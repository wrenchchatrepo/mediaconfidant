include: "/views/cyberdyne/generated/cyberdyne_tiktok.view.lkml"

view: cyberdyne_tiktok_refined {
  extends: [cyberdyne_tiktok]

  dimension_group: user_list_date_rule_item_info {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.user_list_date_rule_item_info ;;
  }

  # Add any necessary refined dimensions or measures if needed
}
