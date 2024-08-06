include: "/views/demo/generated/demo_ga4.view.lkml"

view: demo_ga4_refined {
  extends: [demo_ga4]

  # Add any necessary refined dimensions or measures if needed
  # For now, only including user_list_date_rule_item_info dimension group
  dimension_group: user_list_date_rule_item_info {
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.user_list_date_rule_item_info ;;
  }

  dimension: client_user_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.client_user_id ;;
  }
}
