# The name of this view in Looker is "P Ads Ad Group Label 1962270511"
view: p_ads_ad_group_label_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_AdGroupLabel_1962270511` ;;

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

  dimension: ad_group_label_ad_group {
    type: string
    description: "The ad group to which the label is attached."
    sql: ${TABLE}.ad_group_label_ad_group ;;
  }

  dimension: ad_group_label_label {
    type: string
    description: "The label assigned to the ad group."
    sql: ${TABLE}.ad_group_label_label ;;
  }

  dimension: ad_group_label_resource_name {
    type: string
    description: "The resource name of the ad group label. Ad group label resource names have the form: `customers/{customer_id}/adGroupLabels/{ad_group_id}~{label_id}`"
    sql: ${TABLE}.ad_group_label_resource_name ;;
  }

  dimension: ad_group_name {
    type: string
    description: "The name of the ad group. This field is required and should not be empty when creating new ad groups. It must contain fewer than 255 UTF-8 full-width characters. It must not contain any null (code point 0x0), NL line feed (code point 0xA) or carriage return (code point 0xD) characters."
    sql: ${TABLE}.ad_group_name ;;
  }

  dimension: label_id {
    type: number
    description: "Id of the label. Read only."
    sql: ${TABLE}.label_id ;;
  }

  dimension: label_name {
    type: string
    description: "The name of the label. This field is required and should not be empty when creating a new label. The length of this string should be between 1 and 80, inclusive."
    sql: ${TABLE}.label_name ;;
  }

  dimension: label_resource_name {
    type: string
    description: "Name of the resource. Label resource names have the form: `customers/{customer_id}/labels/{label_id}`"
    sql: ${TABLE}.label_resource_name ;;
  }
  measure: count {
    type: count
    drill_fields: [ad_group_name, label_resource_name, ad_group_label_resource_name, label_name]
  }
}
