include: "/views/cyberdyne/cyberdyne_google.view.lkml"

view: cyberdyne_google_refined {
  extends: [cyberdyne_google]

  dimension_group: user_list_date_rule_item_info {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.user_list_date_rule_item_info ;;
  }
}
