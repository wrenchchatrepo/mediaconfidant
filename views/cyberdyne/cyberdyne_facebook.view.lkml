include: "/views/shared/shared_data.view.lkml"

view: cyberdyne_facebook {
  extends: [shared_data]

  sql_table_name: `customers.cyberdyne_facebook` ;;

  dimension: ad_id {
    type: string
    sql: ${TABLE}.ad_id ;;
  }

  dimension_group: user_list_date_rule_item_info {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.user_list_date_rule_item_info ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: ad_set_name {
    type: string
    sql: ${TABLE}.ad_set_name ;;
  }

  dimension: click_through_rate {
    type: number
    sql: ${TABLE}.click_through_rate ;;
  }

  dimension: cost_per_click {
    type: number
    sql: ${TABLE}.cost_per_click ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
  }

  measure: average_cost_per_click {
    type: average
    sql: ${cost_per_click} ;;
  }
}
