include: "/views/demo/generated/demo_ga4.view.lkml"
include: "/views/demo/generated/demo_bing.view.lkml"
include: "/views/demo/generated/demo_google.view.lkml"
include: "/views/demo/generated/demo_facebook.view.lkml"
include: "/views/demo/generated/demo_tiktok.view.lkml"
include: "/views/demo/refined/demo_ga4_refined.view.lkml"
include: "/views/demo/refined/demo_bing_refined.view.lkml"
include: "/views/demo/refined/demo_google_refined.view.lkml"
include: "/views/demo/refined/demo_facebook_refined.view.lkml"
include: "/views/demo/refined/demo_tiktok_refined.view.lkml"
include: "/views/shared/shared_data.view.lkml"
# include: "/Dashboards/*.dashboard.lookml"
connection: "pipeline"

explore: demo_ga4_refined {
  join: shared_data {
    sql_on: (
      ${demo_ga4_refined.event_timestamp_raw} >= TIMESTAMP_SUB(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
      AND ${demo_ga4_refined.event_timestamp_raw} <= TIMESTAMP_ADD(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
    ) ;;
    relationship: many_to_one
  }
}

explore: demo_bing_refined {
  join: shared_data {
    sql_on: (
      ${demo_bing_refined.user_list_date_rule_item_info_raw} >= TIMESTAMP_SUB(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
      AND ${demo_bing_refined.user_list_date_rule_item_info_raw} <= TIMESTAMP_ADD(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
    ) ;;
    relationship: many_to_one
  }
}

explore: demo_google_refined {
  join: shared_data {
    sql_on: (
      ${demo_google_refined.user_list_date_rule_item_info_raw} >= TIMESTAMP_SUB(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
      AND ${demo_google_refined.user_list_date_rule_item_info_raw} <= TIMESTAMP_ADD(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
    ) ;;
    relationship: many_to_one
  }
}

explore: demo_facebook_refined {
  join: shared_data {
    sql_on: (
      ${demo_facebook_refined.user_list_date_rule_item_info_raw} >= TIMESTAMP_SUB(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
      AND ${demo_facebook_refined.user_list_date_rule_item_info_raw} <= TIMESTAMP_ADD(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
    ) ;;
    relationship: many_to_one
  }
}

explore: demo_tiktok_refined {
  join: shared_data {
    sql_on: (
      ${demo_tiktok_refined.user_list_date_rule_item_info_raw} >= TIMESTAMP_SUB(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
      AND ${demo_tiktok_refined.user_list_date_rule_item_info_raw} <= TIMESTAMP_ADD(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
    ) ;;
    relationship: many_to_one
  }
}
