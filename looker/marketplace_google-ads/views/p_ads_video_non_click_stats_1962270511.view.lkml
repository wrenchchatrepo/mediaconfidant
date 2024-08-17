# The name of this view in Looker is "P Ads Video Non Click Stats 1962270511"
view: p_ads_video_non_click_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_VideoNonClickStats_1962270511` ;;

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
    # This dimension will be called "Ad Group Ad Ad ID" in Explore.

  dimension: ad_group_ad_ad_id {
    type: number
    description: "The ID of the ad."
    sql: ${TABLE}.ad_group_ad_ad_id ;;
  }

  dimension: ad_group_ad_status {
    type: string
    description: "The status of the ad."
    sql: ${TABLE}.ad_group_ad_status ;;
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

  dimension: metrics_average_cpv {
    type: number
    description: "The average amount you pay each time someone views your ad. The average CPV is defined by the total cost of all ad views divided by the number of views."
    sql: ${TABLE}.metrics_average_cpv ;;
  }

  dimension: metrics_cost_per_all_conversions {
    type: number
    description: "The cost of ad interactions divided by all conversions."
    sql: ${TABLE}.metrics_cost_per_all_conversions ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_metrics_cost_per_all_conversions {
    type: sum
    sql: ${metrics_cost_per_all_conversions} ;;  }
  measure: average_metrics_cost_per_all_conversions {
    type: average
    sql: ${metrics_cost_per_all_conversions} ;;  }

  dimension: metrics_cross_device_conversions {
    type: number
    description: "Conversions from when a customer clicks on a Google Ads ad on one device, then converts on a different device or browser. Cross-device conversions are already included in all_conversions."
    sql: ${TABLE}.metrics_cross_device_conversions ;;
  }

  dimension: metrics_engagement_rate {
    type: number
    description: "How often people engage with your ad after it's shown to them. This is the number of ad expansions divided by the number of times your ad is shown."
    sql: ${TABLE}.metrics_engagement_rate ;;
  }

  dimension: metrics_engagements {
    type: number
    description: "The number of engagements. An engagement occurs when a viewer expands your Lightbox ad. Also, in the future, other ad types may support engagement metrics."
    sql: ${TABLE}.metrics_engagements ;;
  }

  dimension: metrics_value_per_all_conversions {
    type: number
    description: "The value of all conversions divided by the number of all conversions."
    sql: ${TABLE}.metrics_value_per_all_conversions ;;
  }

  dimension: metrics_video_quartile_p100_rate {
    type: number
    description: "Percentage of impressions where the viewer watched all of your video."
    sql: ${TABLE}.metrics_video_quartile_p100_rate ;;
  }

  dimension: metrics_video_quartile_p25_rate {
    type: number
    description: "Percentage of impressions where the viewer watched 25% of your video."
    sql: ${TABLE}.metrics_video_quartile_p25_rate ;;
  }

  dimension: metrics_video_quartile_p50_rate {
    type: number
    description: "Percentage of impressions where the viewer watched 50% of your video."
    sql: ${TABLE}.metrics_video_quartile_p50_rate ;;
  }

  dimension: metrics_video_quartile_p75_rate {
    type: number
    description: "Percentage of impressions where the viewer watched 75% of your video."
    sql: ${TABLE}.metrics_video_quartile_p75_rate ;;
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

  dimension: segments_year {
    type: number
    description: "Year, formatted as yyyy."
    sql: ${TABLE}.segments_year ;;
  }

  dimension: video_channel_id {
    type: string
    description: "The owner channel id of the video."
    sql: ${TABLE}.video_channel_id ;;
  }

  dimension: video_id {
    type: string
    description: "The ID of the video."
    sql: ${TABLE}.video_id ;;
  }
  measure: count {
    type: count
  }
}
