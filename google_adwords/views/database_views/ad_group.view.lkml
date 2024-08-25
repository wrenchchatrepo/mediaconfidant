include: "campaign.view"
include: "/views/*/*.view"
include: "/views/*.view"
view: ad_group {
  extends: [google_adwords_base]
  derived_table: {
    datagroup_trigger: adwords_etl_datagroup

    sql:SELECT
      a.*
      FROM
      @{GOOGLE_ADS_SCHEMA}.AD_GROUP_HISTORY a
      INNER JOIN (
      SELECT
      ID,
      MAX(UPDATED_AT) AS LATEST_RECORD
      FROM @{GOOGLE_ADS_SCHEMA}.AD_GROUP_HISTORY
      GROUP BY 1) b
      ON a.ID = b.ID
      AND a.UPDATED_AT = b.LATEST_RECORD;;
  }
  dimension: ad_group_table_name {
    hidden: yes
    sql:ad_group;;
  }

  dimension: ad_group_desktop_bid_modifier {
    hidden: yes
    type: number
    sql: ${TABLE}.ad_group_desktop_bid_modifier ;;
  }

  dimension: ad_group_id {
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ad_group_mobile_bid_modifier {
    hidden: yes
    type: number
    sql: ${TABLE}.ad_group_mobile_bid_modifier ;;
  }

  dimension: ad_group_name {
    type: string
    sql: ${TABLE}.name ;;
    link: {
      label: "View on AdWords"
      icon_url: "https://www.google.com/s2/favicons?domain=www.adwords.google.com"
      url: "https://adwords.google.com/aw/ads?campaignId={{ campaign_id._value }}&adGroupId={{ ad_group_id._value }}"
    }
    link: {
      label: "Pause Ad Group"
      icon_url: "https://www.google.com/s2/favicons?domain=www.adwords.google.com"
      url: "https://adwords.google.com/aw/ads?campaignId={{ campaign_id._value }}&adGroupId={{ ad_group_id._value }}"
    }
    link: {
      url: "https://adwords.google.com/aw/ads?campaignId={{ campaign_id._value }}&adGroupId={{ ad_group_id._value }}"
      icon_url: "https://www.google.com/s2/favicons?domain=www.adwords.google.com"
      label: "Change Bid"
    }
    required_fields: [campaign_id, ad_group_id]
  }

  dimension: ad_group_status {
    hidden: yes
    type: string
    sql: ${TABLE}.ad_group_status ;;
  }

  dimension: status_active {
    hidden: yes
    type: yesno
    sql: ${ad_group_status} = "enabled" ;;
  }

  dimension: ad_group_tablet_bid_modifier {
    hidden: yes
    type: number
    sql: ${TABLE}.ad_group_tablet_bid_modifier ;;
  }

  dimension: bid_type {
    hidden: yes
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

  dimension: bidding_strategy_source {
    hidden: yes
    type: string
    sql: ${TABLE}.bidding_strategy_source ;;
  }

  dimension: bidding_strategy_type {
    hidden: yes
    type: string
    sql: ${TABLE}.bidding_strategy_type ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: content_bid_criterion_type_group {
    hidden: yes
    type: string
    sql: ${TABLE}.content_bid_criterion_type_group ;;
  }

  dimension: cpc_bid {
    type: string
    sql: ${TABLE}.cpc_bid ;;
  }

  dimension: cpm_bid {
    type: number
    sql: ${TABLE}.cpm_bid ;;
  }

  dimension: cpv_bid {
    type: string
    sql: ${TABLE}.cpv_bid ;;
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

  dimension: target_cpa {
    type: number
    sql: ${TABLE}.target_cpa ;;
  }

  dimension: target_cpa_bid_source {
    hidden: yes
    type: string
    sql: ${TABLE}.target_cpa_bid_source ;;
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
