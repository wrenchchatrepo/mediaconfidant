include: "/views/demo/generated/demo_tiktok.view.lkml"

view: demo_tiktok_refined {
  extends: [demo_tiktok]

  # dimension_group: user_list_date_rule_item_info {
  #   type: time
  #   timeframes: [time, date, week, month, quarter, year]
  #   sql: ${TABLE}.user_list_date_rule_item_info ;;
  # }

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

  # Add any necessary refined dimensions or measures if needed
}
