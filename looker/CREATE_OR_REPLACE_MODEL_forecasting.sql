CREATE OR REPLACE MODEL my_dataset.time_series_model
OPTIONS(model_type='ARIMA') AS
SELECT
  event_timestamp AS date,
  SUM(event_value_in_usd) AS total_value
FROM
  my_dataset.combined_metrics
GROUP BY
  date
ORDER BY
  date;