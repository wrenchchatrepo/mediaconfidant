connection: "@{CONNECTION_NAME}"

include: "/dashboards/*.dashboard"
include: "/explores/*.explore"

datagroup: adwords_etl_datagroup {
  sql_trigger: SELECT COUNT(*) FROM `@{GOOGLE_ADS_SCHEMA}.account_hourly_stats` ;;
  max_cache_age: "24 hours"
}
