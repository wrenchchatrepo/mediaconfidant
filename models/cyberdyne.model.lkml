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

# test: event_timestamp_no_nulls_refined {
#   explore_source: cyberdyne_ga4_refined {
#     column: event_timestamp_raw
#     filters: {
#       field: event_timestamp_raw
#       value: "-NULL"
#     }
#   }
#   assert: event_timestamp_no_nulls {
#     expression: ${event_timestamp_raw} IS NOT NULL ;;
#   }
# }

# test: valid_event_value_range {
#   explore_source: cyberdyne_ga4_refined {
#     column: event_value_in_usd
#   }
#   assert: event_value_is_valid {
#     expression: ${event_value_in_usd} BETWEEN 0 AND 1000000 ;;
#   }
# }

# test: valid_money_range {
#   explore_source: cyberdyne_ga4_refined {
#     column: money
#   }
#   assert: money_is_valid {
#     expression: ${money} BETWEEN 0 AND 1000 ;;
#   }
# }

# test: valid_conversions_range {
#   explore_source: cyberdyne_google_refined {
#     column: conversions
#   }
#   assert: conversions_is_valid {
#     expression: ${conversions} BETWEEN 0 AND 1000000 ;;
#   }
# }

# test: valid_clicks_range {
#   explore_source: cyberdyne_facebook_refined {
#     column: clicks
#   }
#   assert: clicks_is_valid {
#     expression: ${clicks} BETWEEN 0 AND 1000000 ;;
#   }
# }

# test: valid_cost_range {
#   explore_source: cyberdyne_tiktok_refined {
#     column: cost
#   }
#   assert: cost_is_valid {
#     expression: ${cost} BETWEEN 0 AND 1000000 ;;
#   }
# }
