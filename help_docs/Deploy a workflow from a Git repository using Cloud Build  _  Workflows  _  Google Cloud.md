# Deploy A Workflow From A Git Repository Using Cloud Build

You can use a Cloud Build trigger to automatically start a build and deploy a workflow from a Git repository. You can configure the trigger to deploy your workflow on any change to the source repository, or deploy the workflow only when the change matches specific criteria.

This approach can help you manage your deployment lifecycle. For example, you can deploy changes to a workflow in a staging environment, run tests against that environment, and then incrementally roll out these changes to the production environment.

## Before You Begin

These instructions assume you have the Cloud Build Editor role (/build/docs/iam-roles-permissions) (roles/cloudbuild.builds.editor) in your Google Cloud project so that you can create triggers. You also need a workflow in a source repository such as GitHub or Bitbucket.

```
Console
        
   (#console)
       gcloud  (#gcloud)

```

1. Enable the Cloud Build and Workflows APIs.

Enable the APIs (https://console.cloud.google.com/flows/enableapi?apiid=cloudbuild.googleapis.com,workflows.googleapis.com)
2. Grant the Workflows Admin role (/workflows/docs/access-control) (roles/workflows.admin) to the Cloud Build service account:
a. In the Google Cloud console, go to the IAM page.

Go to IAM (https://console.cloud.google.com/projectselector/iam-admin/iam?supportedpurview=project,folder,organizationId)
b. Select your project.

c. In the row for the Cloud Build service account (PROJECT_NUMBER@cloudbuild.gserviceaccount.com), click edit Edit principal.

d. Click add **Add another role**.

e. In the **Role** list, select the **Workflows Admin** role.

f. Click **Save**.

3. Grant the Service Account User role (/iam/docs/understanding-roles\#service-accounts-roles) (roles/iam.serviceAccountUser) on the Compute Engine default service account to the Cloud Build service account. When you have enabled the Compute Engine API (https://console.cloud.google.com/apis/api/compute.googleapis.com/overview), the Compute Engine default service account is PROJECT_NUMBER-compute@developer.gserviceaccount.com.

error Caution: Assigning the Service Account User role (/iam/docs/service-account-permissions\#user-role) indirectly grants the role associated with the default service account to the user. For example, if the default service account has the Editor role, the user can then "act as" an Editor. To minimize the impact of these role assignments, we recommend configuring the default service account according to the principle of least privilege (/iam/docs/using-iam-securely\#least_privilege). For more information, see Disable automatic role grants to default service accounts (/resource-manager/docs/organization-policy/restricting-service-accounts\#disable_service_account_default_grants).

## A. In The Google Cloud Console, Go To The **Service Accounts** Page.

Go to Service Accounts (https://console.cloud.google.com/projectselector/iam-admin/serviceaccounts?supportedpurview=project,folder,organiz b. Select your project.

c. Click the email address of the Compute Engine default service account (PROJECT_NUMBERcompute@developer.gserviceaccount.com).

d. Click the **Permissions** tab.

e. Click the person_add **Grant access** button.

f. To add a new principal, enter the email address of your service account
(SERVICE_ACCOUNT_NAME@PROJECT_ID.iam.gserviceaccount.com).

g. In the **Select a role** list, select the Service Accounts > **Service Account User** role.

h. Click **Save**.

## Connect To Your Source Repository

You must connect Cloud Build to your source repository so that Cloud Build can automate builds in response to events that happen in the repository. Complete the following steps to connect to GitHub or Bitbucket:
1. In the Google Cloud console, go to the Cloud Build **Triggers** page:
Go to Triggers (https://console.cloud.google.com/cloud-build/triggers)
2. If necessary, select your project and click **Open**. 3. From the **Region** list, select the region where you would like to create your trigger.

star Note: If you select **global** as your region, default pools are used to run your build; otherwise, a private pool (/build/docs/private-pools/private-pools-overview) in the region of your trigger is used. You **must** specify the private pool in your build config file or through build arguments.

4. Click **Connect repository**. 5. Select the source repository where you've stored your source code.

For example: **GitHub (Cloud Build GitHub App)**
6. Click **Continue**. 7. Authenticate to your source repository with your username and password.

If you are signing into GitHub, you are asked to authorise the Google Cloud Build GitHub App to access your GitHub account to proceed.

8. From the list of available repositories, select the desired repository, and then click OK.

For external repositories such as GitHub and Bitbucket, you must have owner-level permissions for the Google Cloud project in which you're working.

9. Read the disclaimer and select the checkbox next to it to indicate that you consent to the terms.

10. Click **Connect**. 11. To continue creating a build trigger to automate builds for the source code in the repository, click **Create a trigger**. Otherwise, click **Done**.

## Create A Cloud Build Configuration File

A build configuration file defines the fields that are needed when using a build trigger to start a build. Create the config file in your project root directory and write it using either YAML or JSON. For example, the following config file deploys and runs a test workflow, and then uses a script to check the output. If the test passes, the workflow is deployed:
steps: \# Deploy the test workflow with the commit sha - id: 'deploy-test-workflow' name: 'gcr.io/cloud-builders/gcloud' args: ['workflows', 'deploy', '$_WORKFLOW_NAME-$BRANCH_NAME-$SHORT_SHA', '--source', 'gitops/workflow.yaml']
\# Run the test workflow and capture the output - id: 'run-test-workflow' name: 'gcr.io/cloud-builders/gcloud' entrypoint: 'bash' args: ['-c', 'gcloud workflows run $_WORKFLOW_NAME-$BRANCH_NAME-$SHORT_SHA > /workspace/testoutput.log']
\# Delete the test workflow - id: 'delete-test-workflow' name: 'gcr.io/cloud-builders/gcloud' args: ['workflows', 'delete', '$_WORKFLOW_NAME-$BRANCH_NAME-$SHORT_SHA', '--quiet']
\# Check the test output - id: 'check-test-workflow' name: 'gcr.io/cloud-builders/gcloud' entrypoint: 'bash' args: ['gitops/test-$BRANCH_NAME.sh']
\# Deploy the workflow - id: 'deploy-workflow' name: 'gcr.io/cloud-builders/gcloud' args: ['workflows', 'deploy', '$_WORKFLOW_NAME-$BRANCH_NAME', '--source', 'gitops/workflow.yaml']
The $BRANCH_NAME and $SHORT_SHA substitution variables (/build/docs/configuring-builds/substitute-variable-values) are populated by Cloud Build when a build is triggered from a Git repository. They represent the name of your branch, and the first seven characters of the commit ID associated with your build, respectively. The $_WORKFLOW_NAME substitution variable allows you to re-use a config file with different variable values. You can specify its value when you create the build trigger. For more information, see Create a build configuration file (/build/docs/configuring-builds/create-basic-configuration).

## Create A Build Trigger

You can automate the deployment of your workflow by creating a Cloud Build trigger. To create a build trigger for the config file in the previous section:
1. In the Google Cloud console, go to the Cloud Build **Triggers** page:
Go to Triggers (https://console.cloud.google.com/cloud-build/triggers)
2. Click **Create trigger**. 3. In the **Name** field, enter a name for your trigger. 4. For **Event**, select the event to invoke your trigger.

For example: **Push to a branch**
5. For **Source**, select your repository, and the branch or tag name that will start your trigger. You can use a regular expression to specify a match to a branch or tag. For example: GoogleCloudPlatform/workflows-demos (repository) and ^main$|^staging$ (matches the main and staging branches)
6. Expand the **Show included and ignored files filters** section and specify your workflow as an included file so that when it is changed, a build is invoked. For example: gitops/workflow.yaml 7. For **Configuration**, select **Cloud Build configuration file (YAML or JSON)** as the type, and **Repository** as the location. 8. In the **Cloud Build configuration file location** field, specify the location of your file.

For example: gitops/cloudbuild.yaml 9. Optionally, to add a substitution variable, click **Add variable** and specify a key and value combination.

For example: _WORKFLOW_NAME (variable) and workflows-gitops (value)
10. To save your build trigger, click **Create**.

When any changes are pushed to a workflow in the specified branch of the Git repository, it will automatically trigger Cloud Build to deploy the workflow. For more information, see Create and manage build triggers (/build/docs/automating-builds/create-manage-triggers).

## Test The Build Trigger

You can test the build trigger and config file from the previous sections.

1. In the staging branch of the Git repository, edit workflow.yaml, and change Hello World to Bye World:
main:
steps:
- init:
assign:
- message: "Hello World"
- returnResult:
return: ${message}
2. Commit and push the change to the staging branch.

git add workflow.yaml git commit -m "Update workflow.yaml in staging" git push The Cloud Build trigger runs and initiates a build.

3. To confirm the success of the build, in the Google Cloud console, go to the **Build history** page:
Go to Build history (https://console.cloud.google.com/cloud-build/builds)
After a build completes, Cloud Build provides an overall status for the build and for each individual build step. For more information, see View build results (/build/docs/view-build-results).

4. To confirm that a staging workflow is deployed, in the Google Cloud console, go to the **Workflows** page:
Go to Workflows (https://console.cloud.google.com/workflows)
You should see a workflow named workflows-gitops-staging listed.

5. To deploy the staging workflow to production, merge the staging branch to the main branch:
git checkout main git merge staging git push Note that because test-main.sh is expecting Hello World in the output of the workflow, the build will fail:
RESULT_EXPECTED="result: '\"Hello World\"'" RESULT_ACTUAL=$(grep "result: " $FILE) if [[ $RESULT_EXPECTED == $RESULT_ACTUAL ]]; then echo "Result test passed" else echo "Result test failed. Expected: $RESULT_EXPECTED Actual: $RESULT_ACTUAL"; exit 1; fi 6. To successfully deploy a production workflow, in the staging branch, edit workflow.yaml again and change the string back to Hello World.

7. Commit and push the change to the staging branch and then merge the staging branch to the main branch. 8. To confirm that a production workflow is deployed, in the Google Cloud console, go to the **Workflows** page:
Go to Workflows (https://console.cloud.google.com/workflows)
You should see a workflow named workflows-gitops-main listed.

## What'S Next

Learn more about Cloud Build (/build/docs/overview). Learn how to troubleshoot build errors (/build/docs/troubleshooting). Learn how to troubleshoot Workflows (/workflows/docs/troubleshooting).

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-05-13 UTC.