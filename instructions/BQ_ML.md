# Writing SQL for Machine Learning Models in BigQuery

## Introduction

BigQuery ML allows SQL practitioners to create, train, and evaluate machine learning models using SQL queries. This guide provides an overview of how to create different types of models using SQL in BigQuery.

### Supported Models

BigQuery ML supports various types of models, including:

- **Linear Regression**: Used for forecasting continuous values.
- **Logistic Regression**: Used for binary or multi-class classification.
- **K-Means Clustering**: Used for unsupervised clustering of data points.
- **Time Series**: Used for forecasting time-based data.
- **Boosted Tree**: Used for classification and regression tasks, similar to Random Forest.
- **Deep Neural Networks (DNN)**: TensorFlow-based models for complex classification and regression tasks.

## General Syntax

### Creating a Model

```sql
CREATE OR REPLACE MODEL `project.dataset.model_name`
OPTIONS(
  model_type = 'MODEL_TYPE',
  input_label_cols = ['label_column']
) AS
SELECT
  feature_1,
  feature_2,
  ...
  label_column
FROM
  `project.dataset.table_name`;
```

model_type: The type of model to create (e.g., linear_reg, logistic_reg, kmeans, time_series, boosted_tree_regressor, etc.).
input_label_cols: The column(s) that contain the labels for supervised models.
SELECT statement: The SQL query that selects the features and labels from your dataset.

### Evaluating a Model

```sql
SELECT
  *
FROM
  ML.EVALUATE(MODEL `project.dataset.model_name`);
```

This query evaluates the performance of the trained model.

### Predicting with a Model

```sql
SELECT
  feature_1,
  feature_2,
  ...
  predicted_label
FROM
  ML.PREDICT(MODEL `project.dataset.model_name`,
  (
    SELECT
      feature_1,
      feature_2,
      ...
    FROM
      `project.dataset.table_name`
  ));
```

This query uses the trained model to make predictions on new data.

**Examples**

Linear Regression
```sql
CREATE OR REPLACE MODEL `project.dataset.linear_regression_model`
OPTIONS(
  model_type = 'linear_reg',
  input_label_cols = ['label_column']
) AS
SELECT
  feature_1,
  feature_2,
  ...
  label_column
FROM
  `project.dataset.table_name`;
```

Logistic Regression
```sql
CREATE OR REPLACE MODEL `project.dataset.logistic_regression_model`
OPTIONS(
  model_type = 'logistic_reg',
  input_label_cols = ['label_column']
) AS
SELECT
  feature_1,
  feature_2,
  ...
  CASE
    WHEN label_column > 0 THEN 1
    ELSE 0
  END AS label_column
FROM
  `project.dataset.table_name`;
```

K-Means Clustering
```sql
CREATE OR REPLACE MODEL `project.dataset.kmeans_model`
OPTIONS(
  model_type = 'kmeans',
  num_clusters = 3
) AS
SELECT
  feature_1,
  feature_2,
  ...
FROM
  `project.dataset.table_name`;
```

Time Series Forecasting
```sql
CREATE OR REPLACE MODEL `project.dataset.timeseries_model`
OPTIONS(
  model_type = 'arima_plus',
  time_series_timestamp_col = 'timestamp_column',
  time_series_data_col = 'value_column',
  horizon = 10
) AS
SELECT
  timestamp_column,
  value_column
FROM
  `project.dataset.table_name`
ORDER BY
  timestamp_column;
```

Boosted Tree (XGBoost)
```sql
CREATE OR REPLACE MODEL `project.dataset.boosted_tree_model`
OPTIONS(
  model_type = 'boosted_tree_regressor',
  input_label_cols = ['label_column']
) AS
SELECT
  feature_1,
  feature_2,
  ...
  label_column
FROM
  `project.dataset.table_name`;
```

Additional Resources

[Introduction to AI and ML in BigQuery](https://cloud.google.com/bigquery/docs/bqml-introduction)

[The CREATE MODEL statement](https://cloud.google.com/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create)

















