Open in app Search *Write*

# Push Code With Github **Actions** To Google Cloud'S Artifact **Registry**

Roger Martinez · *Follow*

![0_image_0.png](0_image_0.png)

10 min read · Mar 20, *2024* If you've got some application code sitting in GitHub and need to **push** it to a Docker registry, there are a lot of options. This article is going to cover **just** one: pushing to Google Cloud Artifact Registry using GitHub Actions. And we're going to make it happen without using service account **keys** by leveraging Google Cloud Workload Identity **Federation.**
Where to **begin**
Some things we need *first* 1/21

![0_image_1.png](0_image_1.png)

 7:24 AM Push code with   to     | by   | To follow along with what I'm going to demonstrate, you'll need a **couple** of things: ☑️ A Google Cloud project: this will be the project where we'll be creating our resources, which includes an Artifact Registry repository and some IAM resources. Enable the IAM Service Account Credentials and Artifact **Registry** APIs on this **project.** ☑️ Google Cloud CLI: we'll be using the gcloud CLI to interact with **Google** Cloud. If you don't want to install it on your local machine, you can use the Cloud Shell in the Google Cloud console which has gcloud **built-in.** ☑️ A GitHub repository: you'll need a GitHub repository with a **Dockerfile** so that you can build and push your container image to the Artifact **Registry.**

## Github Actions Workflow **File**

GitHub Action workflows are typically stored as yaml files in the
.github/workflows/ directory of your repo. Here's the GitHub **Action**
workflow file we're working **with:**
name: Push to Artifact **Registry** on:
push:
branches: [ **"main"** ]
env:
IMAGE_NAME: '' PROJECT_ID: '' AR_REPO_LOCATION: '' AR_URL: '' SERVICE_ACCOUNT: '' WORKLOAD_IDENTITY_PROVIDER: ''
jobs:
push_to_ar:
permissions:
contents: **'read'** id-token: **'write'**
runs-on: **ubuntu-latest** steps:
- name: **Checkout**
uses: **actions/checkout@v2**
- name: Google **Auth**
id: **auth** uses: **'google-github-actions/auth@v2'** with:
token_format: **'access_token'** project_id: ${{ **env.PROJECT_ID** }} service_account: ${{ **env.SERVICE_ACCOUNT** }} workload_identity_provider: ${{ **env.WORKLOAD_IDENTITY_PROVIDER** }}
- name: Docker **Auth**
id: **docker-auth** uses: **'docker/login-action@v1'** with:
username: **'oauth2accesstoken'** password: '${{ steps.auth.outputs.access_token }}' registry: '${{ env.AR_REPO_LOCATION **}}-docker.pkg.dev'**
- name: Build and Push **Container**
run: |docker build -t "${{ env.AR_URL }}/${{ env.IMAGE_NAME }}:${{ **github.sh** docker push "${{ env.AR_URL }}/${{ env.IMAGE_NAME }}:${{ **github.sha** }}
This workflow will authenticate with Google Cloud using the Google **Cloud** auth GitHub Action and use Docker to authenticate and push to the **registry.** To make this workflow work (or flow?) we need to set up some Google **Cloud** resources and add in those values for our environment variables. Make **sure** to add in the value for PROJECT_ID where you have permission to **create** resources. The value for IMAGE_NAME can be anything - it'll be created the first time this workflow **runs:**
...

![3_image_0.png](3_image_0.png) env:
IMAGE_NAME: '**my-app-image**' PROJECT_ID: '**my-project-id**' AR_REPO_LOCATION: '' AR_URL: '' SERVICE_ACCOUNT: '' WORKLOAD_IDENTITY_PROVIDER: ''
...

Good start! Next we'll need an Artifact Registry **repository.**

## Artifact Registry **Repository**

Artifact Registry is Google Cloud's build artifact management **solution.** It supports several types of repositories like apt, Maven, and Python. For our purposes, we want a Docker repository. You can use an existing **one,** or create a new one with this gcloud **command:**
gcloud artifacts repositories create **my-ar-repo** \

![3_image_1.png](3_image_1.png)

