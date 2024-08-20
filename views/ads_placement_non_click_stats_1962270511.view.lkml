# The name of this view in Looker is "Ads Placement Non Click Stats 1962270511"
view: ads_placement_non_click_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_PlacementNonClickStats_1962270511` ;;

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
    # This dimension will be called "Ad Group Base Ad Group" in Explore.

  dimension: ad_group_base_ad_group {
    type: string
    sql: ${TABLE}.ad_group_base_ad_group ;;
  }

  dimension: ad_group_criterion_criterion_id {
    type: number
    sql: ${TABLE}.ad_group_criterion_criterion_id ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.ad_group_id ;;
  }

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

  dimension: metrics_average_cpe {
    type: number
    sql: ${TABLE}.metrics_average_cpe ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_metrics_average_cpe {
    type: sum
    sql: ${metrics_average_cpe} ;;  }
  measure: average_metrics_average_cpe {
    type: average
    sql: ${metrics_average_cpe} ;;  }

  dimension: metrics_average_cpv {
    type: number
    sql: ${TABLE}.metrics_average_cpv ;;
  }

  dimension: metrics_engagement_rate {
    type: number
    sql: ${TABLE}.metrics_engagement_rate ;;
  }

  dimension: metrics_engagements {
    type: number
    sql: ${TABLE}.metrics_engagements ;;
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
