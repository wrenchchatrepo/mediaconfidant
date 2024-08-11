# The name of this view in Looker is "P Ads Asset Group Asset 1962270511"
view: p_ads_asset_group_asset_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_AssetGroupAsset_1962270511` ;;

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
    # This dimension will be called "Asset Group Asset Asset" in Explore.

  dimension: asset_group_asset_asset {
    type: string
    description: "The asset which this asset group asset is linking."
    sql: ${TABLE}.asset_group_asset_asset ;;
  }

  dimension: asset_group_asset_asset_group {
    type: string
    description: "The asset group which this asset group asset is linking."
    sql: ${TABLE}.asset_group_asset_asset_group ;;
  }

  dimension: asset_group_asset_field_type {
    type: string
    description: "The description of the placement of the asset within the asset group. For example: HEADLINE, YOUTUBE_VIDEO etc."
    sql: ${TABLE}.asset_group_asset_field_type ;;
  }

  dimension: asset_group_asset_performance_label {
    type: string
    description: "The performance of this asset group asset."
    sql: ${TABLE}.asset_group_asset_performance_label ;;
  }

  dimension: asset_group_asset_policy_summary_approval_status {
    type: string
    description: "The overall approval status, which is calculated based on the status of its individual policy topic entries."
    sql: ${TABLE}.asset_group_asset_policy_summary_approval_status ;;
  }

  dimension: asset_group_asset_policy_summary_policy_topic_entries {
    type: string
    description: "The list of policy findings."
    sql: ${TABLE}.asset_group_asset_policy_summary_policy_topic_entries ;;
  }

  dimension: asset_group_asset_policy_summary_review_status {
    type: string
    description: "Where in the review process the resource is."
    sql: ${TABLE}.asset_group_asset_policy_summary_review_status ;;
  }
  measure: count {
    type: count
  }
}
