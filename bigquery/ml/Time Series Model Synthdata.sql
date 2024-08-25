-- Objective: Forecast future buys for the T800 campaign based on historical data.
-- Prediction: What will the number of buys be for the T800 campaign at a future timestamp?

CREATE OR REPLACE MODEL `doit-new-project.synthetic.timeseries_buys_t800`
OPTIONS(
  model_type='ARIMA_PLUS',
  time_series_timestamp_col='dts',  -- The timestamp column
  time_series_data_col='buys_t800', -- The value to forecast
  time_series_id_col='vendors',     -- Optional: Use if you want separate forecasts per vendor
  horizon=10                        -- Forecast 10 time points into the future
) AS
SELECT
  dts,        -- Date-time stamp
  buys_t800,  -- The value to forecast
  vendors     -- Optional: Separate forecasts per vendor
FROM
  `doit-new-project.synthetic.synthdata`  -- Replace with your table name
ORDER BY
  dts;  -- Ensure the data is ordered by the timestamp

-- Objective: Forecast future buys for the T1000 campaign based on historical data.
-- Prediction: What will the number of buys be for the T1000 campaign at a future timestamp?

CREATE OR REPLACE MODEL `doit-new-project.synthetic.timeseries_buys_t1000`
OPTIONS(
  model_type='ARIMA_PLUS',
  time_series_timestamp_col='dts',  -- The timestamp column
  time_series_data_col='buys_t1000', -- The value to forecast
  time_series_id_col='vendors',     -- Optional: Use if you want separate forecasts per vendor
  horizon=10                        -- Forecast 10 time points into the future
) AS
SELECT
  dts,        -- Date-time stamp
  buys_t1000, -- The value to forecast
  vendors     -- Optional: Separate forecasts per vendor
FROM
  `doit-new-project.synthetic.synthdata`  -- Replace with your table name
ORDER BY
  dts;  -- Ensure the data is ordered by the timestamp