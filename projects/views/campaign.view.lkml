include: /views/shared_views/*

view: campaign {
  sql_table_name: `@{GOOGLE_ADS_SCHEMA}.ads_Campaign_@{GOOGLE_ADS_CUSTOMER_ID}` ;;


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
    sql: ${TABLE}._LATEST_DATE;;
  }

  dimension: latest {
    hidden: yes
    type: yesno
    sql: ${_data_raw} = ${_latest_raw} ;;
  }

  filter: campaign_selector {
    description: "use with campaign comparitor"
    suggest_dimension: campaign.campaign_name
  }

  dimension: campaign_comparitor {
    description: "use this with the campaign selector filter for comparisons against population"
    type: string
    sql:
    CASE
      WHEN {% condition campaign_selector %} ${campaign_name} {% endcondition %}
        THEN ${campaign_name}
      ELSE 'Rest of Campaigns'
    END ;;
  }

  dimension: advertising_channel_sub_type {
    group_label: "Campaign Attributes"
    description: "Optional refinement of the campaign's AdvertisingChannelType."
    type: string
    sql: ${TABLE}.advertising_channel_sub_type ;;
  }

  dimension: advertising_channel_type {
    group_label: "Campaign Attributes"
    type: string
    sql: ${TABLE}.advertising_channel_type ;;
  }

  dimension: amount {
    description: "The daily budget amount"
    type: number
    sql: ${TABLE}.amount / 10000 ;;
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

  dimension: bidding_strategy_type {
    type: string
    sql: ${TABLE}.bidding_strategy_type ;;
  }

  dimension: budget_id {
    type: number
    sql: SAFE_CAST(${TABLE}.campaign_campaign_budget AS INT64);;
  }

  dimension: campaign_desktop_bid_modifier {
    type: number
    sql: ${TABLE}.campaign_desktop_bid_modifier ;;
  }

  dimension: campaign_group_id {
    type: number
    sql: ${TABLE}.campaign_group_id ;;
  }

  dimension: campaign_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_mobile_bid_modifier {
    type: number
    sql: ${TABLE}.campaign_mobile_bid_modifier ;;
  }

  dimension: campaign_name {
    drill_fields: [ad_group.ad_group_name]
    alias: [name]
    type: string
    sql: concat(${TABLE}.campaign_name, ' | ', ${campaign_id}) ;;
    link: {
      label: "See {{value}} Detail Dashboard"
      url: "/dashboards/block_google_ads_transfer_v2::campaign_details_lookup?CampaignName={{ value }}&Period={{ fact.period._parameter_value | replace: \"'\", '' | url_encode }}"
    }
  }

  dimension: campaign_status {
    type: string
    sql: ${TABLE}.campaign_status ;;
  }

  dimension: campaign_tablet_bid_modifier {
    type: number
    sql: ${TABLE}.campaign_tablet_bid_modifier ;;
  }

  dimension: campaign_trial_type {
    type: string
    sql: ${TABLE}.campaign_trial_type ;;
  }

  dimension_group: end {
    description: "the end date of the campaign"
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
    sql: ${TABLE}.campaign_end_date ;;
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

  dimension: has_recommended_budget {
    type: yesno
    sql: ${TABLE}.has_recommended_budget ;;
  }

  dimension: is_budget_explicitly_shared {
    type: yesno
    sql: ${TABLE}.is_budget_explicitly_shared ;;
  }

  dimension: label_ids {
    type: string
    sql: ${TABLE}.label_ids ;;
  }

  dimension: labels {
    type: string
    sql: ${TABLE}.labels ;;
  }

  dimension: maximize_conversion_value_target_roas {
    type: number
    sql: ${TABLE}.maximize_conversion_value_target_roas ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension: recommended_budget_amount {
    type: string
    sql: ${TABLE}.recommended_budget_amount ;;
  }

  dimension: serving_status {
    type: string
    sql: ${TABLE}.serving_status ;;
  }

  dimension_group: start {
    description: "the start date of the campaign"
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
    sql: ${TABLE}.campaign_start_date ;;
  }

  dimension: total_amount {
    type: string
    sql: ${TABLE}.total_amount ;;
  }

  dimension: tracking_url_template {
    type: string
    sql: ${TABLE}.tracking_url_template ;;
  }

  dimension: url_custom_parameters {
    type: string
    sql: ${TABLE}.url_custom_parameters ;;
  }

  measure: number_of_campaigns {
    type: count
    drill_fields: [campaign_name, bidding_strategy_name]
  }
}
