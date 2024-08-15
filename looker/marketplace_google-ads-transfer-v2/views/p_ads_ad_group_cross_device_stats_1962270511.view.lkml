# The name of this view in Looker is "P Ads Ad Group Cross Device Stats 1962270511"
view: p_ads_ad_group_cross_device_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_AdGroupCrossDeviceStats_1962270511` ;;

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
    # This dimension will be called "Ad Group Base Ad Group" in Explore.

  dimension: ad_group_base_ad_group {
    type: string
    description: "For draft or experiment ad groups, this field is the resource name of the base ad group from which this ad group was created. If a draft or experiment ad group does not have a base ad group, then this field is null. For base ad groups, this field equals the ad group resource name. This field is read-only."
    sql: ${TABLE}.ad_group_base_ad_group ;;
  }

  dimension: ad_group_id {
    type: number
    description: "The ID of the ad group."
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: campaign_base_campaign {
    type: string
    description: "The resource name of the base campaign of a draft or experiment campaign. For base campaigns, this is equal to `resource_name`. This field is read-only."
    sql: ${TABLE}.campaign_base_campaign ;;
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

  dimension: metrics_absolute_top_impression_percentage {
    type: number
    description: "The percent of your ad impressions that are shown as the very first ad above the organic search results."
    sql: ${TABLE}.metrics_absolute_top_impression_percentage ;;
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

  dimension: metrics_average_page_views {
    type: number
    description: "Average number of pages viewed per session."
    sql: ${TABLE}.metrics_average_page_views ;;
  }

  dimension: metrics_average_time_on_site {
    type: number
    description: "Total duration of all sessions (in seconds) / number of sessions. Imported from Google Analytics."
    sql: ${TABLE}.metrics_average_time_on_site ;;
  }

  dimension: metrics_bounce_rate {
    type: number
    description: "Percentage of clicks where the user only visited a single page on your site. Imported from Google Analytics."
    sql: ${TABLE}.metrics_bounce_rate ;;
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

  dimension: metrics_percent_new_visitors {
    type: number
    description: "Percentage of first-time sessions (from people who had never visited your site before). Imported from Google Analytics."
    sql: ${TABLE}.metrics_percent_new_visitors ;;
  }

  dimension: metrics_phone_calls {
    type: number
    description: "Number of offline phone calls."
    sql: ${TABLE}.metrics_phone_calls ;;
  }

  dimension: metrics_phone_impressions {
    type: number
    description: "Number of offline phone impressions."
    sql: ${TABLE}.metrics_phone_impressions ;;
  }

  dimension: metrics_phone_through_rate {
    type: number
    description: "Number of phone calls received (phone_calls) divided by the number of times your phone number is shown (phone_impressions)."
    sql: ${TABLE}.metrics_phone_through_rate ;;
  }

  dimension: metrics_relative_ctr {
    type: number
    description: "Your clickthrough rate (Ctr) divided by the average clickthrough rate of all advertisers on the websites that show your ads. Measures how your ads perform on Display Network sites compared to other ads on the same sites."
    sql: ${TABLE}.metrics_relative_ctr ;;
  }

  dimension: metrics_search_absolute_top_impression_share {
    type: number
    description: "The percentage of the customer's Shopping or Search ad impressions that are shown in the most prominent Shopping position. See https://support.google.com/google-ads/answer/7501826 for details. Any value below 0.1 is reported as 0.0999."
    sql: ${TABLE}.metrics_search_absolute_top_impression_share ;;
  }

  dimension: metrics_search_budget_lost_absolute_top_impression_share {
    type: number
    description: "The number estimating how often your ad wasn't the very first ad above the organic search results due to a low budget. Note: Search budget lost absolute top impression share is reported in the range of 0 to 0.9. Any value above 0.9 is reported as 0.9001."
    sql: ${TABLE}.metrics_search_budget_lost_absolute_top_impression_share ;;
  }

  dimension: metrics_search_budget_lost_top_impression_share {
    type: number
    description: "The number estimating how often your ad didn't show anywhere above the organic search results due to a low budget. Note: Search budget lost top impression share is reported in the range of 0 to 0.9. Any value above 0.9 is reported as 0.9001."
    sql: ${TABLE}.metrics_search_budget_lost_top_impression_share ;;
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

  dimension: metrics_search_rank_lost_absolute_top_impression_share {
    type: number
    description: "The number estimating how often your ad wasn't the very first ad above the organic search results due to poor Ad Rank. Note: Search rank lost absolute top impression share is reported in the range of 0 to 0.9. Any value above 0.9 is reported as 0.9001."
    sql: ${TABLE}.metrics_search_rank_lost_absolute_top_impression_share ;;
  }

  dimension: metrics_search_rank_lost_impression_share {
    type: number
    description: "The estimated percentage of impressions on the Search Network that your ads didn't receive due to poor Ad Rank. Note: Search rank lost impression share is reported in the range of 0 to 0.9. Any value above 0.9 is reported as 0.9001."
    sql: ${TABLE}.metrics_search_rank_lost_impression_share ;;
  }

  dimension: metrics_search_rank_lost_top_impression_share {
    type: number
    description: "The number estimating how often your ad didn't show anywhere above the organic search results due to poor Ad Rank. Note: Search rank lost top impression share is reported in the range of 0 to 0.9. Any value above 0.9 is reported as 0.9001."
    sql: ${TABLE}.metrics_search_rank_lost_top_impression_share ;;
  }

  dimension: metrics_search_top_impression_share {
    type: number
    description: "The impressions you've received in the top location (anywhere above the organic search results) compared to the estimated number of impressions you were eligible to receive in the top location. Note: Search top impression share is reported in the range of 0.1 to 1. Any value below 0.1 is reported as 0.0999."
    sql: ${TABLE}.metrics_search_top_impression_share ;;
  }

  dimension: metrics_top_impression_percentage {
    type: number
    description: "The percent of your ad impressions that are shown anywhere above the organic search results."
    sql: ${TABLE}.metrics_top_impression_percentage ;;
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