--repository-format=docker \
--location=us-central1 \
--description="Example Docker **repository"**
This will create a Docker repository called my-ar-repo in the **us-central1** region. You can see it in the console on the Artifact Registry **repositories** page. For our workflow YAML file, we need the Artifact Registry URL. **Let's** retrieve that with the following **command:**
gcloud artifacts repositories describe my-ar-repo **--location=us-central1**
The output will look like **this:**
Encryption: Google-managed key Registry URL: **us-central1-docker.pkg.dev/my-project-id/my-ar-repo** Repository Size: **5026.459MB** createTime: **'2024-03-13T23:19:57.701232Z'** description: Example Docker **repository** format: **DOCKER** mode: **STANDARD_REPOSITORY** name: **projects/my-project-id/locations/us-central1/repositories/my-ar-repo** updateTime: **'2024-03-18T17:08:49.658081Z'**
Let's take that value for the Registry URL and throw it into our **GitHub** Actions workflow file, along with the repo **location:**
... env:
IMAGE_NAME: **'my-app-image'** PROJECT_ID: **'my-project-id'** AR_REPO_LOCATION: '**us-central1**' AR_URL: '**us-central1-docker.pkg.dev/my-project-id/my-ar-repo**' SERVICE_ACCOUNT: '' WORKLOAD_IDENTITY_PROVIDER: ''
...

## Service **Account**

Next, we need a service account to serve as the identity that's **going** to be doing the pushing to the Artifact Registry repository. Create a **service**
 5/21 account with **gcloud** :
gcloud iam service-accounts create **github-actions-service-account** \
--description="A service account for use in a GitHub Actions **workflow"** \
--display-name="GitHub Actions service **account."**
Now that we have a service account (see it in the console under IAM), **let's** add the service account email to our YAML file. The **format** is SERVICE_ACCT_NAME@PROJECT_ID.iam.gserviceaccount.com :
... env:
IMAGE_NAME: **'my-app-image'** PROJECT_ID: **'my-project-id'** AR_REPO_LOCATION: **'us-central1'** AR_URL: **'us-central1-docker.pkg.dev/my-project-id/my-ar-repo'** SERVICE_ACCOUNT: '**github-actions-service-account@my-project-id.iam.gserviceacc** WORKLOAD_IDENTITY_PROVIDER: ''
...

By default, the service account has no permissions on any resources on the project. We only need it to be able to push builds to our Artifact **Registry** repo. Let's make it so:
gcloud artifacts repositories add-iam-policy-binding **my-ar-repo** \
--location=us-central1 \ --role=roles/artifactregistry.createOnPushWriter \ --member=serviceAccount:github-actions-service-account@my-project-id.iam.gserv 7:24 AM Push code with   to     | by   | The command above grants the Artifact Registry Create-on-Push *Writer* IAM role to our service account, but only for our particular Artifact **Registry** repository. We could grant it on the entire project by adding the IAM **binding** to the project IAM *policy*, but since Artifact Registry repos have their own IAM policies, we can practice some least privilege and narrow the **scope** to just the one we're working **with.** With that, our service account is able to push builds to our Artifact **Registry.** Well not really - now we need a way to tell it to do **that.**
Note: If the application image already existed in our repository, *then* roles/artifactregistry.writer would suf ice. We're *using* roles/artifactregistry.createOnPushWriter instead because on the first **push,** it needs to be able to create the initial image for our *application.*

## Workload Identity **Federation**

Historically, one way to programmatically access resources with a **service** account has been to use JSON keys to authenticate with their **credentials.** That's still possible, but it is highly discouraged due to the security **risk**
associated with managing them. You'll see caution signs about **that**
throughout Google Cloud console and **documentation:**

![6_image_0.png](6_image_0.png)

TLDR: service account keys bad 7:24 AM Push code with   to     | by   | Workload Identity *Federation* offers an alternative. It lets us grant **external** identities the ability to impersonate a service account without the **burden** of service account keys. Our goal is to create a workload identity pool *provider* for our GitHub repository so that we can impersonate our service **account** from a GitHub Actions **workflow.**

## Create A Workload Identity **Pool**

Before we can create a provider, we need to create a workload identity *pool*. A workload identity pool is a Google Cloud resource that is used to **manage** external identities. Google Cloud suggests creating a new pool for each non- Google Cloud environment that needs to access resources in our project. For our case, let's create a workload identity pool for our app's **development** environment:
gcloud iam workload-identity-pools create **"my-app-dev-pool"** \

![7_image_1.png](7_image_1.png)

![7_image_2.png](7_image_2.png)

![7_image_0.png](7_image_0.png) --display-name="Identity pool for my test **app"**
This creates a workload identity pool on your project. See it in the **console** under **IAM.**
 7:24 AM Push code with   to     | by   | 

![8_image_0.png](8_image_0.png)

Look at *that*

## Create A Workload Identity Pool **Provider**

