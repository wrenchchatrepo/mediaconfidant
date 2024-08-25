# Dataform Project Setup and Configuration

This guide provides instructions on how to set up and configure your Dataform project with a focus on the `workflow_setting.yaml` file and SQLX files for BigQuery tables.

## Project Structure

Your Dataform project should have the following structure:

│your_dataform_project/
├── workflow_setting.yaml
├── definitions/
│    ├── vendors.sqlx
│    └── synthdata.sqlx
├── includes/
└── config.json

- **`workflow_setting.yaml`**: This file contains global configurations for your Dataform project.
- **`definitions/`**: This directory contains your `.sqlx` files where you define your transformations.
- **`includes/`**: Optional directory for any custom configurations or shared logic.
- **`config.json`**: Global configuration for your Dataform project (if needed).

## `workflow_setting.yaml` Configuration

Here is an example of a `workflow_setting.yaml` file:

```yaml
defaultProject: doit-new-project
defaultLocation: US
defaultDataset: dataform
defaultAssertionDataset: dataform_assertions
dataformCoreVersion: 3.0.0
```

## Explanation of Settings

+ defaultProject: The GCP project where your Dataform operations will run.
+ defaultLocation: The location where your BigQuery datasets will be created.
+ defaultDataset: The default BigQuery dataset where transformed tables will be stored.
+ defaultAssertionDataset: The dataset where data quality checks (assertions) will be stored.
+ dataformCoreVersion: The version of Dataform core being used.

These settings apply to all SQLX files in the definitions/ directory unless overridden within a specific file.

## Creating SQLX Files

For each BigQuery table, create a .sqlx file in the definitions/ directory. Here are examples for two tables:

### vendors.sqlx

```
config {
  type: "table",
  description: "Vendors data from the customers dataset",
  dependencies: ["doit-new-project.customers.vendors"]
}

select
  UserID,
  DTS,
  Campaign,
  Revenue,
  DeviceCategory,
  Manufacturer,
  OS,
  Browser,
  Country,
  State,
  CityState,
  Vendor
from
  ${ref("doit-new-project.customers.vendors")}
```

### synthdata.sqlx

```
config {
  type: "table",
  description: "Synthetic data from the synthetic dataset",
  dependencies: ["doit-new-project.synthetic.synthdata"]
}

select
  id,
  dts,
  vendors,
  city_state,
  impressions_t800,
  impressions_t1000,
  clicks_t800,
  clicks_t1000,
  buys_t800,
  buys_t1000,
  rev_t800,
  rev_t000
from
  ${ref("doit-new-project.synthetic.synthdata")}
```

Running Your Dataform Project

Once your SQLX files and configuration are set up, you can run your Dataform project with the following command:

`dataform run`

This will apply the configurations from workflow_setting.yaml and your SQLX files to create or transform the tables in BigQuery.

Customizing workflow_setting.yaml

If you need to change the default project, dataset, or location, you can modify the corresponding values in workflow_setting.yaml.

