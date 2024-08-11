# The name of this view in Looker is "P Ads Ad 1962270511"
view: p_ads_ad_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_Ad_1962270511` ;;

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
    # This dimension will be called "Ad Group Ad Ad Added By Google Ads" in Explore.

  dimension: ad_group_ad_ad_added_by_google_ads {
    type: yesno
    description: "Indicates if this ad was automatically added by Google Ads and not by a user. For example, this could happen when ads are automatically created as suggestions for new ads based on knowledge of how existing ads are performing."
    sql: ${TABLE}.ad_group_ad_ad_added_by_google_ads ;;
  }

  dimension: ad_group_ad_ad_app_ad_descriptions {
    type: string
    description: "List of text assets for descriptions. When the ad serves the descriptions will be selected from this list."
    sql: ${TABLE}.ad_group_ad_ad_app_ad_descriptions ;;
  }

  dimension: ad_group_ad_ad_app_ad_headlines {
    type: string
    description: "List of text assets for headlines. When the ad serves the headlines will be selected from this list."
    sql: ${TABLE}.ad_group_ad_ad_app_ad_headlines ;;
  }

  dimension: ad_group_ad_ad_app_ad_html5_media_bundles {
    type: string
    description: "List of media bundle assets that may be used with the ad."
    sql: ${TABLE}.ad_group_ad_ad_app_ad_html5_media_bundles ;;
  }

  dimension: ad_group_ad_ad_app_ad_images {
    type: string
    description: "List of image assets that may be displayed with the ad."
    sql: ${TABLE}.ad_group_ad_ad_app_ad_images ;;
  }

  dimension: ad_group_ad_ad_app_ad_mandatory_ad_text {
    type: string
    description: "An optional text asset that, if specified, must always be displayed when the ad is served."
    sql: ${TABLE}.ad_group_ad_ad_app_ad_mandatory_ad_text ;;
  }

  dimension: ad_group_ad_ad_app_ad_youtube_videos {
    type: string
    description: "List of YouTube video assets that may be displayed with the ad."
    sql: ${TABLE}.ad_group_ad_ad_app_ad_youtube_videos ;;
  }

  dimension: ad_group_ad_ad_call_ad_phone_number {
    type: string
    description: "The phone number in the ad."
    sql: ${TABLE}.ad_group_ad_ad_call_ad_phone_number ;;
  }

  dimension: ad_group_ad_ad_device_preference {
    type: string
    description: "The device preference for the ad. You can only specify a preference for mobile devices. When this preference is set the ad will be preferred over other ads when being displayed on a mobile device. The ad can still be displayed on other device types, e.g. if no other ads are available. If unspecified (no device preference), all devices are targeted. This is only supported by some ad types."
    sql: ${TABLE}.ad_group_ad_ad_device_preference ;;
  }

  dimension: ad_group_ad_ad_display_url {
    type: string
    description: "The URL that appears in the ad description for some ad formats."
    sql: ${TABLE}.ad_group_ad_ad_display_url ;;
  }

  dimension: ad_group_ad_ad_expanded_dynamic_search_ad_description {
    type: string
    description: "The description of the ad."
    sql: ${TABLE}.ad_group_ad_ad_expanded_dynamic_search_ad_description ;;
  }

  dimension: ad_group_ad_ad_expanded_dynamic_search_ad_description2 {
    type: string
    description: "The second description of the ad."
    sql: ${TABLE}.ad_group_ad_ad_expanded_dynamic_search_ad_description2 ;;
  }

  dimension: ad_group_ad_ad_expanded_text_ad_description {
    type: string
    description: "The description of the ad."
    sql: ${TABLE}.ad_group_ad_ad_expanded_text_ad_description ;;
  }

  dimension: ad_group_ad_ad_expanded_text_ad_description2 {
    type: string
    description: "The second description of the ad."
    sql: ${TABLE}.ad_group_ad_ad_expanded_text_ad_description2 ;;
  }

  dimension: ad_group_ad_ad_expanded_text_ad_headline_part1 {
    type: string
    description: "The first part of the ad's headline."
    sql: ${TABLE}.ad_group_ad_ad_expanded_text_ad_headline_part1 ;;
  }

  dimension: ad_group_ad_ad_expanded_text_ad_headline_part2 {
    type: string
    description: "The second part of the ad's headline."
    sql: ${TABLE}.ad_group_ad_ad_expanded_text_ad_headline_part2 ;;
  }

  dimension: ad_group_ad_ad_expanded_text_ad_headline_part3 {
    type: string
    description: "The third part of the ad's headline."
    sql: ${TABLE}.ad_group_ad_ad_expanded_text_ad_headline_part3 ;;
  }

  dimension: ad_group_ad_ad_expanded_text_ad_path1 {
    type: string
    description: "The text that can appear alongside the ad's displayed URL."
    sql: ${TABLE}.ad_group_ad_ad_expanded_text_ad_path1 ;;
  }

  dimension: ad_group_ad_ad_expanded_text_ad_path2 {
    type: string
    description: "Additional text that can appear alongside the ad's displayed URL."
    sql: ${TABLE}.ad_group_ad_ad_expanded_text_ad_path2 ;;
  }

  dimension: ad_group_ad_ad_final_app_urls {
    type: string
    description: "A list of final app URLs that will be used on mobile if the user has the specific app installed."
    sql: ${TABLE}.ad_group_ad_ad_final_app_urls ;;
  }

  dimension: ad_group_ad_ad_final_mobile_urls {
    type: string
    description: "The list of possible final mobile URLs after all cross-domain redirects for the ad."
    sql: ${TABLE}.ad_group_ad_ad_final_mobile_urls ;;
  }

  dimension: ad_group_ad_ad_final_urls {
    type: string
    description: "The list of possible final URLs after all cross-domain redirects for the ad."
    sql: ${TABLE}.ad_group_ad_ad_final_urls ;;
  }

  dimension: ad_group_ad_ad_group {
    type: string
    description: "The ad group to which the ad belongs."
    sql: ${TABLE}.ad_group_ad_ad_group ;;
  }

  dimension: ad_group_ad_ad_id {
    type: number
    description: "The ID of the ad."
    sql: ${TABLE}.ad_group_ad_ad_id ;;
  }

  dimension: ad_group_ad_ad_image_ad_image_url {
    type: string
    description: "URL of the full size image."
    sql: ${TABLE}.ad_group_ad_ad_image_ad_image_url ;;
  }

  dimension: ad_group_ad_ad_image_ad_mime_type {
    type: string
    description: "The mime type of the image."
    sql: ${TABLE}.ad_group_ad_ad_image_ad_mime_type ;;
  }

  dimension: ad_group_ad_ad_image_ad_name {
    type: string
    description: "The name of the image. If the image was created from a MediaFile, this is the MediaFile's name. If the image was created from bytes, this is empty."
    sql: ${TABLE}.ad_group_ad_ad_image_ad_name ;;
  }

  dimension: ad_group_ad_ad_image_ad_pixel_height {
    type: number
    description: "Height in pixels of the full size image."
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
    description: "Width in pixels of the full size image."
    sql: ${TABLE}.ad_group_ad_ad_image_ad_pixel_width ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_accent_color {
    type: string
    description: "The accent color of the ad in hexadecimal, e.g. #ffffff for white. If one of main_color and accent_color is set, the other is required as well."
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_accent_color ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_allow_flexible_color {
    type: yesno
    description: "Advertiser's consent to allow flexible color. When true, the ad may be served with different color if necessary. When false, the ad will be served with the specified colors or a neutral color. The default value is true. Must be true if main_color and accent_color are not set."
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_allow_flexible_color ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_business_name {
    type: string
    description: "The business name in the ad."
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_business_name ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_call_to_action_text {
    type: string
    description: "The call-to-action text for the ad."
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_call_to_action_text ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_description {
    type: string
    description: "The description of the ad."
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_description ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_format_setting {
    type: string
    description: "Specifies which format the ad will be served in. Default is ALL_FORMATS."
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_format_setting ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_logo_image {
    type: string
    description: "The MediaFile resource name of the logo image used in the ad."
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_logo_image ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_long_headline {
    type: string
    description: "The long version of the ad's headline."
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_long_headline ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_main_color {
    type: string
    description: "The main color of the ad in hexadecimal, e.g. #ffffff for white. If one of main_color and accent_color is set, the other is required as well."
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_main_color ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_marketing_image {
    type: string
    description: "The MediaFile resource name of the marketing image used in the ad."
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_marketing_image ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_price_prefix {
    type: string
    description: "Prefix before price. E.g. 'as low as'."
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_price_prefix ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_promo_text {
    type: string
    description: "Promotion text used for dyanmic formats of responsive ads. For example 'Free two-day shipping'."
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_promo_text ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_short_headline {
    type: string
    description: "The short version of the ad's headline."
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_short_headline ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_square_logo_image {
    type: string
    description: "The MediaFile resource name of the square logo image used in the ad."
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_square_logo_image ;;
  }

  dimension: ad_group_ad_ad_legacy_responsive_display_ad_square_marketing_image {
    type: string
    description: "The MediaFile resource name of the square marketing image used in the ad."
    sql: ${TABLE}.ad_group_ad_ad_legacy_responsive_display_ad_square_marketing_image ;;
  }

  dimension: ad_group_ad_ad_name {
    type: string
    description: "Immutable. The name of the ad. This is only used to be able to identify the ad. It does not need to be unique and does not affect the served ad. The name field is currently only supported for DisplayUploadAd, ImageAd, ShoppingComparisonListingAd and VideoAd."
    sql: ${TABLE}.ad_group_ad_ad_name ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_accent_color {
    type: string
    description: "The accent color of the ad in hexadecimal, e.g. #ffffff for white. If one of main_color and accent_color is set, the other is required as well."
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_accent_color ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_business_name {
    type: string
    description: "The advertiser/brand name. Maximum display width is 25."
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_business_name ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_call_to_action_text {
    type: string
    description: "The call-to-action text for the ad. Maximum display width is 30."
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_call_to_action_text ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_descriptions {
    type: string
    description: "Descriptive texts for the ad. The maximum length is 90 characters. At least 1 and max 5 headlines can be specified."
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_descriptions ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_format_setting {
    type: string
    description: "Specifies which format the ad will be served in. Default is ALL_FORMATS."
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_format_setting ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_headlines {
    type: string
    description: "Short format headlines for the ad. The maximum length is 30 characters. At least 1 and max 5 headlines can be specified."
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_headlines ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_logo_images {
    type: string
    description: "Logo images to be used in the ad. Valid image types are GIF, JPEG, and PNG. The minimum size is 512x128 and the aspect ratio must be 4:1 (+-1%). Combined with square_logo_images the maximum is 5."
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_logo_images ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_long_headline {
    type: string
    description: "A required long format headline. The maximum length is 90 characters."
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_long_headline ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_main_color {
    type: string
    description: "The main color of the ad in hexadecimal, e.g. #ffffff for white. If one of main_color and accent_color is set, the other is required as well."
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_main_color ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_marketing_images {
    type: string
    description: "Marketing images to be used in the ad. Valid image types are GIF, JPEG, and PNG. The minimum size is 600x314 and the aspect ratio must be 1.91:1 (+-1%). At least one marketing_image is required. Combined with square_marketing_images the maximum is 15."
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_marketing_images ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_price_prefix {
    type: string
    description: "Prefix before price. E.g. 'as low as'."
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_price_prefix ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_promo_text {
    type: string
    description: "Promotion text used for dyanmic formats of responsive ads. For example 'Free two-day shipping'."
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_promo_text ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_square_logo_images {
    type: string
    description: "Square logo images to be used in the ad. Valid image types are GIF, JPEG, and PNG. The minimum size is 128x128 and the aspect ratio must be 1:1 (+-1%). Combined with square_logo_images the maximum is 5."
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_square_logo_images ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_square_marketing_images {
    type: string
    description: "Square marketing images to be used in the ad. Valid image types are GIF, JPEG, and PNG. The minimum size is 300x300 and the aspect ratio must be 1:1 (+-1%). At least one square marketing_image is required. Combined with marketing_images the maximum is 15."
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_square_marketing_images ;;
  }

  dimension: ad_group_ad_ad_responsive_display_ad_youtube_videos {
    type: string
    description: "Optional YouTube videos for the ad. A maximum of 5 videos can be specified."
    sql: ${TABLE}.ad_group_ad_ad_responsive_display_ad_youtube_videos ;;
  }

  dimension: ad_group_ad_ad_responsive_search_ad_descriptions {
    type: string
    description: "List of text assets for descriptions. When the ad serves the descriptions will be selected from this list."
    sql: ${TABLE}.ad_group_ad_ad_responsive_search_ad_descriptions ;;
  }

  dimension: ad_group_ad_ad_responsive_search_ad_headlines {
    type: string
    description: "List of text assets for headlines. When the ad serves the headlines will be selected from this list."
    sql: ${TABLE}.ad_group_ad_ad_responsive_search_ad_headlines ;;
  }

  dimension: ad_group_ad_ad_responsive_search_ad_path1 {
    type: string
    description: "First part of text that may appear appended to the url displayed in the ad."
    sql: ${TABLE}.ad_group_ad_ad_responsive_search_ad_path1 ;;
  }

  dimension: ad_group_ad_ad_responsive_search_ad_path2 {
    type: string
    description: "Second part of text that may appear appended to the url displayed in the ad. This field can only be set when path1 is also set."
    sql: ${TABLE}.ad_group_ad_ad_responsive_search_ad_path2 ;;
  }

  dimension: ad_group_ad_ad_strength {
    type: string
    description: "Overall ad strength for this ad group ad."
    sql: ${TABLE}.ad_group_ad_ad_strength ;;
  }

  dimension: ad_group_ad_ad_system_managed_resource_source {
    type: string
    description: "If this ad is system managed, then this field will indicate the source. This field is read-only."
    sql: ${TABLE}.ad_group_ad_ad_system_managed_resource_source ;;
  }

  dimension: ad_group_ad_ad_text_ad_description1 {
    type: string
    description: "The first line of the ad's description."
    sql: ${TABLE}.ad_group_ad_ad_text_ad_description1 ;;
  }

  dimension: ad_group_ad_ad_text_ad_description2 {
    type: string
    description: "The second line of the ad's description."
    sql: ${TABLE}.ad_group_ad_ad_text_ad_description2 ;;
  }

  dimension: ad_group_ad_ad_text_ad_headline {
    type: string
    description: "The headline of the ad."
    sql: ${TABLE}.ad_group_ad_ad_text_ad_headline ;;
  }

  dimension: ad_group_ad_ad_tracking_url_template {
    type: string
    description: "The URL template for constructing a tracking URL."
    sql: ${TABLE}.ad_group_ad_ad_tracking_url_template ;;
  }

  dimension: ad_group_ad_ad_type {
    type: string
    description: "The type of ad."
    sql: ${TABLE}.ad_group_ad_ad_type ;;
  }

  dimension: ad_group_ad_ad_url_custom_parameters {
    type: string
    description: "The list of mappings that can be used to substitute custom parameter tags in a `tracking_url_template`, `final_urls`, or `mobile_final_urls`. For mutates, please use url custom parameter operations."
    sql: ${TABLE}.ad_group_ad_ad_url_custom_parameters ;;
  }

  dimension: ad_group_ad_policy_summary_approval_status {
    type: string
    description: "Output only. The overall approval status of this ad, calculated based on the status of its individual policy topic entries."
    sql: ${TABLE}.ad_group_ad_policy_summary_approval_status ;;
  }

  dimension: ad_group_ad_status {
    type: string
    description: "The status of the ad."
    sql: ${TABLE}.ad_group_ad_status ;;
  }

  dimension: ad_group_id {
    type: number
    description: "Output only. The ID of the ad group."
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: campaign_id {
    type: number
    description: "The ID of the campaign."
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: customer_id {
    type: number
    description: "The ID of the customer."
    sql: ${TABLE}.customer_id ;;
  }
  measure: count {
    type: count
    drill_fields: [ad_group_ad_ad_legacy_responsive_display_ad_business_name, ad_group_ad_ad_responsive_display_ad_business_name, ad_group_ad_ad_image_ad_name, ad_group_ad_ad_name]
  }
}
