# Create A Workflow By Using The Gcloud Cli

This quickstart shows you how to create, deploy, and execute your first workflow using the Google Cloud CLI. The sample workflow sends a request to a public API and then returns the API's response. For a list of all Workflows gcloud CLI commands, see the Workflows gcloud CLI reference page (/sdk/gcloud/reference/workflows).

## Before You Begin

Security constraints defined by your organization might prevent you from completing the following steps. For troubleshooting information, see Develop applications in a constrained Google Cloud environment (/resource-manager/docs/organization-policy/develop-apps-constrained-environment).

1. To run the commands on this page, set up the gcloud CLI in one of the following development environments:
Cloud Shell

 (\#cloud-shell)
Local shell (\#local-shell)
To use an online terminal with the gcloud CLI already set up, activate Cloud Shell:
Activate Cloud Shell on this page At the bottom of this page, a Cloud Shell session starts and displays a commandline prompt. It can take a few seconds for the session to initialize.

## 2. Create Or Select A Google Cloud Project

 (https://cloud.google.com/resource-manager/docs/creating-managing-projects).

Note: If you don't plan to keep the resources that you create in this procedure, create a project instead of selecting an existing project. After you finish these steps, you can delete the project, removing all resources associated with the project.

Create a Google Cloud project:
gcloud projects create PROJECT_ID edit Replace PROJECT_ID with a name for the Google Cloud project you are creating. Select the Google Cloud project that you created:
gcloud config set project PROJECT_ID edit Replace PROJECT_ID with your Google Cloud project name.

3. Make sure that billing is enabled for your Google Cloud project
 (/billing/docs/how-to/verify-billing-enabled\#console).

4. Enable the Workflows API.

gcloud services enable workflows.googleapis.com 5. Create the service account and give it a name; for example, sa-name.

gcloud iam service-accounts create sa-name 6. To send logs to Cloud Logging, grant the roles/logging.logWriter role to the service account.

```
gcloud projects add-iam-policy-binding \
    --member "serviceAccount:sa-name@ .iam.gserviceaccount.com"
                                       PROJECT_ID edit
                                                   
                                     PROJECT_ID edit
                                                 

```

--role "roles/logging.logWriter" To learn more about service account roles and permissions, see Grant a workflow permission to access Google Cloud resources (/workflows/docs/authentication).

## Create, Deploy, And Execute A Workflow

1. In your home directory, create a new file called myFirstWorkflow.yaml or myFirstWorkflow.json.

2. Copy and paste the following workflow into the new file, then save it:
YAML

 (\#yaml)
JSON (\#json)
main:
params: [input] steps:
- checkSearchTermInInput:
switch:
- condition: '${"searchTerm" in input}'
assign:
- searchTerm: '${input.searchTerm}'
next: readWikipedia
- getLocation:
call: sys.get_env args:
name: GOOGLE_CLOUD_LOCATION
result: location
- setFromCallResult:
assign:
- searchTerm: '${text.split(location, "-")[0]}'
- readWikipedia:
call: http.get args:
url: 'https://en.wikipedia.org/w/api.php' query:
action: opensearch search: '${searchTerm}'
result: wikiResult
- returnOutput:
return: '${wikiResult.body[1]}'
star Unless you input your own search term, this workflow uses your Google Cloud location to construct a search term, which it passes to the Wikipedia API (https://wikipedia.org/w/api.php). A list of related Wikipedia articles is returned.

3. Deploy the workflow and associate it with the specified service account:

```
gcloud workflows deploy myFirstWorkflow --source=myFirstWorkflow.
    --service-account=sa-name@ .iam.gserviceaccount.com
                                                                 EXTENSION edit
                                                                            

```

PROJECT_ID edit Replace the following:
EXTENSION: the file extension for your workflow; use yaml for the YAML version or use json for the JSON version PROJECT_ID: your project ID
Note: In production environments, we strongly recommend creating a new service account, then granting it the least permissive roles that allow the service account to access the required resources. To learn more, see Service accounts (/iam/docs/service-accounts). For a list of Workflows roles, see Workflows roles and permissions (/workflows/docs/access-control).

4. Execute the workflow:
gcloud workflows run myFirstWorkflow \
--data='SEARCH_TERM edit' Replace SEARCH_TERM with your search term; for example, {"searchTerm":"North"}. If you enter {}, your Google Cloud location is used to construct a search term. This returns the results of the execution attempt. The output is similar to the following:
argument: '{"searchTerm":"North"}' duration: 0.210616856s endTime: '2023-05-10T21:56:39.465899376Z' name: projects/734581694262/locations/us-central1/workflows/workflow-1/execu result: '["North","North America","Northern Ireland","North Korea","North Ma Carolina","Northrop Grumman B-2 Spirit","Northrop F-5","Northern Cyprus", Dakota"]'
startTime: '2023-05-10T21:56:39.255282520Z' state: SUCCEEDED status:
currentSteps: - routine: main step: returnOutput workflowRevisionId: 000001-ac2 You've deployed and executed your first workflow!

Clean up To avoid incurring charges to your Google Cloud account for the resources used on this page, delete the Google Cloud project with the resources.

1. Delete the workflow you created:
gcloud workflows delete myFirstWorkflow 2. When asked if you want to continue, enter y.

The workflow is deleted.

What's next Update an existing workflow
 (/workflows/docs/creating-updating-workflow\#updating_a_workflow)
Control the order of execution in a workflow (/workflows/docs/controlling-execution-order) Sample workflows (/workflows/docs/samples) Workflows syntax reference (/workflows/docs/reference/syntax)
Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-05-13 UTC.