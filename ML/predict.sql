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
    FROM `doit-new-project.customers.all_data_temp`
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
    FROM `doit-new-project.customers.all_data_temp`
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
    FROM `doit-new-project.customers.all_data_temp`
  )
);

SELECT *
FROM ML.FORECAST(MODEL `doit-new-project.customers.time_series_model`,
  STRUCT(30 AS horizon, 0.8 AS confidence_level)
);
