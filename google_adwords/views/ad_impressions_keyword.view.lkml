include: "/views/**/*.view"
view: ad_impressions_keyword {
  extends: [date_base, period_base, google_ad_metrics_base,  google_adwords_base]
  sql_table_name: @{GOOGLE_ADS_SCHEMA}.keyword_stats ;;

  dimension: keyword_primary_key {
    hidden: yes
    sql: concat(${ad_group_primary_key}, "|", ${criterion_id_string}, "|", ${slot}) ;;
  }
  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: ${keyword_primary_key} ;;
  }
  dimension: criterion_id {
    hidden: yes
    sql: ${TABLE}.id ;;
  }
  dimension: criterion_id_string {
    hidden: yes
    sql: CAST(${TABLE}.id as STRING) ;;
  }
  dimension: slot {
    hidden: yes
    type: string
    sql: ${TABLE}.slot ;;
  }
  dimension: ad_group_primary_key {
    hidden: yes
    sql: concat(${campaign_primary_key}, "|", ${ad_group_id_string}) ;;
  }
  dimension: ad_group_id {
    hidden: yes
    sql: ${TABLE}.ad_group_id ;;
  }
  dimension: ad_group_id_string {
    hidden: yes
    sql: CAST(${TABLE}.ad_group_id as STRING) ;;
  }
  dimension: base_ad_group_id {
    hidden: yes
    sql: ${TABLE}.base_ad_group_id ;;
  }
  dimension: campaign_primary_key {
    hidden: yes
    sql: concat(${account_primary_key}, "|", ${campaign_id_string}) ;;
  }
  dimension: base_campaign_id {
    hidden: yes
    sql: ${TABLE}.base_campaign_id ;;
  }
  dimension: campaign_id {
    hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }
  dimension: campaign_id_string {
    hidden: yes
    sql: CAST(${TABLE}.campaign_id as STRING) ;;
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
