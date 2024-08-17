# The name of this view in Looker is "Ads Asset Group Asset 1962270511"
view: ads_asset_group_asset_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_AssetGroupAsset_1962270511` ;;

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
    # This dimension will be called "Asset Group Asset Asset" in Explore.

  dimension: asset_group_asset_asset {
    type: string
    sql: ${TABLE}.asset_group_asset_asset ;;
  }

  dimension: asset_group_asset_asset_group {
    type: string
    sql: ${TABLE}.asset_group_asset_asset_group ;;
  }

  dimension: asset_group_asset_field_type {
    type: string
    sql: ${TABLE}.asset_group_asset_field_type ;;
  }

  dimension: asset_group_asset_performance_label {
    type: string
    sql: ${TABLE}.asset_group_asset_performance_label ;;
  }

  dimension: asset_group_asset_policy_summary_approval_status {
    type: string
    sql: ${TABLE}.asset_group_asset_policy_summary_approval_status ;;
  }

  dimension: asset_group_asset_policy_summary_policy_topic_entries {
    type: string
    sql: ${TABLE}.asset_group_asset_policy_summary_policy_topic_entries ;;
  }

  dimension: asset_group_asset_policy_summary_review_status {
    type: string
    sql: ${TABLE}.asset_group_asset_policy_summary_review_status ;;
  }
  measure: count {
    type: count
  }
}
