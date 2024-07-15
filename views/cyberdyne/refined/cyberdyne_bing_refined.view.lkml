include: "/views/cyberdyne/cyberdyne_bing.view.lkml"

view: cyberdyne_bing_refined {
  extends: [cyberdyne_bing]

  dimension_group: user_list_date_rule_item_info {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.user_list_date_rule_item_info ;;
  }
}
