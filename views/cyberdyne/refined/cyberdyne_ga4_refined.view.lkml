include: "/views/cyberdyne/generated/cyberdyne_ga4.view.lkml"

view: cyberdyne_ga4_refined {
  extends: [cyberdyne_ga4]

  # Add any necessary refined dimensions or measures if needed
  # For now, only including user_list_date_rule_item_info dimension group
  dimension_group: user_list_date_rule_item_info {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.user_list_date_rule_item_info ;;
  }
}
