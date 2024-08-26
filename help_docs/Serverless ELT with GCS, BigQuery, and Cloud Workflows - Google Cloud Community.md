# Serverless Elt With Gcs, **Bigquery** And Cloud **Workflows**

Mazlum Tosun · *Follow*

![0_image_0.png](0_image_0.png)

Published in Google Cloud - Community · 16 min read · Jan 18, 2024 83 2

## 1. Explanation Ofthe Use Case Presented In This **Article**

This article presents a complete use case with a Serverless ELT pipeline **with** Cloud Storage, BigQuery and Cloud **Workflows**. We proposed previously the same use case with Airflow and **Cloud** Composer, and we wanted to revisit it with a Serverless **approach.** Google Cloud offers 2 services for tasks and pipeline **orchestration** :
Cloud Composer based on a GKE Cluster and **Airflow** Cloud Workflows a serverless component based in a Yaml syntaxe and on API calls to interact with Google Cloud **services.**
For Workflows, developers can check the official documentation to **have** code samples and also the Google Cloud official documentation for the concerned API, example for the **googleapis.bigquery.v2.jobs.insert** : Workflow :
Method: googleapis.bigquery.v2.jobs.insert | Workflows | *Google*

![0_image_1.png](0_image_1.png) Cloud Whether your business is early in its journey or well on its way to digital transformation, Google Cloud can help *solve…*
cloud.google.com Google Cloud API :
Method: jobs.insert | BigQuery | Google *Cloud*

![0_image_2.png](0_image_2.png) Whether your business is early in its journey or well on its way to digital transformation, Google Cloud can help solve…
Both solutions are interesting and teams in projects, can choose the one **that** best suits their **needs.**
We illustrate some pros and cons, but we will propose a dedicated **article** to give more details on this **comparison.** Cloud **Workflows** Pros Present the advantage to be serverless and no need to manage an **infra** Lightweight, we only need to write the Yaml code and deploy the workflow with a gcloud **command** Cost **effective** Simple and based on API calls (standard Google Cloud **APIs)**

## Cons

The Yaml code of Workflows is not testable easily with unit **tests** Currently, we don't have the possibility to retry a failed **task** Sometimes the Yaml code can be verbose, because we need to add **polling** and other orchestration logic, not provided natively by the **concerned** APIs The subworkflows and separate logics can't be included and **shared**
natively, when placed in external files or other Github **repositories**
Cloud **Composer** Pros Based on Apache Airflow, a popular open source library with a **large** community Based on Python and easier that Yaml to write unit **tests** Many operators given natively to interact with Google Cloud **services** Easy to write a DAG and orchestration logic based on **operators** Can retry a failed **tasks** Monitoring proposed by default Based on a GKE cluster, we need to configure and **manage** it A GKE cluster with Airflow has a cost with, at minimum, several **hundred** per **month**
By default, the PyPi packages are globals and not isolated per DAG
Here you can see the diagram of this use **case** :

![2_image_0.png](2_image_0.png) I also created a video on this topic in my GCP Youtube channel, feel **free** to subscribe to the channel to support my work for the Google **Cloud** community : English *version* Serverless EL erless ELT with GCS, BigQuer with GCS, BigQuery and Cloud W y and Cloud Workflflows French *version*

![3_image_0.png](3_image_0.png)

![3_image_1.png](3_image_1.png)

![3_image_2.png](3_image_2.png)

![3_image_3.png](3_image_3.png)

![3_image_4.png](3_image_4.png)

Some **explanations** :
Extract : a input raw file is uploaded to Cloud Storage, this file has a

![3_image_5.png](3_image_5.png)

