# The name of this view in Looker is "P Ads Ad Group 1962270511"
view: p_ads_ad_group_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_AdGroup_1962270511` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: _partitiondate {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONDATE ;;
  }

  dimension_group: _partitiontime {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONTIME ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Ad Group Ad Rotation Mode" in Explore.

  dimension: ad_group_ad_rotation_mode {
    type: string
    description: "The ad rotation mode of the ad group."
    sql: ${TABLE}.ad_group_ad_rotation_mode ;;
  }

  dimension: ad_group_cpc_bid_micros {
    type: number
    description: "The maximum CPC (cost-per-click) bid."
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
    description: "The maximum CPM (cost-per-thousand viewable impressions) bid."
    sql: ${TABLE}.ad_group_cpm_bid_micros ;;
  }

  dimension: ad_group_cpv_bid_micros {
    type: number
    description: "The CPV (cost-per-view) bid."
    sql: ${TABLE}.ad_group_cpv_bid_micros ;;
  }

  dimension: ad_group_display_custom_bid_dimension {
    type: string
    description: "Allows advertisers to specify a targeting dimension on which to place absolute bids. This is only applicable for campaigns that target only the display network and not search."
    sql: ${TABLE}.ad_group_display_custom_bid_dimension ;;
  }

  dimension: ad_group_effective_target_cpa_micros {
    type: number
    description: "The effective target CPA (cost-per-acquisition). This field is read-only."
    sql: ${TABLE}.ad_group_effective_target_cpa_micros ;;
  }

  dimension: ad_group_effective_target_cpa_source {
    type: string
    description: "Source of the effective target CPA. This field is read-only."
    sql: ${TABLE}.ad_group_effective_target_cpa_source ;;
  }

  dimension: ad_group_effective_target_roas {
    type: number
    description: "The effective target ROAS (return-on-ad-spend). This field is read-only."
    sql: ${TABLE}.ad_group_effective_target_roas ;;
  }

  dimension: ad_group_effective_target_roas_source {
    type: string
    description: "Source of the effective target ROAS. This field is read-only."
    sql: ${TABLE}.ad_group_effective_target_roas_source ;;
  }

  dimension: ad_group_id {
    type: number
    description: "The ID of the ad group."
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: ad_group_name {
    type: string
    description: "The name of the ad group. This field is required and should not be empty when creating new ad groups. It must contain fewer than 255 UTF-8 full-width characters. It must not contain any null (code point 0x0), NL line feed (code point 0xA) or carriage return (code point 0xD) characters."
    sql: ${TABLE}.ad_group_name ;;
  }

  dimension: ad_group_status {
    type: string
    description: "The status of the ad group."
    sql: ${TABLE}.ad_group_status ;;
  }

  dimension: ad_group_tracking_url_template {
    type: string
    description: "The URL template for constructing a tracking URL."
    sql: ${TABLE}.ad_group_tracking_url_template ;;
  }

  dimension: ad_group_type {
    type: string
    description: "The type of the ad group."
    sql: ${TABLE}.ad_group_type ;;
  }

  dimension: ad_group_url_custom_parameters {
    type: string
    description: "The list of mappings used to substitute custom parameter tags in a `tracking_url_template`, `final_urls`, or `mobile_final_urls`."
    sql: ${TABLE}.ad_group_url_custom_parameters ;;
  }

  dimension: campaign_bidding_strategy {
    type: string
    description: "Portfolio bidding strategy used by campaign."
    sql: ${TABLE}.campaign_bidding_strategy ;;
  }

  dimension: campaign_bidding_strategy_type {
    type: string
    description: "The type of bidding strategy. A bidding strategy can be created by setting either the bidding scheme to create a standard bidding strategy or the `bidding_strategy` field to create a portfolio bidding strategy. This field is read-only."
    sql: ${TABLE}.campaign_bidding_strategy_type ;;
  }

  dimension: campaign_id {
    type: number
    description: "The ID of the campaign."
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_manual_cpc_enhanced_cpc_enabled {
    type: yesno
    description: "Whether bids are to be enhanced based on conversion optimizer data."
    sql: ${TABLE}.campaign_manual_cpc_enhanced_cpc_enabled ;;
  }

  dimension: campaign_percent_cpc_enhanced_cpc_enabled {
    type: yesno
    description: "Adjusts the bid for each auction upward or downward, depending on the likelihood of a conversion. Individual bids may exceed cpc_bid_ceiling_micros, but the average bid amount for a campaign should not."
    sql: ${TABLE}.campaign_percent_cpc_enhanced_cpc_enabled ;;
  }

  dimension: customer_id {
    type: number
    description: "The ID of the customer."
    sql: ${TABLE}.customer_id ;;
  }
  measure: count {
    type: count
    drill_fields: [ad_group_name]
  }
}
