CREATE OR REPLACE MODEL my_dataset.clv_model
OPTIONS(model_type='linear_reg') AS
SELECT
  client_user_id,
  SUM(event_value_in_usd) AS total_value,
  COUNT(event_name) AS total_events,
  device_category,
  device_brand_name,
  geo_region,
  geo_city
FROM
  my_dataset.combined_metrics
GROUP BY
  client_user_id,
  device_category,
  device_brand_name,
  geo_region,
  geo_city;
