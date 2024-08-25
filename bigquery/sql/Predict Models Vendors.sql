SELECT *
FROM ML.PREDICT(MODEL `doit-new-project.customers.linear_regression_model`,
  (
    SELECT 
      DeviceCategory,
      Manufacturer,
      OS,
      Browser,
      Country,
      State,
      CityState,
      Vendor
    FROM `doit-new-project.customers.vendors`
  )
);

SELECT *
FROM ML.PREDICT(MODEL `doit-new-project.customers.logistic_regression_model`,
  (
    SELECT 
      DeviceCategory,
      Manufacturer,
      OS,
      Browser,
      Country,
      State,
      CityState,
      Vendor
    FROM `doit-new-project.customers.vendors`
  )
);

SELECT *
FROM ML.PREDICT(MODEL `doit-new-project.customers.kmeans_model`,
  (
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
    FROM `doit-new-project.customers.vendors`
  )
);

SELECT *
FROM ML.FORECAST(MODEL `doit-new-project.customers.time_series_model`,
  STRUCT(30 AS horizon, 0.8 AS confidence_level)
);

SELECT *
FROM ML.PREDICT(MODEL `doit-new-project.customers.random_forest_model`,
  (
    SELECT
      DATE(DTS) AS date,               -- Group by date
      DeviceCategory,
      Campaign,
      COUNT(`UserID`) AS user_count,  -- Include user_count as it was used in model training
      SUM(Revenue) AS total_revenue    -- Sum revenue as in the model training
    FROM `doit-new-project.customers.vendors`
    GROUP BY date, DeviceCategory, Campaign
  )
);