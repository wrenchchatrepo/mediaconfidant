include: "/views/shared/shared_data.view.lkml"

view: cyberdyne_google {
  extends: [shared_data]

  sql_table_name: `customers.cyberdyne_google` ;;

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension_group: user_list_date_rule_item_info {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.user_list_date_rule_item_info ;;
  }

  dimension: ad_group_id {
    type: string
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: ad_id {
    type: string
    sql: ${TABLE}.ad_id ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
  }

  measure: total_impressions {
    type: sum
    sql: ${impressions} ;;
  }

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
  }

  measure: total_conversions {
    type: sum
    sql: ${conversions} ;;
  }

  measure: average_cost_per_click {
    type: average
    sql: ${cost} / NULLIF(${clicks}, 0) ;;
  }
}
