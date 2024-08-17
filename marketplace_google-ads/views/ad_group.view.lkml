view: ad_group {
  sql_table_name: `@{GOOGLE_ADS_SCHEMA}.ads_AdGroup_@{GOOGLE_ADS_CUSTOMER_ID}`    ;;


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

  dimension: ad_group_desktop_bid_modifier {
    type: number
    sql: ${TABLE}.ad_group_desktop_bid_modifier ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: ad_group_mobile_bid_modifier {
    type: number
    sql: ${TABLE}.ad_group_mobile_bid_modifier ;;
  }

  dimension: ad_group_name {
    drill_fields: [keyword.criteria]
    type: string
    sql: ${TABLE}.ad_group_name ;;
    link: {
      label: "View on Google Ads"
      icon_url: "https://www.google.com/s2/favicons?domain=www.ads.google.com"
      url: "https://ads.google.com/aw/adgroups"
    }
  }


  dimension: ad_group_status {
    type: string
    sql: ${TABLE}.ad_group_status ;;
  }

  dimension: ad_group_tablet_bid_modifier {
    type: number
    sql: ${TABLE}.ad_group_tablet_bid_modifier ;;
  }

  dimension: ad_group_type {
    type: string
    sql: ${TABLE}.ad_group_type ;;
  }

  dimension: ad_rotation_mode {
    type: string
    sql: ${TABLE}.ad_rotation_mode ;;
  }

  dimension: bid_type {
    type: string
    sql: ${TABLE}.bid_type ;;
  }

  dimension: bidding_strategy_id {
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
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: content_bid_criterion_type_group {
    type: string
    sql: ${TABLE}.content_bid_criterion_type_group ;;
  }

  dimension: cpc_bid {
    type: string
    sql: ${TABLE}.cpc_bid ;;
  }

  dimension: cpm_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.cpm_bid ;;
  }

  dimension: cpm_bid_str {
    type: string
    sql: ${TABLE}.cpm_bid_str ;;
  }

  dimension: cpv_bid {
    type: string
    sql: ${TABLE}.cpv_bid ;;
  }

  dimension: effective_target_roas {
    type: number
    sql: ${TABLE}.effective_target_roas ;;
  }

  dimension: effective_target_roas_source {
    type: string
    sql: ${TABLE}.effective_target_roas_source ;;
  }

  dimension: enhanced_cpc_enabled {
    type: yesno
    sql: ${TABLE}.enhanced_cpc_enabled ;;
  }

  dimension: enhanced_cpv_enabled {
    type: yesno
    sql: ${TABLE}.enhanced_cpv_enabled ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: label_ids {
    type: string
    sql: ${TABLE}.label_ids ;;
  }

  dimension: labels {
    type: string
    sql: ${TABLE}.labels ;;
  }

  dimension: target_cpa {
    type: number
    sql: ${TABLE}.target_cpa ;;
  }

  dimension: target_cpa_bid_source {
    type: string
    sql: ${TABLE}.target_cpa_bid_source ;;
  }

  dimension: tracking_url_template {
    type: string
    sql: ${TABLE}.tracking_url_template ;;
  }

  dimension: url_custom_parameters {
    type: string
    sql: ${TABLE}.url_custom_parameters ;;
  }

  measure: count {
    type: count
    drill_fields: [ad_group_name, bidding_strategy_name]
  }
}
