# The name of this view in Looker is "P Ads Click Stats 1962270511"
view: p_ads_click_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_ClickStats_1962270511` ;;

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

  dimension: ad_group_status {
    type: string
    description: "The status of the ad group."
    sql: ${TABLE}.ad_group_status ;;
  }

  dimension: campaign_id {
    type: number
    description: "The ID of the campaign."
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: click_view_ad_group_ad {
    type: string
    description: "The associated ad."
    sql: ${TABLE}.click_view_ad_group_ad ;;
  }

  dimension: click_view_area_of_interest_city {
    type: string
    description: "The city location criterion associated with the impression."
    sql: ${TABLE}.click_view_area_of_interest_city ;;
  }

  dimension: click_view_area_of_interest_country {
    type: string
    description: "The country location criterion associated with the impression."
    sql: ${TABLE}.click_view_area_of_interest_country ;;
  }

  dimension: click_view_area_of_interest_metro {
    type: string
    description: "The metro location criterion associated with the impression."
    sql: ${TABLE}.click_view_area_of_interest_metro ;;
  }

  dimension: click_view_area_of_interest_most_specific {
    type: string
    description: "The most specific location criterion associated with the impression."
    sql: ${TABLE}.click_view_area_of_interest_most_specific ;;
  }

  dimension: click_view_area_of_interest_region {
    type: string
    description: "The region location criterion associated with the impression."
    sql: ${TABLE}.click_view_area_of_interest_region ;;
  }

  dimension: click_view_gclid {
    type: string
    description: "The Google Click ID."
    sql: ${TABLE}.click_view_gclid ;;
  }

  dimension: click_view_keyword {
    type: string
    description: "The associated keyword, if one exists and the click corresponds to the SEARCH channel."
    sql: ${TABLE}.click_view_keyword ;;
  }

  dimension: click_view_keyword_info_match_type {
    type: string
    description: "The match type of the keyword."
    sql: ${TABLE}.click_view_keyword_info_match_type ;;
  }

  dimension: click_view_keyword_info_text {
    type: string
    description: "The text of the keyword (at most 80 characters and 10 words)."
    sql: ${TABLE}.click_view_keyword_info_text ;;
  }

  dimension: click_view_location_of_presence_city {
    type: string
    description: "The city location criterion associated with the impression."
    sql: ${TABLE}.click_view_location_of_presence_city ;;
  }

  dimension: click_view_location_of_presence_country {
    type: string
    description: "The country location criterion associated with the impression."
    sql: ${TABLE}.click_view_location_of_presence_country ;;
  }

  dimension: click_view_location_of_presence_metro {
    type: string
    description: "The metro location criterion associated with the impression."
    sql: ${TABLE}.click_view_location_of_presence_metro ;;
  }

  dimension: click_view_location_of_presence_most_specific {
    type: string
    description: "The most specific location criterion associated with the impression."
    sql: ${TABLE}.click_view_location_of_presence_most_specific ;;
  }

  dimension: click_view_location_of_presence_region {
    type: string
    description: "The region location criterion associated with the impression."
    sql: ${TABLE}.click_view_location_of_presence_region ;;
  }

  dimension: click_view_page_number {
    type: number
    description: "Page number in search results where the ad was shown."
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
    description: "Optional, non-unique descriptive name of the customer."
    sql: ${TABLE}.customer_descriptive_name ;;
  }

  dimension: customer_id {
    type: number
    description: "The ID of the customer."
    sql: ${TABLE}.customer_id ;;
  }

  dimension: metrics_clicks {
    type: number
    description: "The number of clicks."
    sql: ${TABLE}.metrics_clicks ;;
  }

  dimension: segments_ad_network_type {
    type: string
    description: "Ad network type."
    sql: ${TABLE}.segments_ad_network_type ;;
  }

  dimension: segments_click_type {
    type: string
    description: "Click type."
    sql: ${TABLE}.segments_click_type ;;
  }

  dimension_group: segments {
    type: time
    description: "Date to which metrics apply. yyyy-MM-dd format, e.g., 2018-04-17."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_date ;;
  }

  dimension: segments_device {
    type: string
    description: "Device to which metrics apply."
    sql: ${TABLE}.segments_device ;;
  }

  dimension: segments_slot {
    type: string
    description: "Position of the ad."
    sql: ${TABLE}.segments_slot ;;
  }
  measure: count {
    type: count
    drill_fields: [customer_descriptive_name]
  }
}
