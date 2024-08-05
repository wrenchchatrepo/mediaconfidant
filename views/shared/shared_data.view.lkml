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

  dimension: gclid {
    type: string
    sql: ${TABLE}.gclid ;;
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
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.event_timestamp_time ;;
  }

  dimension_group: user_list_date_rule_item_info {
    type: time
    timeframes: [time, date, week, month, quarter, year]
    # Use a CASE statement to handle the different sources
    sql: ${shared_data.event_timestamp_time} ;;
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

# Add dimensions for vendor selection
  dimension: vendor {
    type: string
    case: {
      when: {
        label: "Google Analytics 4"
        sql: ${demo_ga4_refined.client_user_id} is not null ;;
      }
      when: {
        label: "Bing Ads"
        sql: ${demo_bing_refined.gclid} is not null ;;
      }
      when: {
        label: "Google Ads"
        sql: ${demo_google_refined.gclid} is not null ;;
      }
      when: {
        label: "Facebook Ads"
        sql: ${demo_facebook_refined.gclid} is not null ;;
      }
      when: {
        label: "TikTok Ads"
        sql: ${demo_tiktok_refined.gclid} is not null ;;
      }
      else: "Unknown"
    }
  }
}
