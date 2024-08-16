# The name of this view in Looker is "P Ads Product Group Stats 1962270511"
view: p_ads_product_group_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_ProductGroupStats_1962270511` ;;

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
    # This dimension will be called "Ad Group Criterion Cpc Bid Micros" in Explore.

  dimension: ad_group_criterion_cpc_bid_micros {
    type: number
    description: "The CPC (cost-per-click) bid."
    sql: ${TABLE}.ad_group_criterion_cpc_bid_micros ;;
  }

  dimension: ad_group_criterion_criterion_id {
    type: number
    description: "The ID of the criterion. This field is ignored for mutates."
    sql: ${TABLE}.ad_group_criterion_criterion_id ;;
  }

  dimension: ad_group_criterion_display_name {
    type: string
    description: "The display name of the criterion. This field is ignored for mutates."
    sql: ${TABLE}.ad_group_criterion_display_name ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_bidding_category_id {
    type: string
    description: "ID of the product bidding category. This ID is equivalent to the google_product_category ID as described in this article: https://support.google.com/merchants/answer/6324436"
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_bidding_category_id ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_bidding_category_level {
    type: string
    description: "Level of the product bidding category."
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_bidding_category_level ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_brand_value {
    type: string
    description: "String value of the product brand."
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_brand_value ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_category_category_id {
    type: string
    description: "ID of the product category. This ID is equivalent to the google_product_category ID as described in this article: https://support.google.com/merchants/answer/6324436"
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_category_category_id ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_category_level {
    type: string
    description: "Level of the product category."
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_category_level ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_channel_channel {
    type: string
    description: "Value of the locality."
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_channel_channel ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_channel_exclusivity_channel_exclusivity {
    type: string
    description: "Value of the availability."
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_channel_exclusivity_channel_exclusivity ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_condition_condition {
    type: string
    description: "Value of the condition."
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_condition_condition ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_custom_attribute_index {
    type: string
    description: "Indicates the index of the custom attribute."
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_custom_attribute_index ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_custom_attribute_value {
    type: string
    description: "String value of the product custom attribute."
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_custom_attribute_value ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_item_id_value {
    type: string
    description: "Value of the id."
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_item_id_value ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_type_level {
    type: string
    description: "Level of the type."
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_type_level ;;
  }

  dimension: ad_group_criterion_listing_group_case_value_product_type_value {
    type: string
    description: "Value of the type."
    sql: ${TABLE}.ad_group_criterion_listing_group_case_value_product_type_value ;;
  }

  dimension: ad_group_criterion_status {
    type: string
    description: "The status of the criterion."
    sql: ${TABLE}.ad_group_criterion_status ;;
  }

  dimension: ad_group_id {
    type: number
    description: "The ID of the ad group."
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: campaign_id {
    type: number
    description: "The ID of the campaign."
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: metrics_average_cpc {
    type: number
    description: "The total cost of all clicks divided by the total number of clicks received."
    sql: ${TABLE}.metrics_average_cpc ;;
  }

  dimension: metrics_average_cpm {
    type: number
    description: "Average cost-per-thousand impressions (CPM)."
    sql: ${TABLE}.metrics_average_cpm ;;
  }

  dimension: metrics_clicks {
    type: number
    description: "The number of clicks."
    sql: ${TABLE}.metrics_clicks ;;
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

  dimension: product_group_view_resource_name {
    type: string
    description: "The resource name of the product group view. Product group view resource names have the form: customers/{customer_id}/productGroupViews/{ad_group_id}~{criterion_id}"
    sql: ${TABLE}.product_group_view_resource_name ;;
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

  dimension_group: segments_month {
    type: time
    description: "Month as represented by the date of the first day of a month. Formatted as yyyy-MM-dd."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_month ;;
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

#  dimension: segments_year {
#   type: number
#    sql: ${TABLE}.segments_year ;;
#  }  measure: count {
    type: count
    drill_fields: [ad_group_criterion_display_name, product_group_view_resource_name]
  }
}
