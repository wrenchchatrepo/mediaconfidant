# The name of this view in Looker is "P Ads Campaign Label 1962270511"
view: p_ads_campaign_label_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_CampaignLabel_1962270511` ;;

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
    # This dimension will be called "Campaign ID" in Explore.

  dimension: campaign_id {
    type: number
    description: "The ID of the campaign."
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_label_campaign {
    type: string
    description: "The campaign to which the label is attached."
    sql: ${TABLE}.campaign_label_campaign ;;
  }

  dimension: campaign_label_label {
    type: string
    description: "The label assigned to the campaign."
    sql: ${TABLE}.campaign_label_label ;;
  }

  dimension: campaign_label_resource_name {
    type: string
    description: "Name of the resource. Campaign label resource names have the form: `customers/{customer_id}/campaignLabels/{campaign_id}~{label_id}`"
    sql: ${TABLE}.campaign_label_resource_name ;;
  }

  dimension: campaign_name {
    type: string
    description: "The name of the campaign. This field is required and should not be empty when creating new campaigns. It must not contain any null (code point 0x0), NL line feed (code point 0xA) or carriage return (code point 0xD) characters."
    sql: ${TABLE}.campaign_name ;;
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
    drill_fields: [campaign_name, campaign_label_resource_name, label_resource_name, label_name]
  }
}
