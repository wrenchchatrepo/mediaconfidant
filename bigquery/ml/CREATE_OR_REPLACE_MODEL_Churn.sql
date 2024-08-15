CREATE OR REPLACE MODEL my_dataset.churn_model
OPTIONS(model_type='logistic_reg') AS
SELECT
  client_user_id,
  event_value_in_usd,
  device_category,
  device_brand_name,
  geo_region,
  geo_city,
  CASE WHEN churn = 1 THEN 1 ELSE 0 END AS label
FROM
  my_dataset.combined_metrics;
