palewire / README.md Last active last week - Report abuse Code Revisions 18 Stars 86 Forks 23 How to push tagged Docker releases to Google Artifact Registry with a GitHub Action README.md

## How To Push Tagged Docker Releases To Google Artifact Registry With A Github Action

Here's how I configured a GitHub Action so that a new version issued by GitHub's release interface will build a Dockerfile, tag it with the version number and upload it to Google Artifact Registry. Before you attempt the steps below, you need the following:
A GitHub repository that contains a working Dockerfile The Google Cloud SDK tool gcloud installed and authenticated

## Create A Workload Identity Federation

The first step is to create a Workload Identity Federation that will allow your GitHub Action to log in to your Google Cloud account. The instructions below are cribbed from the documentation for the google-github-actions/auth Action. You should follow along in your terminal.

The first command creates a service account with Google. I will save the name I make up, as well as my Google project id, as environment variables for reuse. You should adapt the variables here, and others as we continue, to fit your project and preferred naming conventions.

export **PROJECT_ID=my-project-id**
export **SERVICE_ACCOUNT=my-service-account**
5/28/24, 10:07 PM How to push tagged Docker releases to    with a GitHub Action gcloud iam service-accounts create **"${SERVICE_ACCOUNT}"** \
--project **"${PROJECT_ID}"**
Enable Google's IAM API for use.

gcloud services enable **iamcredentials.googleapis.com** \
--project **"${PROJECT_ID}"**
Create a workload identity pool that will manage the GitHub Action's roles in Google Cloud's permission system.

export **WORKLOAD_IDENTITY_POOL=my-pool** gcloud iam workload-identity-pools create **"${WORKLOAD_IDENTITY_POOL}"** \
--project="${PROJECT_ID}" \ --location="global" \
--display-name="${WORKLOAD_IDENTITY_POOL}"
Get the unique identifier of that pool.

gcloud iam workload-identity-pools describe **"${WORKLOAD_IDENTITY_POOL}"** \
--project="${PROJECT_ID}" \
--location="global" \ --format="value(name)"
Export the returned value to a new variable.

export **WORKLOAD_IDENTITY_POOL_ID=whatever-you-got-back**
Create a provider within the pool for GitHub to access.

export **WORKLOAD_PROVIDER=my-provider**
gcloud iam workload-identity-pools providers create-oidc **"${WORKLOAD_PROVIDER**
--project="${PROJECT_ID}" \
--location="global" \ --workload-identity-pool="${WORKLOAD_IDENTITY_POOL}" \ --display-name="${WORKLOAD_PROVIDER}" \
--attribute-mapping="google.subject=assertion.sub,attribute.actor=assertion --issuer-uri="https://token.actions.githubusercontent.com" 5/28/24, 10:07 PM How to push tagged Docker releases to    with a GitHub Action Allow a GitHub Action based in your repository to login to the service account via the provider.

export **REPO=my-username/my-repo**
gcloud iam service-accounts add-iam-policy-binding **"${SERVICE_ACCOUNT}@${PROJ**
--project="${PROJECT_ID}" \ --role="roles/iam.workloadIdentityUser" \ --member="principalSet://iam.googleapis.com/${WORKLOAD_IDENTITY_POOL_ID}/at Ask Google to return the identifier of that provider.

gcloud iam workload-identity-pools providers describe **"${WORKLOAD_PROVIDER}"**
--project="${PROJECT_ID}" \ --location="global" \
--workload-identity-pool="${WORKLOAD_IDENTITY_POOL}" \ --format="value(name)"
That will return a string that you should save for later. We'll use it in our GitHub Action. Finally, we need to make sure that the service account we created at the start has permission to muck around with Google Artifact Registry.

gcloud projects add-iam-policy-binding **$PROJECT_ID** \
--member="serviceAccount:${SERVICE_ACCOUNT}@${PROJECT_ID}.iam.gserviceacc --role="roles/artifactregistry.admin" To verify that worked, you can ask Google print out the permissions assigned to the service account.

gcloud projects get-iam-policy **$PROJECT_ID** \
--flatten="bindings[].members" \
--format='table(bindings.role)' \ --
filter="bindings.members:${SERVICE_ACCOUNT}@${PROJECT_ID}.iam.gserviceaccount

# Create A Google Artifact Registry Repository

Go to the Google Artifact Registry interface within your project. Create a new repository by hitting the buttona at the top. Tell Google it will be in the Docker format and then select a region. It doesn't matter which region. Save the name you give the repo and the region's abbreviation, which will be something like **us-west1** .

## Create A Github Action

Now it's time to make your GitHub Action. You should add a new YAML file in the
.github/workflows folder. In the authentication step you'll want to fill in your provider id, your service account id and project id. In the push step you'll need to fill in your GAR
repository name and region, as well as a name for your image, which you'll need to make up on your own.

