# Use The Open-Source Dataform Cli

This document shows you how to use the open-source Dataform command line interface (CLI)
to locally develop SQL workflows by using the terminal.

With the open-source Dataform CLI, you can initialize, compile, test, and run Dataform core (/dataform/docs/dataform-core) locally, outside of Google Cloud. Dataform distributes a Docker image  (https://hub.docker.com/r/dataformco/dataform) which you can use to run the equivalent of Dataform CLI commands. The Dataform CLI supports Application Default Credentials (ADC) (/docs/authentication/application-default-credentials). With ADC, you can make credentials available to your application in a variety of environments, such as local development or production, without needing to modify your application code. To use ADC, you must first provide your credentials (/docs/authentication/provide-credentials-adc) to ADC.

Before you begin Before installing the Dataform CLI, install NPM  (https://www.npmjs.com/get-npm).

Install Dataform CLI

To install Dataform CLI, run the following command:
npm i -g @dataform/cli@^3.0.0-beta

## Initialize A Dataform Project

To initialize a new Dataform project, run the following command inside your project directory:
dataform init . PROJECT_NAME edit DEFAULT_LOCATION edit Replace the following:
PROJECT_NAME: the name of your project. DEFAULT_LOCATION: the region where you want Dataform to write BigQuery data. For more information about BigQuery regions, see BigQuery locations (/bigquery/docs/locations).

## Update Dataform

To update the Dataform framework, update the dataformCoreVersion in workflow_settings.yaml file, then re-run NPM install:
npm i

## Update Dataform Cli

To update the Dataform CLI tool, run the following command:
npm i -g @dataform/cli@^3.0.0-beta.2

## Create A Credentials File

Dataform requires a credentials file to connect to remote services and create the .dfcredentials.json file on your disk.

Warning:If you use a source control system, don't commit the df-credentials.json. file to your repository to protect these access credentials. We recommend that you add the .df-credentials.json file to .gitignore.

To create the credentials file, follow these steps:
1. Run the following command:
dataform init-creds 2. Follow the init-creds wizard that walks you through credentials file creation.

Create a project An empty Dataform project has the following structure:
project-dir
├── definitions ├── includes └── workflow_settings.yaml To create a Dataform project to deploy assets to BigQuery, run the following command:
dataform init PROJECT_NAME edit --default-project YOUR_GOOGLE_CLOUD_PROJECT_ID
Replace the following:
PROJECT_NAME: the name of your project. YOUR_GOOGLE_CLOUD_PROJECT_ID: your Google Cloud project ID.

## Clone A Project

To clone an existing Dataform project from a third-party Git repository, follow the instructions from your Git provider.

Once the repository is cloned, run the following command inside the cloned repository directory:
dataform install

## Define A Table

Store definitions in the definitions/ folder.

To define a table, run the following command:
echo "config { type: 'TABLE_TYPE edit' } SELECT_STATEMENT edit" > definitions/FIL
Replace the following:
TABLE_TYPE: the type of the table: table, incremental, or view.

SELECT_STATEMENT: a SELECT statement that defines the table. FILE: the name for the table definition file.

The following code sample defines a view in the example SQLX file.

echo "config { type: 'view' } SELECT 1 AS test" > definitions/example.sqlx

## Define A Manual Assertion

Store definitions in the definitions/ folder.

To define a manual assertion, run the following command:
echo "config { type: 'assertion' } SELECT_STATEMENT edit" > definitions/FILE edit Replace the following:
SELECT_STATEMENT: a SELECT statement that defines the assertion. FILE: the name for the custom SQL operation definition file.

## Define A Custom Sql Operation

Store definitions in the definitions/ folder.

To define a custom SQL operation, run the following command:
echo "config { type: 'operations' } SQL_QUERY edit" > definitions/FILE edit.sqlx Replace the following:
SQL_QUERY: your custom SQL operation. FILE: the name for the custom SQL operation definition file.

## View Compilation Output

Dataform compiles your code in real time.

To view the output of the compilation process in the terminal, run the following command:
dataform compile To view the output of the compilation process as a JSON object, run the following command:
dataform compile --json To view the output of the compilation with custom compilation variables (/dataform/docs/configure-execution), run the following command:
dataform compile --vars=SAMPLE_VAR edit=SAMPLE_VALUE edit,foo=bar Replace the following:
SAMPLE_VAR: your custom compilation variable. SAMPLE_VALUE: the value of your custom compilation variable.

## Execute Code

To execute your code, Dataform accesses BigQuery to determine its current state and tailor the resulting SQL accordingly.

To execute the code of your Dataform project, run the following command:
dataform run To execute the code of your Dataform project in BigQuery with custom compilation variables (/dataform/docs/configure-execution), run the following command:
dataform run --vars=SAMPLE_VAR edit=SAMPLE_VALUE edit,sampleVar2=sampleValue2 Replace the following:
SAMPLE_VAR: your custom compilation variable. SAMPLE_VALUE: the value of your custom compilation variable.

To execute the code of your Dataform project in BigQuery and rebuild all tables from scratch, run the following command:
dataform run --full-refresh Without --full-refresh, Dataform updates incremental tables without rebuilding them from scratch.

To see the final compiled SQL code tailored to the current state of BigQuery, without executing it inside BigQuery, run the following command:
dataform run --dry-run

## Get Help

To list all of the available commands and options, run the following command:
dataform help To view a description of a specific command, run the following command:
dataform help COMMAND edit Replace *COMMAND* with the command you want to learn about.

## What'S Next

To learn more about Dataform CLI, see Dataform CLI reference
 (/dataform/docs/reference/dataform-cli-reference)
To learn more about Dataform, see Dataform overview (/dataform/docs/overview).

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-05-23 UTC.