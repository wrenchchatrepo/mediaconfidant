# The name of this view in Looker is "Ads Ad Group Ad Label 1962270511"
view: ads_ad_group_ad_label_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_AdGroupAdLabel_1962270511` ;;

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
    # This dimension will be called "Ad Group Ad Label Ad Group Ad" in Explore.

  dimension: ad_group_ad_label_ad_group_ad {
    type: string
    sql: ${TABLE}.ad_group_ad_label_ad_group_ad ;;
  }

  dimension: ad_group_ad_label_label {
    type: string
    sql: ${TABLE}.ad_group_ad_label_label ;;
  }

  dimension: ad_group_ad_label_resource_name {
    type: string
    sql: ${TABLE}.ad_group_ad_label_resource_name ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: ad_group_name {
    type: string
    sql: ${TABLE}.ad_group_name ;;
  }

  dimension: label_id {
    type: number
    sql: ${TABLE}.label_id ;;
  }

  dimension: label_name {
    type: string
    sql: ${TABLE}.label_name ;;
  }

  dimension: label_resource_name {
    type: string
    sql: ${TABLE}.label_resource_name ;;
  }
  measure: count {
    type: count
    drill_fields: [ad_group_name, ad_group_ad_label_resource_name, label_resource_name, label_name]
  }
}
