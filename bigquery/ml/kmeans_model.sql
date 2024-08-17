# k-means Clustering
# Use Case: Grouping users into clusters based on their attributes (e.g., segmenting users by behavior)
CREATE OR REPLACE MODEL `doit-new-project.customers.kmeans_model`
OPTIONS(model_type = 'kmeans', num_clusters = 3) AS
SELECT
  Revenue,
  DeviceCategory,
  Manufacturer,
  OS,
  Browser,
  Country,
  State,
  CityState,
  Vendor
FROM `doit-new-project.customers.all_data_temp`;
