include: "/models/core_hub.model.lkml"
include: "/views/cyberdyne/*.view.lkml"

explore: cyberdyne_ga4 {
  join: shared_data {
    sql_on: ${cyberdyne_ga4.event_timestamp_raw} = ${shared_data.event_timestamp_raw} ;;
    relationship: many_to_one
  }
  join: cyberdyne_bing {
    sql_on: TIMESTAMP_DIFF(${cyberdyne_ga4.event_timestamp_raw}, ${cyberdyne_bing.user_list_date_rule_item_info_raw}, SECOND) BETWEEN -60 AND 60 ;;
    relationship: many_to_one
  }
  join: cyberdyne_google {
    sql_on: TIMESTAMP_DIFF(${cyberdyne_ga4.event_timestamp_raw}, ${cyberdyne_google.user_list_date_rule_item_info_raw}, SECOND) BETWEEN -60 AND 60 ;;
    relationship: many_to_one
  }
  join: cyberdyne_facebook {
    sql_on: TIMESTAMP_DIFF(${cyberdyne_ga4.event_timestamp_raw}, ${cyberdyne_facebook.user_list_date_rule_item_info_raw}, SECOND) BETWEEN -60 AND 60 ;;
    relationship: many_to_one
  }
  join: cyberdyne_tiktok {
    sql_on: TIMESTAMP_DIFF(${cyberdyne_ga4.event_timestamp_raw}, ${cyberdyne_tiktok.user_list_date_rule_item_info_raw}, SECOND) BETWEEN -60 AND 60 ;;
    relationship: many_to_one
  }
}

explore: cyberdyne_bing {
  join: shared_data {
    sql_on: ${cyberdyne_bing.user_list_date_rule_item_info_raw} = ${shared_data.event_timestamp_raw} ;;
    relationship: many_to_one
  }
}

explore: cyberdyne_google {
  join: shared_data {
    sql_on: ${cyberdyne_google.user_list_date_rule_item_info_raw} = ${shared_data.event_timestamp_raw} ;;
    relationship: many_to_one
  }
}

explore: cyberdyne_facebook {
  join: shared_data {
    sql_on: ${cyberdyne_facebook.user_list_date_rule_item_info_raw} = ${shared_data.event_timestamp_raw} ;;
    relationship: many_to_one
  }
}

explore: cyberdyne_tiktok {
  join: shared_data {
    sql_on: ${cyberdyne_tiktok.user_list_date_rule_item_info_raw} = ${shared_data.event_timestamp_raw} ;;
    relationship: many_to_one
  }
}
