# The name of this view in Looker is "Ads Video 1962270511"
view: ads_video_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_Video_1962270511` ;;

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
    # This dimension will be called "Ad Group Ad Status" in Explore.

  dimension: ad_group_ad_status {
    type: string
    sql: ${TABLE}.ad_group_ad_status ;;
  }

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

  dimension: video_duration_millis {
    type: number
    sql: ${TABLE}.video_duration_millis ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_video_duration_millis {
    type: sum
    sql: ${video_duration_millis} ;;  }
  measure: average_video_duration_millis {
    type: average
    sql: ${video_duration_millis} ;;  }

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id ;;
  }

  dimension: video_title {
    type: string
    sql: ${TABLE}.video_title ;;
  }
  measure: count {
    type: count
  }
}
