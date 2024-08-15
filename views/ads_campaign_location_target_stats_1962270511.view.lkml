# The name of this view in Looker is "Ads Campaign Location Target Stats 1962270511"
view: ads_campaign_location_target_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_CampaignLocationTargetStats_1962270511` ;;

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
    # This dimension will be called "Campaign Criterion Criterion ID" in Explore.

  dimension: campaign_criterion_criterion_id {
    type: number
    sql: ${TABLE}.campaign_criterion_criterion_id ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
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

  dimension: metrics_average_cost {
    type: number
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
    sql: ${TABLE}.metrics_average_cpc ;;
  }

  dimension: metrics_average_cpe {
    type: number
    sql: ${TABLE}.metrics_average_cpe ;;
  }

  dimension: metrics_average_cpm {
    type: number
    sql: ${TABLE}.metrics_average_cpm ;;
  }

  dimension: metrics_average_cpv {
    type: number
    sql: ${TABLE}.metrics_average_cpv ;;
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

  dimension: metrics_engagement_rate {
    type: number
    sql: ${TABLE}.metrics_engagement_rate ;;
  }

  dimension: metrics_engagements {
    type: number
    sql: ${TABLE}.metrics_engagements ;;
  }

  dimension: metrics_impressions {
    type: number
    sql: ${TABLE}.metrics_impressions ;;
  }

  dimension: metrics_interaction_event_types {
    type: string
    sql: ${TABLE}.metrics_interaction_event_types ;;
  }

  dimension: metrics_interaction_rate {
    type: number
    sql: ${TABLE}.metrics_interaction_rate ;;
  }

  dimension: metrics_interactions {
    type: number
    sql: ${TABLE}.metrics_interactions ;;
  }

  dimension: metrics_value_per_all_conversions {
    type: number
    sql: ${TABLE}.metrics_value_per_all_conversions ;;
  }

  dimension: metrics_value_per_conversion {
    type: number
    sql: ${TABLE}.metrics_value_per_conversion ;;
  }

  dimension: metrics_video_view_rate {
    type: number
    sql: ${TABLE}.metrics_video_view_rate ;;
  }

  dimension: metrics_video_views {
    type: number
    sql: ${TABLE}.metrics_video_views ;;
  }

  dimension: metrics_view_through_conversions {
    type: number
    sql: ${TABLE}.metrics_view_through_conversions ;;
  }

  dimension_group: segments {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_date ;;
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
  }
}
