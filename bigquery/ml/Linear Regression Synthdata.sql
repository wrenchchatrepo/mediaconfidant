-- Objective: Predict the number of clicks (clicks_t800) 
-- based on the number of impressions (impressions_t800).
-- Prediction: How many clicks will the T800 campaign generate?

CREATE OR REPLACE MODEL `doit-new-project.synthetic.linear_regression_clicks_t800`
OPTIONS(
  model_type='linear_reg',
  input_label_cols=['clicks_t800']  -- Dependent variable: clicks_t800
) AS
SELECT
  impressions_t800,   -- Independent variable
  clicks_t800         -- Label for prediction (dependent variable)
FROM
  `doit-new-project.synthetic.synthdata`;  -- Replace with your table name

  -- Objective: Predict the number of clicks (clicks_t1000) 
-- based on the number of impressions (impressions_t1000).
-- Prediction: How many clicks will the T1000 campaign generate?

CREATE OR REPLACE MODEL `doit-new-project.synthetic.linear_regression_clicks_t1000`
OPTIONS(
  model_type='linear_reg',
  input_label_cols=['clicks_t1000']  -- Dependent variable: clicks_t1000
) AS
SELECT
  impressions_t1000,  -- Independent variable
  clicks_t1000        -- Label for prediction (dependent variable)
FROM
  `doit-new-project.synthetic.synthdata`;  -- Replace with your table name