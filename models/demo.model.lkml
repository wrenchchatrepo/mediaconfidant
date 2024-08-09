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
# include: "/views/demo/shared/shared_data.view.lkml"
# include: "/**/*.dashboard"
# include: "/tests/data_tests.lkml"



connection: "pipeline"

# explore: demo_ga4_refined {
explore: Vendors {
  from: demo_ga4_refined

  fields: [ALL_FIELDS*]
  # Join all refined views
  join: demo_bing_refined {
    relationship: one_to_one
    sql_on: ${demo_bing_refined.user_list_date_rule_item_info_time} = ${Vendors.event_timestamp_time} ;;
  }
  join: demo_google_refined {
    relationship: one_to_one
    sql_on: ${demo_google_refined.user_list_date_rule_item_info_time} = ${Vendors.event_timestamp_time} ;;
  }
  join: demo_facebook_refined {
    relationship: one_to_one
    sql_on: ${demo_facebook_refined.user_list_date_rule_item_info_time} = ${Vendors.event_timestamp_time} ;;
  }
  join: demo_tiktok_refined {
    relationship: one_to_one
    sql_on: ${demo_tiktok_refined.user_list_date_rule_item_info_time} = ${Vendors.event_timestamp_time} ;;
  }
}
