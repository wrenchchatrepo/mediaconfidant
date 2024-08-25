# Store Docker Container Images In Artifact Registry

Artifact Registry provides a single location for managing private packages and Docker container images. This quickstart shows you how to:
Create a private Docker repository in Artifact Registry Set up authentication Push an image to the repository Pull the image from the repository To follow step-by-step guidance for this task directly in the Google Cloud console, click **Guide me**:
Guide me (https://console.cloud.google.com/?tutorial=artifact_registry_docker_quickstart)

## Before You Begin

1. In the Google Cloud console, on the project selector page, select or create a Google Cloud project
 (/resource-manager/docs/creating-managing-projects).

star Note: If you don't plan to keep the resources that you create in this procedure, create a project instead of selecting an existing project. After you finish these steps, you can delete the project, removing all resources associated with the project.

Go to project selector (https://console.cloud.google.com/projectselector2/home/dashboard)
2. Make sure that billing is enabled for your Google Cloud project (/billing/docs/how-to/verify-billing-enabled\#console). 3. Enable the Artifact Registry API.

Enable the API (https://console.cloud.google.com/flows/enableapi?apiid=artifactregistry.googleapis.com&redirect=https://cloud.google.com/artifact-registr

## Choose A Shell

To complete this quickstart, use either Cloud Shell or your local shell. Cloud Shell Cloud Shell (/shell/docs) is a shell environment for managing resources hosted on Google Cloud. It comes preinstalled with Docker and the Google Cloud CLI (/sdk/gcloud), the primary command-line interface for Google Cloud.

Local shell If you prefer using your local shell, you must install Docker and gcloud CLI in your environment.

Starting Cloud Shell To launch Cloud Shell, perform the following steps:
1. Go to Google Cloud console.

Google Cloud console (https://console.cloud.google.com/)
2. Click the **Activate Cloud Shell** button:
A Cloud Shell session opens inside a frame lower on the console. You use this shell to run gcloud commands.

Setting up a local shell To install gcloud CLI and Docker, perform the following steps:
1. Install the gcloud CLI (/sdk/docs/install). To update an existing installation, run the command gcloud components update.

star Note: On Ubuntu, use the Debian package (/sdk/docs/install\#deb) to install gcloud CLI. The gcloud CLI snap package does not include kubectl or extensions to authenticate with Artifact Registry using the gcloud CLI.

2. Install Docker  (https://docs.docker.com/install/linux/docker-ce/ubuntu/) if it is not already installed. 3. Docker requires privileged access to interact with registries. On Linux or Windows, add the user that you use to run Docker commands to the Docker security group. This step is not required on MacOS since Docker Desktop
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

## Create A Docker Repository

Create a Docker repository to store the sample image for this quickstart.

Console  (\#console)gcloud
 (\#gcloud)
1. Run the following command to create a new Docker repository named quickstart-docker-repo in the location us-central1 with the description "docker repository".

gcloud artifacts repositories create quickstart-docker-repo --repository-format=docker \
--location=us-central1 --description="Docker repository" \
--project=PROJECT edit Where *PROJECT* is your Google Cloud project ID.

2. Run the following command to verify that your repository was created.

gcloud artifacts repositories list \
--project=PROJECT edit For more information about Artifact Registry commands, run the command gcloud artifacts.

## Configure Authentication

Before you can push or pull images, configure Docker to use the Google Cloud CLI to authenticate requests to Artifact Registry. To set up authentication to Docker repositories in the region us-central1, run the following command:
gcloud auth configure-docker us-central1-docker.pkg.dev The command updates your Docker configuration. You can now connect with Artifact Registry in your Google Cloud project to push and pull images. For information about other authentication methods, see Authentication methods (/artifact-registry/docs/docker/authentication).

Obtain an image to push For this quickstart, you will push a sample image named hello-app. Run the following command to pull version 1.0 of the image.

docker pull us-docker.pkg.dev/google-samples/containers/gke/hello-app:1.0 Image paths in Artifact Registry include multiple parts. For this sample image:
us is the location of the repository. docker.pkg.dev is the hostname for container images stored in Artifact Registry Docker repositories. google-samples is the repository ID. containers/gke/ is the path to the image under google-samples.

Add the image to the repository Before you push the Docker image to Artifact Registry, you must tag it with the repository name.

Tag the image with a registry name Tagging the Docker image with a repository name configures the docker push command to push the image to a specific location. For this quickstart, the host location is us-central1-docker.pkg.dev. Run the following command to tag the image as quickstart-image:tag1:
docker tag us-docker.pkg.dev/google-samples/containers/gke/hello-app:1.0 \
us-central1-docker.pkg.dev/PROJECT edit/quickstart-docker-repo/quickstart-image:tag1 Where us-central1 is the repository location. docker.pkg.dev is the hostname for the Docker repository you created. PROJECT is your Google Cloud project ID (/resource-manager/docs/creating-managing-projects\#identifying_projects). If your project ID contains a colon (:), see Domain-scoped projects (/artifact-registry/docs/docker/names\#domain). quickstart-docker-repo is the ID of the repository you created. quickstart-image is the image name you want to use in the repository. The image name can be different than the local image name. For this quickstart you will store the image directly under the repository ID quickstart-docker-repo. tag1 is a tag you're adding to the Docker image. If you didn't specify a tag, Docker will apply the default tag latest.

You are now ready to push the image to the repository you created.

Push the image to Artifact Registry After you have configured authentication and tagged the local image, you can push the image to the repository that you created. To push the Docker image, run the following command:
docker push us-central1-docker.pkg.dev/PROJECT edit/quickstart-docker-repo/quickstart-image:tag1 Replace *PROJECT* with your Google Cloud project ID (/resource-manager/docs/creating-managing-projects\#identifying_projects). If your project ID contains a colon (:), see Domain-scoped projects (/artifact-registry/docs/docker/names\#domain).

## Pull The Image From Artifact Registry

To pull the image from Artifact Registry onto your local machine, run the following command:
docker pull us-central1-docker.pkg.dev/PROJECT edit/quickstart-docker-repo/quickstart-image:tag1 Replace *PROJECT* with your Google Cloud project ID (/resource-manager/docs/creating-managing-projects\#identifying_projects). If your project ID contains a colon (:), see Domain-scoped projects (/artifact-registry/docs/docker/names\#domain). You should see output similar to the following:
latest: Pulling from [PROJECT-ID]/quickstart-image:tag1 Digest: sha256:70c42... Status: Image is up to date for us-central1-docker.pkg.dev/PROJECT/quickstart-docker-repo/quickstart-image:tag1

## Clean Up

To avoid incurring charges to your Google Cloud account for the resources used on this page, follow these steps. Before you remove the repository, ensure that any images you want to keep are available in another location.

To delete the repository:
Console  (\#console)gcloud
 (\#gcloud)
To delete the quickstart-docker-repo repository, run the following command:
gcloud artifacts repositories delete quickstart-docker-repo --location=us-central1

## What'S Next

Learn more about working with container images (/artifact-registry/docs/docker). Learn more about Docker  (https://docs.docker.com/get-started/). Read our resources about DevOps (/devops) and explore the DevOps Research and Assessment (DORA) (https://dora.dev/) research program.

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-05-23 UTC.