include: "/views/demo/generated/demo_bing.view.lkml"

view: demo_bing_refined {
  extends: [demo_bing]

  # Refined dimensions and measures can be added here if needed
  dimension_group: user_list_date_rule_item_info {
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.user_list_date_rule_item_info ;;
  }

  dimension: gclid {
    primary_key: yes
    type: string
    sql: ${TABLE}.gclid ;;
  }

  dimension_group: user_list_date_rule_item_info_time {
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.user_list_date_rule_item_info ;;  # Assuming the original field is called user_list_date_rule_item_info
  }
}
