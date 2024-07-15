include: "/views/shared/shared_data.view.lkml"

view: cyberdyne_bing {
  extends: [shared_data]

  sql_table_name: `customers.cyberdyne_bing` ;;

  dimension: browser_version_info {
    type: string
    sql: ${TABLE}.browser_version_info ;;
  }

  dimension: event_item_attribute {
    type: string
    sql: ${TABLE}.event_item_attribute ;;
  }

  dimension: mobile_device_info {
    type: string
    sql: ${TABLE}.mobile_device_info ;;
  }

  dimension: money {
    type: number
    sql: ${TABLE}.money ;;
  }

  measure: total_money {
    type: sum
    sql: ${money} ;;
  }

  measure: average_money {
    type: average
    sql: ${money} ;;
  }

  dimension: operating_system_version_info {
    type: string
    sql: ${TABLE}.operating_system_version_info ;;
  }

  dimension_group: user_list_date_rule_item_info {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.user_list_date_rule_item_info ;;
  }
}
