# The name of this view in Looker is "Ads Campaign Cross Device Stats 1962270511"
view: ads_campaign_cross_device_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_CampaignCrossDeviceStats_1962270511` ;;

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
    # This dimension will be called "Campaign Base Campaign" in Explore.

  dimension: campaign_base_campaign {
    type: string
    sql: ${TABLE}.campaign_base_campaign ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: metrics_absolute_top_impression_percentage {
    type: number
    sql: ${TABLE}.metrics_absolute_top_impression_percentage ;;
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

  dimension: metrics_average_cpe {
    type: number
    sql: ${TABLE}.metrics_average_cpe ;;
  }

  dimension: metrics_average_cpv {
    type: number
    sql: ${TABLE}.metrics_average_cpv ;;
  }

  dimension: metrics_average_page_views {
    type: number
    sql: ${TABLE}.metrics_average_page_views ;;
  }

  dimension: metrics_average_time_on_site {
    type: number
    sql: ${TABLE}.metrics_average_time_on_site ;;
  }

  dimension: metrics_bounce_rate {
    type: number
    sql: ${TABLE}.metrics_bounce_rate ;;
  }

  dimension: metrics_content_budget_lost_impression_share {
    type: number
    sql: ${TABLE}.metrics_content_budget_lost_impression_share ;;
  }

  dimension: metrics_content_impression_share {
    type: number
    sql: ${TABLE}.metrics_content_impression_share ;;
  }

  dimension: metrics_content_rank_lost_impression_share {
    type: number
    sql: ${TABLE}.metrics_content_rank_lost_impression_share ;;
  }

  dimension: metrics_cost_per_all_conversions {
    type: number
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
    sql: ${TABLE}.metrics_cross_device_conversions ;;
  }

  dimension: metrics_engagement_rate {
    type: number
    sql: ${TABLE}.metrics_engagement_rate ;;
  }

  dimension: metrics_engagements {
    type: number
    sql: ${TABLE}.metrics_engagements ;;
  }

  dimension: metrics_invalid_click_rate {
    type: number
    sql: ${TABLE}.metrics_invalid_click_rate ;;
  }

  dimension: metrics_invalid_clicks {
    type: number
    sql: ${TABLE}.metrics_invalid_clicks ;;
  }

  dimension: metrics_percent_new_visitors {
    type: number
    sql: ${TABLE}.metrics_percent_new_visitors ;;
  }

  dimension: metrics_phone_calls {
    type: number
    sql: ${TABLE}.metrics_phone_calls ;;
  }

  dimension: metrics_phone_impressions {
    type: number
    sql: ${TABLE}.metrics_phone_impressions ;;
  }

  dimension: metrics_phone_through_rate {
    type: number
    sql: ${TABLE}.metrics_phone_through_rate ;;
  }

  dimension: metrics_relative_ctr {
    type: number
    sql: ${TABLE}.metrics_relative_ctr ;;
  }

  dimension: metrics_search_absolute_top_impression_share {
    type: number
    sql: ${TABLE}.metrics_search_absolute_top_impression_share ;;
  }

  dimension: metrics_search_budget_lost_absolute_top_impression_share {
    type: number
    sql: ${TABLE}.metrics_search_budget_lost_absolute_top_impression_share ;;
  }

  dimension: metrics_search_budget_lost_impression_share {
    type: number
    sql: ${TABLE}.metrics_search_budget_lost_impression_share ;;
  }

  dimension: metrics_search_budget_lost_top_impression_share {
    type: number
    sql: ${TABLE}.metrics_search_budget_lost_top_impression_share ;;
  }

  dimension: metrics_search_click_share {
    type: number
    sql: ${TABLE}.metrics_search_click_share ;;
  }

  dimension: metrics_search_exact_match_impression_share {
    type: number
    sql: ${TABLE}.metrics_search_exact_match_impression_share ;;
  }

  dimension: metrics_search_impression_share {
    type: number
    sql: ${TABLE}.metrics_search_impression_share ;;
  }

  dimension: metrics_search_rank_lost_absolute_top_impression_share {
    type: number
    sql: ${TABLE}.metrics_search_rank_lost_absolute_top_impression_share ;;
  }

  dimension: metrics_search_rank_lost_impression_share {
    type: number
    sql: ${TABLE}.metrics_search_rank_lost_impression_share ;;
  }

  dimension: metrics_search_rank_lost_top_impression_share {
    type: number
    sql: ${TABLE}.metrics_search_rank_lost_top_impression_share ;;
  }

  dimension: metrics_search_top_impression_share {
    type: number
    sql: ${TABLE}.metrics_search_top_impression_share ;;
  }

  dimension: metrics_top_impression_percentage {
    type: number
    sql: ${TABLE}.metrics_top_impression_percentage ;;
  }

  dimension: metrics_value_per_all_conversions {
    type: number
    sql: ${TABLE}.metrics_value_per_all_conversions ;;
  }

  dimension: metrics_video_quartile_p100_rate {
    type: number
    sql: ${TABLE}.metrics_video_quartile_p100_rate ;;
  }

  dimension: metrics_video_quartile_p25_rate {
    type: number
    sql: ${TABLE}.metrics_video_quartile_p25_rate ;;
  }

  dimension: metrics_video_quartile_p50_rate {
    type: number
    sql: ${TABLE}.metrics_video_quartile_p50_rate ;;
  }

  dimension: metrics_video_quartile_p75_rate {
    type: number
    sql: ${TABLE}.metrics_video_quartile_p75_rate ;;
  }

  dimension: metrics_video_view_rate {
    type: number
    sql: ${TABLE}.metrics_video_view_rate ;;
  }

  dimension: metrics_video_views {
    type: number
    sql: ${TABLE}.metrics_video_views ;;
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

  dimension: segments_year {
    type: number
    sql: ${TABLE}.segments_year ;;
  }
  measure: count {
    type: count
  }
}
