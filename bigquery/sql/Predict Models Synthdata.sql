-- Use the model to predict clicks_t800 for new data

SELECT
  impressions_t800,
  predicted_clicks_t800
FROM
  ML.PREDICT(MODEL `doit-new-project.synthetic.linear_regression_clicks_t800`,
  (
    SELECT
      impressions_t800
    FROM
      `doit-new-project.synthetic.synthdata`
  ));

-- Use the model to predict clicks_t1000 for new data

SELECT
  impressions_t1000,
  predicted_clicks_t1000
FROM
  ML.PREDICT(MODEL `doit-new-project.synthetic.linear_regression_clicks_t1000`,
  (
    SELECT
      impressions_t1000
    FROM
      `doit-new-project.synthetic.synthdata`
  ));

-- Use the model to assign clusters to data points

SELECT
  *,
  CENTROID_ID AS predicted_cluster  -- Use CENTROID_ID as the predicted cluster ID
FROM
  ML.PREDICT(MODEL `doit-new-project.synthetic.kmeans_campaigns`,
  (
    SELECT
      impressions_t800,
      impressions_t1000,
      clicks_t800,
      clicks_t1000,
      buys_t800,
      buys_t1000
    FROM
      `doit-new-project.synthetic.synthdata`
  ));

-- Forecast future buys for the T800 campaign

SELECT
  *
FROM
  ML.FORECAST(MODEL `doit-new-project.synthetic.timeseries_buys_t800`,
  STRUCT(10 AS horizon));  -- Forecast 10 time points into the future

-- Forecast future buys for the T1000 campaign

SELECT
  *
FROM
  ML.FORECAST(MODEL `doit-new-project.synthetic.timeseries_buys_t1000`,
  STRUCT(10 AS horizon));  -- Forecast 10 time points into the future

-- Predict purchases for the T800 campaign

SELECT
  impressions_t800,
  clicks_t800,
  predicted_buys_t800  -- The predicted binary outcome (1 for Yes, 0 for No)
FROM
  ML.PREDICT(MODEL `doit-new-project.synthetic.logistic_regression_buys_t800`,
  (
    SELECT
      impressions_t800,
      clicks_t800
    FROM
      `doit-new-project.synthetic.synthdata`
  ));

-- Predict purchases for the T1000 campaign

SELECT
  impressions_t1000,
  clicks_t1000,
  predicted_buys_t1000  -- The predicted binary outcome (1 for Yes, 0 for No)
FROM
  ML.PREDICT(MODEL `doit-new-project.synthetic.logistic_regression_buys_t1000`,
  (
    SELECT
      impressions_t1000,
      clicks_t1000
    FROM
      `doit-new-project.synthetic.synthdata`
  ));

-- Predict buys for the T800 campaign

SELECT
  impressions_t800,
  clicks_t800,
  predicted_buys_t800  -- The predicted number of buys for T800
FROM
  ML.PREDICT(MODEL `doit-new-project.synthetic.xgboost_buys_t800`,
  (
    SELECT
      impressions_t800,
      clicks_t800
    FROM
      `doit-new-project.synthetic.synthdata`
  ));

-- Predict buys for the T1000 campaign

SELECT
  impressions_t1000,
  clicks_t1000,
  predicted_buys_t1000  -- The predicted number of buys for T1000
FROM
  ML.PREDICT(MODEL `doit-new-project.synthetic.xgboost_buys_t1000`,
  (
    SELECT
      impressions_t1000,
      clicks_t1000
    FROM
      `doit-new-project.synthetic.synthdata`
  ));


  