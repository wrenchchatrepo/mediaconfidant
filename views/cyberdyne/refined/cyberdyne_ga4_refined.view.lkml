include: "/views/cyberdyne/generated/cyberdyne_bing.view.lkml"

view: cyberdyne_bing_refined {
  extends: [cyberdyne_bing]

  # Add any necessary refined dimensions or measures if needed
  # For now, only including user_list_date_rule_item_info dimension group
  dimension_group: user_list_date_rule_item_info {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.user_list_date_rule_item_info ;;
  }
}
