# Create A Docker Hub Remote Repository

Create a remote repository to act as a proxy for Docker Hub.

## Before You Begin

1. In the Google Cloud console, on the project selector page, select or create a Google Cloud project
 (/resource-manager/docs/creating-managing-projects).

star Note: If you don't plan to keep the resources that you create in this procedure, create a project instead of selecting an existing project. After you finish these steps, you can delete the project, removing all resources associated with the project.

Go to project selector (https://console.cloud.google.com/projectselector2/home/dashboard)
2. Make sure that billing is enabled for your Google Cloud project (/billing/docs/how-to/verify-billing-enabled\#console). 3. Enable the Artifact Registry, Secret Manager APIs.

Enable the APIs (https://console.cloud.google.com/flows/enableapi?apiid=artifactregistry.googleapis.com,secretmanager.googleapis.com&redirect=https://
4. Install (/sdk/docs/install) the Google Cloud CLI. 5. To initialize (/sdk/docs/initializing) the gcloud CLI, run the following command:
gcloud init star Note: If you installed the gcloud CLI previously, make sure you have the latest version by running gcloud components update.

6. Create a Docker Hub (https://www.docker.com/products/docker-hub/) account.

Required roles To get the permissions that you need to create a Docker Hub remote repository, ask your administrator to grant you the following IAM roles:
To create remote repositories and grant access to individual repositories: Artifact Registry Administrator (https://cloud.google.com/iam/docs/understanding-roles\#artifactregistry.admin) (roles/artifactregistry.admin) on the project To create and manage secrets: Secret Manager Admin role  (https://cloud.google.com/iam/docs/understanding-roles\#secretmanager.admin) (roles/secretmanager.admin) on the project For more information about granting roles, see Manage access (/iam/docs/granting-changing-revoking-access). You might also be able to get the required permissions through custom roles (/iam/docs/creating-custom-roles) or other predefined roles (/iam/docs/understanding-roles).

## Choose A Shell

To complete this quickstart, use either Cloud Shell or your local shell. Cloud Shell Cloud Shell (/shell/docs) is a shell environment for managing resources hosted on Google Cloud. It comes preinstalled with Docker and the Google Cloud CLI (/sdk/gcloud), the primary command-line interface for Google Cloud.

Local shell If you prefer using your local shell, you must install Docker and gcloud CLI in your environment.

Starting Cloud Shell To launch Cloud Shell, perform the following steps:
1. Go to Google Cloud console.

Google Cloud console (https://console.cloud.google.com/)
2. Click the **Activate Cloud Shell** button:
.

A Cloud Shell session opens inside a frame lower on the console. You use this shell to run gcloud commands.

Setting up a local shell To install gcloud CLI and Docker, perform the following steps:
1. Install the gcloud CLI (/sdk/docs/install). To update an existing installation, run the command gcloud components update.

star Note: On Ubuntu, use the Debian package (/sdk/docs/install\#deb) to install gcloud CLI. The gcloud CLI snap package does not include kubectl or extensions to authenticate with Artifact Registry using the gcloud CLI.

2. Install Docker  (https://docs.docker.com/install/linux/docker-ce/ubuntu/) if it is not already installed. 3. Docker requires privileged access to interact with registries. On Linux or Windows, add the user that you use to run Docker commands to the Docker security group. This step is not required on macOS since Docker Desktop
 (https://docs.docker.com/docker-for-mac/docker-toolbox/) runs on a virtual machine as the root user.

```
Linux
      
    (#linux)
     Windows (#windows)

```

The Docker security group is called docker. To add your username, run the following command:
sudo usermod -a -G docker ${USER}
star Note: The Docker security group has access equivalent to the root or Administrator user. Only add trusted users who require access to Docker. For details about security impacts, see Docker daemon security  (https://docs.docker.com/engine/security/security/\#docker-daemon-attack-surface).

4. Log out and log back in for group membership changes to take effect. If you are using a virtual machine, you may need to restart the virtual machine for membership changes to take effect.

5. To ensure that Docker is running, run the following Docker command, which returns the current time and date:
docker run --rm busybox date The --rm flag deletes the container instance on exit.

Configure Docker Hub authentication To prevent using unauthenticated Docker Hub quota (https://www.docker.com/increase-rate-limits/), we recommend authenticating to Docker Hub when using remote repositories. Remote repositories allow you to add your Docker Hub username and a personal access token saved as a secret to authenticate to Docker Hub.

Create a Docker Hub personal access token 1. Login to Docker Hub (https://hub.docker.com/). 2. Create a personal access token (https://docs.docker.com/docker-hub/access-tokens/) with **read-only** permissions. 3. Copy the access token.

warning Warning: The access token is only displayed once. If you close the window it can't be retrieved and you have to create a new access token.

4. Save the access token in a text file in your local or Cloud Shell.

warning Warning: Treat access tokens like passwords and keep them secure.

Save your personal access token in a secret console  (\#console)gcloud CLI
 (\#gcloud-cli)
gcloud secrets create my-secret --data-file="/path/to/file.txt" Where /path/to/file.txt is the location of the text file with your personal access token.

Grant the Artifact Registry service account access to your secret console  (\#console)gcloud CLI
 (\#gcloud-cli)

```
gcloud secrets add-iam-policy-binding my-secret \
   --member="serviceAccount:service- @gcp-sa-artifactregistry.iam.gserviceaccount.com" \
   --role="roles/secretmanager.secretAccessor"
                                     PROJECT-NUMBER edit
                                                       

```

Where *PROJECT-NUMBER* is the project number of your project. To find your project number:
Go to the **Dashboard** page (https://console.cloud.google.com/home) in the Google Cloud console.

Go to the Dashboard page (https://console.cloud.google.com/home)
Click the **Select from** drop-down list at the top of the page. In the **Select from** window that appears, select your project. The project ID and project number are displayed on the project Dashboard **Project info** card.

Create a remote repository Create an Artifact Registry remote repository named quickstart-docker-hub-remote in location us-central1 with your Docker Hub credentials by running the following command:
gcloud artifacts repositories create quickstart-docker-hub-remote \
--project= \ --repository-format=DOCKER \ --location=us-central1 \ --description="Remote Docker repository" \ --mode=remote-repository \ --remote-repo-config-desc="Docker Hub" \ --remote-docker-repo=DOCKER-HUB \ --remote-username= \ --remote-password-secret-version=projects/ /secrets/my-secret/versions/1 PROJECT_ID edit

```
USERNAME edit
           
                       PROJECT edit
                                  

```

Where:
quickstart-docker-hub-remote is the name of the repository. For each repository location in a project, repository names must be unique.

PROJECT_ID is your project ID. If this flag is omitted, the current or default project is used.

us-central1 is the regional or multi-regional location (/artifact-registry/docs/repositories/repo-locations) for the repository. You can omit this flag if you set a default (/artifact-registry/docs/repositories/gcloud-defaults\#set). To view a list of supported locations, run the command gcloud artifacts locations list. "Remote Docker repository" is the optional description of your repository. Do not include sensitive data, since repository descriptions are not encrypted. "Docker Hub" is the optional description for the external repository configuration for this remote repository. DOCKER-HUB sets the remote repository upstream to the public Docker Hub upstream. USERNAME is your Docker Hub username. projects/PROJECT/secrets/my-secret/versions/1 is the secret version you created to store your Docker Hub personal access token.

Artifact Registry creates the repository and adds it to the list of repositories.

## Configure Docker Authentication

Before you can push or pull images, configure Docker to use the Google Cloud CLI to authenticate requests to Artifact Registry.

1. Sign in to gcloud CLI as the user that will run Docker commands.

gcloud auth login 2. To set up authentication to Docker repositories in the region us-central1, run the following command:
gcloud auth configure-docker us-central1-docker.pkg.dev The command updates your Docker configuration. You can now connect with Artifact Registry in your Google Cloud project to push and pull images.

For information about other authentication methods, see Authentication methods (/artifact-registry/docs/docker/authentication\#methods).

## Pull An Image Into Your Remote Repository

1. Sign in to gcloud CLI as the user that will run Docker commands.

gcloud auth login 2. Pull an image from Docker Hub onto your machine, and into your remote repository with the following command:
docker pull us-central1-docker.pkg.dev/PROJECT edit/quickstart-docker-hub-remote/busybox:latest Where:
us-central1 is the remote repository location. us-central1-docker.pkg.dev is the hostname for the Docker repository you created. PROJECT is your Google Cloud project ID (/resource-manager/docs/creating-managing-projects\#identifying_projects). If your project ID contains a colon (:), see Domain-scoped projects (/artifact-registry/docs/docker/names\#domain). quickstart-docker-hub-remote is the ID of the repository you created. busybox is the name of the image you want to pull from Docker Hub into quickstart-docker-hub-remote. latest is the tagged image version you want to pull from Docker Hub.

The image is pulled onto your machine and cached in the remote repository. If you pull the same tagged image again, it will be pulled from your remote repository. Your Docker Hub credentials are used.

3. List the artifacts stored in your remote repository:
gcloud artifacts packages list \
--location=us-central1 \ --repository=quickstart-docker-hub-remote The output resembles the following:
Listing items under project my-project, location us-central1, repository quickstart-docker-hub-remote. PACKAGE: busybox CREATE_TIME: 2023-06-19T18:59:09 UPDATE_TIME: 2023-06-19T18:59:10

## Clean Up

To avoid incurring charges to your Google Cloud account for the resources used on this page, follow these steps.

Delete your repository If you want to keep your project and only delete the repository resource, follow the steps in this section. If you want to delete your entire project, follow the steps in Delete your project (\#delete_your_project) Before you remove the repository, ensure that any images you want to keep are available in another location. To delete the repository:
Console  (\#console)gcloud
 (\#gcloud)
To delete the quickstart-docker-hub-remote repository, run the following command:
gcloud artifacts repositories delete quickstart-docker-hub-remote \
--location=us-central1 Delete your project error Caution: Deleting a project has the following effects:
Everything in the project is deleted. If you used an existing project for the tasks in this document, when you delete it, you also delete any other work you've done in the project. Custom project IDs are lost. When you created this project, you might have created a custom project ID that you want to use in the future. To preserve the URLs that use the project ID, such as an appspot.com URL, delete selected resources inside the project instead of deleting the whole project.

If you plan to explore multiple architectures, tutorials, or quickstarts, reusing projects can help you avoid exceeding project quota limits.

1. In the Google Cloud console, go to the **Manage resources** page.

Go to Manage resources (https://console.cloud.google.com/iam-admin/projects)
2. In the project list, select the project that you want to delete, and then click **Delete**. 3. In the dialog, type the project ID, and then click **Shut down** to delete the project.

## What'S Next

Read about the different Artifact Registry repository modes (/artifact-registry/docs/repositories\#mode). Learn more about Artifact Registry remote repositories (/artifact-registry/docs/repositories/remote-repo). Learn more about CI/CD  (/docs/ci-cd).

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-05-23 UTC.