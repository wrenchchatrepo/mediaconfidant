# Workows Api Connector Overview

The Workflows connector defines the built-in functions that can be used to access other Google Cloud products within a workflow. This page provides an overview of the individual connector. There is no need to import or load connector libraries in a workflow—connectors work out of the box when used in a call step.

## Workflows Api

Manage workflow definitions. To execute workflows and manage executions, see the Workflows Executions API. To learn more, see the Workflows API documentation (https://cloud.google.com/workflows).

## Workflows Connector Sample

```
YAML
    
   (#yaml)
    JSON (#json)

```

\# This workflow demonstrates how to use the Cloud Workflows connector. \# The workflow creates/gets/deletes a workflow.

\# Expected successful output: "SUCCESS"
- init:
assign:
- project: ${sys.get_env("GOOGLE_CLOUD_PROJECT_ID")} - location: "us-central1" - workflow: "example-workflow"
- create_workflow:
call: googleapis.workflows.v1.projects.locations.workflows.create args:
parent: ${"projects/" + project + "/locations/" + location} workflowId: ${workflow} body:
name: ${"projects/" + project + "/locations/" + location + "/workfl description: "An example workflow to be created and deleted." sourceContents: "- step:\n next: end"
- get_workflow:
call: googleapis.workflows.v1.projects.locations.workflows.get args:
name: ${"projects/" + project + "/locations/" + location + "/workflow
- delete_workflow:
call: googleapis.workflows.v1.projects.locations.workflows.delete args:
name: ${"projects/" + project + "/locations/" + location + "/workflow
- the_end:
return: "SUCCESS"

## Module: Googleapis.Workflows.V1.Projects.Locations

get (/workflows/docs/reference/googleapis/workflows/v1/projects.locations/get)
Gets information about a loca list (/workflows/docs/reference/googleapis/workflows/v1/projects.locations/list)
Lists information about the supported locations for this service.

Module: googleapis.workflows.v1.projects.locations.

operations Functions delete (/workflows/docs/reference/googleapis/workflows/v1/projects.locations.operations/delete)
Deletes a long-r This method in client is no long operation result cancel the oper doesn't support returns google UNIMPLEMENT

| Functions get                                                                          | Gets the latest                                                                                                                                                                                                                                                                                             |
|----------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| (/workflows/docs/reference/googleapis/workflows/v1/projects.locations.operations/get)  | running operati this method to  result at interva recommended                                                                                                                                                                                                                                               |
| list                                                                                   | Lists operations                                                                                                                                                                                                                                                                                            |
| (/workflows/docs/reference/googleapis/workflows/v1/projects.locations.operations/list) | specified filter i the server does method, it retur UNIMPLEMENT name binding a to override the  different resour such as users To override the  services can ad as "/v1/{nam operations" configuration. F compatibility, th includes the op id, however ove ensure the nam parent resource operations colle |

Module: googleapis.workflows.v1.projects.locations.

workflows Functions

| create                                                                                                                                                                   | Creates a new w   |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------|
| (/workflows/docs/reference/googleapis/workflows/v1/projects.locations.workflows/create) workflow with t already exists in project and loca running operatio ALREADY_EXIS |                   |

| Functions delete                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | Deletes a workfl   |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------|
| (/workflows/docs/reference/googleapis/workflows/v1/projects.locations.workflows/delete) specified name cancels and de executions of th get Gets details of a  (/workflows/docs/reference/googleapis/workflows/v1/projects.locations.workflows/get) list Lists Workflows  (/workflows/docs/reference/googleapis/workflows/v1/projects.locations.workflows/list) and location. Th not specified. patch Updates an exis  (/workflows/docs/reference/googleapis/workflows/v1/projects.locations.workflows/patch) Running this me impact on alrea executions of th revision of the w created as a res update operatio such revision w workflow execu |                    |

Module: googleapis.workflows.v1beta.projects.locations Functions get (/workflows/docs/reference/googleapis/workflows/v1beta/projects.locations/get)
Gets information about a list (/workflows/docs/reference/googleapis/workflows/v1beta/projects.locations/list)
Lists information about th supported locations for t service.

Module: googleapis.workflows.v1beta.projects.locations.

operations

| Functions delete                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Deletes a lo   |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------|
| (/workflows/docs/reference/googleapis/workflows/v1beta/projects.locations.operations/delete) This metho client is no operation r cancel the  doesn't sup returns goo UNIMPLEM get Gets the la  (/workflows/docs/reference/googleapis/workflows/v1beta/projects.locations.operations/get) running op this metho result at int recommen list Lists opera  (/workflows/docs/reference/googleapis/workflows/v1beta/projects.locations.operations/list) specified fi the server d method, it  UNIMPLEM name bindi to override different re such as us To override services ca as "/v1/{ operatio configurati compatibil includes th id, howeve ensure the  parent reso operations |                |

Module: googleapis.workflows.v1beta.projects.locations.

workflows

| create                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | Creates a n   |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------|
| (/workflows/docs/reference/googleapis/workflows/v1beta/projects.locations.workflows/create) workflow w already exis project and running ope ALREADY_ delete Deletes a w  (/workflows/docs/reference/googleapis/workflows/v1beta/projects.locations.workflows/delete) specified n cancels an executions get Gets detail  (/workflows/docs/reference/googleapis/workflows/v1beta/projects.locations.workflows/get) list Lists Workfl  (/workflows/docs/reference/googleapis/workflows/v1beta/projects.locations.workflows/list) and locatio not specifie patch Updates an  (/workflows/docs/reference/googleapis/workflows/v1beta/projects.locations.workflows/patch) Running th impact on a executions revision of  created as  update ope such revisio workflow e |               |

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-05-13 UTC.