# Overview Of Dataform Core

This document introduces you to Dataform core and shows you how to use it in Dataform.

## Overview Of Dataform Core

Dataform core is an open source meta-language to create SQL tables and workflows. Dataform core extends SQL by providing a dependency management system, automated data quality testing, and data documentation. You can use Dataform core for the following purposes:
Defining tables, views, materialized views, or incremental tables. Defining data transformation logic. Declaring source data and managing table dependencies. Documenting table and column descriptions inside code. Reusing functions and variables across different queries. Writing data assertions to ensure data consistency.

In Dataform, you use Dataform core to develop SQL workflows and deploy assets to BigQuery. Dataform core is part of the open-source Dataform data modeling framework
 (https://github.com/dataform-co/dataform) that also includes Dataform CLI
 (/dataform/docs/use-dataform-cli). You can compile and run Dataform core locally through the Dataform CLI outside of Google Cloud. To use Dataform core, you write SQLX files. Each SQLX file contains a query that defines a database relation that Dataform creates and updates inside BigQuery. Dataform compiles your Dataform core code in real time to create a SQL compilation result that you can execute in BigQuery. Dataform compilation is hermetic to ensure compilation consistency, meaning that the same code compiles to the same SQL compilation result every time. Dataform compiles your code in a sandbox environment with no internet access. No additional actions, such as calling external APIs, are available during compilation.

## Sqlx File Config Block

A SQLX file consists of a config block and a body. All config properties, and the config block itself, are optional. Given this, any plain SQL file is a valid SQLX file that Dataform executes asis.

In the config block, you can perform the following actions:
Specify query metadata. (\#query-metadata) Document data.  (\#document) Define data quality tests. (\#tests)

## Specify Query Metadata

You can configure how Dataform materializes queries into BigQuery, for example the output table type, the target database, or labels using the config metadata.

## Document Data

You can document your tables (/dataform/docs/document-tables) and their fields directly in the config block. Documentation of your tables is pushed directly to BigQuery. You can parse this documentation and push it out to other tools.

## Define Data Quality Tests

You can define data quality tests, called assertions (/dataform/docs/assertions), to check for uniqueness, null values, or a custom condition. Dataform adds assertions defined in the config block to your workflow dependency tree after table creation. You can also define assertions outside the config block, in a separate SQLX file. The following code sample shows you how to define the output table type, document the table, and define a quality test in a config block of a SQLX file.

config {
type: "table",
description: "This table joins orders information from OnlineStore & payment columns: {
order_date: "The date when a customer placed their order", id: "Order ID as defined by OnlineStore", order_status: "The status of an order e.g. sent, delivered", customer_id: "Unique customer ID", payment_status: "The status of a payment e.g. pending, paid", payment_method: "How the customer chose to pay", item_count: "The number of items the customer ordered", amount: "The amount the customer paid"
},
assertions: { uniqueKey: ["id"]
}
}

## Sqlx File Body

In the body of a SQLX file you can perform the following actions:
Define a table and its dependencies. (\#define-table) Define additional SQL operations to run in BigQuery. (\#define-SQL) Generate SQL code with JavaScript. (\#encapsulate-SQL)

## Define A Table

To define a new table you can use SQL SELECT statements and the ref function. The ref function is a SQLX built-in function that is critical to dependency management in Dataform. The ref function lets you reference tables defined in your Dataform project instead of hard coding the schema and table names of your data table.

Dataform uses the ref function to build a dependency tree of all the tables to be created or updated. After compiling, Dataform adds boilerplate statements like CREATE, REPLACE, or INSERT. The following code sample shows you how to reference a table in a SQLX file with the ref function.

config { type: "table" } SELECT
order_date AS date, order_id AS order_id, order_status AS order_status, SUM(item_count) AS item_count, SUM(amount) AS revenue FROM ${ref("store_clean")} GROUP BY 1, 2, 3 The output is similar to the following:
CREATE OR REPLACE TABLE Dataform.orders AS SELECT
order_date AS date, order_id AS order_id, order_status AS order_status, SUM(item_count) AS item_count, SUM(amount) AS revenue FROM Dataform_stg.store_clean GROUP BY 1, 2, 3 For more information on additional dependency management, for example, executing code conditionally, using other Dataform core built-in functions, see the Dataform core reference (/dataform/docs/reference/dataform-core-reference).

Define additional SQL operations To configure Dataform to execute one or more SQL statements before or after creating a table or view, you can specify pre-query and post-query operations (/dataform/docs/custom-sql). The following code sample shows you how to configure table or view access permissions in a post-query operation.

SELECT * FROM ... post_operations {
GRANT `roles/bigquery.dataViewer` ON TABLE ${self()} TO "group:someusers@dataf
}

## Encapsulate Sql Code

To define reusable functions to generate repetitive parts of SQL code, you can use JavaScript blocks. You can reuse code defined in a JavaScript block only inside the SLQX file where the block is defined. To reuse code across your entire repository, you can create includes (/dataform/docs/reuse-code-includes). To dynamically modify a query, you can use inline JavaScript anywhere in the body. The following code sample shows how to define a JavaScript block in a SQLX file and use it inline inside a query:
js {
const columnName = "foo";
} SELECT 1 AS ${columnName} FROM "..."

## What'S Next

To learn more about Dataform core built-in functions, see the Dataform core reference (/dataform/docs/reference/dataform-core-reference). To learn more about Dataform CLI, see Use the Dataform CLI (/dataform/docs/use-dataform-cli). To learn how to define additional SQL operations, see Add custom SQL operations (/dataform/docs/custom-sql). To learn how to create JavaScript includes, see Reuse variables and functions with includes (/dataform/docs/reuse-code-includes).

To learn how to define a table using Dataform, see Create a table (/dataform/docs/define-table).

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-06-12 UTC.