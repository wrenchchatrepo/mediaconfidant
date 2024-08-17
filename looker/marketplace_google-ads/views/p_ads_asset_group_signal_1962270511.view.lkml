# The name of this view in Looker is "P Ads Asset Group Signal 1962270511"
view: p_ads_asset_group_signal_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_AssetGroupSignal_1962270511` ;;

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
    # This dimension will be called "Asset Group Signal Asset Group" in Explore.

  dimension: asset_group_signal_asset_group {
    type: string
    description: "The asset group which this asset group signal belongs to."
    sql: ${TABLE}.asset_group_signal_asset_group ;;
  }

  dimension: asset_group_signal_audience_audience {
    type: string
    description: "The Audience resource name."
    sql: ${TABLE}.asset_group_signal_audience_audience ;;
  }

  dimension: asset_group_signal_resource_name {
    type: string
    description: "The resource name of the asset group signal. Asset group signal resource name have the form: customers/{customer_id}/assetGroupSignals/{asset_group_id}~{signal_id}"
    sql: ${TABLE}.asset_group_signal_resource_name ;;
  }
  measure: count {
    type: count
    drill_fields: [asset_group_signal_resource_name]
  }
}
