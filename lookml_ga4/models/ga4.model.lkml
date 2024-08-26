connection: "empyrean-backup-411421"

include: "/lookml_ga4/dashboards/*.dashboard"
include: "/lookml_ga4/explores/*.explore.lkml"
include: "/lookml_ga4/views/**/*.view.lkml"

label: "Google Analytics 4"


datagroup: ga4_main_datagroup {
  sql_trigger:  SELECT CURRENT_DATE();;
  max_cache_age: "3 hour"
}

datagroup: ga4_default_datagroup {
  sql_trigger: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*1)/(60*60*24));;
  max_cache_age: "3 hour"
}

datagroup: ga4_attribution_channel {
  sql_trigger: SELECT 1 ;;
}

persist_with: ga4_main_datagroup
