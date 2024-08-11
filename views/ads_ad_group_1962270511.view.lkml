# The name of this view in Looker is "Ads Ad Group 1962270511"
view: ads_ad_group_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_AdGroup_1962270511` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: _data {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension_group: _latest {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._LATEST_DATE ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Ad Group Ad Rotation Mode" in Explore.

  dimension: ad_group_ad_rotation_mode {
    type: string
    sql: ${TABLE}.ad_group_ad_rotation_mode ;;
  }

  dimension: ad_group_cpc_bid_micros {
    type: number
    sql: ${TABLE}.ad_group_cpc_bid_micros ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_ad_group_cpc_bid_micros {
    type: sum
    sql: ${ad_group_cpc_bid_micros} ;;  }
  measure: average_ad_group_cpc_bid_micros {
    type: average
    sql: ${ad_group_cpc_bid_micros} ;;  }

  dimension: ad_group_cpm_bid_micros {
    type: number
    sql: ${TABLE}.ad_group_cpm_bid_micros ;;
  }

  dimension: ad_group_cpv_bid_micros {
    type: number
    sql: ${TABLE}.ad_group_cpv_bid_micros ;;
  }

  dimension: ad_group_display_custom_bid_dimension {
    type: string
    sql: ${TABLE}.ad_group_display_custom_bid_dimension ;;
  }

  dimension: ad_group_effective_target_cpa_micros {
    type: number
    sql: ${TABLE}.ad_group_effective_target_cpa_micros ;;
  }

  dimension: ad_group_effective_target_cpa_source {
    type: string
    sql: ${TABLE}.ad_group_effective_target_cpa_source ;;
  }

  dimension: ad_group_effective_target_roas {
    type: number
    sql: ${TABLE}.ad_group_effective_target_roas ;;
  }

  dimension: ad_group_effective_target_roas_source {
    type: string
    sql: ${TABLE}.ad_group_effective_target_roas_source ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: ad_group_name {
    type: string
    sql: ${TABLE}.ad_group_name ;;
  }

  dimension: ad_group_status {
    type: string
    sql: ${TABLE}.ad_group_status ;;
  }

  dimension: ad_group_tracking_url_template {
    type: string
    sql: ${TABLE}.ad_group_tracking_url_template ;;
  }

  dimension: ad_group_type {
    type: string
    sql: ${TABLE}.ad_group_type ;;
  }

  dimension: ad_group_url_custom_parameters {
    type: string
    sql: ${TABLE}.ad_group_url_custom_parameters ;;
  }

  dimension: campaign_bidding_strategy {
    type: string
    sql: ${TABLE}.campaign_bidding_strategy ;;
  }

  dimension: campaign_bidding_strategy_type {
    type: string
    sql: ${TABLE}.campaign_bidding_strategy_type ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_manual_cpc_enhanced_cpc_enabled {
    type: yesno
    sql: ${TABLE}.campaign_manual_cpc_enhanced_cpc_enabled ;;
  }

  dimension: campaign_percent_cpc_enhanced_cpc_enabled {
    type: yesno
    sql: ${TABLE}.campaign_percent_cpc_enhanced_cpc_enabled ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }
  measure: count {
    type: count
    drill_fields: [ad_group_name]
  }
}
