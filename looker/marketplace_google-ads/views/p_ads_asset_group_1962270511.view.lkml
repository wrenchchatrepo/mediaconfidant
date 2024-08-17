# The name of this view in Looker is "P Ads Asset Group 1962270511"
view: p_ads_asset_group_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_AssetGroup_1962270511` ;;

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
    # This dimension will be called "Asset Group Campaign" in Explore.

  dimension: asset_group_campaign {
    type: string
    description: "Immutable. The campaign with which this asset group is associated. The asset which is linked to the asset group."
    sql: ${TABLE}.asset_group_campaign ;;
  }

  dimension: asset_group_final_mobile_urls {
    type: string
    description: "A list of final mobile URLs after all cross domain redirects. In performance max, by default, the urls are eligible for expansion unless opted out."
    sql: ${TABLE}.asset_group_final_mobile_urls ;;
  }

  dimension: asset_group_final_urls {
    type: string
    description: "A list of final URLs after all cross domain redirects. In performance max, by default, the urls are eligible for expansion unless opted out."
    sql: ${TABLE}.asset_group_final_urls ;;
  }

  dimension: asset_group_id {
    type: string
    description: "Output only. The ID of the asset group."
    sql: ${TABLE}.asset_group_id ;;
  }

  dimension: asset_group_name {
    type: string
    description: "Required. Name of the asset group. Required. It must have a minimum length of 1 and maximum length of 128. It must be unique under a campaign."
    sql: ${TABLE}.asset_group_name ;;
  }

  dimension: asset_group_status {
    type: string
    description: "The status of the asset group."
    sql: ${TABLE}.asset_group_status ;;
  }
  measure: count {
    type: count
    drill_fields: [asset_group_name]
  }
}
