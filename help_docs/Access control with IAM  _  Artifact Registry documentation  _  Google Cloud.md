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