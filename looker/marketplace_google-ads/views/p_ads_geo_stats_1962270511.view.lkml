# The name of this view in Looker is "P Ads Geo Stats 1962270511"
view: p_ads_geo_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_GeoStats_1962270511` ;;

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

  dimension: geographic_view_country_criterion_id {
    type: number
    description: "Criterion Id for the country."
    sql: ${TABLE}.geographic_view_country_criterion_id ;;
  }

  dimension: geographic_view_location_type {
    type: string
    description: "Type of the geo targeting of the campaign."
    sql: ${TABLE}.geographic_view_location_type ;;
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

  dimension: metrics_average_cost {
    type: number
    description: "The average amount you pay per interaction. This amount is the total cost of your ads divided by the total number of interactions."
    sql: ${TABLE}.metrics_average_cost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_metrics_average_cost {
    type: sum
    sql: ${metrics_average_cost} ;;  }
  measure: average_metrics_average_cost {
    type: average
    sql: ${metrics_average_cost} ;;  }

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

  dimension: metrics_average_cpv {
    type: number
    description: "The average amount you pay each time someone views your ad. The average CPV is defined by the total cost of all ad views divided by the number of views."
    sql: ${TABLE}.metrics_average_cpv ;;
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

  dimension: metrics_interaction_event_types {
    type: string
    description: "The types of payable and free interactions."
    sql: ${TABLE}.metrics_interaction_event_types ;;
  }

  dimension: metrics_interaction_rate {
    type: number
    description: "How often people interact with your ad after it is shown to them. This is the number of interactions divided by the number of times your ad is shown."
    sql: ${TABLE}.metrics_interaction_rate ;;
  }

  dimension: metrics_interactions {
    type: number
    description: "The number of interactions. An interaction is the main user action associated with an ad format-clicks for text and shopping ads, views for video ads, and so on."
    sql: ${TABLE}.metrics_interactions ;;
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

  dimension: metrics_video_view_rate {
    type: number
    description: "The number of views your TrueView video ad receives divided by its number of impressions, including thumbnail impressions for TrueView in-display ads."
    sql: ${TABLE}.metrics_video_view_rate ;;
  }

  dimension: metrics_video_views {
    type: number
    description: "The number of times your video ads were viewed."
    sql: ${TABLE}.metrics_video_views ;;
  }

  dimension: metrics_view_through_conversions {
    type: number
    description: "The total number of view-through conversions. These happen when a customer sees an image or rich media ad, then later completes a conversion on your site without interacting with (e.g., clicking on) another ad."
    sql: ${TABLE}.metrics_view_through_conversions ;;
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

  dimension: segments_geo_target_most_specific_location {
    type: string
    description: "Resource name of the geo target constant that represents the most specific location."
    sql: ${TABLE}.segments_geo_target_most_specific_location ;;
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
  }
}
