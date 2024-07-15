include: "/views/cyberdyne/generated/cyberdyne_bing.view.lkml"

view: cyberdyne_bing_refined {
  extends: [cyberdyne_bing]

  # Refined dimensions and measures can be added here if needed
  dimension_group: user_list_date_rule_item_info {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.user_list_date_rule_item_info ;;
  }
}
