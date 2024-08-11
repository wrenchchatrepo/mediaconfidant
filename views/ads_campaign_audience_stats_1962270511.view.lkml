# The name of this view in Looker is "Ads Campaign Audience Stats 1962270511"
view: ads_campaign_audience_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_CampaignAudienceStats_1962270511` ;;

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

  dimension: campaign_criterion_criterion_id {
    type: string
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

  dimension: metrics_active_view_cpm {
    type: number
    sql: ${TABLE}.metrics_active_view_cpm ;;
  }

  dimension: metrics_active_view_ctr {
    type: number
    sql: ${TABLE}.metrics_active_view_ctr ;;
  }

  dimension: metrics_active_view_impressions {
    type: number
    sql: ${TABLE}.metrics_active_view_impressions ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_metrics_active_view_impressions {
    type: sum
    sql: ${metrics_active_view_impressions} ;;  }
  measure: average_metrics_active_view_impressions {
    type: average
    sql: ${metrics_active_view_impressions} ;;  }

  dimension: metrics_active_view_measurability {
    type: number
    sql: ${TABLE}.metrics_active_view_measurability ;;
  }

  dimension: metrics_active_view_measurable_cost_micros {
    type: number
    sql: ${TABLE}.metrics_active_view_measurable_cost_micros ;;
  }

  dimension: metrics_active_view_measurable_impressions {
    type: number
    sql: ${TABLE}.metrics_active_view_measurable_impressions ;;
  }

  dimension: metrics_active_view_viewability {
    type: number
    sql: ${TABLE}.metrics_active_view_viewability ;;
  }

  dimension: metrics_all_conversions_from_interactions_rate {
    type: number
    sql: ${TABLE}.metrics_all_conversions_from_interactions_rate ;;
  }

  dimension: metrics_average_cost {
    type: number
    sql: ${TABLE}.metrics_average_cost ;;
  }

  dimension: metrics_average_cpc {
    type: number
    sql: ${TABLE}.metrics_average_cpc ;;
  }

  dimension: metrics_average_cpm {
    type: number
    sql: ${TABLE}.metrics_average_cpm ;;
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

  dimension: metrics_ctr {
    type: number
    sql: ${TABLE}.metrics_ctr ;;
  }

  dimension: metrics_gmail_forwards {
    type: number
    sql: ${TABLE}.metrics_gmail_forwards ;;
  }

  dimension: metrics_gmail_saves {
    type: number
    sql: ${TABLE}.metrics_gmail_saves ;;
  }

  dimension: metrics_gmail_secondary_clicks {
    type: number
    sql: ${TABLE}.metrics_gmail_secondary_clicks ;;
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

  dimension: metrics_value_per_conversion {
    type: number
    sql: ${TABLE}.metrics_value_per_conversion ;;
  }

  dimension: segments_ad_network_type {
    type: string
    sql: ${TABLE}.segments_ad_network_type ;;
  }

  dimension: segments_click_type {
    type: string
    sql: ${TABLE}.segments_click_type ;;
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

  dimension: segments_year {
    type: number
    sql: ${TABLE}.segments_year ;;
  }
  measure: count {
    type: count
  }
}
