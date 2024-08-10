include: "/views/demo/generated/demo_ga4.view.lkml"

view: demo_ga4_refined {
  extends: [demo_ga4]

  # Add any necessary refined dimensions or measures if needed
  # For now, only including user_list_date_rule_item_info dimension group

  dimension: vendor {
    type: string
    sql: 'GA4' ;;
  }

  dimension: client_user_id {
    label: "User ID"
    type: string
    sql: ${TABLE}.client_user_id ;;
  }

  dimension: device_brand_name {
    label: "Manufacturer"
    type: string
    sql: ${TABLE}.device_brand_name ;;
  }

  dimension: device_category {
    label: "Device Category"
    type: string
    sql: ${TABLE}.device_category ;;
  }

  dimension: device_operating_system_version {
    label: "OS"
    type: string
    sql: ${TABLE}.device_operating_system_version ;;
  }

  dimension: device_web_info_browser_version {
    label: "Browser"
    type: string
    sql: ${TABLE}.device_web_info_browser_version ;;
  }

  dimension: event_name {
    label: "Campaign"
    type: string
    sql: ${TABLE}.event_name ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: event_timestamp {
    group_label: "DTS"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.event_timestamp ;;
  }

  dimension: event_value_in_usd {
    label: "Revenue"
    type: number
    sql: ${TABLE}.event_value_in_usd ;;
    value_format: "$#.00;($#.00)"
  }

  measure: total_event_value_in_usd {
    label: "Total Revenue"
    type: sum
    sql: ${event_value_in_usd} ;;
    value_format: "$#.00;($#.00)"
  }

  measure: average_event_value_in_usd {
    label: "Average Revenue"
    type: average
    sql: ${event_value_in_usd} ;;
    value_format: "$#.00;($#.00)"
  }

  dimension: geo_city {
    label: "City State"
    type: string
    sql: ${TABLE}.geo_city ;;
  }

  dimension: geo_country {
    label: "Country"
    type: string
    sql: ${TABLE}.geo_country ;;
  }

  dimension: geo_region {
    label: "State"
    type: string
    sql: ${TABLE}.geo_region ;;
  }
  measure: count {
    type: count
    drill_fields: [device_brand_name, event_name]
  }
  }
