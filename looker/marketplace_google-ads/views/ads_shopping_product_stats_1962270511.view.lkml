# The name of this view in Looker is "Ads Shopping Product Stats 1962270511"
view: ads_shopping_product_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_ShoppingProductStats_1962270511` ;;

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
    # This dimension will be called "Campaign ID" in Explore.

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_status {
    type: string
    sql: ${TABLE}.campaign_status ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: metrics_all_conversions {
    type: number
    sql: ${TABLE}.metrics_all_conversions ;;
  }

  dimension: metrics_all_conversions_from_interactions_rate {
    type: number
    sql: ${TABLE}.metrics_all_conversions_from_interactions_rate ;;
  }

  dimension: metrics_all_conversions_value {
    type: number
    sql: ${TABLE}.metrics_all_conversions_value ;;
  }

  dimension: metrics_average_cpc {
    type: number
    sql: ${TABLE}.metrics_average_cpc ;;
  }

  dimension: metrics_clicks {
    type: number
    sql: ${TABLE}.metrics_clicks ;;
  }

  dimension: metrics_conversions {
    type: number
    sql: ${TABLE}.metrics_conversions ;;
  }

  dimension: metrics_conversions_from_interactions_rate {
    type: number
    sql: ${TABLE}.metrics_conversions_from_interactions_rate ;;
  }

  dimension: metrics_conversions_value {
    type: number
    sql: ${TABLE}.metrics_conversions_value ;;
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

  dimension: metrics_cost_per_all_conversions {
    type: number
    sql: ${TABLE}.metrics_cost_per_all_conversions ;;
  }

  dimension: metrics_cost_per_conversion {
    type: number
    sql: ${TABLE}.metrics_cost_per_conversion ;;
  }

  dimension: metrics_cross_device_conversions {
    type: number
    sql: ${TABLE}.metrics_cross_device_conversions ;;
  }

  dimension: metrics_ctr {
    type: number
    sql: ${TABLE}.metrics_ctr ;;
  }

  dimension: metrics_impressions {
    type: number
    sql: ${TABLE}.metrics_impressions ;;
  }

  dimension: metrics_search_absolute_top_impression_share {
    type: number
    sql: ${TABLE}.metrics_search_absolute_top_impression_share ;;
  }

  dimension: metrics_search_click_share {
    type: number
    sql: ${TABLE}.metrics_search_click_share ;;
  }

  dimension: metrics_search_impression_share {
    type: number
    sql: ${TABLE}.metrics_search_impression_share ;;
  }

  dimension: metrics_value_per_all_conversions {
    type: number
    sql: ${TABLE}.metrics_value_per_all_conversions ;;
  }

  dimension: metrics_value_per_conversion {
    type: number
    sql: ${TABLE}.metrics_value_per_conversion ;;
  }

  dimension: segments_ad_network_type {
    type: string
    sql: ${TABLE}.segments_ad_network_type ;;
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

  dimension: segments_device {
    type: string
    sql: ${TABLE}.segments_device ;;
  }

  dimension_group: segments_month {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_month ;;
  }

  dimension: segments_product_aggregator_id {
    type: number
    sql: ${TABLE}.segments_product_aggregator_id ;;
  }

  dimension: segments_product_bidding_category_level1 {
    type: string
    sql: ${TABLE}.segments_product_bidding_category_level1 ;;
  }

  dimension: segments_product_bidding_category_level2 {
    type: string
    sql: ${TABLE}.segments_product_bidding_category_level2 ;;
  }

  dimension: segments_product_bidding_category_level3 {
    type: string
    sql: ${TABLE}.segments_product_bidding_category_level3 ;;
  }

  dimension: segments_product_bidding_category_level4 {
    type: string
    sql: ${TABLE}.segments_product_bidding_category_level4 ;;
  }

  dimension: segments_product_bidding_category_level5 {
    type: string
    sql: ${TABLE}.segments_product_bidding_category_level5 ;;
  }

  dimension: segments_product_brand {
    type: string
    sql: ${TABLE}.segments_product_brand ;;
  }

  dimension: segments_product_category_level1 {
    type: string
    sql: ${TABLE}.segments_product_category_level1 ;;
  }

  dimension: segments_product_category_level2 {
    type: string
    sql: ${TABLE}.segments_product_category_level2 ;;
  }

  dimension: segments_product_category_level3 {
    type: string
    sql: ${TABLE}.segments_product_category_level3 ;;
  }

  dimension: segments_product_category_level4 {
    type: string
    sql: ${TABLE}.segments_product_category_level4 ;;
  }

  dimension: segments_product_category_level5 {
    type: string
    sql: ${TABLE}.segments_product_category_level5 ;;
  }

  dimension: segments_product_channel {
    type: string
    sql: ${TABLE}.segments_product_channel ;;
  }

  dimension: segments_product_channel_exclusivity {
    type: string
    sql: ${TABLE}.segments_product_channel_exclusivity ;;
  }

  dimension: segments_product_condition {
    type: string
    sql: ${TABLE}.segments_product_condition ;;
  }

  dimension: segments_product_country {
    type: string
    sql: ${TABLE}.segments_product_country ;;
  }

  dimension: segments_product_custom_attribute0 {
    type: string
    sql: ${TABLE}.segments_product_custom_attribute0 ;;
  }

  dimension: segments_product_custom_attribute1 {
    type: string
    sql: ${TABLE}.segments_product_custom_attribute1 ;;
  }

  dimension: segments_product_custom_attribute2 {
    type: string
    sql: ${TABLE}.segments_product_custom_attribute2 ;;
  }

  dimension: segments_product_custom_attribute3 {
    type: string
    sql: ${TABLE}.segments_product_custom_attribute3 ;;
  }

  dimension: segments_product_custom_attribute4 {
    type: string
    sql: ${TABLE}.segments_product_custom_attribute4 ;;
  }

  dimension: segments_product_item_id {
    type: string
    sql: ${TABLE}.segments_product_item_id ;;
  }

  dimension: segments_product_language {
    type: string
    sql: ${TABLE}.segments_product_language ;;
  }

  dimension: segments_product_merchant_id {
    type: number
    sql: ${TABLE}.segments_product_merchant_id ;;
  }

  dimension: segments_product_type_l1 {
    type: string
    sql: ${TABLE}.segments_product_type_l1 ;;
  }

  dimension: segments_product_type_l2 {
    type: string
    sql: ${TABLE}.segments_product_type_l2 ;;
  }

  dimension: segments_product_type_l3 {
    type: string
    sql: ${TABLE}.segments_product_type_l3 ;;
  }

  dimension: segments_product_type_l4 {
    type: string
    sql: ${TABLE}.segments_product_type_l4 ;;
  }

  dimension: segments_product_type_l5 {
    type: string
    sql: ${TABLE}.segments_product_type_l5 ;;
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

  dimension: segments_year {
    type: number
    sql: ${TABLE}.segments_year ;;
  }
  measure: count {
    type: count
  }
}
