# The name of this view in Looker is "Ads Ad 1962270511"
view: ads_ad_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_Ad_1962270511` ;;

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
    # This dimension will be called "Ad Group Ad Ad Added By Google Ads" in Explore.

  dimension: ad_group_ad_ad_added_by_google_ads {
    type: yesno
    sql: ${TABLE}.ad_group_ad_ad_added_by_google_ads ;;
  }

  dimension: ad_group_ad_ad_app_ad_descriptions {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_app_ad_descriptions ;;
  }

  dimension: ad_group_ad_ad_app_ad_headlines {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_app_ad_headlines ;;
  }

  dimension: ad_group_ad_ad_app_ad_html5_media_bundles {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_app_ad_html5_media_bundles ;;
  }

  dimension: ad_group_ad_ad_app_ad_images {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_app_ad_images ;;
  }

  dimension: ad_group_ad_ad_app_ad_mandatory_ad_text {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_app_ad_mandatory_ad_text ;;
  }

  dimension: ad_group_ad_ad_app_ad_youtube_videos {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_app_ad_youtube_videos ;;
  }

  dimension: ad_group_ad_ad_call_ad_phone_number {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_call_ad_phone_number ;;
  }

  dimension: ad_group_ad_ad_device_preference {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_device_preference ;;
  }

  dimension: ad_group_ad_ad_display_url {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_display_url ;;
  }

  dimension: ad_group_ad_ad_expanded_dynamic_search_ad_description {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_expanded_dynamic_search_ad_description ;;
  }

  dimension: ad_group_ad_ad_expanded_dynamic_search_ad_description2 {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_expanded_dynamic_search_ad_description2 ;;
  }

  dimension: ad_group_ad_ad_expanded_text_ad_description {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_expanded_text_ad_description ;;
  }

  dimension: ad_group_ad_ad_expanded_text_ad_description2 {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_expanded_text_ad_description2 ;;
  }

  dimension: ad_group_ad_ad_expanded_text_ad_headline_part1 {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_expanded_text_ad_headline_part1 ;;
  }

  dimension: ad_group_ad_ad_expanded_text_ad_headline_part2 {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_expanded_text_ad_headline_part2 ;;
  }

  dimension: ad_group_ad_ad_expanded_text_ad_headline_part3 {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_expanded_text_ad_headline_part3 ;;
  }

  dimension: ad_group_ad_ad_expanded_text_ad_path1 {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_expanded_text_ad_path1 ;;
  }

  dimension: ad_group_ad_ad_expanded_text_ad_path2 {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_expanded_text_ad_path2 ;;
  }

  dimension: ad_group_ad_ad_final_app_urls {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_final_app_urls ;;
  }

  dimension: ad_group_ad_ad_final_mobile_urls {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_final_mobile_urls ;;
  }

  dimension: ad_group_ad_ad_final_urls {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_final_urls ;;
  }

  dimension: ad_group_ad_ad_group {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_group ;;
  }

  dimension: ad_group_ad_ad_id {
    type: number
    sql: ${TABLE}.ad_group_ad_ad_id ;;
  }

  dimension: ad_group_ad_ad_image_ad_image_url {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_image_ad_image_url ;;
  }

  dimension: ad_group_ad_ad_image_ad_mime_type {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_image_ad_mime_type ;;
  }

  dimension: ad_group_ad_ad_image_ad_name {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_image_ad_name ;;
  }

  dimension: ad_group_ad_ad_image_ad_pixel_height {
    type: number
    sql: ${TABLE}.ad_group_ad_ad_image_ad_pixel_height ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_ad_group_ad_ad_image_ad_pixel_height {
    type: sum
    sql: ${ad_group_ad_ad_image_ad_pixel_height} ;;  }
  measure: average_ad_group_ad_ad_image_ad_pixel_height {
    type: average
    sql: ${ad_group_ad_ad_image_ad_pixel_height} ;;  }

  dimension: ad_group_ad_ad_image_ad_pixel_width {
    type: number
    sql: ${TABLE}.ad_group_ad_ad_image_ad_pixel_width ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_accent_color {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_accent_color ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_allow_flexible_color {
    type: yesno
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_allow_flexible_color ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_business_name {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_business_name ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_call_to_action_text {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_call_to_action_text ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_description {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_description ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_format_setting {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_format_setting ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_logo_image {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_logo_image ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_long_headline {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_long_headline ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_main_color {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_main_color ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_marketing_image {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_marketing_image ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_price_prefix {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_price_prefix ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_promo_text {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_promo_text ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_short_headline {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_short_headline ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_square_logo_image {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_square_logo_image ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_square_marketing_image {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_square_marketing_image ;;
  }

  dimension: ad_group_ad_ad_name {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_name ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_accent_color {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_accent_color ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_business_name {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_business_name ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_call_to_action_text {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_call_to_action_text ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_descriptions {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_descriptions ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_format_setting {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_format_setting ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_headlines {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_headlines ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_logo_images {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_logo_images ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_long_headline {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_long_headline ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_main_color {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_main_color ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_marketing_images {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_marketing_images ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_price_prefix {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_price_prefix ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_promo_text {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_promo_text ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_square_logo_images {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_square_logo_images ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_square_marketing_images {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_square_marketing_images ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_youtube_videos {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_youtube_videos ;;
  }

  dimension: ad_group_ad_ad_responsive_search_ad_descriptions {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_search_ad_descriptions ;;
  }

  dimension: ad_group_ad_ad_responsive_search_ad_headlines {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_search_ad_headlines ;;
  }

  dimension: ad_group_ad_ad_responsive_search_ad_path1 {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_search_ad_path1 ;;
  }

  dimension: ad_group_ad_ad_responsive_search_ad_path2 {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_responsive_search_ad_path2 ;;
  }

  dimension: ad_group_ad_ad_strength {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_strength ;;
  }

  dimension: ad_group_ad_ad_system_managed_resource_source {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_system_managed_resource_source ;;
  }

  dimension: ad_group_ad_ad_text_ad_description1 {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_text_ad_description1 ;;
  }

  dimension: ad_group_ad_ad_text_ad_description2 {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_text_ad_description2 ;;
  }

  dimension: ad_group_ad_ad_text_ad_headline {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_text_ad_headline ;;
  }

  dimension: ad_group_ad_ad_tracking_url_template {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_tracking_url_template ;;
  }

  dimension: ad_group_ad_ad_type {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_type ;;
  }

  dimension: ad_group_ad_ad_url_custom_parameters {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_url_custom_parameters ;;
  }

  dimension: ad_group_ad_policy_summary_approval_status {
    type: string
    sql: ${TABLE}.ad_group_ad_policy_summary_approval_status ;;
  }

  dimension: ad_group_ad_status {
    type: string
    sql: ${TABLE}.ad_group_ad_status ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }
  measure: count {
    type: count
    drill_fields: [ad_group_ad_ad_legacy_responsive_display_ad_business_name, ad_group_ad_ad_responsive_display_ad_business_name, ad_group_ad_ad_image_ad_name, ad_group_ad_ad_name]
  }
}
