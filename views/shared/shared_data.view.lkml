include: "/views/demo/refined/demo_ga4_refined.view.lkml"
include: "/views/demo/refined/demo_bing_refined.view.lkml"
include: "/views/demo/refined/demo_google_refined.view.lkml"
include: "/views/demo/refined/demo_facebook_refined.view.lkml"
include: "/views/demo/refined/demo_tiktok_refined.view.lkml"

view: shared_data {
  dimension: client_user_id {
    type: string
    sql: ${TABLE}.client_user_id ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }

  dimension_group: event_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.event_timestamp ;;
  }

  dimension_group: user_list_date_rule_item_info {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.UserListDateRuleItemInfo ;;
  }

  dimension: geo_city {
    type: string
    sql: ${TABLE}.geo_city ;;
  }

  dimension: geo_country {
    type: string
    sql: ${TABLE}.geo_country ;;
  }

  dimension: geo_region {
    type: string
    sql: ${TABLE}.geo_region ;;
  }

  measure: count {
    type: count
    drill_fields: [device_category, event_name]
  }
}
