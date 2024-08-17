# The name of this view in Looker is "P Ads Account Non Click Stats 1962270511"
view: p_ads_account_non_click_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_AccountNonClickStats_1962270511` ;;

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
    # This dimension will be called "Customer ID" in Explore.

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

  dimension: metrics_average_cpe {
    type: number
    description: "The average amount that you've been charged for an ad engagement. This amount is the total cost of all ad engagements divided by the total number of ad engagements."
    sql: ${TABLE}.metrics_average_cpe ;;
  }

  dimension: metrics_average_cpv {
    type: number
    description: "The average amount you pay each time someone views your ad. The average CPV is defined by the total cost of all ad views divided by the number of views."
    sql: ${TABLE}.metrics_average_cpv ;;
  }

  dimension: metrics_content_budget_lost_impression_share {
    type: number
    description: "The estimated percent of times that your ad was eligible to show on the Display Network but didn't because your budget was too low. Note: Content budget lost impression share is reported in the range of 0 to 0.9. Any value above 0.9 is reported as 0.9001."
    sql: ${TABLE}.metrics_content_budget_lost_impression_share ;;
  }

  dimension: metrics_content_impression_share {
    type: number
    description: "The impressions you've received on the Display Network divided by the estimated number of impressions you were eligible to receive. Note: Content impression share is reported in the range of 0.1 to 1. Any value below 0.1 is reported as 0.0999."
    sql: ${TABLE}.metrics_content_impression_share ;;
  }

  dimension: metrics_content_rank_lost_impression_share {
    type: number
    description: "The estimated percentage of impressions on the Display Network that your ads didn't receive due to poor Ad Rank. Note: Content rank lost impression share is reported in the range of 0 to 0.9. Any value above 0.9 is reported as 0.9001."
    sql: ${TABLE}.metrics_content_rank_lost_impression_share ;;
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

  dimension: metrics_invalid_click_rate {
    type: number
    description: "The percentage of clicks filtered out of your total number of clicks (filtered + non-filtered clicks) during the reporting period."
    sql: ${TABLE}.metrics_invalid_click_rate ;;
  }

  dimension: metrics_invalid_clicks {
    type: number
    description: "Number of clicks Google considers illegitimate and doesn't charge you for."
    sql: ${TABLE}.metrics_invalid_clicks ;;
  }

  dimension: metrics_search_budget_lost_impression_share {
    type: number
    description: "The estimated percent of times that your ad was eligible to show on the Search Network but didn't because your budget was too low. Note: Search budget lost impression share is reported in the range of 0 to 0.9. Any value above 0.9 is reported as 0.9001."
    sql: ${TABLE}.metrics_search_budget_lost_impression_share ;;
  }

  dimension: metrics_search_exact_match_impression_share {
    type: number
    description: "The impressions you've received divided by the estimated number of impressions you were eligible to receive on the Search Network for search terms that matched your keywords exactly (or were close variants of your keyword), regardless of your keyword match types. Note: Search exact match impression share is reported in the range of 0.1 to 1. Any value below 0.1 is reported as 0.0999."
    sql: ${TABLE}.metrics_search_exact_match_impression_share ;;
  }

  dimension: metrics_search_impression_share {
    type: number
    description: "The impressions you've received on the Search Network divided by the estimated number of impressions you were eligible to receive. Note: Search impression share is reported in the range of 0.1 to 1. Any value below 0.1 is reported as 0.0999."
    sql: ${TABLE}.metrics_search_impression_share ;;
  }

  dimension: metrics_search_rank_lost_impression_share {
    type: number
    description: "The estimated percentage of impressions on the Search Network that your ads didn't receive due to poor Ad Rank. Note: Search rank lost impression share is reported in the range of 0 to 0.9. Any value above 0.9 is reported as 0.9001."
    sql: ${TABLE}.metrics_search_rank_lost_impression_share ;;
  }

  dimension: metrics_value_per_all_conversions {
    type: number
    description: "The value of all conversions divided by the number of all conversions."
    sql: ${TABLE}.metrics_value_per_all_conversions ;;
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
  measure: count {
    type: count
  }
}
