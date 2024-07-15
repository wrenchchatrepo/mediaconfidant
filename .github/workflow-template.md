---
name: Workflow Template
about: Use this template to start a workflow build
title: New Workflow Request
labels: ''
assignees: ''

---

Title: A concise and descriptive title for the workflow request.

Description: A detailed description of the desired workflow. Include the purpose of the workflow and its importance.

Products Involved: Specify which Google Cloud products are involved (e.g., BigQuery, Dataform, Data Transfer Service).

Detailed Requirements:

For BigQuery: Mention the datasets, tables, queries, scheduled queries, and any other specific configurations.
For Dataform: Provide details on the repository, dataset, tables, SQL code, Git remote settings, etc.
For Data Transfer Service: Mention the data sources, destination, schedule, parameters, and data refresh window.
Resources and Configurations:

List any specific resources that need to be created or configured.
Provide configurations for each resource such as location, labels, permissions, and other settings.
Sample Data or Queries:

If applicable, provide sample datasets, SQL queries, scripts, or configurations.
Expected Outputs: Describe what the expected outputs of the workflow are.

Additional Information:

Include any additional context or information that might be valuable.
Attach any relevant documents, diagrams, or references.
Here’s an example of how such an issue might look:

Title: Request New Workflow for BigQuery and Dataform Integration

Description: We need to integrate BigQuery and Dataform to streamline our ETL processes. This workflow will automate data transformations and load the results into BigQuery for analytics. The transformed data will be used for generating reports on a daily basis.

Products Involved:

Google Cloud BigQuery
Google Cloud Dataform
Detailed Requirements:

BigQuery:
Create a dataset named analytics_data.
Create tables named sales, customers, and products.
Schedule a daily query to aggregate sales data.
Dataform:
Set up a Dataform repository.
Define SQL transformations to clean and aggregate the data.
Git remote settings for the Dataform repository: URL, default branch, and authentication token.
Resources and Configurations:

BigQuery:
Location: US
Labels: {"project": "analytics"}
Dataform:
Repository Name: analytics_dataform_repo
GitRemoteSettings:
URL: git@example.com:repo.git
Default Branch: main
AuthenticationTokenSecretVersion: projects/YOUR_PROJECT_ID/secrets/YOUR_SECRET_ID/versions/latest
Sample Data/Queries:


CREATE OR REPLACE TABLE `analytics_data.sales` AS
SELECT * FROM `raw_data.sales`
WHERE sale_date >= CURRENT_DATE() - INTERVAL 30 DAY;
Expected Outputs:

Aggregated sales data loaded into BigQuery daily.
Clean and transformed data ready for generating reports.
Additional Information:

Please find attached the data schema and a detailed diagram of the workflow.
Reference to the previous similar implementation: [Link to Previous Implementation].

```
package main

import (
    "github.com/pulumi/pulumi-gcp/sdk/v7/go/gcp/bigquery"
    "github.com/pulumi/pulumi-gcp/sdk/v7/go/gcp/dataform"
    "github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
    pulumi.Run(func(ctx *pulumi.Context) error {
        // Create a BigQuery Dataset
        dataset, err := bigquery.NewDataset(ctx, "analytics_data", &bigquery.DatasetArgs{
            Location: pulumi.String("US"),
            Labels: pulumi.StringMap{
                "project": pulumi.String("analytics"),
            },
        })
        if err != nil {
            return err
        }

        // Create a BigQuery Table
        salesTable, err := bigquery.NewTable(ctx, "sales", &bigquery.TableArgs{
            DatasetId: dataset.DatasetId,
            Schema: pulumi.String(`[
                { "name": "sale_id", "type": "STRING", "mode": "REQUIRED" },
                { "name": "sale_date", "type": "DATE", "mode": "REQUIRED" },
                { "name": "amount", "type": "FLOAT", "mode": "REQUIRED" }
            ]`),
        })
        if err != nil {
            return err
        }

        // Creating a Dataform Repository
        repo, err := dataform.NewRepository(ctx, "analytics_dataform_repo", &dataform.RepositoryArgs{
            Project: pulumi.String("YOUR_PROJECT_ID"),
            Name: pulumi.String("analytics_dataform_repo"),
            GitRemoteSettings: &dataform.RepositoryGitRemoteSettingsArgs{
                Url:                            pulumi.String("git@example.com:repo.git"),
                DefaultBranch:                  pulumi.String("main"),
                AuthenticationTokenSecretVersion: pulumi.String("projects/YOUR_PROJECT_ID/secrets/YOUR_SECRET_ID/versions/latest"),
            },
        })
        if err != nil {
            return err
        }

        // Export the dataset and table URLs
        ctx.Export("datasetURL", dataset.SelfLink)
        ctx.Export("salesTableURL", salesTable.SelfLink)

        return nil
    })
}
```
