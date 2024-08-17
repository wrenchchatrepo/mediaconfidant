# The name of this view in Looker is "Ads Asset Group Listing Group Filter 1962270511"
view: ads_asset_group_listing_group_filter_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_AssetGroupListingGroupFilter_1962270511` ;;

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
    # This dimension will be called "Asset Group Listing Group Filter Asset Group" in Explore.

  dimension: asset_group_listing_group_filter_asset_group {
    type: string
    sql: ${TABLE}.asset_group_listing_group_filter_asset_group ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_bidding_category_id {
    type: string
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_bidding_category_id ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_bidding_category_level {
    type: string
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_bidding_category_level ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_brand_value {
    type: string
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_brand_value ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_category_category_id {
    type: string
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_category_category_id ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_category_level {
    type: string
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_category_level ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_channel_channel {
    type: string
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_channel_channel ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_condition_condition {
    type: string
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_condition_condition ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_custom_attribute_index {
    type: string
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_custom_attribute_index ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_custom_attribute_value {
    type: string
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_custom_attribute_value ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_item_id_value {
    type: string
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_item_id_value ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_type_level {
    type: string
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_type_level ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_type_value {
    type: string
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_type_value ;;
  }

  dimension: asset_group_listing_group_filter_id {
    type: string
    sql: ${TABLE}.asset_group_listing_group_filter_id ;;
  }

  dimension: asset_group_listing_group_filter_listing_source {
    type: string
    sql: ${TABLE}.asset_group_listing_group_filter_listing_source ;;
  }

  dimension: asset_group_listing_group_filter_parent_listing_group_filter {
    type: string
    sql: ${TABLE}.asset_group_listing_group_filter_parent_listing_group_filter ;;
  }

  dimension: asset_group_listing_group_filter_type {
    type: string
    sql: ${TABLE}.asset_group_listing_group_filter_type ;;
  }

  dimension: asset_group_listing_group_filter_vertical {
    type: string
    sql: ${TABLE}.asset_group_listing_group_filter_vertical ;;
  }
  measure: count {
    type: count
  }
}