name: **Release** on:
push:
jobs:
docker-release:
name: Tagged Docker release to Google Artifact **Registry**
runs-on: **ubuntu-latest** if: github.event_name == 'push' && startsWith(github.ref, **'refs/tags')** \#
permissions:
contents: **'read'** id-token: **'write'**
steps:
- id: **checkout**
name: **Checkout**
uses: **actions/checkout@v2**
- id: **auth**
name: Authenticate with Google **Cloud** uses: **google-github-actions/auth@v0** with:
token_format: **access_token**
workload_identity_provider: **<your-provider-id>** service_account: **<your-service-account>@<your-project-id>.iam.gserv** access_token_lifetime: **300s**
- name: Login to Artifact **Registry**
uses: **docker/login-action@v1**
5/28/24, 10:07 PM How to push tagged Docker releases to    with a GitHub Action with:
registry: **us-west2-docker.pkg.dev** username: **oauth2accesstoken**
password: ${{ **steps.auth.outputs.access_token** }}
- name: Get tag id: **get-tag** run: echo ::set-output **name=short_ref::${GITHUB_REF\#refs/*/}**
- id: **docker-push-tagged**
name: Tag Docker image and push to Google Artifact **Registry** uses: **docker/build-push-action@v2**
with:
push: **true** tags: |
<your-gar-region>-docker.pkg.dev/<your-project-id>/<your-gar-rep
<your-gar-region>-docker.pkg.dev/<your-project-id>/<your-gar-rep

## Make A Release

Phew. That's it. Not you can go to the releases panel for your repo on GitHub, punch in a new version tag like **0.0.1** and hit the big green button. That should trigger a new process in your Actions tab, where the push of the tagged commit will trigger the release.

## Extra Bits

In my real world implementations, I will typically have several testing steps that precede the release job. That will ensure that the code is good to go before sending out the release. That could look something like this:
name: Tesst and **release** on:
push:
jobs:
test-python:
name: Test Python **code**
runs-on: **ubuntu-latest** steps:
- name: **Checkout**
uses: **actions/checkout@v2**
- id: **install**
name: Install Python, pipenv and Pipfile **packages**
uses: **palewire/install-python-pipenv-pipfile@v2** with:
python-version: 3.7
- id: run name: Run **tests**
run: make **test**
docker-release:
name: Tagged Docker release to Google Artifact **Registry** runs-on: **ubuntu-latest** needs: **[test-python]** if: github.event_name == 'push' && startsWith(github.ref, **'refs/tags')**
permissions:
contents: **'read'**
id-token: **'write'**
steps:
- id: **checkout**
name: **Checkout** uses: **actions/checkout@v2**
- id: **auth**
name: Authenticate with Google **Cloud** uses: **google-github-actions/auth@v0**
with:
token_format: **access_token** workload_identity_provider: **<your-provider-id?** service_account: **<your-service-account>@<your-project-id>.iam.gserv**
access_token_lifetime: **300s**
- name: Login to Artifact **Registry**
uses: **docker/login-action@v1** with:
registry: **us-west2-docker.pkg.dev**
username: **oauth2accesstoken** password: ${{ **steps.auth.outputs.access_token** }}
- name: Get tag id: **get-tag** run: echo ::set-output **name=short_ref::${GITHUB_REF\#refs/*/}**
- id: **docker-push-tagged**
name: Tag Docker image and push to Google Artifact **Registry** uses: **docker/build-push-action@v2**
5/28/24, 10:07 PM How to push tagged Docker releases to    with a GitHub Action with:
push: **true** tags: |
<your-gar-region>-docker.pkg.dev/<your-project-id>/<your-gar-rep <your-gar-region>-docker.pkg.dev/<your-project-id>/<your-gar-rep If you just wanted tags to trigger releases, you could likely hook the action to run on tags rather than on every push. That would mean putting something like this at the top, and removing the if clause I've put on the release job to filter out typical pushes.

on:
push:
tags:
- '*'
But all that's up to you. Good luck. It's a real pain to get all these ducks in a row, but once you do it you'll have a streamlined release system that can be repeated quickly and smoothly well into the future.

## Mlerman-Stratuscent Commented On Aug 17, 2022

Thanks for the comprehensive article, helped me a lot!

yomexzo commented on Dec 3, 2022 Ditto. Thanks for this. Very useful bschaatsbergen commented on Jan 3, 2023 Thanks for the example UmungoBungo commented on Feb 28, 2023 legendary bmritz commented on May 11, 2023 Thank you. You are a professional. The commands all worked straight through.

zamai commented on May 18, 2023 After reading hours of OpenID Connect docs - this was a breath of fresh air! thanks!

antham commented on Jun 14, 2023 •
edited The terraform counterpart to setup the credentials data "google_project" **"project"** {
}
resource "google_artifact_registry_repository" **"<repository_name>"** {
location = **"<location>"**
repository_id = **"<repository_name>"** description = **"<description>"**
format = **"DOCKER"**
}
resource "google_service_account_iam_binding" **"<repository>-repository-iam"** {
service_account_id = **google_service_account.github.name**
role = **"roles/iam.workloadIdentityUser"**
members = [
"principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute
]
} resource "google_service_account" **"github"** {
account_id = **"github"** project = **google_project.project.project_id**
display_name = **"GitHub"**
}
resource "google_iam_workload_identity_pool" **"github"** {
workload_identity_pool_id = **"github"**
}
resource "google_iam_workload_identity_pool_provider" **"github"** {
project = **google_project.core_project.project_id**
workload_identity_pool_id =
google_iam_workload_identity_pool.github.workload_identity_pool_id workload_identity_pool_provider_id = **"github"**
attribute_mapping = {
"google.subject" = **"assertion.sub"**
"attribute.actor" = **"assertion.actor"** "attribute.repository" = **"assertion.repository"**
}
oidc {
issuer_uri = **"https://token.actions.githubusercontent.com"**
}
}
resource "google_project_iam_binding" **"read-write-registry-iam"** {
project = **google_project.core_project.project_id**
role = **"roles/artifactregistry.writer"**
members = **["serviceAccount:${google_service_account.github.email}"]**
}
aleenprd commented on Jun 16, 2023 Hello! Really cool guide, yet I am facing an issue and maybe someone here can help me figure this out.

Here is my .yml for the action.

docker:
\# needs: **test**
runs-on: **ubuntu-latest** timeout-minutes: 5 permissions:
contents: **'read'**
id-token: **'write'**
steps:
-
name: **Checkout**
uses: **actions/checkout@v3**
-
name: Set up **QEMU**
uses: **docker/setup-qemu-action@v2**
-
name: Set up Docker **Buildx**
uses: **docker/setup-buildx-action@v2**
with:
driver-opts: **image=moby/buildkit:master**
-
name: Login to Docker Hub uses: **docker/login-action@v2**
with:
username: ${{ **secrets.DOCKERHUB_USERNAME** }}
password: ${{ **secrets.DOCKERHUB_TOKEN** }}
-
id: **authgcp** name: Authenticate to Google **Cloud**
uses: **google-github-actions/auth@v1**
with:
token_format: **access_token** workload_identity_provider: ${{ **secrets.WORKLOAD_IDENTITY_PROVIDER_RESOURCE_NAME**
}}
service_account: ${{ secrets.SERVICE_ACCOUNT }}@${{ **secrets.PROJECT_ID**
}}.iam.gserviceaccount.com access_token_lifetime: **600s**
-
name: Login to Artifact **Registry**
uses: **docker/login-action@v2**
5/28/24, 10:07 PM How to push tagged Docker releases to    with a GitHub Action with:
registry: ${{ secrets.GAR_REGION **}}-docker.pkg.dev** username: **oauth2accesstoken**
password: ${{ **steps.authgcp.outputs.access_token** }}
-
name: Build and **push** uses: **docker/build-push-action@v4**
with:
context: .

push: **true** tags: |
${{ secrets.DOCKERHUB_USERNAME }}/${{ vars.APP_NAME **}}:latest**
${{ secrets.GAR_REGION }}-docker.pkg.dev/${{ secrets.PROJECT_ID **}}/${{**
secrets.GAR_REPO }}/${{ vars.APP_NAME **}}:latest**
The error I am facing is:
ERROR: failed to solve: failed to push *****-docker.pkg.dev/***/***/homer:latest:**
unexpected status: 400 Bad **Request**
Error: buildx failed with: ERROR: failed to solve: failed to push *****-**
docker.pkg.dev/***/***/homer:latest: unexpected status: 400 Bad **Request**
antham commented on Jun 17, 2023 What did you do in the previous steps to setup the registry ?

victorboissiere commented on Jul 2, 2023 Very useful, thanks a lot!

sphtd commented on Jul 3, 2023 •
edited ERROR: denied: Artifact Registry API has not been used in project before or it is disabled. Enable it by visiting https://console.developers.google.com/apis/api/artifactregistry.googleapis.com/overview?

project= then retry. If you enabled this API recently, wait a few minutes for the action to propagate to our systems and retry.

Error: buildx failed with: ERROR: denied: Artifact Registry API has not been used in project before or it is disabled. Enable it by visiting https://console.developers.google.com/apis/api/artifactregistry.googleapis.com/overview?project= then retry. If you enabled this API recently, wait a few minutes for the action to propagate to our systems and retry Anyone?

palewire commented on Jul 3, 2023 Author ERROR: denied: Artifact Registry API has not been used in project before or it is disabled. Enable it by visiting https://console.developers.google.com/apis/api/artifactregistry.googleapis.com/overview?project=
then retry. If you enabled this API recently, wait a few minutes for the action to propagate to our systems and retry. Error: buildx failed with: ERROR: denied: Artifact Registry API has not been used in project before or it is disabled. Enable it by visiting https://console.developers.google.com/apis/api/artifactregistry.googleapis.com/overview?project=
then retry. If you enabled this API recently, wait a few minutes for the action to propagate to our systems and retry Anyone?

Make sure that you first enable Google's IAM API for use, before everything else that follows gcloud services enable **iamcredentials.googleapis.com** \
--project **"${PROJECT_ID}"**
isurus95 commented on Aug 5, 2023 superb. There's a static region specified here, name: Login to Artifact **Registry**
uses: **docker/login-action@v1**
with:
registry: **us-west2-docker.pkg.dev**
better if the region can be parameterized too.

Like this name: Login to Artifact **Registry**
uses: **docker/login-action@v1**
with:
registry: **<your-gar-region>-docker.pkg.dev**
Goldziher commented on Oct 14, 2023 fantastic, very helpful!

esgn commented on Mar 26 Thanks for the tutorial.

I had to change **--attributemapping="google.subject=assertion.sub,attribute.actor=assertion.actor,attribute.repository=ass**
ertion.repository" to --attributemapping="google.subject=assertion.sub,attribute.repository=assertion.repository" to make it work. In https://cloud.google.com/blog/products/identity-security/enabling-keyless-authentication-fromgithub-actions?hl=en the same attribute mapping is suggested.

# Connect To A Github Repository

1st gen checked2nd gen This page explains how to connect a GitHub  (https://docs.github.com/) repository to Cloud Build. To learn more about Cloud Build repositories, see Cloud Build repositories (/build/docs/repositories).

## Before You Begin

Enable the Cloud Build and Secret Manager APIs.

Enable the APIs (https://console.cloud.google.com/flows/enableapi?apiid=cloudbuild.googleapis.com,%20secretmanager.googleapis.com&redirect=https://
Have your source code ready in a GitHub repository. Have either a Dockerfile or a Cloud Build config file (/build/docs/build-config) in your GitHub source repository. If you are initially connecting your repository to Cloud Build, make sure you have admin-level permissions on your repository. To learn more about GitHub repository permissions, see Repository permission levels for an organization
 (https://docs.github.com/en/github/setting-up-and-managing-organizations-and-teams/repository-permission-levels-for-an-organization\#permissionlevels-for-repositories-owned-by-an-organization)
. To use gcloud commands on this page, install the Google Cloud CLI (/sdk/docs/install-sdk).

star Note: If you've installed gcloud CLI previously, make sure you have the latest available version by running gcloud components update.

## Required Iam Permissions

To connect your GitHub host, grant the Cloud Build Connection Admin (roles/cloudbuild.connectionAdmin) role to your user account. To add the required roles to your user account, see Configuring access to Cloud Build resources (/build/docs/securing-builds/configure-access-to-resources). To learn more about IAM roles associated with Cloud Build, see IAM roles and permissions (/build/docs/iam-roles-permissions). To create connections using gcloud installation steps, grant the Secret Manager Admin role (roles/secretmanager.admin) to the Cloud Build Service Agent by running the following command in your Google Cloud project:

```
PN=$(gcloud projects describe ${PROJECT_ID} --format="value(projectNumber)")
CLOUD_BUILD_SERVICE_AGENT="service-${PN}@gcp-sa-cloudbuild.iam.gserviceaccount.com"
gcloud projects add-iam-policy-binding ${PROJECT_ID} \
 --member="serviceAccount:${CLOUD_BUILD_SERVICE_AGENT}" \
 --role="roles/secretmanager.admin"

```

Note: You can revoke the Secret Manager Admin role (roles/secretmanager.admin) after your connection is in state COMPLETE. To learn more, see Granting a role to the Cloud Build service agent (/build/docs/securing-builds/configure-access-for-cloud-build-service-account\#service-agent-permissions).

## Connecting A Github Host

Console  (\#console)gcloud
 (\#gcloud)
To connect your GitHub host using gcloud, complete the following steps:
star Note: The installation steps require actions in your web browser.

1. Enter the following command to initiate a connection to your GitHub repository:
Where:
CONNECTION_NAME is the name of your connection. REGION is the region (/build/docs/locations) for your trigger.

star Note: You must specify a region. Your connection cannot exist globally.

To connect your GitHub host using an existing token and installation ID obtained from a previous connection, complete the following steps:
gcloud builds connections create github CONNECTION_NAME edit --region=REGION edit After running the gcloud builds connections command, you will see a link to authorize the Cloud Build GitHub App.

2. Log into your github.com account.

star Note: This authentication can be used to create additional connections in the same project. We recommend using a robot account, or an account shared by your team, instead of a personal GitHub account to keep your connections secure.

3. Follow the link to authorize the Cloud Build GitHub App.

After authorizing the app, Cloud Build stores an authentication token as a secret in Secret Manager in your Google Cloud project. You can view your secrets on the **Secret Manager** (https://console.cloud.google.com/security/secret-manager) page.

4. Install the Cloud Build GitHub App in your account or in an organization you own.

Permit the installation using your GitHub account and select repository permissions when prompted.

5. Verify the installation of your GitHub connection by running the following command:
gcloud builds connections describe CONNECTION_NAME edit --region=REGION edit Where:
CONNECTION_NAME is the name of your connection. REGION is the region (/build/docs/locations) for your trigger.

If the installationState field is set to COMPLETE, you have successfully installed the connection. Otherwise, the installationState field provides a link for additional steps required.

You have now successfully created a GitHub connection.

## Connecting A Github Host Programmatically

Terraform  (\#terraform)gcloud
 (\#gcloud)
star Note: When using an existing token and installation ID to create a connection, such as from a script, no manual intervention via a web browser is required.

1. Install the Cloud Build GitHub App (https://github.com/apps/google-cloud-build) on your GitHub account or in an organization you own. 2. Create a personal access token
 (https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token).

Make sure to set your token to have no expiration date and select the following permissions when prompted in GitHub: repo and read:user. If your app is installed in an organization, make sure to also select the read:org permission. After you generate your personal access token, save your generated token in a secure place. You will use the generated token in the following steps.

star Note: If you have an authentication token stored in a secret from a previously created connection, you can use that same secret for the new connection.

3. Store your token in Secret Manager in your Google Cloud project by running the following command:
echo -n TOKEN edit | gcloud secrets create SECRET_NAME edit --data-file=-
Where:
TOKEN is your personal access token. SECRET_NAME is the name you want to give to your secret in Secret Manager.

4. Grant access to the Cloud Build Service Agent on the secret, where *SECRET_NAME* is the name of your secret as stored in Secret Manager:

```
PROJECT_ID=$(gcloud config list --format="value(core.project)")
PN=$(gcloud projects describe ${PROJECT_ID} --format="value(projectNumber)")
CLOUD_BUILD_SERVICE_AGENT="service-${PN}@gcp-sa-cloudbuild.iam.gserviceaccount.com"
gcloud secrets add-iam-policy-binding \
 --member="serviceAccount:${CLOUD_BUILD_SERVICE_AGENT}" \
 --role="roles/secretmanager.secretAccessor"
                                      SECRET_NAME edit
                                                     

```

5. Create your GitHub connection:

```
gcloud builds connections create github \
 --authorizer-token-secret-version=projects/ /secrets/ /versions/1 \
 --app-installation-id= --region=
                                        CONNECTION_NAME edit
                                                           
                                             PROJECT_ID edit SECRET_NAME edit
                                                                                  
                        INSTALLATION_ID edit REGION edit
                                                              

```

Where:
CONNECTION_NAME is the name of your connection. PROJECT_ID is your Google Cloud project ID. SECRET_NAME is the name of your secret as stored in Secret Manager. INSTALLATION_ID is the installation ID of your GitHub app. Your installation ID can be found in the URL of your Cloud Build GitHub App. In the following URL, https://github.com/settings/installations/1234567, the installation ID is the numerical value 1234567. REGION is the region (/build/docs/locations) for of your connection.

You have now successfully created a GitHub connection.

## Connecting A Github Repository

Console  (\#console)gcloud
 (\#gcloud)
Terraform  (\#terraform)
To add a GitHub repository to your connection, enter the following command:

```
gcloud builds repositories create \
  --remote-uri= \
  --connection= --region=
                                  REPO_NAME edit
                                               
               REPO_URI edit
                           
               CONNECTION_NAME edit REGION edit
                                                     

```

Where:
REPO_NAME is the name of your repository. REPO_URI is the link to your GitHub repository. For example, https://github.com/cloud-build/test-repo.git. CONNECTION_NAME is the name of your connection. REGION is the region (/build/docs/locations) for your connection.

You have now linked a repository to your GitHub connection.

## What'S Next

Learn how to build repositories from GitHub (/build/docs/automating-builds/github/build-repos-from-github). Learn how to perform blue/green deployments on Compute Engine (/build/docs/deploying-builds/deploy-compute-engine).

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-05-23 UTC.

joeyslalom / github-docker-artifact-registry.yaml Created 2 years ago - Report abuse Code Revisions 1 Stars 14 Forks 2 GitHub Action - docker build and push to Artifact Registry github-docker-artifact-registry.yaml 1 **\# 1. Create service account** 2 **\#. * Service Account Token Creator** 3 **\#. * Artifact Registry Writer**
4 **\# 2. Generate service account key**
8 **\# 3. Create repo in artifact repository** 9 **\#. * Name: $env.REPOSITORY below**
10 **\#. * Region: $env.GAR_LOCATION below** 11 12 **name: Docker build and push to Artifact Registry** 13 14 on: 15 push: 16 branches: 17 - main 18 - github-action 19 20 **env:** 25 21 PROJECT_ID: slalom-2020-293920 22 GAR_LOCATION: us-west1 23 REPOSITORY: reimagined-couscous 24 IMAGE: main 26 **jobs:** 27 login-build-push: 28 name: Docker login, build, and push 29 runs-on: ubuntu-latest 30 31 steps: 34 36 run: |37 docker build \ 35 - name: 'Docker build' 5 **\#. * In GitHub project -> Settings -> Secrets -> Actions -> New Repository Secret** 6 **\#. Name: GCP_CREDENTIALS** 7 **\#. Value: key.json contents**
33 uses: actions/checkout@v3 32 - name: Checkout 46 53 54 - name: 'Docker push' 55 run: |56 docker push "$GAR_LOCATION-docker.pkg.dev/$PROJECT_ID/$REPOSITORY/$IMAGE:$GITHUB_S
joeyslalom commented on Jun 30, 2022 Author corresponding tf:
resource "google_service_account" **"github"** {
account_id = **"github-docker-push"**
} resource "google_project_iam_member" **"github_token_creator"** {
project = **google_project.project.project_id** role = **"roles/iam.serviceAccountTokenCreator"**
member = **"serviceAccount:${google_service_account.github.email}"**
}
resource "google_project_iam_member" **"github_act_as"** {
project = **google_project.project.project_id**
role = **"roles/artifactregistry.writer"**
member = **"serviceAccount:${google_service_account.github.email}"**
} resource "google_artifact_registry_repository" **"resdna"** {
provider = **google-beta**
location = **var.default_region**
repository_id = **"resdna"**
format = **"DOCKER"** project = **google_project.project.project_id**
}
5/28/24, 10:08 PM GitHub Action - docker build and push to  
38 --tag "$GAR_LOCATION-docker.pkg.dev/$PROJECT_ID/$REPOSITORY/$IMAGE:$GITHUB_SHA" 39 app/
40 - id: 'auth' 41 name: 'Authenticate to Google Cloud' 42 uses: 'google-github-actions/auth@v0.6.0' 43 with: 44 credentials_json: '${{ secrets.GCP_CREDENTIALS }}' 45 token_format: 'access_token' 47 - uses: 'docker/login-action@v1' 48 name: 'Docker login' 49 with: 50 registry: '${{ env.GAR_LOCATION }}-docker.pkg.dev' 51 username: 'oauth2accesstoken' 52 password: '${{ steps.auth.outputs.access_token }}'

# Access Control With Iam

This page describes access control with Identity and Access Management (IAM) in Artifact Registry. Default permissions for Artifact Registry minimize setup effort when implementing a CI/CD pipeline. You can also integrate Artifact Registry with third-party CI/CD tools and configure the permissions and authentication required to access repositories. If you use Artifact Analysis to work with container metadata, such as vulnerabilities found in images, see the Artifact Analysis documentation (/artifact-analysis/docs/ca-access-control) for information about granting access to view or manage metadata.

## Before You Begin

1. Enable Artifact Registry (/artifact-registry/docs/enable-service), including enabling the API
and installing the Google Cloud CLI.

2. If you want to apply repository-specific permissions, then create an Artifact Registry repository (/artifact-registry/docs/repositories/create-repos) for your packages.

## Overview

IAM permissions (/iam/docs/overview\#permissions) and roles (/iam/docs/overview\#roles) determine your ability to create, view, edit, or delete data in an Artifact Registry repository. A role is a collection of permissions. You can't grant a principal permissions directly; instead, you grant them a role. When you grant a role to a principal, you grant them all the permissions that the role contains. You can grant multiple roles to the same principal.

## Google Cloud Default Permissions

By default, the following permissions apply to Google Cloud CI/CD services in the same project as Artifact Registry:
Cloud Build permissions (/build/docs/cloud-build-service-account) include permissions to upload and download artifacts. Compute Engine, supported Google Kubernetes Engine versions
 (/artifact-registry/docs/integrate-gke), and Cloud Run use the Compute Engine default service account (/compute/docs/access/service-accounts\#default_service_account), which has read-only access to storage.

If all your services are in the same Google Cloud project and the default permissions meet your needs, you don't need to configure permissions. You must configure Artifact Registry permissions for these services if:
You want to use these services to access Artifact Registry in another project. In the project with Artifact Registry, grant (\#grant) the workload identity pool (/iam/docs/workload-identity-federation\#pools) or service account for each service the required role. If connecting to Cloud Run, grant the Cloud Run Service Agent (/iam/docs/service-agents) the required role. you're using a GKE version that does not have built-in support for pulling images from Artifact Registry. See the GKE (/artifact-registry/docs/integrate-gke) section for configuration instructions. You want the default service account to have read and write access to repositories. See the following information for details:
Compute Engine (\#compute) GKE (\#gke)
you're using a user-provided service account for your runtime environments instead of the default service account. In the project with Artifact Registry, grant (\#grant) your service account the required role.

## Third-Party Integration

For third-party clients, you must configure both permissions and authentication. Traditionally, applications running outside Google Cloud use service account keys (/iam/docs/service-account-creds\#key-types) to access Google Cloud resources. However, service account keys are powerful credentials, and can present a security risk if they are not managed correctly. Workload Identity Federation lets you use Identity and Access Management to grant external identities IAM roles (/iam/docs/overview\#roles), including the ability to impersonate service accounts. This approach eliminates the maintenance and security burden associated with service account keys.

## Use Workload Identity Federation:

1. Create a Workload Identity Federation pool
 (/iam/docs/manage-workload-identity-pools-providers\#create-pools).

2. Create a Workload Identity Federation provider
 (/iam/docs/manage-workload-identity-pools-providers\#create-provider).

3. Grant (\#grant) the appropriate Artifact Registry role to the workload identity pool to allow repository access.

4. Configure your third-party client to authenticate with Artifact Registry.

Container images: Docker (/artifact-registry/docs/docker/authentication), Helm
 (/artifact-registry/docs/helm/authentication)
Language packages: Java (/artifact-registry/docs/java/authentication), Node.js (/artifact-registry/docs/nodejs/authentication), Python (/artifact-registry/docs/python/authentication), Go (/artifact-registry/docs/go/authentication) OS packages: Debian (/artifact-registry/docs/os-packages/debian/configure), RPM
 (/artifact-registry/docs/os-packages/rpm/configure)
Other: Kubeflow Pipeline templates (/vertex-ai/docs/pipelines/create-pipeline-template)

## Use A Service Account:

1. Create (/iam/docs/service-accounts-create\#creating) a service account to act on behalf of your application, or choose an existing service account that use for your CI/CD automation.

2. Grant (\#grant) the appropriate Artifact Registry role to the service account to provide repository access.

3. Configure your third-party client to authenticate with Artifact Registry.

Container images: Docker (/artifact-registry/docs/docker/authentication), Helm
 (/artifact-registry/docs/helm/authentication)
Language packages: Java (/artifact-registry/docs/java/authentication), Node.js (/artifact-registry/docs/nodejs/authentication), Python (/artifact-registry/docs/python/authentication), Go (/artifact-registry/docs/go/authentication)
OS packages: Debian (/artifact-registry/docs/os-packages/debian/configure), RPM
 (/artifact-registry/docs/os-packages/rpm/configure)
Other: Kubeflow Pipeline templates (/vertex-ai/docs/pipelines/create-pipeline-template)
GitLab on Google Cloud

## Preview

This product or feature is subject to the "Pre-GA Offerings Terms" in the General Service Terms section of the Service Specific Terms (/terms/service-terms\#1). Pre-GA products and features are available "as is" and might have limited support. For more information, see the launch stage descriptions (/products\#product-launch-stages).

The GitLab on Google Cloud integration uses Workload Identity Federation (/iam/docs/workload-identity-federation) for authorization and authentication for GitLab workloads on Google Cloud without the need for service accounts or service account keys. For more information on how Workload Identity Federation is used in this partnership, see Authentication overview (/docs/gitlab/authentication-overview). To set up Workload Identity Federation and the necessary IAM roles for the GitLab on Google Cloud, see the GitLab tutorial Google Cloud Workload Identity Federation and IAM policies (https://docs.gitlab.com/ee/integration/google_cloud_iam.html). To connect your Artifact Registry repository, follow the GitLab tutorial Google Artifact Registry (https://docs.gitlab.com/ee/user/project/integrations/google_artifact_registry.html).

## Roles And Permissions

Every Artifact Registry API method requires that the principal (user, group, or service account) making the request has the required permissions to use the resource. Permissions are given to principals by setting policies that grant the principal a predefined role on the resource. You can grant roles on the Google Cloud project or the Artifact Registry repository.

## Predefined Artifact Registry Roles

IAM provides predefined roles (/iam/docs/understanding-roles\#predefined_roles) that grant access to specific Google Cloud resources and prevent unauthorized access to other resources. Use the following predefined roles for standard, virtual, and remote repositories on the pkg.dev domain:

| Role                                                                       | Description                                       |
|----------------------------------------------------------------------------|---------------------------------------------------|
| Artifact Registry Reader                                                   | View and get artifacts, view repository metadata. |
| (roles/artifactregistry.reader) Artifact Registry Writer                   | Read and write artifacts.                         |
| (roles/artifactregistry.writer) Artifact Registry Repository Administrator | Read, write, and delete artifacts.                |
| (roles/artifactregistry.repoAdmin) Artifact Registry Administrator         | Create and manage repositories and artifacts.     |
| (roles/artifactregistry.admin)                                             |                                                   |

The following additional predefined roles include permissions to create gcr.io repositories (/artifact-registry/docs/repositories\#gcr) to host images for the gcr.io domain. The roles don't include permissions to create other repository formats in Artifact Registry on the pkg.dev domain. These roles support backwards compatibility with Container Registry, since Container Registry uses the first push of a container image to create each multi-regional registry.

| Role                                                              | Description                        |
|-------------------------------------------------------------------|------------------------------------|
| Artifact Registry Create-on-push Writer (roles/artifactregistry.  | Read and write artifacts. Create   |
| createOnPushWriter)                                               | gcr.io repositories.               |
| Artifact Registry Create-on-push Repository Administrator (roles/ | Read, write, and delete artifacts. |
| artifactregistry.createOnPushRepoAdmin)                           | Create gcr.io repositories.        |

For a full list of the individual permissions in each role, refer to Artifact Registry roles (/iam/docs/understanding-roles\#artifact-registry-roles). You can also use the gcloud iam roles describe (/sdk/gcloud/reference/iam/roles/describe) command to view a list of permissions in each role.

## Basic Iam Roles

Basic IAM roles grant users global, project-level access to all Google Cloud resources. Use predefined roles (\#roles) for repository access whenever possible so that users and service accounts only have the permissions that are required.

The following table lists the basic roles (/iam/docs/understanding-roles\#basic) that existed prior to IAM, and the Artifact Registry IAM roles that they include:

| Role         | Role Title   | Includes role                                                  |
|--------------|--------------|----------------------------------------------------------------|
| roles/viewer | Viewer       | roles/artifactregistry.reader                                  |
| roles/editor | Editor       | roles/artifactregistry.writer roles/artifactregistry.repoAdmin |
| roles/owner  | Owner        | roles/artifactregistry.admin                                   |

Note: Owner, Editor, and Viewer include permissions for many other Google Cloud services. The Owner role is automatically granted to the original project creator. You can use the gcloud iam roles describe (/sdk/gcloud/reference/iam/roles/describe) command to verify which Artifact Registry permissions are included in the role.

## Granting Permissions

Grant permissions at the project level if the same permissions apply to all repositories in the project. If some accounts require different levels of access, grant roles at the repository level. If you're granting permissions on a virtual repository (/artifact-registry/docs/repositories/virtual-repo), those permissions apply to all upstream repositories available through the virtual repository, regardless of individual repository permissions. If you're granting roles using the gcloud command, you can specify a single role binding for a principal or use a policy file to define multiple bindings.

Note: Applying a policy file to a project resets all IAM policies for that project, so use this option with caution.

Granting project-wide permissions Grant a role at the project level if the same permissions apply to all repositories in the project. To add a user or service account to a project and grant them an Artifact Registry role:
Console  (\#console)gcloud
 (\#gcloud)
1. In one of the following development environments, set up the gcloud CLI:
Cloud Shell: to use an online terminal with the gcloud CLI already set up, activate Cloud Shell.

Activate Cloud Shell on this page At the bottom of this page, a Cloud Shell session starts and displays a command-line prompt. It can take a few seconds for the session to initialize. Local shell: to use a local development environment, install (/sdk/docs/install) and initialize (/sdk/docs/initializing) the gcloud CLI.

2. To grant a role to a single principal, run the following command:
PROJECT edit gcloud projects add-iam-policy-binding \
PRINCPAL edit

--member= \
ROLE edit

--role=
where PROJECT is the ID of the project where Artifact Registry is running. PRINCIPAL is the principal to add the binding for. Use the form user|group|serviceAccount:email or domain:domain. Examples: user:test-user@gmail.com, group:admins@example.com, serviceAccount:test123@example.domain.com, or domain:example.domain.com.

ROLE is the role (\#roles) that you want to grant.

For more information, see the add-iam-policy-binding (/sdk/gcloud/reference/projects/add-iam-policy-binding) documentation. To grant roles using a policy file, run the following command:
gcloud projects set-iam-policy PROJECT edit /PATH/TO/policy.yaml edit Where PROJECT is the ID of the project or fully qualified identifier for the project where Artifact Registry is running. /PATH/TO/policy.yaml is the path and file name of the policy file.

Note: Applying a policy file to a project resets all IAM policies for that project, so use this option with caution.

To get the currently configured policy, run the following command:
gcloud projects get-iam-policy PROJECT edit Where *PROJECT* is the ID of the project or fully qualified identifier for the project. For more information, see the set-iam-policy (/sdk/gcloud/reference/projects/set-iam-policy) documentation.

Granting repository-specific permissions Grant repository-level permissions when you want users or service accounts to have different levels of access for each repository in your project.

Console  (\#console)gcloud
 (\#gcloud)
Terraform  (\#terraform)
1. In one of the following development environments, set up the gcloud CLI:
Cloud Shell: to use an online terminal with the gcloud CLI already set up, activate Cloud Shell.

Activate Cloud Shell on this page At the bottom of this page, a Cloud Shell session starts and displays a command-line prompt. It can take a few seconds for the session to initialize. Local shell: to use a local development environment, install (/sdk/docs/install) and initialize (/sdk/docs/initializing) the gcloud CLI.

2. You can set an IAM set of individual policy bindings or use a policy file.

To grant a role to a single principal, run the following command:
REPOSITORY edit gcloud artifacts repositories add-iam-policy-binding \
LOCATION edit

--location= \
PRINCIPAL edit

--member= \
ROLE edit

--role=
where REPOSITORY is the ID of the repository. PRINCIPAL is the principal to add the binding for. Use the form user|group|serviceAccount:email or domain:domain. Examples: user:test-user@gmail.com, group:admins@example.com, serviceAccount:test123@example.domain.com, or domain:example.domain.com. ROLE is the role (\#roles) that you want to grant. LOCATION is the regional or multi-regional location (/artifact-registry/docs/repo-locations) of the repository.

star For example, to add an IAM policy binding for the role roles/artifactregistry.writer for the user write@gmail.com with the repository my-repo in the location --us-central1, run:
gcloud artifacts repositories add-iam-policy-binding my-repo \ --location=us-central1 --member=user:write@gmail.com --role=roles/arti To grant roles using a policy file, run the following command:
gcloud artifacts repositories set-iam-policy REPOSITORY edit /PATH/TO/po Where REPOSITORY is the ID of the repository. /PATH/TO/policy.yaml is the path and file name of the policy file. LOCATION is the regional or multi-regional location (/artifact-registry/docs/repo-locations) of the repository.

For example, to set the IAM policy for the repository my-repo in the location --uscentral1 with the policy defined in policy.yaml, run:
gcloud artifacts repositories set-iam-policy my-repo policy.yaml --loc Note: Applying a policy file to a repository resets all IAM policies for that repository, so use this option with caution.

Configuring public access to a repository If you have artifacts that you want to make available to anyone on the internet without authentication, store them in a repository that you make public. To configure a repository for public read-only access, grant the Artifact Registry Reader role to the principal allUsers. We also recommend capping user request quotas
 (/artifact-registry/quotas\#user-quota) so that a single user can't use up your project's overall quota.

Console  (\#console)gcloud
 (\#gcloud)
1. In one of the following development environments, set up the gcloud CLI:
Cloud Shell: to use an online terminal with the gcloud CLI already set up, activate Cloud Shell.

Activate Cloud Shell on this page At the bottom of this page, a Cloud Shell session starts and displays a command-line prompt. It can take a few seconds for the session to initialize. Local shell: to use a local development environment, install (/sdk/docs/install) and initialize (/sdk/docs/initializing) the gcloud CLI.

2. Run the following command:
--location= --member=allUsers --role=
REPOSITORY edit gcloud artifacts repositories add-iam-policy-binding \
LOCATION edit ROLE edit where REPOSITORY is the ID of the repository. ROLE is the role (\#roles) that you want to grant. LOCATION is the regional or multi-regional location (/artifact-registry/docs/repo-locations) of the repository.

For example, configure the repository my-repo in the location --us-central1 as public, run:
gcloud artifacts repositories add-iam-policy-binding my-repo \
--location=us-central1 --member=allUsers --role=roles/artifactregistr 3. Set a per-user limit on Artifact Registry API requests to prevent misuse by unauthenticated users. See Capping usage (/docs/quota\#capping_usage) for instructions.

## Revoking Permissions

To revoke access to a repository, remove the principal from the list of authorized principals. To remove public access from a repository, remove the allUsers principal.

Console  (\#console)gcloud
 (\#gcloud)
1. In one of the following development environments, set up the gcloud CLI:
Cloud Shell: to use an online terminal with the gcloud CLI already set up, activate Cloud Shell.

Activate Cloud Shell on this page At the bottom of this page, a Cloud Shell session starts and displays a command-line prompt. It can take a few seconds for the session to initialize. Local shell: to use a local development environment, install (/sdk/docs/install) and initialize (/sdk/docs/initializing) the gcloud CLI.

2. To revoke a role at the project level, run the following command:
PROJECT edit gcloud projects remove-iam-policy-binding \
PRINCIPAL edit

--member= \
ROLE edit

--role=
PROJECT is the project ID. PRINCIPAL is the principal to remove the binding for. Use the form user|group|serviceAccount:email or domain:domain. Examples: user:test-user@gmail.com, group:admins@example.com, serviceAccount:test123@example.domain.com, or domain:example.domain.com. ROLE is the role (\#roles) that you want to revoke.

To revoke a role for a repository, run the following command:
REPOSITORY edit gcloud artifacts repositories remove-iam-policy-binding LOCATION edit

--location= \
PRINCIPAL edit

--member= \
ROLE edit

--role=
where REPOSITORY is the ID of the repository. PRINCIPAL is the principal to remove the binding for. Use the form user|group|serviceAccount:email or domain:domain. Examples: user:test-user@gmail.com, group:admins@example.com, serviceAccount:test123@example.domain.com, or domain:example.domain.com.

To revoke public access to the repository, specify the principal allUsers.

ROLE is the role (\#roles) that you want to revoke.

For example, to remove a policy binding for the role roles/artifactregistry.writer for the user write@gmail.com with the repository my-repo in the location --us-central1, run:
gcloud artifacts repositories remove-iam-policy-binding my-repo \
--location=us-central1 \ --member=user:write@gmail.com \ --role=roles/artifactregistry.writer To revoke public access to my-repo in the location --us-central1, run:
gcloud artifacts repositories remove-iam-policy-binding my-repo \
--location=us-central1 \ --member=allUsers \ --role=roles/artifactregistry.reader

## Granting Conditional Access With Tags

Project administrators can create tags for resources across Google Cloud and manage them in Resource Manager (/resource-manager/docs/tags/tags-overview). When you attach a tag to a Artifact Registry repository, administrators can use the tag with IAM conditions to grant conditional access to the repository. You cannot attach tags to individual artifacts. For more information see the following documentation:
Administrators setting up tags and access control Creating and managing tags (/resource-manager/docs/tags/tags-creating-and-managing) Tags and access control (/iam/docs/tags-access-control).

Developers attaching tags to repositories Tagging repositories (/artifact-registry/docs/repositories/tag-repos)

## Integrating With Google Cloud Services

For most Google Cloud service accounts, configuring access to a registry only requires granting the appropriate IAM permissions.

Default permissions for Google Cloud services Google Cloud services such as Cloud Build or Google Kubernetes Engine use a default service account (/iam/docs/service-account-types\#default) or service agent (/iam/docs/service-account-types\#default) to interact with resources within the same project.

You must configure or modify permissions yourself if:
The Google Cloud service is in a different project than Artifact Registry. The default permissions do not meet your needs. For example, the default Compute Engine service account has read-only access to storage in the same project. If you want to push an image from a VM to Artifact Registry, you can modify permissions for the VM service account or use a different account with the required permissions. you're using a user-provided service account to interact with Artifact Registry instead of the default service account.

The following service accounts typically access Artifact Registry. The email address for the service account includes the Google Cloud project ID or project number (/resource-manager/docs/creating-managing-projects\#identifying_projects) of the project where the service is running.

| Service                                   | Service account   | Email address   | Permiss   |
|-------------------------------------------|-------------------|-----------------|-----------|
| App Engine App Engine service account     | PROJECTID@appspot.gserviceaccount.com                   | Editor ro       |           |
| flexible                                  | (/appengine/docs/standard/python/serviceaccount)                   | to repos        |           |
| environment Compute Compute Engine default service account Engine  (/compute/docs/access/serviceaccounts#default_service_account)                                           | PROJECT-NUMBERcompute@developer.gserviceaccount.com Editor ro access                   |                 |           |
| Cloud Build Cloud Build service account   | PROJECTNUMBER@cloudbuild.gserviceaccount.com                   |                 |           |
| (/build/docs/cloud-build-service-account) | Default   (/build/ serviceinclude  to repos to creat  (/artifa registry .                   |                 |           |
| star Note: The Cloud Build default service account used to run builds is being changed. For more information, see Cloud Build service account change  (/build/docs/cloud-build-service-accountupdates) .                                           |                   |                 |           |

| Cloud Run   | Cloud Run service agent  (/iam/docs/service-agents) The service agent for run.googleapis. com.   | service-PROJECT-NUMBER@serverlessrobot-prod.iam.gserviceaccount.com   | Reader  read-on reposito   |
|-------------|--------------------------------------------------------------------------------------------------|---|----------------------------|
| GKE         | Compute Engine default service account  (/compute/docs/access/serviceaccounts#default_service_account) The default service account for nodes.                                                                                                  | PROJECT-NUMBERcompute@developer.gserviceaccount.com Editor ro access   |                            |

## Granting Access To Compute Engine Instances

VM instances that access repositories must have both Artifact Registry permissions and storage *access scope* configured. While a service account's access level is determined by the IAM roles granted to the service account, *access scopes* on a VM instance determine the default OAuth scopes for requests made through the gcloud CLI and client libraries on the instance. As a result, access scopes potentially further limit access to API methods when authenticating with Application Default Credentials (/docs/authentication/application-default-credentials). Compute Engine uses the following defaults:
The Compute Engine default service account (/compute/docs/access/service-accounts\#default_service_account) is the identity for VM instances. The service account email address has the suffix @developer.gserviceaccount.com. The default service account has the IAM basic Editor role, if you have not disabled this behavior
 (/resource-manager/docs/organization-policy/restricting-serviceaccounts\#disable_service_account_default_grants)
. Instances you create with the default service account have the Compute Engine default access scopes (/compute/docs/access/service-accounts\#default_scopes), including read-only access to storage. While the Editor role generally grants write access, the read-only storage access scope limits the instance service account to downloading artifacts only from any repository in the same project.

You must configure the access scope of the service account if:
The VM service account needs to access a repository in a different project. The VM service account needs to perform actions other than reading artifacts from repositories. This typically applies third-party tools on a VM that need to push images or run Artifact Registry gcloud commands.

To configure permissions and set the access scope:
1. In the project with your VM instance, get the name of the Compute Engine default service account (/compute/docs/access/service-accounts\#default_service_account). The service account email address has the suffix **@developer.gserviceaccount.com**.

2. In the project with the repository, grant permissions (\#grant) so that the service account can access the repository.

3. Set the access scope with the --scopes
 (/sdk/gcloud/reference/compute/instances/create\#--scopes) option.

a. Stop the VM instance. See Stopping an instance
 (/compute/docs/instances/stop-start-instance).

b. Set the access scope with the following command:
gcloud compute instances set-service-account INSTANCE --scopes=SCOPE edit Replace *SCOPE* with the appropriate value.

For Docker, the following options are supported:
storage-ro - Grants read permission only for pulling images. storage-rw - Grants read and write permission for pushing or pulling images. cloud-platform - View and manage data, including metadata, across Google Cloud service.

For other formats, you must use the cloud-platform scope.

c. Restart the VM instance. See Starting a stopped instance
 (/compute/docs/instances/stop-start-instance\#starting_a_stopped_instance).

## Granting Access To Google Kubernetes Engine Clusters

GKE clusters and node pools can pull containers without any additional configuration if all the following requirements are met:
GKE is in the same project as Artifact Registry Nodes are using the default service account, the Compute Engine default service account (/compute/docs/access/service-accounts\#default_service_account) Nodes were created with read access to storage (\#gke-scope) by:
Using the Compute Engine default access scopes (/compute/docs/access/service-accounts\#default_scopes). Granting the cloud-platform access scope or another scope that includes read access to storage.

you're running a supported version (/artifact-registry/docs/integrate-gke) of GKE
If your GKE environment does not meet these requirements the instructions to grant access depend on whether you're using the Compute Engine default service account or a userprovided service account as the identity for your nodes.

## Default Service Account

The following configuration requirements apply to the Compute Engine default service account (/compute/docs/access/service-accounts\#default_service_account):
1. If GKE is in a different project than Artifact Registry, grant (\#grant) the required permissions to the service account.

2. To push images, interact with repositories for formats other than containers, or run gcloud commands from your cluster, you must set access scopes (\#gke-scope) for the service account when you create the cluster or node pool.

3. If you're not using a supported version (/artifact-registry/docs/integrate-gke) of GKE,
configure imagePullSecrets (\#gke-secret).

## User-Provided Service Account

If you want to use a user-provided service account (/iam/docs/service-accounts) as the identity for a cluster, you must:
1. Grant (\#grant) the required permissions to the service account from the Google Cloud project where Artifact Registry is running.

2. By default, creating a cluster or node pool with a user-provided service account grants the cloud-platform access scope.

If you use the --scopes flag with the gcloud container clusters create (/sdk/gcloud/reference/container/clusters/create) or gcloud container node-pools create (/sdk/gcloud/reference/container/node-pools/create) command, you must include the appropriate access scopes (\#gke-scope) for use with Artifact Registry.

## Setting Access Scopes

Access scopes are the legacy method of specifying authorization for Compute Engine VMs. To pull images from Artifact Registry repositories, GKE nodes must have the storage read-only access scope or another storage access scope that includes storage read access. You can only set access scopes when you create a cluster or node pool. You cannot change access scopes on existing nodes.

If you're using the Compute Engine default service account (/compute/docs/access/service-accounts\#default_service_account), GKE creates nodes with the Compute Engine default access scopes (/compute/docs/access/service-accounts\#default_scopes), which includes read-only access to storage. If you're using a user-provided service account, GKE creates nodes with the cloudplatform scope, the scope required for most Google Cloud services.

To specify access scopes when creating a cluster, run the following command:
gcloud container clusters create NAME edit --scopes=SCOPES edit To specify access scopes when creating a node pool, run the following command:
gcloud container node-pools create NAME edit --scopes=SCOPES edit Replace the following values:
NAME is the name of the cluster or node pool. SCOPES is a comma-separated list of access scopes to grant.

To access Docker repositories, use one of the following scopes: storage-ro - Grants read-only permission for pulling images. storage-rw - Grants read and write permission for pushing or pulling images. cloud-platform - View and manage data, including metadata, across Google Cloud service. To access other repositories, you must use the cloud-platform scope.

For a full list of scopes, see the documentation for gcloud container clusters create (/sdk/gcloud/reference/container/clusters/create) or gcloud container node-pools create (/sdk/gcloud/reference/container/node-pools/create).

For more information about scopes you can set when creating a new cluster, refer to the documentation for the command gcloud container clusters create (/sdk/gcloud/reference/container/clusters/create).

## Configuring An Imagepullsecret

To configure an imagePullSecret:
1. In the project with GKE, find Compute Engine default service account. The account email address has the suffix **@developer.gserviceaccount.com**.

2. Download the service account key
 (/iam/docs/creating-managing-service-account-keys\#creating_service_account_keys) for the service account.

Note: Service account keys are a security risk if not managed correctly. You should choose a more secure alternative to service account keys (/docs/authentication\#auth-decision-tree) whenever possible. If you must authenticate with a service account key, you are responsible for the security of the private key and for other operations described by Best practices for managing service account keys (/iam/docs/best-practices-for-managing-service-account-keys). If you are prevented from creating a service account key, service account key creation might be disabled for your organization.

For more information, see Managing secure-by-default organization resources
 (/resource-manager/docs/secure-by-default-organizations).

3. In the project with the repository, verify that you have granted permissions (\#grant) to the repository.

4. In the project with your cluster, create an imagePullSecret secret called artifactregistry with the service account key.

kubectl create secret docker-registry artifact-registry \ --docker-server=https:// -docker.pkg.dev \ --docker-email= \ --docker-username=_json_key \ --docker-password="$(cat )"
LOCATION edit SERVICE-ACCOUNT-EMAIL edit KEY-FILE edit

## Where

LOCATION is the regional or multi-regional location (/artifact-registry/docs/repo-locations) of the repository. SERVICE-ACCOUNT-EMAIL is the email address of the Compute Engine service account. KEY-FILE is the name of your service account key file. For example key.json.

5. Open your default service account:
kubectl edit serviceaccount default --namespace default Every namespace (https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/) in your Kubernetes cluster has a default service account called default. This default service account is used to pull your container image.

6. Add the newly created imagePullSecret secret to your default service account:
imagePullSecrets: - name: artifact-registry Your service account should now look like this:
apiVersion: v1 kind: ServiceAccount metadata:
name: default namespace: default ...

secrets: - name: default-token-zd84v \# The secret you created: imagePullSecrets: - name: artifact-registry Now, any new pods created in the current default namespace will have the imagePullSecret secret defined.

## Artifact Registry Service Account

The Artifact Registry Service Agent is a Google-managed service account that acts on behalf of Artifact Registry when interacting with Google Cloud services. For more information about the account and its permissions, see Artifact Registry service account (/artifact-registry/docs/ar-service-account).

## What'S Next

After you have set up permissions, learn more about working with your artifacts.

Container images: Docker (/artifact-registry/docs/docker), Helm (/artifact-registry/docs/helm) Language packages: Java (/artifact-registry/docs/java), Node.js (/artifact-registry/docs/nodejs), Python (/artifact-registry/docs/python), Go (/artifact-registry/docs/go) OS packages: Debian (/artifact-registry/docs/os-packages/debian), RPM
 (/artifact-registry/docs/os-packages/rpm)
Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-05-23 UTC.