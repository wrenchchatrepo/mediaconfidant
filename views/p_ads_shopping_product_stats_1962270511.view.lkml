# The name of this view in Looker is "P Ads Shopping Product Stats 1962270511"
view: p_ads_shopping_product_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_ShoppingProductStats_1962270511` ;;

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
    # This dimension will be called "Campaign ID" in Explore.

  dimension: campaign_id {
    type: number
    description: "The ID of the campaign."
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_status {
    type: string
    description: "The status of the campaign. When a new campaign is added, the status defaults to ENABLED."
    sql: ${TABLE}.campaign_status ;;
  }

  dimension: customer_id {
    type: number
    description: "The ID of the customer."
    sql: ${TABLE}.customer_id ;;
  }

  dimension: metrics_all_conversions {
    type: number
    description: "The total number of conversions. This only includes conversion actions which include_in_conversions_metric attribute is set to true."
    sql: ${TABLE}.metrics_all_conversions ;;
  }

  dimension: metrics_all_conversions_from_interactions_rate {
    type: number
    description: "All conversions from interactions (as oppose to view through conversions) divided by the number of ad interactions."
    sql: ${TABLE}.metrics_all_conversions_from_interactions_rate ;;
  }

  dimension: metrics_all_conversions_value {
    type: number
    description: "The total value of all conversions."
    sql: ${TABLE}.metrics_all_conversions_value ;;
  }

  dimension: metrics_average_cpc {
    type: number
    description: "The total cost of all clicks divided by the total number of clicks received."
    sql: ${TABLE}.metrics_average_cpc ;;
  }

  dimension: metrics_clicks {
    type: number
    description: "The number of clicks."
    sql: ${TABLE}.metrics_clicks ;;
  }

  dimension: metrics_conversions {
    type: number
    description: "The number of conversions. This only includes conversion actions which include_in_conversions_metric attribute is set to true."
    sql: ${TABLE}.metrics_conversions ;;
  }

  dimension: metrics_conversions_from_interactions_rate {
    type: number
    description: "Conversions from interactions divided by the number of ad interactions (such as clicks for text ads or views for video ads). This only includes conversion actions which include_in_conversions_metric attribute is set to true."
    sql: ${TABLE}.metrics_conversions_from_interactions_rate ;;
  }

  dimension: metrics_conversions_value {
    type: number
    description: "The total value of conversions. This only includes conversion actions which include_in_conversions_metric attribute is set to true."
    sql: ${TABLE}.metrics_conversions_value ;;
  }

  dimension: metrics_cost_micros {
    type: number
    description: "The sum of your cost-per-click (CPC) and cost-per-thousand impressions (CPM) costs during this period."
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
    description: "The cost of ad interactions divided by all conversions."
    sql: ${TABLE}.metrics_cost_per_all_conversions ;;
  }

  dimension: metrics_cost_per_conversion {
    type: number
    description: "The cost of ad interactions divided by conversions. This only includes conversion actions which include_in_conversions_metric attribute is set to true."
    sql: ${TABLE}.metrics_cost_per_conversion ;;
  }

  dimension: metrics_cross_device_conversions {
    type: number
    description: "Conversions from when a customer clicks on a Google Ads ad on one device, then converts on a different device or browser. Cross-device conversions are already included in all_conversions."
    sql: ${TABLE}.metrics_cross_device_conversions ;;
  }

  dimension: metrics_ctr {
    type: number
    description: "The number of clicks your ad receives (Clicks) divided by the number of times your ad is shown (Impressions)."
    sql: ${TABLE}.metrics_ctr ;;
  }

  dimension: metrics_impressions {
    type: number
    description: "Count of how often your ad has appeared on a search results page or website on the Google Network."
    sql: ${TABLE}.metrics_impressions ;;
  }

  dimension: metrics_search_absolute_top_impression_share {
    type: number
    description: "The percentage of the customer's Shopping or Search ad impressions that are shown in the most prominent Shopping position. See https://support.google.com/google-ads/answer/7501826 for details. Any value below 0.1 is reported as 0.0999."
    sql: ${TABLE}.metrics_search_absolute_top_impression_share ;;
  }

  dimension: metrics_search_click_share {
    type: number
    description: "The number of clicks you've received on the Search Network divided by the estimated number of clicks you were eligible to receive. Note: Search click share is reported in the range of 0.1 to 1. Any value below 0.1 is reported as 0.0999."
    sql: ${TABLE}.metrics_search_click_share ;;
  }

  dimension: metrics_search_impression_share {
    type: number
    description: "The impressions you've received on the Search Network divided by the estimated number of impressions you were eligible to receive. Note: Search impression share is reported in the range of 0.1 to 1. Any value below 0.1 is reported as 0.0999."
    sql: ${TABLE}.metrics_search_impression_share ;;
  }

  dimension: metrics_value_per_all_conversions {
    type: number
    description: "The value of all conversions divided by the number of all conversions."
    sql: ${TABLE}.metrics_value_per_all_conversions ;;
  }

  dimension: metrics_value_per_conversion {
    type: number
    description: "The value of conversions divided by the number of conversions. This only includes conversion actions which include_in_conversions_metric attribute is set to true."
    sql: ${TABLE}.metrics_value_per_conversion ;;
  }

  dimension: segments_ad_network_type {
    type: string
    description: "Ad network type."
    sql: ${TABLE}.segments_ad_network_type ;;
  }

  dimension_group: segments {
    type: time
    description: "Date to which metrics apply. yyyy-MM-dd format, e.g., 2018-04-17."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_date ;;
  }

  dimension: segments_day_of_week {
    type: string
    description: "Day of the week, e.g., MONDAY."
    sql: ${TABLE}.segments_day_of_week ;;
  }

  dimension: segments_device {
    type: string
    description: "Device to which metrics apply."
    sql: ${TABLE}.segments_device ;;
  }

  dimension_group: segments_month {
    type: time
    description: "Month as represented by the date of the first day of a month. Formatted as yyyy-MM-dd."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_month ;;
  }

  dimension: segments_product_aggregator_id {
    type: number
    description: "Aggregator ID of the product."
    sql: ${TABLE}.segments_product_aggregator_id ;;
  }

  dimension: segments_product_bidding_category_level1 {
    type: string
    description: "Bidding category (level 1) of the product."
    sql: ${TABLE}.segments_product_bidding_category_level1 ;;
  }

  dimension: segments_product_bidding_category_level2 {
    type: string
    description: "Bidding category (level 2) of the product."
    sql: ${TABLE}.segments_product_bidding_category_level2 ;;
  }

  dimension: segments_product_bidding_category_level3 {
    type: string
    description: "Bidding category (level 3) of the product."
    sql: ${TABLE}.segments_product_bidding_category_level3 ;;
  }

  dimension: segments_product_bidding_category_level4 {
    type: string
    description: "Bidding category (level 4) of the product."
    sql: ${TABLE}.segments_product_bidding_category_level4 ;;
  }

  dimension: segments_product_bidding_category_level5 {
    type: string
    description: "Bidding category (level 5) of the product."
    sql: ${TABLE}.segments_product_bidding_category_level5 ;;
  }

  dimension: segments_product_brand {
    type: string
    description: "Brand of the product."
    sql: ${TABLE}.segments_product_brand ;;
  }

  dimension: segments_product_category_level1 {
    type: string
    description: "Category (level 1) of the product."
    sql: ${TABLE}.segments_product_category_level1 ;;
  }

  dimension: segments_product_category_level2 {
    type: string
    description: "Category (level 2) of the product."
    sql: ${TABLE}.segments_product_category_level2 ;;
  }

  dimension: segments_product_category_level3 {
    type: string
    description: "Category (level 3) of the product."
    sql: ${TABLE}.segments_product_category_level3 ;;
  }

  dimension: segments_product_category_level4 {
    type: string
    description: "Category (level 4) of the product."
    sql: ${TABLE}.segments_product_category_level4 ;;
  }

  dimension: segments_product_category_level5 {
    type: string
    description: "Category (level 5) of the product."
    sql: ${TABLE}.segments_product_category_level5 ;;
  }

  dimension: segments_product_channel {
    type: string
    description: "Channel of the product."
    sql: ${TABLE}.segments_product_channel ;;
  }

  dimension: segments_product_channel_exclusivity {
    type: string
    description: "Channel exclusivity of the product."
    sql: ${TABLE}.segments_product_channel_exclusivity ;;
  }

  dimension: segments_product_condition {
    type: string
    description: "Condition of the product."
    sql: ${TABLE}.segments_product_condition ;;
  }

  dimension: segments_product_country {
    type: string
    description: "Resource name of the geo target constant for the country of sale of the product."
    sql: ${TABLE}.segments_product_country ;;
  }

  dimension: segments_product_custom_attribute0 {
    type: string
    description: "Custom attribute 0 of the product."
    sql: ${TABLE}.segments_product_custom_attribute0 ;;
  }

  dimension: segments_product_custom_attribute1 {
    type: string
    description: "Custom attribute 1 of the product."
    sql: ${TABLE}.segments_product_custom_attribute1 ;;
  }

  dimension: segments_product_custom_attribute2 {
    type: string
    description: "Custom attribute 2 of the product."
    sql: ${TABLE}.segments_product_custom_attribute2 ;;
  }

  dimension: segments_product_custom_attribute3 {
    type: string
    description: "Custom attribute 3 of the product."
    sql: ${TABLE}.segments_product_custom_attribute3 ;;
  }

  dimension: segments_product_custom_attribute4 {
    type: string
    description: "Custom attribute 4 of the product."
    sql: ${TABLE}.segments_product_custom_attribute4 ;;
  }

  dimension: segments_product_item_id {
    type: string
    description: "Item ID of the product."
    sql: ${TABLE}.segments_product_item_id ;;
  }

  dimension: segments_product_language {
    type: string
    description: "Resource name of the language constant for the language of the product."
    sql: ${TABLE}.segments_product_language ;;
  }

  dimension: segments_product_merchant_id {
    type: number
    description: "Merchant ID of the product."
    sql: ${TABLE}.segments_product_merchant_id ;;
  }

  dimension: segments_product_type_l1 {
    type: string
    description: "Type (level 1) of the product."
    sql: ${TABLE}.segments_product_type_l1 ;;
  }

  dimension: segments_product_type_l2 {
    type: string
    description: "Type (level 2) of the product."
    sql: ${TABLE}.segments_product_type_l2 ;;
  }

  dimension: segments_product_type_l3 {
    type: string
    description: "Type (level 3) of the product."
    sql: ${TABLE}.segments_product_type_l3 ;;
  }

  dimension: segments_product_type_l4 {
    type: string
    description: "Type (level 4) of the product."
    sql: ${TABLE}.segments_product_type_l4 ;;
  }

  dimension: segments_product_type_l5 {
    type: string
    description: "Type (level 5) of the product."
    sql: ${TABLE}.segments_product_type_l5 ;;
  }

  dimension_group: segments_quarter {
    type: time
    description: "Quarter as represented by the date of the first day of a quarter. Uses the calendar year for quarters, e.g., the second quarter of 2018 starts on 2018-04-01. Formatted as yyyy-MM-dd."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_quarter ;;
  }

  dimension_group: segments_week {
    type: time
    description: "Week as defined as Monday through Sunday, and represented by the date of Monday. Formatted as yyyy-MM-dd."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_week ;;
  }

  # dimension: segments_year {
  #   type: number
  #   description: "Year, formatted as yyyy."
  #   sql: ${TABLE}.segments_year ;;
  # }
  measure: count {
    type: count
  }
}
