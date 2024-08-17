# The name of this view in Looker is "Ads Ad Group Bid Modifier 1962270511"
view: ads_ad_group_bid_modifier_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_AdGroupBidModifier_1962270511` ;;

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
    # This dimension will be called "Ad Group Bid Modifier Ad Group" in Explore.

  dimension: ad_group_bid_modifier_ad_group {
    type: string
    sql: ${TABLE}.ad_group_bid_modifier_ad_group ;;
  }

  dimension: ad_group_bid_modifier_base_ad_group {
    type: string
    sql: ${TABLE}.ad_group_bid_modifier_base_ad_group ;;
  }

  dimension: ad_group_bid_modifier_bid_modifier {
    type: number
    sql: ${TABLE}.ad_group_bid_modifier_bid_modifier ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_ad_group_bid_modifier_bid_modifier {
    type: sum
    sql: ${ad_group_bid_modifier_bid_modifier} ;;  }
  measure: average_ad_group_bid_modifier_bid_modifier {
    type: average
    sql: ${ad_group_bid_modifier_bid_modifier} ;;  }

  dimension: ad_group_bid_modifier_bid_modifier_source {
    type: string
    sql: ${TABLE}.ad_group_bid_modifier_bid_modifier_source ;;
  }

  dimension: ad_group_bid_modifier_criterion_id {
    type: number
    sql: ${TABLE}.ad_group_bid_modifier_criterion_id ;;
  }

  dimension: ad_group_bid_modifier_device_type {
    type: string
    sql: ${TABLE}.ad_group_bid_modifier_device_type ;;
  }

  dimension: ad_group_bid_modifier_resource_name {
    type: string
    sql: ${TABLE}.ad_group_bid_modifier_resource_name ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: ad_group_name {
    type: string
    sql: ${TABLE}.ad_group_name ;;
  }
  measure: count {
    type: count
    drill_fields: [ad_group_bid_modifier_resource_name, ad_group_name]
  }
}
