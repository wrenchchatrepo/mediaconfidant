-- Objective: Predict whether a user will make a purchase (buys_t800 > 0) 
-- based on impressions and clicks for the T800 campaign.
-- Prediction: Will a user make a purchase (Yes/No)?

CREATE OR REPLACE MODEL `doit-new-project.synthetic.logistic_regression_buys_t800`
OPTIONS(
  model_type='logistic_reg',
  input_label_cols=['buys_t800']  -- Dependent variable: buys_t800 (binary: 0/1)
) AS
SELECT
  impressions_t800,   -- Independent variable
  clicks_t800,        -- Independent variable
  CASE
    WHEN buys_t800 > 0 THEN 1  -- Convert buys_t800 into a binary outcome
    ELSE 0
  END AS buys_t800    -- Label for prediction (binary: 1 if buys > 0, otherwise 0)
FROM
  `doit-new-project.synthetic.synthdata`;  -- Replace with your table name

-- Objective: Predict whether a user will make a purchase (buys_t1000 > 0) 
-- based on impressions and clicks for the T1000 campaign.
-- Prediction: Will a user make a purchase (Yes/No)?

CREATE OR REPLACE MODEL `doit-new-project.synthetic.logistic_regression_buys_t1000`
OPTIONS(
  model_type='logistic_reg',
  input_label_cols=['buys_t1000']  -- Dependent variable: buys_t1000 (binary: 0/1)
) AS
SELECT
  impressions_t1000,  -- Independent variable
  clicks_t1000,       -- Independent variable
  CASE
    WHEN buys_t1000 > 0 THEN 1  -- Convert buys_t1000 into a binary outcome
    ELSE 0
  END AS buys_t1000   -- Label for prediction (binary: 1 if buys > 0, otherwise 0)
FROM
  `doit-new-project.synthetic.synthdata`;  -- Replace with your table name