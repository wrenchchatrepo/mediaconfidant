-- Random Forest Classifier with 0 and 1 as labels based on user_count threshold of 1500
CREATE OR REPLACE MODEL `doit-new-project.customers.random_forest_model`
OPTIONS(
  model_type = 'random_forest_classifier',
  num_parallel_tree = 50,
  tree_method = 'HIST',
  early_stop = FALSE,
  subsample = 0.85,
  input_label_cols = ['LowUserIDGroup']  -- Specify the label column as LowUserIDGroup
) AS
WITH AggregatedData AS (
  SELECT
    DATE(DTS) AS date,              -- Grouping by date extracted from DTS
    DeviceCategory,
    Campaign,
    COUNT(`UserID`) AS user_count,  -- Count occurrences of User ID within each group
    SUM(Revenue) AS total_revenue    -- Sum Revenue within each group
  FROM `doit-new-project.customers.vendors`
  GROUP BY date, DeviceCategory, Campaign
),
LabeledData AS (
  SELECT
    *,
    CASE
      WHEN user_count < 1500 THEN 0
      ELSE 1
    END AS LowUserIDGroup  -- Label as 0 if user_count is less than 1500, otherwise 1
  FROM AggregatedData
)
SELECT
  LowUserIDGroup,    -- Label for user_count less than 1500 (0) or greater than or equal to 1500 (1)
  date,
  DeviceCategory,
  Campaign,
  total_revenue,      -- Include total revenue as a feature
  user_count          -- Include user count to inspect
FROM LabeledData;