# The name of this view in Looker is "P Ads Paid Organic Stats 1962270511"
view: p_ads_paid_organic_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_PaidOrganicStats_1962270511` ;;

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
    # This dimension will be called "Ad Group ID" in Explore.

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

  dimension: metrics_average_cpc {
    type: number
    description: "The total cost of all clicks divided by the total number of clicks received."
    sql: ${TABLE}.metrics_average_cpc ;;
  }

  dimension: metrics_clicks {
    type: number
    description: "The number of clicks."
    sql: ${TABLE}.metrics_clicks ;;
  }

  dimension: metrics_combined_clicks {
    type: number
    description: "The number of times your ad or your site's listing in the unpaid results was clicked. See the help page at https://support.google.com/google-ads/answer/3097241 for details."
    sql: ${TABLE}.metrics_combined_clicks ;;
  }

  dimension: metrics_combined_clicks_per_query {
    type: number
    description: "The number of times your ad or your site's listing in the unpaid results was clicked (combined_clicks) divided by combined_queries. See the help page at https://support.google.com/google-ads/answer/3097241 for details."
    sql: ${TABLE}.metrics_combined_clicks_per_query ;;
  }

  dimension: metrics_combined_queries {
    type: number
    description: "The number of searches that returned pages from your site in the unpaid results or showed one of your text ads. See the help page at https://support.google.com/google-ads/answer/3097241 for details."
    sql: ${TABLE}.metrics_combined_queries ;;
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
    description: "The number of times someone clicked your site's listing in the unpaid results for a particular query. See the help page at https://support.google.com/google-ads/answer/3097241 for details."
    sql: ${TABLE}.metrics_organic_clicks ;;
  }

  dimension: metrics_organic_clicks_per_query {
    type: number
    description: "The number of times someone clicked your site's listing in the unpaid results (organic_clicks) divided by the total number of searches that returned pages from your site (organic_queries). See the help page at https://support.google.com/google-ads/answer/3097241 for details."
    sql: ${TABLE}.metrics_organic_clicks_per_query ;;
  }

  dimension: metrics_organic_impressions {
    type: number
    description: "The number of listings for your site in the unpaid search results. See the help page at https://support.google.com/google-ads/answer/3097241 for details."
    sql: ${TABLE}.metrics_organic_impressions ;;
  }

  dimension: metrics_organic_impressions_per_query {
    type: number
    description: "The number of times a page from your site was listed in the unpaid search results (organic_impressions) divided by the number of searches returning your site's listing in the unpaid results (organic_queries). See the help page at https://support.google.com/google-ads/answer/3097241 for details."
    sql: ${TABLE}.metrics_organic_impressions_per_query ;;
  }

  dimension: metrics_organic_queries {
    type: number
    description: "The total number of searches that returned your site's listing in the unpaid results. See the help page at https://support.google.com/google-ads/answer/3097241 for details."
    sql: ${TABLE}.metrics_organic_queries ;;
  }

  dimension: paid_organic_search_term_view_search_term {
    type: string
    description: "The search term."
    sql: ${TABLE}.paid_organic_search_term_view_search_term ;;
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

  dimension: segments_search_engine_results_page_type {
    type: string
    description: "Type of the search engine results page."
    sql: ${TABLE}.segments_search_engine_results_page_type ;;
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
