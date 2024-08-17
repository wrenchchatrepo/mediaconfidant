# The name of this view in Looker is "Ads Click Stats 1962270511"
view: ads_click_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_ClickStats_1962270511` ;;

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

  dimension: ad_group_status {
    type: string
    sql: ${TABLE}.ad_group_status ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: click_view_ad_group_ad {
    type: string
    sql: ${TABLE}.click_view_ad_group_ad ;;
  }

  dimension: click_view_area_of_interest_city {
    type: string
    sql: ${TABLE}.click_view_area_of_interest_city ;;
  }

  dimension: click_view_area_of_interest_country {
    type: string
    sql: ${TABLE}.click_view_area_of_interest_country ;;
  }

  dimension: click_view_area_of_interest_metro {
    type: string
    sql: ${TABLE}.click_view_area_of_interest_metro ;;
  }

  dimension: click_view_area_of_interest_most_specific {
    type: string
    sql: ${TABLE}.click_view_area_of_interest_most_specific ;;
  }

  dimension: click_view_area_of_interest_region {
    type: string
    sql: ${TABLE}.click_view_area_of_interest_region ;;
  }

  dimension: click_view_gclid {
    type: string
    sql: ${TABLE}.click_view_gclid ;;
  }

  dimension: click_view_keyword {
    type: string
    sql: ${TABLE}.click_view_keyword ;;
  }

  dimension: click_view_keyword_info_match_type {
    type: string
    sql: ${TABLE}.click_view_keyword_info_match_type ;;
  }

  dimension: click_view_keyword_info_text {
    type: string
    sql: ${TABLE}.click_view_keyword_info_text ;;
  }

  dimension: click_view_location_of_presence_city {
    type: string
    sql: ${TABLE}.click_view_location_of_presence_city ;;
  }

  dimension: click_view_location_of_presence_country {
    type: string
    sql: ${TABLE}.click_view_location_of_presence_country ;;
  }

  dimension: click_view_location_of_presence_metro {
    type: string
    sql: ${TABLE}.click_view_location_of_presence_metro ;;
  }

  dimension: click_view_location_of_presence_most_specific {
    type: string
    sql: ${TABLE}.click_view_location_of_presence_most_specific ;;
  }

  dimension: click_view_location_of_presence_region {
    type: string
    sql: ${TABLE}.click_view_location_of_presence_region ;;
  }

  dimension: click_view_page_number {
    type: number
    sql: ${TABLE}.click_view_page_number ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_click_view_page_number {
    type: sum
    sql: ${click_view_page_number} ;;  }
  measure: average_click_view_page_number {
    type: average
    sql: ${click_view_page_number} ;;  }

  dimension: customer_descriptive_name {
    type: string
    sql: ${TABLE}.customer_descriptive_name ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: metrics_clicks {
    type: number
    sql: ${TABLE}.metrics_clicks ;;
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

  dimension: segments_device {
    type: string
    sql: ${TABLE}.segments_device ;;
  }

  dimension: segments_slot {
    type: string
    sql: ${TABLE}.segments_slot ;;
  }
  measure: count {
    type: count
    drill_fields: [customer_descriptive_name]
  }
}
