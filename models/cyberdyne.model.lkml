include: "/views/cyberdyne/generated/cyberdyne_ga4.view.lkml"
include: "/views/cyberdyne/generated/cyberdyne_bing.view.lkml"
include: "/views/cyberdyne/generated/cyberdyne_google.view.lkml"
include: "/views/cyberdyne/generated/cyberdyne_facebook.view.lkml"
include: "/views/cyberdyne/generated/cyberdyne_tiktok.view.lkml"
include: "/views/cyberdyne/refined/cyberdyne_ga4_refined.view.lkml"
include: "/views/cyberdyne/refined/cyberdyne_bing_refined.view.lkml"
include: "/views/cyberdyne/refined/cyberdyne_google_refined.view.lkml"
include: "/views/cyberdyne/refined/cyberdyne_facebook_refined.view.lkml"
include: "/views/cyberdyne/refined/cyberdyne_tiktok_refined.view.lkml"
include: "/views/shared/shared_data.view.lkml"
include: "/Dashboards/Vendor_Independent_Activity_Dashboard.dashboard.lookml"
include: "/Dashboards/Cyberdyne_Comparison_Dashboard.dashboard.lookml"

connection: "pipeline"

explore: cyberdyne_ga4_refined {
  join: shared_data {
    sql_on: (
      ${cyberdyne_ga4_refined.event_timestamp_raw} >= TIMESTAMP_SUB(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
      AND ${cyberdyne_ga4_refined.event_timestamp_raw} <= TIMESTAMP_ADD(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
    ) ;;
    relationship: many_to_one
  }
}

explore: cyberdyne_bing_refined {
  join: shared_data {
    sql_on: (
      ${cyberdyne_bing_refined.user_list_date_rule_item_info_raw} >= TIMESTAMP_SUB(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
      AND ${cyberdyne_bing_refined.user_list_date_rule_item_info_raw} <= TIMESTAMP_ADD(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
    ) ;;
    relationship: many_to_one
  }
}

explore: cyberdyne_google_refined {
  join: shared_data {
    sql_on: (
      ${cyberdyne_google_refined.user_list_date_rule_item_info_raw} >= TIMESTAMP_SUB(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
      AND ${cyberdyne_google_refined.user_list_date_rule_item_info_raw} <= TIMESTAMP_ADD(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
    ) ;;
    relationship: many_to_one
  }
}

explore: cyberdyne_facebook_refined {
  join: shared_data {
    sql_on: (
      ${cyberdyne_facebook_refined.user_list_date_rule_item_info_raw} >= TIMESTAMP_SUB(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
      AND ${cyberdyne_facebook_refined.user_list_date_rule_item_info_raw} <= TIMESTAMP_ADD(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
    ) ;;
    relationship: many_to_one
  }
}

explore: cyberdyne_tiktok_refined {
  join: shared_data {
    sql_on: (
      ${cyberdyne_tiktok_refined.user_list_date_rule_item_info_raw} >= TIMESTAMP_SUB(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
      AND ${cyberdyne_tiktok_refined.user_list_date_rule_item_info_raw} <= TIMESTAMP_ADD(${shared_data.event_timestamp_raw}, INTERVAL 60 SECOND)
    ) ;;
    relationship: many_to_one
  }
}
