# The name of this view in Looker is "Ads Product Group Stats 1962270511"
view: ads_product_group_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_ProductGroupStats_1962270511` ;;

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
    # This dimension will be called "Ad Group Criterion Cpc Bid Micros" in Explore.

  dimension: ad_group_criterion_cpc_bid_micros {
    type: number
    sql: ${TABLE}.ad_group_criterion_cpc_bid_micros ;;
  }

  dimension: ad_group_criterion_criterion_id {
    type: number
    sql: ${TABLE}.ad_group_criterion_criterion_id ;;
  }

  dimension: ad_group_criterion_display_name {
    type: string
    sql: ${TABLE}.ad_group_criterion_display_name ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_bidding_category_id {
    type: string
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_bidding_category_id ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_bidding_category_level {
    type: string
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_bidding_category_level ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_brand_value {
    type: string
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_brand_value ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_category_category_id {
    type: string
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_category_category_id ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_category_level {
    type: string
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_category_level ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_channel_channel {
    type: string
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_channel_channel ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_channel_exclusivity_channel_exclusivity {
    type: string
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_channel_exclusivity_channel_exclusivity ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_condition_condition {
    type: string
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_condition_condition ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_custom_attribute_index {
    type: string
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_custom_attribute_index ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_custom_attribute_value {
    type: string
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_custom_attribute_value ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_item_id_value {
    type: string
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_item_id_value ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_type_level {
    type: string
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_type_level ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_type_value {
    type: string
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_type_value ;;
  }

  dimension: ad_group_criterion_status {
    type: string
    sql: ${TABLE}.ad_group_criterion_status ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: metrics_average_cpc {
    type: number
    sql: ${TABLE}.metrics_average_cpc ;;
  }

  dimension: metrics_average_cpm {
    type: number
    sql: ${TABLE}.metrics_average_cpm ;;
  }

  dimension: metrics_clicks {
    type: number
    sql: ${TABLE}.metrics_clicks ;;
  }

  dimension: metrics_cost_micros {
    type: number
    sql: ${TABLE}.metrics_cost_micros ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_metrics_cost_micros {
    type: sum
    sql: ${metrics_cost_micros} ;;  }
  measure: average_metrics_cost_micros {
    type: average
    sql: ${metrics_cost_micros} ;;  }

  dimension: metrics_ctr {
    type: number
    sql: ${TABLE}.metrics_ctr ;;
  }

  dimension: metrics_impressions {
    type: number
    sql: ${TABLE}.metrics_impressions ;;
  }

  dimension: product_group_view_resource_name {
    type: string
    sql: ${TABLE}.product_group_view_resource_name ;;
  }

  dimension_group: segments {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_date ;;
  }

  dimension: segments_day_of_week {
    type: string
    sql: ${TABLE}.segments_day_of_week ;;
  }

  dimension_group: segments_month {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_month ;;
  }

  dimension_group: segments_quarter {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_quarter ;;
  }

  dimension_group: segments_week {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_week ;;
  }

  # dimension: segments_year {
  #   type: number
  #   sql: ${TABLE}.segments_year ;;
  # }
  measure: count {
    type: count
    drill_fields: [ad_group_criterion_display_name, product_group_view_resource_name]
  }
}
