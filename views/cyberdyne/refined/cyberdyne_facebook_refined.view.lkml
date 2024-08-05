include: "/views/cyberdyne/generated/cyberdyne_facebook.view.lkml"

view: cyberdyne_facebook_refined {
  extends: [cyberdyne_facebook]

  dimension_group: user_list_date_rule_item_info {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.user_list_date_rule_item_info ;;
  }

  # Add any necessary refined dimensions or measures if needed
}
