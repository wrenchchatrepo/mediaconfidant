-- Evaluate the linear regression model for clicks_t800

SELECT
  *
FROM
  ML.EVALUATE(MODEL `doit-new-project.synthetic.linear_regression_clicks_t800`);

-- Evaluate the linear regression model for clicks_t1000

SELECT
  *
FROM
  ML.EVALUATE(MODEL `doit-new-project.synthetic.linear_regression_clicks_t1000`);

-- Evaluate the K-Means clustering model

SELECT
  *
FROM
  ML.EVALUATE(MODEL `doit-new-project.synthetic.kmeans_campaigns`);

-- Evaluate the time series model for buys_t800

SELECT
  *
FROM
  ML.EVALUATE(MODEL `doit-new-project.synthetic.timeseries_buys_t800`);

SELECT
  *
FROM
  ML.EVALUATE(MODEL `doit-new-project.synthetic.timeseries_buys_t1000`);

-- Evaluate the logistic regression model for buys_t800

SELECT
  *
FROM
  ML.EVALUATE(MODEL `doit-new-project.synthetic.logistic_regression_buys_t800`);

-- Evaluate the logistic regression model for buys_t1000

SELECT
  *
FROM
  ML.EVALUATE(MODEL `doit-new-project.synthetic.logistic_regression_buys_t1000`);

-- Evaluate the XGBoost model for buys_t800

SELECT
  *
FROM
  ML.EVALUATE(MODEL `doit-new-project.synthetic.xgboost_buys_t800`);

-- Evaluate the XGBoost model for buys_t1000

SELECT
  *
FROM
  ML.EVALUATE(MODEL `doit-new-project.synthetic.xgboost_buys_t1000`);