A workload identity pool *provider* describes the relationship between **Google** Cloud and an identity provider (IdP) that supports OpenID Connect **(OIDC).** It must be created within a workload identity **pool:**
gcloud iam workload-identity-pools providers create-oidc **"github-actions-provide**
--location="global" \ --workload-identity-pool="my-app-dev-pool" \ --display-name="Provider for GitHub **Actions"** \ --issuer-uri="https://token.actions.githubusercontent.com" \ --attribute-mapping="google.subject=assertion.sub,attribute.actor=assertion.act The create-oidc sub-command indicates that we want to create an **OpenID** Connect *(OIDC)* provider in our pool. GitHub uses OIDC to authenticate **with**
 9/21 7:24 AM Push code with   to     | by   | different cloud providers (see GitHub documentation on it here). The issueruri parameter specifies the provider URL, as indicated by GitHub's **OIDC** documentation. The --attribute-mapping parameter lists our attribute *mapping*. **Attribute** mapping defines how values are derived from an external token and **mapped** to the Google Security Token Service (STS) token attributes. The value for **this** parameter is a comma-separated list of mappings in the **form** of TARGET_ATTRIBUTE=SOURCE_EXPRESSION . These attributes will be referenced **later**
when we set up **permissions.**
Learn more about attribute mapping from Google Cloud's **documentation** on workload identity *federation.*
With a workload identity pool provider in place we can add the value to our workflow YAML file. First, retrieve the full name of the **provider:**
gcloud iam workload-identity-pools providers describe **github-actions-provider** \
--location=global \
--workload-identity-pool="my-app-dev-pool" The output will include the name which will be in the **format**
projects/PROJECT_NUMBER/locations/POOL_LOCATION/workloadIdentityPools/**POOL_**
NAME/providers/PROVIDER_NAME. That's what we need for the WORKLOAD_IDENTITY_PROVIDER environment **variable:**
 7:24 AM Push code with   to     | by   | IMAGE_NAME: **'my-app-image'** PROJECT_ID: **'my-project-id'** AR_REPO_LOCATION: **'us-central1'** AR_URL: **'us-central1-docker.pkg.dev/my-project-id/my-ar-repo'** SERVICE_ACCOUNT: **'github-actions-service-account@my-project-id.iam.gserviceacc** WORKLOAD_IDENTITY_PROVIDER: '**projects/123456789/locations/global/workloadIdent**
...

## Setting **Permissions**

The only permissions we've granted so far have been to our service **account** to push to the Artifact Registry repository. Now that we have a **workload** identity provider, we need to grant it permission to act as the **service** account. If we wanted to grant service account impersonation permissions to a **user** account or service account principal, we would grant the Service *Account* Token *Creator* role on the service account's IAM **policy:**
gcloud iam service-accounts **add-iam-policy-binding** \
github-actions-service-account@my-project-id.iam.gserviceaccount.com \ --role=roles/iam.serviceAccountTokenCreator \ --member=user:roger@myemail.com This command would allow my user account to act as the service **account** and access whatever the service account can access. With Workload **Identity** Federation, it's the same concept with 2 differences: the IAM role and the principal (or the member parameter in the command **above).** Instead of granting the Service Account Token *Creator* **role** (roles/iam.serviceAccountTokenCreator) to our workload identity **pool**
 7:24 AM Push code with   to     | by   | principal, we need to grant the Workload Identity *User* **role** (roles/iam.workloadIdentityUser) instead. This role allows the **principal** to impersonate service accounts from federated **workloads.** As for the principal, the prefixes user and serviceAccount are used for **user** accounts and service accounts, respectively, followed by an email **address:**
user:roger@myemail.com serviceAccount:my-service-account@my-project-id.iam.gserviceaccount.com Workload Identity Federation however uses principalSet as a **prefix,** followed by a member *identifier* that includes the identity pool and an attribute from the provider's attribute **mapping:**
principalSet://iam.googleapis.com/WORKLOAD_IDENTITY_POOL_NAME/attribute.ATT
RIBUTE_NAME/ATTRIBUTE_VALUE
For example, the following principal can be used to grant access to **external** identities coming from any GitHub repository that your organization **owns:**
principalSet://iam.googleapis.com/WORKLOAD_IDENTITY_POOL_NAME/**attribute.own**
er/your-github-organization We can use any of the attributes that we mapped on our workload **identity** federation OIDC provider earlier. The principal that we'll be using, **however,** will narrow access down to external identities corresponding with one particular GitHub repository using **attribute.repository:**
 7:24 AM Push code with   to     | by   | principalSet://iam.googleapis.com/WORKLOAD_IDENTITY_POOL_NAME/attribute.rep ository/**github-repo-owner/github-repo-name**
Note: Besides attributes, you can grant permissions to external *identities* by subject and by group. Learn more about that *here.*
So we've got a IAM role and a principal to grant it to. Let's add an IAM binding to our service account's IAM policy. First, retrieve the **workload** identity pool **name:**
gcloud iam workload-identity-pools describe **"my-app-dev-pool"** \
--location=global The value will be in the **format**
projects/PROJECT_NUMBER/locations/POOL_LOCATION/workloadIdentityPools/POOL_
NAME
It's a long string, so let's throw this into an environment **variable:**
export **WIP_POOL=projects/123456789/locations/global/workloadIdentityPools/my-app**
And finally, let's add the binding to the service account's IAM policy. Be **sure** to update the values for GITHUB_REPO_OWNER and GITHUB_REPO_NAME with **values** for the GitHub repo that you plan on the running the workflow **from:**
gcloud iam service-accounts **add-iam-policy-binding** \
github-actions-service-account@my-project-id.iam.gserviceaccount.com \ --role=roles/iam.workloadIdentityUser \ --member=principalSet://iam.googleapis.com/${WIP_POOL}/attribute.repository/GI
With this binding in place, GitHub Actions is able to use Workload **Identity** Federation to authenticate as your service account and push builds to **your** Artifact Registry. There's one more thing we can do to further narrow the scope of access: specify an attribute *condition* on the identity pool **provider.** An attribute *condition* is an expression that checks an attribute and **must** evaluate to true for a given credential in order for it to be accepted. For example, we can define an attribute condition that checks whether the attribute repository_owner matches a GitHub organization or GitHub **user** that owns a **repository:**
gcloud iam workload-identity-pools providers **update-oidc** \

![13_image_0.png](13_image_0.png)

github-actions-provider \ --project=PROJECT_ID \
--location=global \
--workload-identity-pool=my-app-dev-pool \ --attribute-condition="assertion.repository_owner == **'GITHUB_REPO_OWNER'"**
In this example, the restriction added by this attribute **condition** is redundant, since the IAM policy binding is already limited to a **particular** repo owner. However, if for whatever reason the IAM policy ever **changes** to be more broad, this will still restrict access to the specified GitHub **repo** owner.

# Let'S Test **Drive**

Before we can test this out, you'll need a repository with a valid **Dockerfile.** Here's the final yaml file for our **workflow:**
name: Push to Artifact **Registry** on:
push:
branches: [ **"main"** ]
env:
IMAGE_NAME: **'my-app-image'** PROJECT_ID: **'my-project-id'** AR_REPO_LOCATION: **'us-central1'** AR_URL: **'us-central1-docker.pkg.dev/my-project-id/my-ar-repo'** SERVICE_ACCOUNT: **'github-actions-service-account@my-project-id.iam.gserviceacc** WORKLOAD_IDENTITY_PROVIDER: **'projects/123456789/locations/global/workloadIdent**
jobs:
push_to_ar:
permissions:
contents: **'read'** id-token: **'write'**
runs-on: **ubuntu-latest** steps:
- name: **Checkout**
uses: **actions/checkout@v2**
- name: Google **Auth**
id: **auth** uses: **'google-github-actions/auth@v2'** with:
token_format: **'access_token'** project_id: ${{ **env.PROJECT_ID** }} service_account: ${{ **env.SERVICE_ACCOUNT** }} workload_identity_provider: ${{ **env.WORKLOAD_IDENTITY_PROVIDER** }}
- name: Docker **Auth**
id: **docker-auth** uses: **'docker/login-action@v1'** with:
username: **'oauth2accesstoken'**
 15/21 7:24 AM Push code with   to     | by   | password: '${{ steps.auth.outputs.access_token }}' registry: '${{ env.AR_REPO_LOCATION **}}-docker.pkg.dev'**
- name: Build and Push **Container**
run: |docker build -t "${{ env.AR_URL }}/${{ env.IMAGE_NAME }}:${{ **github.sh** docker push "${{ env.AR_URL }}/${{ env.IMAGE_NAME }}:${{ **github.sha** }}
We'll place this configuration in our GitHub **repository** in
.github/workflows/push-to-ar.yml. As soon as you merge this file into **your**
main branch, it'll kick off the workflow and if all permissions and **resources** are in place, you'll have a build of your application sitting in your **Artifact** Registry. Verify by visiting the Artifact Registry page in the Google **Cloud** Console.

## What **Next?**

Arguably, the star of the show is the Google Auth GitHub Action - **that's** what's using the Workload Identity Provider and service account to **access** your Google Cloud project. If you plan on doing other things with **this** authentication, just be sure to use a service account that has the right **access** those things. For example, if you're using the Secret Manager GitHub **Action** to access secrets from Secret Manager, make sure the service account has the Secret Manager Secret *Accessor* IAM role on the project or secret. To **take** a look at all of the available actions, check out the repos available in the Google GitHub Actions GitHub **organization.**
Github Actions Google Cloud Platform Cicd Artifact Registry *DevOps*