view: keyword {

  sql_table_name: `@{GOOGLE_ADS_SCHEMA}.ads_Keyword_@{GOOGLE_ADS_CUSTOMER_ID}`    ;;

  dimension: primary_key {
    type: string
    hidden: yes
    primary_key: yes
    sql: CONCAT(${criterion_id},${campaign_id},${ad_group_id}) ;;
  }


  dimension_group: _data {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension_group: _latest {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._LATEST_DATE ;;
  }

  dimension: latest {
    hidden: yes
    type: yesno
    sql: ${_data_raw} = ${_latest_raw} ;;
  }


  dimension: ad_group_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: approval_status {
    type: string
    sql: ${TABLE}.approval_status ;;
  }

  dimension: bid_type {
    type: string
    sql: ${TABLE}.bid_type ;;
  }

  dimension: bidding_strategy_id {
    hidden: yes
    type: number
    sql: ${TABLE}.bidding_strategy_id ;;
  }

  dimension: bidding_strategy_name {
    type: string
    sql: ${TABLE}.bidding_strategy_name ;;
  }

  dimension: bidding_strategy_source {
    type: string
    sql: ${TABLE}.bidding_strategy_source ;;
  }

  dimension: bidding_strategy_type {
    type: string
    sql: ${TABLE}.bidding_strategy_type ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: cpc_bid {
    type: string
    sql: ${TABLE}.cpc_bid ;;
  }

  dimension: cpc_bid_source {
    type: string
    sql: ${TABLE}.cpc_bid_source ;;
  }

  dimension: cpm_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.cpm_bid ;;
  }

  dimension: cpm_bid_str {
    type: string
    sql: ${TABLE}.metrics_cpm_bid_str ;;
  }

  dimension: creative_quality_score {
    type: string
    sql: ${TABLE}.creative_quality_score ;;
  }

  dimension: criteria {
    description: "keyword name"
    type: string
    sql: ${TABLE}.ad_group_criterion_keyword_text ;;
    link: {
      label: "Manage this keyword"
      url: "https://ads.google.com/aw/keywords?ocid={{ keyword.criterion_id._value}}"
    }
  }

  dimension: criteria_destination_url {
    type: string
    sql: ${TABLE}.criteria_destination_url ;;
  }

  dimension: criterion_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ad_group_criterion_criterion_id;;
  }

  dimension: enhanced_cpc_enabled {
    type: yesno
    sql: ${TABLE}.metrics_enhanced_cpc_enabled ;;
  }

  dimension: estimated_add_clicks_at_first_position_cpc {
    type: number
    sql: ${TABLE}.metrics_estimated_add_clicks_at_first_position_cpc ;;
  }

  dimension: estimated_add_cost_at_first_position_cpc {
    type: number
    sql: ${TABLE}.metrics_estimated_add_cost_at_first_position_cpc ;;
  }

  dimension: external_customer_id {
    hidden: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: final_app_urls {
    type: string
    sql: ${TABLE}.final_app_urls ;;
  }

  dimension: final_mobile_urls {
    type: string
    sql: ${TABLE}.final_mobile_urls ;;
  }

  dimension: final_url_suffix {
    type: string
    sql: ${TABLE}.final_url_suffix ;;
  }

  dimension: final_urls {
    type: string
    sql: ${TABLE}.final_urls ;;
  }

  dimension: first_page_cpc {
    type: string
    sql: ${TABLE}.first_page_cpc ;;
  }

  dimension: first_position_cpc {
    type: string
    sql: ${TABLE}.first_position_cpc ;;
  }

  dimension: has_quality_score {
    type: yesno
    sql: ${TABLE}.has_quality_score ;;
  }

  dimension: is_negative {
    type: yesno
    sql: ${TABLE}.is_negative ;;
  }

  dimension: keyword_match_type {
    type: string
    sql: ${TABLE}.keyword_match_type ;;
  }

  dimension: label_ids {
    type: string
    sql: ${TABLE}.label_ids ;;
  }

  dimension: labels {
    type: string
    sql: ${TABLE}.labels ;;
  }

  dimension: post_click_quality_score {
    type: string
    sql: ${TABLE}.post_click_quality_score ;;
  }

  dimension: quality_score {
    type: number
    sql: ${TABLE}.quality_score ;;
  }

  dimension: search_predicted_ctr {
    type: string
    sql: ${TABLE}.search_predicted_ctr ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: system_serving_status {
    type: string
    sql: ${TABLE}.system_serving_status ;;
  }

  dimension: top_of_page_cpc {
    type: string
    sql: ${TABLE}.top_of_page_cpc ;;
  }

  dimension: tracking_url_template {
    type: string
    sql: ${TABLE}.tracking_url_template ;;
  }

  dimension: url_custom_parameters {
    type: string
    sql: ${TABLE}.url_custom_parameters ;;
  }

  dimension: vertical_id {
    hidden: yes
    type: number
    sql: ${TABLE}.vertical_id ;;
  }

  measure: number_of_enabled_keywords {
    type: count
    filters: [status: "ENABLED"]
  }

  drill_fields:   [campaign.campaign_name,ad_group.ad_group_name,criteria,criteria_destination_url]


}
