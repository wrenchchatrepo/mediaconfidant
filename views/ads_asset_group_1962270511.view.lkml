# The name of this view in Looker is "Ads Asset Group 1962270511"
view: ads_asset_group_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_AssetGroup_1962270511` ;;

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
    # This dimension will be called "Asset Group Campaign" in Explore.

  dimension: asset_group_campaign {
    type: string
    sql: ${TABLE}.asset_group_campaign ;;
  }

  dimension: asset_group_final_mobile_urls {
    type: string
    sql: ${TABLE}.asset_group_final_mobile_urls ;;
  }

  dimension: asset_group_final_urls {
    type: string
    sql: ${TABLE}.asset_group_final_urls ;;
  }

  dimension: asset_group_id {
    type: string
    sql: ${TABLE}.asset_group_id ;;
  }

  dimension: asset_group_name {
    type: string
    sql: ${TABLE}.asset_group_name ;;
  }

  dimension: asset_group_status {
    type: string
    sql: ${TABLE}.asset_group_status ;;
  }
  measure: count {
    type: count
    drill_fields: [asset_group_name]
  }
}
