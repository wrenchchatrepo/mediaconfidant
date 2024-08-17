# The name of this view in Looker is "P Ads Campaign Criterion 1962270511"
view: p_ads_campaign_criterion_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_CampaignCriterion_1962270511` ;;

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
    # This dimension will be called "Campaign Criterion Bid Modifier" in Explore.

  dimension: campaign_criterion_bid_modifier {
    type: number
    description: "The modifier for the bids when the criterion matches. The modifier must be in the range: 0.1 - 10.0. Most targetable criteria types support modifiers. Use 0 to opt out of a Device type."
    sql: ${TABLE}.campaign_criterion_bid_modifier ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_campaign_criterion_bid_modifier {
    type: sum
    sql: ${campaign_criterion_bid_modifier} ;;  }
  measure: average_campaign_criterion_bid_modifier {
    type: average
    sql: ${campaign_criterion_bid_modifier} ;;  }

  dimension: campaign_criterion_campaign {
    type: string
    description: "The campaign to which the criterion belongs."
    sql: ${TABLE}.campaign_criterion_campaign ;;
  }

  dimension: campaign_criterion_criterion_id {
    type: number
    description: "The ID of the criterion. This field is ignored during mutate."
    sql: ${TABLE}.campaign_criterion_criterion_id ;;
  }

  dimension: campaign_criterion_device_type {
    type: string
    description: "Type of the device."
    sql: ${TABLE}.campaign_criterion_device_type ;;
  }

  dimension: campaign_criterion_display_name {
    type: string
    description: "The display name of the criterion. This field is ignored for mutates."
    sql: ${TABLE}.campaign_criterion_display_name ;;
  }

  dimension: campaign_criterion_negative {
    type: yesno
    description: "Whether to target (`false`) or exclude (`true`) the criterion."
    sql: ${TABLE}.campaign_criterion_negative ;;
  }

  dimension: campaign_criterion_status {
    type: string
    description: "The status of the criterion."
    sql: ${TABLE}.campaign_criterion_status ;;
  }

  dimension: campaign_criterion_type {
    type: string
    description: "The type of the criterion."
    sql: ${TABLE}.campaign_criterion_type ;;
  }

  dimension: campaign_id {
    type: number
    description: "The ID of the campaign."
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    description: "The name of the campaign. This field is required and should not be empty when creating new campaigns. It must not contain any null (code point 0x0), NL line feed (code point 0xA) or carriage return (code point 0xD) characters."
    sql: ${TABLE}.campaign_name ;;
  }
  measure: count {
    type: count
    drill_fields: [campaign_name, campaign_criterion_display_name]
  }
}
