include: "/views/**/*.view"

view: ad_impressions_daily {
  extends: [date_base, period_base, google_ad_metrics_base,  google_adwords_base]
  sql_table_name: @{GOOGLE_ADS_SCHEMA}.account_stats ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: concat(${account_primary_key}, "|", ${date_string}) ;;
  }
  dimension: account_primary_key {
    hidden: yes
    sql: concat(
      ${date_string}, "|",
      ${ad_network_type1},  "|",
      ${ad_network_type2}, "|",
      ${device}) ;;
  }
  dimension: active_view_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.active_view_impressions ;;
  }
  dimension: active_view_measurability {
    hidden: yes
    type: number
    sql: ${TABLE}.active_view_measurability ;;
  }
  dimension: active_view_measurable_cost {
    hidden: yes
    type: number
    sql: ${TABLE}.active_view_measurable_cost ;;
  }
  dimension: active_view_measurable_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.active_view_measurable_impressions ;;
  }
  dimension: active_view_viewability {
    hidden: yes
    type: number
    sql: ${TABLE}.active_view_viewability ;;
  }
  dimension: ad_network_type1 {
    hidden: yes
    type: string
    sql: ${TABLE}.ad_network_type_1 ;;
  }
  dimension: ad_network_type2 {
    hidden: yes
    type: string
    sql: ${TABLE}.ad_network_type_2 ;;
  }
  dimension: clicks {
    hidden: yes
    type: number
    sql: ${TABLE}.clicks ;;
  }
  dimension: conversions {
    hidden: yes
    type: number
    sql: ${TABLE}.conversions ;;
  }
  dimension: conversionvalue {
    hidden: yes
    type: number
    sql: ${TABLE}.conversion_value ;;
  }
  dimension: cost {
    hidden: yes
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension: device {
    hidden: yes
    type: string
    sql: ${TABLE}.device ;;
  }
  dimension: impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.impressions ;;
  }
  dimension: interactions {
    hidden: yes
    type: number
    sql: ${TABLE}.interactions ;;
  }
  dimension: interaction_types {
    hidden: yes
    type: string
    sql: ${TABLE}.interaction_types ;;
  }
  dimension: view_through_conversions {
    hidden: yes
    type: number
    sql: ${TABLE}.view_through_conversions ;;
  }
}
