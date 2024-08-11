# The name of this view in Looker is "P Ads Asset Group Listing Group Filter 1962270511"
view: p_ads_asset_group_listing_group_filter_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_AssetGroupListingGroupFilter_1962270511` ;;

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
    # This dimension will be called "Asset Group Listing Group Filter Asset Group" in Explore.

  dimension: asset_group_listing_group_filter_asset_group {
    type: string
    description: "The asset group which this asset group listing group filter is part of."
    sql: ${TABLE}.asset_group_listing_group_filter_asset_group ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_bidding_category_id {
    type: string
    description: "ID of the product bidding category. This ID is equivalent to the google_product_category ID as described in this article: https://support.google.com/merchants/answer/6324436"
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_bidding_category_id ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_bidding_category_level {
    type: string
    description: "Indicates the level of the category in the taxonomy."
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_bidding_category_level ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_brand_value {
    type: string
    description: "String value of the product brand."
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_brand_value ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_category_category_id {
    type: string
    description: "ID of the product category. This ID is equivalent to the google_product_category ID as described in this article: https://support.google.com/merchants/answer/6324436"
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_category_category_id ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_category_level {
    type: string
    description: "Indicates the level of the category in the taxonomy."
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_category_level ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_channel_channel {
    type: string
    description: "Value of the locality."
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_channel_channel ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_condition_condition {
    type: string
    description: "Value of the condition."
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_condition_condition ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_custom_attribute_index {
    type: string
    description: "Indicates the index of the custom attribute."
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_custom_attribute_index ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_custom_attribute_value {
    type: string
    description: "String value of the product custom attribute."
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_custom_attribute_value ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_item_id_value {
    type: string
    description: "Value of the id."
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_item_id_value ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_type_level {
    type: string
    description: "Level of the type."
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_type_level ;;
  }

  dimension: asset_group_listing_group_filter_case_value_product_type_value {
    type: string
    description: "Value of the type."
    sql: ${TABLE}.asset_group_listing_group_filter_case_value_product_type_value ;;
  }

  dimension: asset_group_listing_group_filter_id {
    type: string
    description: "The ID of the ListingGroupFilter."
    sql: ${TABLE}.asset_group_listing_group_filter_id ;;
  }

  dimension: asset_group_listing_group_filter_listing_source {
    type: string
    description: "The source of listings filtered by this listing group filter."
    sql: ${TABLE}.asset_group_listing_group_filter_listing_source ;;
  }

  dimension: asset_group_listing_group_filter_parent_listing_group_filter {
    type: string
    description: "Resource name of the parent listing group subdivision. Null for the root listing group filter node."
    sql: ${TABLE}.asset_group_listing_group_filter_parent_listing_group_filter ;;
  }

  dimension: asset_group_listing_group_filter_type {
    type: string
    description: "Type of a listing group filter node."
    sql: ${TABLE}.asset_group_listing_group_filter_type ;;
  }

  dimension: asset_group_listing_group_filter_vertical {
    type: string
    description: "The vertical the current node tree represents. All nodes in the same tree must belong to the same vertical."
    sql: ${TABLE}.asset_group_listing_group_filter_vertical ;;
  }
  measure: count {
    type: count
  }
}
