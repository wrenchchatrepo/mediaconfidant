-- Objective: Group similar data points based on impressions, clicks, and buys 
-- for the T800 and T1000 campaigns.
-- Prediction: Which cluster does a given set of data points belong to?

CREATE OR REPLACE MODEL `doit-new-project.synthetic.kmeans_campaigns`
OPTIONS(
  model_type='kmeans',
  num_clusters=3  -- Set the number of clusters; adjust as needed
) AS
SELECT
  impressions_t800,   -- Feature for clustering
  impressions_t1000,  -- Feature for clustering
  clicks_t800,        -- Feature for clustering
  clicks_t1000,       -- Feature for clustering
  buys_t800,          -- Feature for clustering
  buys_t1000          -- Feature for clustering
FROM
  `doit-new-project.synthetic.synthdata`;  -- Replace with your table name