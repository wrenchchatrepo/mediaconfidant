include: "/views/demo/generated/demo_facebook.view.lkml"

view: demo_facebook_refined {
  extends: [demo_facebook]

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
