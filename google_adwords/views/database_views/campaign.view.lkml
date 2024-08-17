include: "customer.view"
include: "/views/*/*.view"
include: "/views/*.view"
view: campaign {
  extends: [ google_adwords_base]
  derived_table: {
 datagroup_trigger: adwords_etl_datagroup

 sql:SELECT
      a.*
      FROM
      @{GOOGLE_ADS_SCHEMA}.CAMPAIGN_HISTORY a
      INNER JOIN (
      SELECT
      ID,
      MAX(UPDATED_AT) AS LATEST_RECORD
      FROM @{GOOGLE_ADS_SCHEMA}.CAMPAIGN_HISTORY
      GROUP BY 1) b
      ON a.ID = b.ID
      AND a.UPDATED_AT = b.LATEST_RECORD;;
}
  dimension: advertising_channel_sub_type {
    hidden: yes
    type: string
    sql: ${TABLE}.advertising_channel_sub_type ;;
  }

  dimension: advertising_channel_type {
    hidden: yes
    type: string
    sql: ${TABLE}.advertising_channel_type ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: bid_type {
    type: string
    sql: ${TABLE}.bid_type ;;
  }

  dimension: bidding_strategy_id {
    hidden: yes
    sql: ${TABLE}.bidding_strategy_id ;;
  }

  dimension: bidding_strategy_name {
    hidden: yes
    type: string
    sql: ${TABLE}.bidding_strategy_name ;;
  }

  dimension: bidding_strategy_type {
    hidden: yes
    type: string
    sql: ${TABLE}.bidding_strategy_type ;;
  }

  dimension: budget_id {
    hidden: yes
    sql: ${TABLE}.budget_id ;;
  }

  dimension: campaign_desktop_bid_modifier {
    hidden: yes
    type: number
    sql: ${TABLE}.campaign_desktop_bid_modifier ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: campaign_mobile_bid_modifier {
    hidden: yes
    type: number
    sql: ${TABLE}.campaign_mobile_bid_modifier ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    link: {
      label: "Campaign Dashboard"
      url: "/dashboards/marketing_analytics::campaign_metrics_cost_per_conversion?Campaign={{ value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
    link: {
      label: "View on AdWords"
      icon_url: "https://www.google.com/s2/favicons?domain=www.adwords.google.com"
      url: "https://adwords.google.com/aw/adgroups?campaignId={{ campaign_id._value | encode_uri }}"
    }
    link: {
      label: "Pause Campaign"
      icon_url: "https://www.google.com/s2/favicons?domain=www.adwords.google.com"
      url: "https://adwords.google.com/aw/ads?campaignId={{ campaign_id._value | encode_uri }}"
    }
    link: {
      url: "https://adwords.google.com/aw/ads?campaignId={{ campaign_id._value | encode_uri }}"
      icon_url: "https://www.google.com/s2/favicons?domain=www.adwords.google.com"
      label: "Change Budget"
    }
    required_fields: [ campaign_id]
  }

  dimension: campaign_status {
    hidden: yes
    type: string
    sql: ${TABLE}.campaign_status ;;
  }

  dimension: status_active {
    hidden: yes
    type: yesno
    sql: ${campaign_status} = "enabled" ;;
  }

  dimension: campaign_tablet_bid_modifier {
    hidden: yes
    type: number
    sql: ${TABLE}.campaign_tablet_bid_modifier ;;
  }

  dimension: campaign_trial_type {
    hidden: yes
    type: string
    sql: ${TABLE}.campaign_trial_type ;;
  }

  dimension_group: end {
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
    sql: (TIMESTAMP(${TABLE}.end_date)) ;;
  }

  dimension: enhanced_cpc_enabled {
    hidden: yes
    type: yesno
    sql: ${TABLE}.enhanced_cpc_enabled ;;
  }

  dimension: enhanced_cpv_enabled {
    hidden: yes
    type: yesno
    sql: ${TABLE}.enhanced_cpv_enabled ;;
  }

  dimension: is_budget_explicitly_shared {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_budget_explicitly_shared ;;
  }

  dimension: label_ids {
    hidden: yes
    type: string
    sql: ${TABLE}.label_ids ;;
  }

  dimension: labels {
    hidden: yes
    type: string
    sql: ${TABLE}.labels ;;
  }

  dimension: period {
    hidden: yes
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension: serving_status {
    hidden: yes
    type: string
    sql: ${TABLE}.serving_status ;;
  }

  dimension_group: start {
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
    sql: (TIMESTAMP(${TABLE}.start_date)) ;;
  }

  dimension: tracking_url_template {
    hidden: yes
    type: string
    sql: ${TABLE}.tracking_url_template ;;
  }

  dimension: url_custom_parameters {
    hidden: yes
    type: string
    sql: ${TABLE}.url_custom_parameters ;;
  }
}
