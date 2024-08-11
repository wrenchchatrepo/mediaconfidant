# The name of this view in Looker is "Ads Parental Status 1962270511"
view: ads_parental_status_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_ParentalStatus_1962270511` ;;

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
    # This dimension will be called "Ad Group Base Ad Group" in Explore.

  dimension: ad_group_base_ad_group {
    type: string
    sql: ${TABLE}.ad_group_base_ad_group ;;
  }

  dimension: ad_group_criterion_criterion_id {
    type: number
    sql: ${TABLE}.ad_group_criterion_criterion_id ;;
  }

  dimension: ad_group_criterion_effective_cpc_bid_micros {
    type: number
    sql: ${TABLE}.ad_group_criterion_effective_cpc_bid_micros ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_ad_group_criterion_effective_cpc_bid_micros {
    type: sum
    sql: ${ad_group_criterion_effective_cpc_bid_micros} ;;  }
  measure: average_ad_group_criterion_effective_cpc_bid_micros {
    type: average
    sql: ${ad_group_criterion_effective_cpc_bid_micros} ;;  }

  dimension: ad_group_criterion_effective_cpc_bid_source {
    type: string
    sql: ${TABLE}.ad_group_criterion_effective_cpc_bid_source ;;
  }

  dimension: ad_group_criterion_effective_cpm_bid_micros {
    type: number
    sql: ${TABLE}.ad_group_criterion_effective_cpm_bid_micros ;;
  }

  dimension: ad_group_criterion_effective_cpm_bid_source {
    type: string
    sql: ${TABLE}.ad_group_criterion_effective_cpm_bid_source ;;
  }

  dimension: ad_group_criterion_final_mobile_urls {
    type: string
    sql: ${TABLE}.ad_group_criterion_final_mobile_urls ;;
  }

  dimension: ad_group_criterion_final_urls {
    type: string
    sql: ${TABLE}.ad_group_criterion_final_urls ;;
  }

  dimension: ad_group_criterion_negative {
    type: yesno
    sql: ${TABLE}.ad_group_criterion_negative ;;
  }

  dimension: ad_group_criterion_parental_status_type {
    type: string
    sql: ${TABLE}.ad_group_criterion_parental_status_type ;;
  }

  dimension: ad_group_criterion_status {
    type: string
    sql: ${TABLE}.ad_group_criterion_status ;;
  }

  dimension: ad_group_criterion_tracking_url_template {
    type: string
    sql: ${TABLE}.ad_group_criterion_tracking_url_template ;;
  }

  dimension: ad_group_criterion_url_custom_parameters {
    type: string
    sql: ${TABLE}.ad_group_criterion_url_custom_parameters ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: ad_group_targeting_setting_target_restrictions {
    type: string
    sql: ${TABLE}.ad_group_targeting_setting_target_restrictions ;;
  }

  dimension: campaign_base_campaign {
    type: string
    sql: ${TABLE}.campaign_base_campaign ;;
  }

  dimension: campaign_bidding_strategy {
    type: string
    sql: ${TABLE}.campaign_bidding_strategy ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }
  measure: count {
    type: count
  }
}
