# The name of this view in Looker is "P Ads Asset 1962270511"
view: p_ads_asset_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_Asset_1962270511` ;;

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
    # This dimension will be called "Asset Final Urls" in Explore.

  dimension: asset_final_urls {
    type: string
    description: "Output only. Type of the asset."
    sql: ${TABLE}.asset_final_urls ;;
  }

  dimension: asset_name {
    type: string
    description: "Optional name of the asset."
    sql: ${TABLE}.asset_name ;;
  }

  dimension: asset_source {
    type: string
    description: "Output only. Source of the asset."
    sql: ${TABLE}.asset_source ;;
  }

  dimension: asset_type {
    type: string
    description: "A list of possible final URLs after all cross domain redirects."
    sql: ${TABLE}.asset_type ;;
  }

  dimension: segments_conversion_action {
    type: string
    description: "Resource name of the conversion action."
    sql: ${TABLE}.segments_conversion_action ;;
  }
  measure: count {
    type: count
    drill_fields: [asset_name]
  }
}
