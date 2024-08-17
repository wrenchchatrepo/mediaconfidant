view: ad {
  sql_table_name: `@{GOOGLE_ADS_SCHEMA}.ads_Ad_@{GOOGLE_ADS_CUSTOMER_ID}` ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${campaign_id},${creative_id}) ;;
  }

  dimension_group: _data {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension_group: _latest {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._LATEST_DATE;;
  }

  dimension: latest {
    hidden: yes
    type: yesno
    sql: ${_data_raw} = ${_latest_raw} ;;
  }


  dimension: accent_color {
    type: string
    sql: ${TABLE}.accent_color ;;
  }

  dimension: ad_group_ad_disapproval_reasons {
    type: string
    sql: ${TABLE}.ad_group_ad_disapproval_reasons ;;
  }

  dimension: ad_group_ad_trademark_disapproved {
    type: yesno
    sql: ${TABLE}.ad_group_ad_trademark_disapproved ;;
  }

  dimension: ad_group_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: ad_strength_info {
    type: string
    sql: ${TABLE}.ad_strength_info ;;
  }

  dimension: ad_type {
    type: string
    sql: ${TABLE}.ad_type ;;
  }

  dimension: allow_flexible_color {
    type: yesno
    sql: ${TABLE}.allow_flexible_color ;;
  }

  dimension: automated {
    type: yesno
    sql: ${TABLE}.automated ;;
  }

  dimension: business_name {
    type: string
    sql: ${TABLE}.business_name ;;
  }

  dimension: call_only_phone_number {
    type: string
    sql: ${TABLE}.call_only_phone_number ;;
  }

  dimension: call_to_action_text {
    type: string
    sql: ${TABLE}.call_to_action_text ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: combined_approval_status {
    type: string
    sql: ${TABLE}.combined_approval_status ;;
  }

  dimension: creative_approval_status {
    type: string
    sql: ${TABLE}.creative_approval_status ;;
  }

  dimension: creative_destination_url {
    type: string
    sql: ${TABLE}.creative_destination_url ;;
  }

  dimension: creative_final_app_urls {
    type: string
    sql: ${TABLE}.creative_final_app_urls ;;
  }

  dimension: creative_final_mobile_urls {
    type: string
    sql: ${TABLE}.creative_final_mobile_urls ;;
  }

  dimension: creative_final_urls {
    type: string
    sql: ${TABLE}.creative_final_urls ;;
  }

  dimension: creative_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ad_group_ad_ad_id ;;
  }

  dimension: creative_tracking_url_template {
    type: string
    sql: ${TABLE}.creative_tracking_url_template ;;
  }

  dimension: creative_url_custom_parameters {
    type: string
    sql: ${TABLE}.creative_url_custom_parameters ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
    drill_fields: [keyword.criteria]
  }

  dimension: description1 {
    type: string
    sql: ${TABLE}.description1 ;;
  }

  dimension: description2 {
    type: string
    sql: ${TABLE}.description2 ;;
  }

  dimension: device_preference {
    type: number
    sql: ${TABLE}.device_preference ;;
  }

  dimension: display_url {
    type: string
    sql: ${TABLE}.display_url ;;
  }

  dimension: enhanced_display_creative_landscape_logo_image_media_id {
    type: number
    sql: ${TABLE}.enhanced_display_creative_landscape_logo_image_media_id ;;
  }

  dimension: enhanced_display_creative_logo_image_media_id {
    type: number
    sql: ${TABLE}.enhanced_display_creative_logo_image_media_id ;;
  }

  dimension: enhanced_display_creative_marketing_image_media_id {
    type: number
    sql: ${TABLE}.enhanced_display_creative_marketing_image_media_id ;;
  }

  dimension: enhanced_display_creative_marketing_image_square_media_id {
    type: number
    sql: ${TABLE}.enhanced_display_creative_marketing_image_square_media_id ;;
  }

  dimension: expanded_dynamic_search_creative_description2 {
    type: string
    sql: ${TABLE}.expanded_dynamic_search_creative_description2 ;;
  }

  dimension: expanded_text_ad_description2 {
    type: string
    sql: ${TABLE}.expanded_text_ad_description2 ;;
  }

  dimension: expanded_text_ad_headline_part3 {
    type: string
    sql: ${TABLE}.expanded_text_ad_headline_part3 ;;
  }

  dimension: external_customer_id {
    hidden: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: format_setting {
    type: string
    sql: ${TABLE}.format_setting ;;
  }

  dimension: gmail_creative_header_image_media_id {
    type: number
    sql: ${TABLE}.gmail_creative_header_image_media_id ;;
  }

  dimension: gmail_creative_logo_image_media_id {
    type: number
    sql: ${TABLE}.gmail_creative_logo_image_media_id ;;
  }

  dimension: gmail_creative_marketing_image_media_id {
    type: number
    sql: ${TABLE}.gmail_creative_marketing_image_media_id ;;
  }

  dimension: gmail_teaser_business_name {
    type: string
    sql: ${TABLE}.gmail_teaser_business_name ;;
  }

  dimension: gmail_teaser_description {
    type: string
    sql: ${TABLE}.gmail_teaser_description ;;
  }

  dimension: gmail_teaser_headline {
    type: string
    sql: ${TABLE}.gmail_teaser_headline ;;
  }

  dimension: headline {
    type: string
    sql: ${TABLE}.headline ;;
  }

  dimension: headline_part1 {
    type: string
    sql: ${TABLE}.headline_part1 ;;
  }

  dimension: headline_part2 {
    type: string
    sql: ${TABLE}.headline_part2 ;;
  }

  dimension: image_ad_url {
    type: string
    sql: ${TABLE}.image_ad_url ;;
  }

  dimension: image_creative_image_height {
    type: number
    sql: ${TABLE}.image_creative_image_height ;;
  }

  dimension: image_creative_image_width {
    type: number
    sql: ${TABLE}.image_creative_image_width ;;
  }

  dimension: image_creative_mime_type {
    type: string
    sql: ${TABLE}.image_creative_mime_type ;;
  }

  dimension: image_creative_name {
    type: string
    sql: ${TABLE}.image_creative_name ;;
  }

  dimension: label_ids {
    hidden: yes
    type: string
    sql: ${TABLE}.label_ids ;;
  }

  dimension: labels {
    type: string
    sql: ${TABLE}.labels ;;
  }

  dimension: long_headline {
    type: string
    sql: ${TABLE}.long_headline ;;
  }

  dimension: main_color {
    type: string
    sql: ${TABLE}.main_color ;;
  }

  dimension: marketing_image_call_to_action_text {
    type: string
    sql: ${TABLE}.marketing_image_call_to_action_text ;;
  }

  dimension: marketing_image_call_to_action_text_color {
    type: string
    sql: ${TABLE}.marketing_image_call_to_action_text_color ;;
  }

  dimension: marketing_image_description {
    type: string
    sql: ${TABLE}.marketing_image_description ;;
  }

  dimension: marketing_image_headline {
    type: string
    sql: ${TABLE}.marketing_image_headline ;;
  }

  dimension: multi_asset_responsive_display_ad_accent_color {
    type: string
    sql: ${TABLE}.multi_asset_responsive_display_ad_accent_color ;;
  }

  dimension: multi_asset_responsive_display_ad_business_name {
    type: string
    sql: ${TABLE}.multi_asset_responsive_display_ad_business_name ;;
  }

  dimension: multi_asset_responsive_display_ad_call_to_action_text {
    type: string
    sql: ${TABLE}.multi_asset_responsive_display_ad_call_to_action_text ;;
  }

  dimension: multi_asset_responsive_display_ad_descriptions {
    type: string
    sql: ${TABLE}.multi_asset_responsive_display_ad_descriptions ;;
  }

  dimension: multi_asset_responsive_display_ad_dynamic_settings_price_prefix {
    type: string
    sql: ${TABLE}.multi_asset_responsive_display_ad_dynamic_settings_price_prefix ;;
  }

  dimension: multi_asset_responsive_display_ad_dynamic_settings_promo_text {
    type: string
    sql: ${TABLE}.multi_asset_responsive_display_ad_dynamic_settings_promo_text ;;
  }

  dimension: multi_asset_responsive_display_ad_format_setting {
    type: string
    sql: ${TABLE}.multi_asset_responsive_display_ad_format_setting ;;
  }

  dimension: multi_asset_responsive_display_ad_headlines {
    type: string
    sql: ${TABLE}.multi_asset_responsive_display_ad_headlines ;;
  }

  dimension: multi_asset_responsive_display_ad_landscape_logo_images {
    type: string
    sql: ${TABLE}.multi_asset_responsive_display_ad_landscape_logo_images ;;
  }

  dimension: multi_asset_responsive_display_ad_logo_images {
    type: string
    sql: ${TABLE}.multi_asset_responsive_display_ad_logo_images ;;
  }

  dimension: multi_asset_responsive_display_ad_long_headline {
    type: string
    sql: ${TABLE}.multi_asset_responsive_display_ad_long_headline ;;
  }

  dimension: multi_asset_responsive_display_ad_main_color {
    type: string
    sql: ${TABLE}.multi_asset_responsive_display_ad_main_color ;;
  }

  dimension: multi_asset_responsive_display_ad_marketing_images {
    type: string
    sql: ${TABLE}.multi_asset_responsive_display_ad_marketing_images ;;
  }

  dimension: multi_asset_responsive_display_ad_square_marketing_images {
    type: string
    sql: ${TABLE}.multi_asset_responsive_display_ad_square_marketing_images ;;
  }

  dimension: multi_asset_responsive_display_ad_you_tube_videos {
    type: string
    sql: ${TABLE}.multi_asset_responsive_display_ad_you_tube_videos ;;
  }

  dimension: path1 {
    type: string
    sql: ${TABLE}.path1 ;;
  }

  dimension: path2 {
    type: string
    sql: ${TABLE}.path2 ;;
  }

  dimension: policy_summary {
    type: string
    sql: ${TABLE}.policy_summary ;;
  }

  dimension: price_prefix {
    type: string
    sql: ${TABLE}.price_prefix ;;
  }

  dimension: promo_text {
    type: string
    sql: ${TABLE}.promo_text ;;
  }

  dimension: responsive_search_ad_descriptions {
    type: string
    sql: ${TABLE}.responsive_search_ad_descriptions ;;
  }

  dimension: responsive_search_ad_headlines {
    type: string
    sql: ${TABLE}.responsive_search_ad_headlines ;;
  }

  dimension: responsive_search_ad_path1 {
    type: string
    sql: ${TABLE}.responsive_search_ad_path1 ;;
  }

  dimension: responsive_search_ad_path2 {
    type: string
    sql: ${TABLE}.responsive_search_ad_path2 ;;
  }

  dimension: short_headline {
    type: string
    sql: ${TABLE}.short_headline ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: system_managed_entity_source {
    type: string
    sql: ${TABLE}.system_managed_entity_source ;;
  }

  dimension: trademarks {
    type: string
    sql: ${TABLE}.trademarks ;;
  }

  dimension: universal_app_ad_descriptions {
    type: string
    sql: ${TABLE}.universal_app_ad_descriptions ;;
  }

  dimension: universal_app_ad_headlines {
    type: string
    sql: ${TABLE}.universal_app_ad_headlines ;;
  }

  dimension: universal_app_ad_html5_media_bundles {
    type: string
    sql: ${TABLE}.universal_app_ad_html5_media_bundles ;;
  }

  dimension: universal_app_ad_images {
    type: string
    sql: ${TABLE}.universal_app_ad_images ;;
  }

  dimension: universal_app_ad_mandatory_ad_text {
    type: string
    sql: ${TABLE}.universal_app_ad_mandatory_ad_text ;;
  }

  dimension: universal_app_ad_you_tube_videos {
    type: string
    sql: ${TABLE}.universal_app_ad_you_tube_videos ;;
  }



  measure: number_of_ads {
    description: "includes all statuses (PAUSED, ENABLED, DISABLED)"
    type: count
  }

  measure: number_of_enabled_ads {
    description: "includes only status (ENABLED)"
    filters: [status: "ENABLED"]
    type: count
  }

  drill_fields:   [campaign.campaign_name,ad_group.ad_group_name,description,display_url]
}
