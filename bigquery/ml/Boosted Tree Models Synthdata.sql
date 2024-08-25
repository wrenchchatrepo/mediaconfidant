-- Objective: Predict the number of buys (buys_t800)
-- based on impressions and clicks for the T800 campaign using XGBoost.
-- Prediction: How many buys will the T800 campaign generate?

CREATE OR REPLACE MODEL `doit-new-project.synthetic.xgboost_buys_t800`
OPTIONS(
  model_type='boosted_tree_regressor',  -- Using XGBoost (Boosted Tree Regressor)
  input_label_cols=['buys_t800']        -- Dependent variable: buys_t800
) AS
SELECT
  impressions_t800,   -- Independent variable
  clicks_t800,        -- Independent variable
  buys_t800           -- Label for prediction (dependent variable)
FROM
  `doit-new-project.synthetic.synthdata`;  -- Replace with your table name

-- Objective: Predict the number of buys (buys_t1000)
-- based on impressions and clicks for the T1000 campaign using XGBoost.
-- Prediction: How many buys will the T1000 campaign generate?

CREATE OR REPLACE MODEL `doit-new-project.synthetic.xgboost_buys_t1000`
OPTIONS(
  model_type='boosted_tree_regressor',  -- Using XGBoost (Boosted Tree Regressor)
  input_label_cols=['buys_t1000']       -- Dependent variable: buys_t1000
) AS
SELECT
  impressions_t1000,  -- Independent variable
  clicks_t1000,       -- Independent variable
  buys_t1000          -- Label for prediction (dependent variable)
FROM
  `doit-new-project.synthetic.synthdata`;  -- Replace with your table name