ndjson **format**
Load : the raw file is loaded to a BigQuery raw **table** Transform : the transform part is applied with SQL query in **BigQuery** and the result is loaded in a final domain **table** Backup processed files : Workflows invokes Cloud Build to **move** processed files from the input to the destination bucket. The **advantage** is to have access to the  , because it's not possible natively with the storage API to move several files (objects) between **buckets.**
The deployment and CI CD part are done with Cloud **Build.** Firstly the use case is execute with gcloud commands and bash *scripts* :
Deploy the **workflow** Run the workflow with runtime **arguments** Create a scheduler and cron job with Cloud Scheduler to launch the workflow with runtime **arguments**
Then the use case is execute with *Terraform* :
Deploy the **workflow** Create a scheduler and cron job with Cloud Scheduler to launch the workflow with runtime **arguments**
2. Structure ofthe *project* ly teams-league-cloud-workflows-elt ~/my-projects/blogarticles/teams-league-cloud-workflows-elt
- . Idea
■■ diagram
> 
> 
< 
< 
> 
- 
> 
i) workflow_config.json w team_league_elt_gcs_file_schema.yaml f locals.tf Y main.tf il terragrunt.hcl Y variables.tf ii terragrunt.hcl
> 
❏ deploy_workflow.sh
❏ deploy_workflow_scheduler.sh
[] run_workflow.sh
- 
::
f team_stats_raw_table_schema.json
- In config io workflow_config.json w.team_league_elt_gcs_file_schema.yaml m_team_league_elt_standard_schema.yaml
~ .envrc 15 .gitignore w deploy-workflow.yaml ve deploy-workflow-scheduler.yaml er deploy-workflow-scheduler-terraform-apply.yaml er deploy-workflow-scheduler-terraform-plan.yaml n README.md s, run-workflow.yaml

## 2.2 Execute The Elt Workflow With Cloud Build And Gcloud Commands

The first part of this use case will deploy/run the resources with gcloud cmmands :
- Create and deploy the workflow - Run the workflow directly with runtime arguments - Create a cron job with Cloud Scheduler, that will execute the workflow with runtime arguments 2.2.1 Workflow code logic Create and deploy the Workflow A root folder called workflow contains the workflow to **create** :

![5_image_0.png](5_image_0.png)

team_league_elt_gcs_file_schema.yaml The other file serves only to illustrate how using a BigQuery schema **directly** in the **Yaml** We created a configuration file for our Workflow, that will be **passed** as runtime arguments : **workflow/config/workflow_config.json**

![5_image_1.png](5_image_1.png)

![5_image_2.png](5_image_2.png)

