# Time Series Forecasting (ARIMA_PLUS)
# Use Case: Predicting future values based on time-series data (Return On Ad Spend)
CREATE OR REPLACE MODEL `doit-new-project.customers.time_series_model`
OPTIONS(
  model_type = 'arima_plus',
  time_series_data_col = 'time_series_data',
  time_series_timestamp_col = 'time_series_timestamp'
) AS
SELECT
  TIMESTAMP_TRUNC(DTS, HOUR) AS time_series_timestamp,
  SUM(Revenue) AS time_series_data
FROM `doit-new-project.customers.vendors`
WHERE Revenue IS NOT NULL
GROUP BY time_series_timestamp
ORDER BY time_series_timestamp;