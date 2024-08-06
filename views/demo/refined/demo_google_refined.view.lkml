include: "/views/demo/generated/demo_google.view.lkml"

view: demo_google_refined {
  extends: [demo_google]

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

  # Add any necessary refined dimensions or measures if needed
}
