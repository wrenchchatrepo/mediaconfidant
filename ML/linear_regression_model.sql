# Linear Regression
# Use Case: Predicting a continuous value (e.g., predicting revenue)
CREATE OR REPLACE MODEL `doit-new-project.customers.linear_regression_model`
OPTIONS(model_type='linear_reg') AS
SELECT
  Revenue AS label,
  DeviceCategory,
  Manufacturer,
  OS,
  Browser,
  Country,
  State,
  CityState,
  Vendor
FROM `doit-new-project.customers.all_data_temp`;