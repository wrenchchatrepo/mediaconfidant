CREATE OR REPLACE TABLE `doit-new-project.customers.all_data_temp` AS

SELECT 
  gclid AS UserID,
  UserListDateRuleItemInfo AS DTS,
  EventItemAttribute AS Campaign,
  Money AS Revenue,
  DeviceCategory AS DeviceCategory,
  MobileDeviceInfo AS Manufacturer,
  OperatingSystemVersionInfo AS OS,
  BrowserVersionInfo AS Browser,
  GeoPointInfo AS Country,
  GeoPointInfoState AS State,
  GeoPointInfoCity AS CityState,
  'bing' AS Vendor
FROM `doit-new-project.customers.demo_bing`

UNION ALL

SELECT 
  gclid AS UserID,
  UserListDateRuleItemInfo AS DTS,
  EventItemAttribute AS Campaign,
  Money AS Revenue,
  DeviceCategory AS DeviceCategory,
  MobileDeviceInfo AS Manufacturer,
  OperatingSystemVersionInfo AS OS,
  BrowserVersionInfo AS Browser,
  GeoPointInfo AS Country,
  GeoPointInfoState AS State,
  GeoPointInfoCity AS CityState,
  'facebook' AS Vendor
FROM `doit-new-project.customers.demo_facebook`

UNION ALL

SELECT 
  gclid AS UserID,
  UserListDateRuleItemInfo AS DTS,
  EventItemAttribute AS Campaign,
  Money AS Revenue,
  DeviceCategory AS DeviceCategory,
  MobileDeviceInfo AS Manufacturer,
  OperatingSystemVersionInfo AS OS,
  BrowserVersionInfo AS Browser,
  GeoPointInfo AS Country,
  GeoPointInfoState AS State,
  GeoPointInfoCity AS CityState,
  'google' AS Vendor
FROM `doit-new-project.customers.demo_google`

UNION ALL

SELECT 
  gclid AS UserID,
  UserListDateRuleItemInfo AS DTS,
  EventItemAttribute AS Campaign,
  Money AS Revenue,
  DeviceCategory AS DeviceCategory,
  MobileDeviceInfo AS Manufacturer,
  OperatingSystemVersionInfo AS OS,
  BrowserVersionInfo AS Browser,
  GeoPointInfo AS Country,
  GeoPointInfoState AS State,
  GeoPointInfoCity AS CityState,
  'tiktok' AS Vendor
FROM `doit-new-project.customers.demo_tiktok`

UNION ALL

SELECT 
  client_user_id AS UserID,
  event_timestamp AS DTS,
  event_name AS Campaign,
  event_value_in_usd AS Revenue,
  device_category AS DeviceCategory,
  device_brand_name AS Manufacturer,
  device_operating_system_version AS OS,
  device_web_info_browser_version AS Browser,
  geo_country AS Country,
  geo_region AS State,
  geo_city AS CityState,
  'ga4' AS Vendor
FROM `doit-new-project.customers.demo_ga4`;