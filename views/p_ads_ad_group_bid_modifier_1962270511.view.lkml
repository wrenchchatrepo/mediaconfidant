# The name of this view in Looker is "P Ads Ad Group Bid Modifier 1962270511"
view: p_ads_ad_group_bid_modifier_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_AdGroupBidModifier_1962270511` ;;

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
    # This dimension will be called "Ad Group Bid Modifier Ad Group" in Explore.

  dimension: ad_group_bid_modifier_ad_group {
    type: string
    description: "The ad group to which this criterion belongs."
    sql: ${TABLE}.ad_group_bid_modifier_ad_group ;;
  }

  dimension: ad_group_bid_modifier_base_ad_group {
    type: string
    description: "The base ad group from which this draft/trial adgroup bid modifier was created. If ad_group is a base ad group then this field will be equal to ad_group. If the ad group was created in the draft or trial and has no corresponding base ad group, then this field will be null. This field is readonly."
    sql: ${TABLE}.ad_group_bid_modifier_base_ad_group ;;
  }

  dimension: ad_group_bid_modifier_bid_modifier {
    type: number
    description: "The modifier for the bid when the criterion matches. The modifier must be in the range: 0.1 - 10.0. The range is 1.0 - 6.0 for PreferredContent. Use 0 to opt out of a Device type."
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
    description: "Bid modifier source."
    sql: ${TABLE}.ad_group_bid_modifier_bid_modifier_source ;;
  }

  dimension: ad_group_bid_modifier_criterion_id {
    type: number
    description: "The ID of the criterion to bid modify. This field is ignored for mutates."
    sql: ${TABLE}.ad_group_bid_modifier_criterion_id ;;
  }

  dimension: ad_group_bid_modifier_device_type {
    type: string
    description: "Type of the device."
    sql: ${TABLE}.ad_group_bid_modifier_device_type ;;
  }

  dimension: ad_group_bid_modifier_resource_name {
    type: string
    description: "The resource name of the ad group bid modifier. Ad group bid modifier resource names have the form: `customers/{customer_id}/adGroupBidModifiers/{ad_group_id}~{criterion_id}`"
    sql: ${TABLE}.ad_group_bid_modifier_resource_name ;;
  }

  dimension: ad_group_id {
    type: number
    description: "The ID of the ad group."
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: ad_group_name {
    type: string
    description: "The name of the ad group. This field is required and should not be empty when creating new ad groups. It must contain fewer than 255 UTF-8 full-width characters. It must not contain any null (code point 0x0), NL line feed (code point 0xA) or carriage return (code point 0xD) characters."
    sql: ${TABLE}.ad_group_name ;;
  }
  measure: count {
    type: count
    drill_fields: [ad_group_bid_modifier_resource_name, ad_group_name]
  }
}
