# The name of this view in Looker is "Ads Paid Organic Stats 1962270511"
view: ads_paid_organic_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_PaidOrganicStats_1962270511` ;;

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
    # This dimension will be called "Ad Group ID" in Explore.

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: metrics_average_cpc {
    type: number
    sql: ${TABLE}.metrics_average_cpc ;;
  }

  dimension: metrics_clicks {
    type: number
    sql: ${TABLE}.metrics_clicks ;;
  }

  dimension: metrics_combined_clicks {
    type: number
    sql: ${TABLE}.metrics_combined_clicks ;;
  }

  dimension: metrics_combined_clicks_per_query {
    type: number
    sql: ${TABLE}.metrics_combined_clicks_per_query ;;
  }

  dimension: metrics_combined_queries {
    type: number
    sql: ${TABLE}.metrics_combined_queries ;;
  }

  dimension: metrics_ctr {
    type: number
    sql: ${TABLE}.metrics_ctr ;;
  }

  dimension: metrics_impressions {
    type: number
    sql: ${TABLE}.metrics_impressions ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_metrics_impressions {
    type: sum
    sql: ${metrics_impressions} ;;  }
  measure: average_metrics_impressions {
    type: average
    sql: ${metrics_impressions} ;;  }

  dimension: metrics_organic_clicks {
    type: number
    sql: ${TABLE}.metrics_organic_clicks ;;
  }

  dimension: metrics_organic_clicks_per_query {
    type: number
    sql: ${TABLE}.metrics_organic_clicks_per_query ;;
  }

  dimension: metrics_organic_impressions {
    type: number
    sql: ${TABLE}.metrics_organic_impressions ;;
  }

  dimension: metrics_organic_impressions_per_query {
    type: number
    sql: ${TABLE}.metrics_organic_impressions_per_query ;;
  }

  dimension: metrics_organic_queries {
    type: number
    sql: ${TABLE}.metrics_organic_queries ;;
  }

  dimension: paid_organic_search_term_view_search_term {
    type: string
    sql: ${TABLE}.paid_organic_search_term_view_search_term ;;
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

  dimension: segments_search_engine_results_page_type {
    type: string
    sql: ${TABLE}.segments_search_engine_results_page_type ;;
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
