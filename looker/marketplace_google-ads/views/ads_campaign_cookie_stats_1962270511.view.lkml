# The name of this view in Looker is "Ads Campaign Cookie Stats 1962270511"
view: ads_campaign_cookie_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_CampaignCookieStats_1962270511` ;;

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

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_metrics_absolute_top_impression_percentage {
    type: sum
    sql: ${metrics_absolute_top_impression_percentage} ;;  }
  measure: average_metrics_absolute_top_impression_percentage {
    type: average
    sql: ${metrics_absolute_top_impression_percentage} ;;  }

  dimension: metrics_search_budget_lost_absolute_top_impression_share {
    type: number
    sql: ${TABLE}.metrics_search_budget_lost_absolute_top_impression_share ;;
  }

  dimension: metrics_search_budget_lost_top_impression_share {
    type: number
    sql: ${TABLE}.metrics_search_budget_lost_top_impression_share ;;
  }

  dimension: metrics_search_rank_lost_absolute_top_impression_share {
    type: number
    sql: ${TABLE}.metrics_search_rank_lost_absolute_top_impression_share ;;
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

  dimension_group: segments_month {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_month ;;
  }

  dimension_group: segments_week {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_week ;;
  }
  measure: count {
    type: count
  }
}
