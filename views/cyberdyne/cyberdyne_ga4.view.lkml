include: "/views/shared/shared_data.view.lkml"

view: cyberdyne_ga4 {
  extends: [shared_data]

  sql_table_name: `customers.cyberdyne_ga4` ;;

  dimension_group: event_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.event_timestamp ;;
  }

  dimension: device_brand_name {
    type: string
    sql: ${TABLE}.device_brand_name ;;
  }

  dimension: device_operating_system_version {
    type: string
    sql: ${TABLE}.device_operating_system_version ;;
  }

  dimension: device_web_info_browser_version {
    type: string
    sql: ${TABLE}.device_web_info_browser_version ;;
  }

  dimension: event_value_in_usd {
    type: number
    sql: ${TABLE}.event_value_in_usd ;;
  }

  measure: total_event_value_in_usd {
    type: sum
    sql: ${event_value_in_usd} ;;
  }

  measure: average_event_value_in_usd {
    type: average
    sql: ${event_value_in_usd} ;;
  }
}