The elements like the source and destination buckets are given **(hot/cold).** The elements for raw and domain tables are also **configured.** The workflow code logic in **Yaml** :
main:
params: [ **workflowConfig** ] steps:
- **init:**
assign:
- project_id: **${sys.get_env("GOOGLE_CLOUD_PROJECT_ID")}** - location_id: "global"
- **loadTeamStatsRawToBq:**
call: **googleapis.bigquery.v2.jobs.insert** args:
projectId: **${project_id}** body:
configuration:
load:
destinationTable:
datasetId: **${workflowConfig.dataset}** projectId: **${project_id}** tableId: **${workflowConfig.team_stat_raw_table}**
referenceFileSchemaUri: **${workflowConfig.team_stats_raw_bq_schem** sourceFormat: **${workflowConfig.team_stats_raw_bq_source_format}** sourceUris: **${workflowConfig.team_stats_raw_files_hot_source_uri** createDisposition: **${workflowConfig.team_stats_raw_bq_create_dis** writeDisposition: **${workflowConfig.team_stats_raw_bq_write_dispo**
result: **loadTeamStatsRawToBqResult**
- **runQueryTransformToTeamStatsDomainAndLoadToBQ:**
call: **googleapis.bigquery.v2.jobs.query** args:
projectId: **${project_id}** body:
useLegacySql: **false** query: INSERT INTO **`mazlum_test.team_stat`**
( teamName, teamScore, teamSlogan, teamTotalGoals, topScorerStats, bestPasserStats, ingestionDate ) SELECT team_stats.teamName, team_stats.teamScore, team_slogan.teamSlogan, sum(scorer.goals) as **teamTotalGoals,** ARRAY_AGG( STRUCT( scorer.scorerFirstName AS **firstName,** scorer.scorerLastName AS **lastName,** scorer.goals AS **goals,** scorer.games AS **games** ) ORDER BY scorer.goals DESC **LIMIT** 1 )[OFFSET(0)] AS **topScorerStats,** ARRAY_AGG( STRUCT( scorer.scorerFirstName AS **firstName,** scorer.scorerLastName AS **lastName,** scorer.goalAssists AS **goalAssists,** scorer.games AS **games** ) ORDER BY scorer.goalAssists DESC **LIMIT** 1 )[OFFSET(0)] AS **bestPasserStats,** current_timestamp() as **ingestionDate** FROM `mazlum_test.team_stat_raw` **team_stats** INNER JOIN `mazlum_test.team_slogan` team_slogan ON **team_stats.tea** UNNEST(team_stats.scorers) AS **scorer** GROUP BY team_stats.teamName, team_stats.teamScore, team_slogan.teamSlogan result: **queryResult**
- **copyProcessedFilesToColdBucket:**
call: **googleapis.cloudbuild.v1.projects.builds.create** args:
projectId: **${project_id}** parent: ${"projects/" + project_id + "/locations/" + **location_id}** body:
serviceAccount: **${sys.get_env("GOOGLE_CLOUD_SERVICE_ACCOUNT_NAME")}** options:
logging: **CLOUD_LOGGING_ONLY**
steps:
- name: **gcr.io/google.com/cloudsdktool/cloud-sdk:455.0.0-slim**
script: ${"gsutil cp " + **workflowConfig.team_stats_raw_files_hot**
result: **resultCloudBuildCopy**
- **returnResult:**
return: **${resultCloudBuildCopy}**
Some explanations for the code logic in the **workflow** :
The program start with a top start element called **main** Runtime **arguments** We can pass runtime arguments with params , that corresponds to the configuration showed **previously** :
params: [ **workflowConfig** ]
List of **steps** Then the rest of the code is a list of **steps** :

![7_image_0.png](7_image_0.png)

Reusable **variables** The first step prepares reusable variables accessible in the other **steps** :

![7_image_1.png](7_image_1.png)

Load raw files to BigQuery raw table The second step corresponds to the load part of our ELT pipeline, we use the standard API to execute a load job to BigQuery. In this case, the load job **will** write all the input raw files (objects) to the BigQuery raw **table.** A important detail here, we need to pass the schema of the BigQuery **table,** we can do it in the two following **ways** :
Pass the schema directly in the Yaml **code** Reference a Json schema from a Cloud Storage **bucket**
In this first example, the schema is referenced from Cloud Storage via referenceFileSchemaUri

![8_image_0.png](8_image_0.png)

The second example with the schema added directly in the **Yaml** :

![8_image_1.png](8_image_1.png)

projectId: **${project_id}**

![9_image_1.png](9_image_1.png)

![9_image_2.png](9_image_2.png) tableId: **${workflowConfig.team_stat_raw_table}**
schema:
fields:
- name: **"teamScore"**

![9_image_0.png](9_image_0.png)

sourceFormat: **${workflowConfig.team_stats_raw_bq_source_format}** sourceUris: **${workflowConfig.team_stats_raw_files_hot_source_uri** createDisposition: **${workflowConfig.team_stats_raw_bq_create_dis** writeDisposition: **${workflowConfig.team_stats_raw_bq_write_dispo**
result: **loadTeamStatsRawToBqResult**
The Json format is more standard and shareable between **different**

![9_image_3.png](9_image_3.png)

![9_image_4.png](9_image_4.png)

![9_image_5.png](9_image_5.png)

![9_image_6.png](9_image_6.png) resources (gcloud commands, Terraform, Airflow…), we prefer using **this** approach in the rest of the **code.** Transform raw to domain data with a SQL query and **BigQuery**
This step corresponds to the transform part of our ELT pipeline. In this **case,**
the transform part is done with a SQL query executed from **BigQuery.** In this first execution, the SQL query was directly added in the YAML, but in the execution with Terraform in the next section, we will pass the **query** as template string **(placeholder).**
main:

![9_image_8.png](9_image_8.png)

![9_image_9.png](9_image_9.png)

![9_image_10.png](9_image_10.png)

![9_image_11.png](9_image_11.png)

![9_image_12.png](9_image_12.png)

![9_image_7.png](9_image_7.png) steps:
- **init:**
assign:
- project_id: **${sys.get_env("GOOGLE_CLOUD_PROJECT_ID")}** - location_id: **"global"**
- **loadTeamStatsRawToBq:**
...

- **runQueryTransformToTeamStatsDomainAndLoadToBQ:**
call: **googleapis.bigquery.v2.jobs.query** args:

![9_image_13.png](9_image_13.png) body:

useLegacySql: **false** query: INSERT INTO **`mazlum_test.team_stat`**
( teamName, teamScore, teamSlogan, teamTotalGoals, topScorerStats, bestPasserStats, ingestionDate ) SELECT team_stats.teamName, team_stats.teamScore, team_slogan.teamSlogan, sum(scorer.goals) as **teamTotalGoals,** ARRAY_AGG( STRUCT( scorer.scorerFirstName AS **firstName,** scorer.scorerLastName AS **lastName,** scorer.goals AS **goals,** ![10_image_0.png](10_image_0.png) INNER JOIN `mazlum_test.team_slogan` team_slogan ON **team_stats.tea** UNNEST(team_stats.scorers) AS **scorer** GROUP BY team_stats.teamName, team_stats.teamScore, team_slogan.teamSlogan result: **queryResult**

## Move Processed Files From A Hot Bucket To A Cold **Bucket**

![10_Image_1.Png](10_Image_1.Png)

![10_Image_2.Png](10_Image_2.Png)

![10_Image_3.Png](10_Image_3.Png)

![10_Image_4.Png](10_Image_4.Png)

![10_Image_5.Png](10_Image_5.Png)

![10_Image_6.Png](10_Image_6.Png)

In the last step of the pipeline, we want to move the input and processed **files** from an input to a destination bucket (hot to **cold).** The standard storage.api doesn't support the move of several **objects** between **buckets.** To solve this issue, we can use a Cloud Build job from Workflows. The advantage is to have access to the gcloud cli that supports the **move** of several objects between **buckets.** This system is really powerful, because from Cloud Build, we have **access** to many tools offered by the Docker ecosystem.

In this example, we use a gsutil cp to copy the objects from the hot to the cold bucket, with the use of a **wildcard** :
gs://mazlum_dev/workflows/team_league/elt/hot/*.json

![11_image_0.png](11_image_0.png)

The last step of the pipeline, returns the result of the Cloud Build **operation** :

![11_image_1.png](11_image_1.png)

\#!/bin/bash export **PROJECT_ID={{project}}** export **LOCATION={{location}}** \# **Workflow** export WORKFLOW_NAME=team-league-elt-gcs-schema export **WORKFLOW_SOURCE=workflow/team_league_elt_gcs_file_schema.yaml** export **WORKFLOW_SA={{sa_email}}** export **WORKFLOW_CONFIG_FILE_PATH=./workflow/config/workflow_config.json** \# Workflow **Scheduler** export **WORKFLOW_URI=https://workflowexecutions.googleapis.com/v1/projects/gb-poc** export **WORKFLOW_SCHEDULER_NAME=team-league-elt-gcs-schema-cron-job** export **WORKFLOW_SCHEDULER_INTERVAL="0** 0 1 * *" export **WORKFLOW_SCHEDULER_TIME_ZONE=Europe/Paris** export **WORKFLOW_SCHEDULER_SA={{sa_email}}** \# **Terraform** export **TF_STATE_BUCKET=gb-poc-terraform-state** export **TF_STATE_PREFIX=testmazlum** export GOOGLE_PROVIDER_VERSION="= **5.8.0"**

## 2.2.3 Deploy The Workflows With Cloud **Build**

In this section we will deploy the Workflow with Cloud **Build** :
deploy-workflow.yaml **file** :
We have a step from the cloud-sdk Docker image, then we invoke bash **script**

![12_image_0.png](12_image_0.png)

![12_image_1.png](12_image_1.png)

deploy_workflow.sh **script** :
\#!/usr/bin/env **bash**

![12_image_2.png](12_image_2.png)

echo "\#\#\#\#\#\#\#\#\#\#\#\#\# Deploying the workflow... **\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#"**

![12_image_3.png](12_image_3.png) gcloud workflows deploy **"$WORKFLOW_NAME"** \
--source="$WORKFLOW_SOURCE" \ --location **"$LOCATION"** \ --service-account **"$WORKFLOW_SA"**
echo "\#\#\#\#\#\#\#\#\#\#\#\#\# The workflow was deployed successfully \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
The gcloud workflows deploy command allows the deployment of the Workflow. We **give** :
The Workflow **name** The Workflow source that corresponds the workflow file **path** :
workflow/team_league_elt_gcs_file_schema.yaml The **location** The service account dedicated to the **Workflow**
After the deployment, the workflow appears in the dedicated **menu** in Google **Cloud** :

![13_image_0.png](13_image_0.png)

## 2.2.4 Run The Workflows With Cloud **Build**

In this section we will run the Workflow with Cloud Build. The **Workflow** takes runtime **arguments.**
run-workflow.yaml **file** :
We have a step from the cloud-sdk Docker **image** We install a tool called jq because we need to parse the Json config **file**
and get it as **string**
We invoke the run_workflow.sh bash **script**

![13_image_1.png](13_image_1.png) ![14_image_0.png](14_image_0.png) gcloud workflows run **team-league-elt-gcs-schema** \
--location **europe-west1** \ --data='{"workflow_name":"team_league_workflow_elt","team_stats_raw_bq_create_
jq allows to read the config file and return it as string in one line, the command line with hardcoded parameters looks **like** : When we access to the workflow, we can see all the **executions** :

![14_image_1.png](14_image_1.png) We click on the link in the execution ID column and access to the **Workflow** detail :
The **summary** The **input** The **output** At the right side, we have access to the graph of the workflow (DAG)

![15_image_0.png](15_image_0.png)

the execute **button** :

![15_image_1.png](15_image_1.png) In this section, we will create a cron job with a scheduler that will **execute** the workflow while passing runtime **arguments.** We can also trigger a workflow with an event driven approach, but we **will** cover this aspect in a dedicated **article.**

![15_image_2.png](15_image_2.png) ![16_image_0.png](16_image_0.png)

Some parameters are passed by the **scheduler** :
The scheduler **name** The schedule interval **(cron)** The **location** The Workflow URI Message body : the scheduler needs to pass the runtime arguments **when** launching the workflow. The Json config file is parsed and escaped **with**
jq and passed to the gcloud scheduler command **line**
Scheduler **timezone** The service account used for the **scheduler**
The command line with hardcoded parameters looks **like** :

![16_image_1.png](16_image_1.png)

![16_image_2.png](16_image_2.png)

e

![17_image_0.png](17_image_0.png)

When we click on the workflow name, we can access to the scheduler detail :
Cloud Scheduler team-league-elt-gcs-schema-cron-job HITTE
URL *
https://workflowexecutions.googleapis.com/v1/projects/gb-poc-373711/locations HTP method POST
HTTP headers Some headers are set to default values or removed by Cloud Scheduler. Learn more (2)

![17_image_1.png](17_image_1.png)

![17_image_2.png](17_image_2.png)

✦ ADD A HEADER

![17_image_3.png](17_image_3.png)

The workflow will be triggered one time per month with the following cron expression : 0 0 1 * *
We can also trigger the workflow manually with the Force run button :

## 2.3 Execute The Elt Workflow With Cloud Build And **Terraform**

![18_Image_0.Png](18_Image_0.Png)

In this last section, we will create the scheduler and the workflow **with**
Terraform instead of gcloud **commands.**
It is a good approach to manage and automate the creation of elements **with** a IaC tool like Terraform, that's why this use case presents a complete IaC code to create the **resources.**

## 2.3.1 The Cloud Build **Part**

We have 2 Yaml files and Cloud Build jobs to launch the IaC **part** : Plan : **deploy-workflow-scheduler-terraform-plan.yaml**

![18_image_1.png](18_image_1.png)

Apply : **deploy-workflow-scheduler-terraform-apply.yaml**

steps:

![18_image_3.png](18_image_3.png)

![18_image_2.png](18_image_2.png)

- **'TF_STATE_BUCKET=$_TF_STATE_BUCKET'** - **'TF_STATE_PREFIX=$_TF_STATE_PREFIX'** - **'TF_VAR_workflow_name=$_WORKFLOW_NAME'** - **'TF_VAR_workflow_source=$_WORKFLOW_SOURCE'** - **'TF_VAR_workflow_uri=$_WORKFLOW_URI'** - **'TF_VAR_workflow_sa=$_WORKFLOW_SCHEDULER_SA'** - **'TF_VAR_workflow_scheduler_name=$_WORKFLOW_SCHEDULER_NAME'** - **'TF_VAR_workflow_scheduler_interval=$_WORKFLOW_SCHEDULER_INTERVAL'** - **'TF_VAR_workflow_scheduler_timezone=$_WORKFLOW_SCHEDULER_TIME_ZONE'** - **'TF_VAR_workflow_scheduler_sa=$_WORKFLOW_SCHEDULER_SA'** - **'GOOGLE_PROVIDER_VERSION=$_GOOGLE_PROVIDER_VERSION'**
In the 2 Yaml files, we pass variables to the Terraform part and execute the IaC resources with the dedicated command line. We use Terragrunt in **this** example for **simplicity.** 2.3.2 The Terraform and IaC **part**

![19_image_0.png](19_image_0.png) The root folder containing all the infra code is **infra** The resource folder **contains** :
The workflow yaml **code**
resource/workflow/team_league_elt_gcs_file_schema.yaml The SQL **query**
resource/workflow/config/query/compute_and_insert_team_stats_data.sql The workflow runtime **configuration**
resource/workflow/config/workflow_config.json The workflow yaml **code** :

![20_image_0.png](20_image_0.png)

The principle is identical to the previous part with the exception that the SQL query is passed as a placeholder in the workflow code : **{{sql_query}}** The SQL **query**
teamName, teamScore, teamSlogan, teamTotalGoals, topScorerStats, bestPasserStats, ingestionDate
) SELECT
team_stats.teamName, team_stats.teamScore, team_slogan.teamSlogan, sum(scorer.goals) as **teamTotalGoals,** ARRAY_AGG(
STRUCT(
scorer.scorerFirstName AS **firstName,** scorer.scorerLastName AS **lastName,** scorer.goals AS **goals,** scorer.games AS **games**
) ORDER BY scorer.goals DESC **LIMIT** 1
)[OFFSET(0)] AS **topScorerStats,** ARRAY_AGG(
STRUCT(
scorer.scorerFirstName AS **firstName,** scorer.scorerLastName AS **lastName,** scorer.goalAssists AS **goalAssists,** scorer.games AS **games**
) ORDER BY scorer.goalAssists DESC **LIMIT** 1
)[OFFSET(0)] AS **bestPasserStats,** current_timestamp() as **ingestionDate**
FROM `${project_id}.${dataset}.${team_stat_raw_table}` **team_stats** INNER JOIN `${project_id}.${dataset}.team_slogan` team_slogan ON **team_stats.team** UNNEST(team_stats.scorers) AS **scorer** GROUP BY
team_stats.teamName, team_stats.teamScore, team_slogan.teamSlogan The query contains dynamic parameters that will be resolved by **Terraform** template.

The Terraform variables : **infra/variables.tf** :
variable **"project_id"** {
description = "Project ID, used to enforce providing a project **id."** type = **string**
} variable **"location"** {
description = **"Location."** type = **string**
} variable **"workflow_name"** {
description = "Workflow **name."** type = **string**
} .....

This file contains all the Terraform variables. It corresponds to the **TF_VAR_**
env variables passed by Cloud Build to **Terraform**. The Terraform local variables : **infra/locals.tf** :

![22_image_0.png](22_image_0.png)

team_league_workflow_yaml_as_string = **file("${path.module}/resource/wor** team_league_workflow_yaml_config_as_string = **file("${path.module}/resource/wor** team_league_workflow_yaml_config = **jsondecode(file("${path.module}/r** compute_and_insert_team_stats_data_query = **file("${path.module}/resource/wor**

![22_image_1.png](22_image_1.png)

team_league_workflow_yaml_as_string : load the workflow Yaml **file** as string , via the file Terraform operator. This string content **will** be then used by the Terraform resource to create the **workflow**
team_league_workflow_yaml_config_as_string : load the workflow **config** Json file as string . We use file again **here.** team_league_workflow_yaml_config : load the workflow config json **file** as Terraform Map . It will be necessary in the Terraform **resources.**
compute_and_insert_team_stats_data_query : load the SQL query **file** as string with **file**
The Terraform resources : **infra/locals.tf** :
Open in app data "template_file" **"raw_to_domain_query_template"** {
template = **local.compute_and_insert_team_stats_data_query** vars = {
project_id = **var.project_id** dataset = **local.team_league_workflow_yaml_config["dataset"]** team_stat_table = **local.team_league_workflow_yaml_config["team_stat_tabl** team_stat_raw_table = **local.team_league_workflow_yaml_config["team_stat_raw_**
}
} resource "google_cloud_scheduler_job" **"job"** {
project = **var.project_id** region = **var.location** name = **var.workflow_scheduler_name** description = "Scheduler for team league **workflow"** schedule = **var.workflow_scheduler_interval** time_zone = **var.workflow_scheduler_timezone** attempt_deadline = **"320s"** http_target {
body = **base64encode(**
jsonencode({
"argument" : **local.team_league_workflow_yaml_config_as_string,** "callLogLevel" : **"CALL_LOG_LEVEL_UNSPECIFIED"**
} ))
http_method = **"POST"** uri = **"https://workflowexecutions.googleapis.com/v1/projects/${var.p**

![22_image_2.png](22_image_2.png)

scope = **"https://www.googleapis.com/auth/cloud-platform"** service_account_email = **var.workflow_scheduler_sa**
}
}
}

| ] project                                                                                                        | = var.project_id                 |
|------------------------------------------------------------------------------------------------------------------|----------------------------------|
| region                                                                                                           | = var.location                   |
| name                                                                                                             | = var.workflow_name              |
| description                                                                                                      | = "Workflow for team league ELT" |
| service_account = var.workflow_sa source_contents = replace(local.team_league_workflow_yaml_as_string, "{{sql_qu |                                  |

## Terraform **Template** :

The first data block retrieves the SQL query as string from locals and resolve parameters with Terraform template : **template_file** Some elements are retrieved from the configuration as Map **provided** by locals. The resource to create the *scheduler* : The resource google_cloud_scheduler_job creates the scheduler. The **config** as string is passed to the http_target/body encoded in **base** 64. All the other elements are retrieved from Terraform **variables.** The resource to create the *scheduler* : The resource google_workflows_workflow creates and deploys the **workflow.** The depend_on allows adding a dependency between the SQL query **prepared** by Terraform template and the current resource to create the workflow. So, the elements will be created in the correct order by **Terraform.** In the source_contents we pass the workflow as string and replace the SQL query :
source_contents = replace(local.team_league_workflow_yaml_as_string, **"{{sql_quer**
This article showed a complete and real world use case with an ELT **pipeline**
using Cloud **Workflows**. Workflows presents the advantage to be serverless, cost effective and lightweight and fit well for an **ELT.** GCP Developers can be quickly familiar with the Workflow's system, **because** it's based on API calls and native Google Cloud **APIs.** To be as complete as possible, two executions with gcloud commands and Terraform resource were presented in **detail.** For more complexe orchestration and industrialisation, developers can **test** and choose the solution that suits them best, Airflow and Composer **could** also be a good **candidate.** Also, it's really important to not add complexe logic in the YAML to **keep** a good maintainability and **readability.** All the code shared on this article is accessible from my Github *repository* :

GitHub - tosun-si/teams-league-cloud-workflows-elt: *This*

![24_image_1.png](24_image_1.png)

![24_image_2.png](24_image_2.png) ![24_image_0.png](24_image_0.png) This project shows a real world use case with ELT pipeline *using* Cloud Storage, BigQuery and Cloud Workflows - *GitHub* …
github.com Twitter LinkedIn Gcp App Dev
If you like my articles, videos and want to see my posts, **follow** me on :
Medium Youtube

Google Cloud Platform Serverless Google Cloud Workflows *Terraform*

![24_image_3.png](24_image_3.png)

