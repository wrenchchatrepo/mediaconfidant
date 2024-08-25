# Logistic Regression (for Classification Problems)
# Use Case: Predicting binary outcomes (Propensity to Buy)
CREATE OR REPLACE MODEL `doit-new-project.customers.logistic_regression_model`
OPTIONS(model_type='logistic_reg') AS
SELECT
  IF(Revenue > 0, 1, 0) AS label,
  DeviceCategory,
  Manufacturer,
  OS,
  Browser,
  Country,
  State,
  CityState,
  Vendor
FROM `doit-new-project.customers.vendors`;
