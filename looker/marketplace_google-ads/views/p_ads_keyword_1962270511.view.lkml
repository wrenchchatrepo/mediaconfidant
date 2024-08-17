# The name of this view in Looker is "P Ads Keyword 1962270511"
view: p_ads_keyword_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_Keyword_1962270511` ;;

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
    # This dimension will be called "Ad Group Criterion Approval Status" in Explore.

  dimension: ad_group_criterion_approval_status {
    type: string
    description: "Approval status of the criterion."
    sql: ${TABLE}.ad_group_criterion_approval_status ;;
  }

  dimension: ad_group_criterion_criterion_id {
    type: number
    description: "The ID of the criterion. This field is ignored for mutates."
    sql: ${TABLE}.ad_group_criterion_criterion_id ;;
  }

  dimension: ad_group_criterion_effective_cpc_bid_micros {
    type: number
    description: "The effective CPC (cost-per-click) bid."
    sql: ${TABLE}.ad_group_criterion_effective_cpc_bid_micros ;;
  }

  dimension: ad_group_criterion_effective_cpc_bid_source {
    type: string
    description: "Source of the effective CPC bid."
    sql: ${TABLE}.ad_group_criterion_effective_cpc_bid_source ;;
  }

  dimension: ad_group_criterion_effective_cpm_bid_micros {
    type: number
    description: "The effective CPM (cost-per-thousand viewable impressions) bid."
    sql: ${TABLE}.ad_group_criterion_effective_cpm_bid_micros ;;
  }

  dimension: ad_group_criterion_final_mobile_urls {
    type: string
    description: "The list of possible final mobile URLs after all cross-domain redirects."
    sql: ${TABLE}.ad_group_criterion_final_mobile_urls ;;
  }

  dimension: ad_group_criterion_final_url_suffix {
    type: string
    description: "URL template for appending params to final URL."
    sql: ${TABLE}.ad_group_criterion_final_url_suffix ;;
  }

  dimension: ad_group_criterion_final_urls {
    type: string
    description: "The list of possible final URLs after all cross-domain redirects for the ad."
    sql: ${TABLE}.ad_group_criterion_final_urls ;;
  }

  dimension: ad_group_criterion_keyword_match_type {
    type: string
    description: "The match type of the keyword."
    sql: ${TABLE}.ad_group_criterion_keyword_match_type ;;
  }

  dimension: ad_group_criterion_keyword_text {
    type: string
    description: "The text of the keyword (at most 80 characters and 10 words)."
    sql: ${TABLE}.ad_group_criterion_keyword_text ;;
  }

  dimension: ad_group_criterion_negative {
    type: yesno
    description: "Whether to target (`false`) or exclude (`true`) the criterion. This field is immutable. To switch a criterion from positive to negative, remove then re-add it."
    sql: ${TABLE}.ad_group_criterion_negative ;;
  }

  dimension: ad_group_criterion_position_estimates_estimated_add_clicks_at_first_position_cpc {
    type: number
    description: "Estimate of how many clicks per week you might get by changing your keyword bid to the value in first_position_cpc_micros."
    sql: ${TABLE}.ad_group_criterion_position_estimates_estimated_add_clicks_at_first_position_cpc ;;
  }

  dimension: ad_group_criterion_position_estimates_estimated_add_cost_at_first_position_cpc {
    type: number
    description: "Estimate of how your cost per week might change when changing your keyword bid to the value in first_position_cpc_micros."
    sql: ${TABLE}.ad_group_criterion_position_estimates_estimated_add_cost_at_first_position_cpc ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_ad_group_criterion_position_estimates_estimated_add_cost_at_first_position_cpc {
    type: sum
    sql: ${ad_group_criterion_position_estimates_estimated_add_cost_at_first_position_cpc} ;;  }
  measure: average_ad_group_criterion_position_estimates_estimated_add_cost_at_first_position_cpc {
    type: average
    sql: ${ad_group_criterion_position_estimates_estimated_add_cost_at_first_position_cpc} ;;  }

  dimension: ad_group_criterion_position_estimates_first_page_cpc_micros {
    type: number
    description: "The estimate of the CPC bid required for ad to be shown on first page of search results."
    sql: ${TABLE}.ad_group_criterion_position_estimates_first_page_cpc_micros ;;
  }

  dimension: ad_group_criterion_position_estimates_first_position_cpc_micros {
    type: number
    description: "The estimate of the CPC bid required for ad to be displayed in first position, at the top of the first page of search results."
    sql: ${TABLE}.ad_group_criterion_position_estimates_first_position_cpc_micros ;;
  }

  dimension: ad_group_criterion_position_estimates_top_of_page_cpc_micros {
    type: number
    description: "The estimate of the CPC bid required for ad to be displayed at the top of the first page of search results."
    sql: ${TABLE}.ad_group_criterion_position_estimates_top_of_page_cpc_micros ;;
  }

  dimension: ad_group_criterion_quality_info_creative_quality_score {
    type: string
    description: "The performance of the ad compared to other advertisers."
    sql: ${TABLE}.ad_group_criterion_quality_info_creative_quality_score ;;
  }

  dimension: ad_group_criterion_quality_info_post_click_quality_score {
    type: string
    description: "The quality score of the landing page."
    sql: ${TABLE}.ad_group_criterion_quality_info_post_click_quality_score ;;
  }

  dimension: ad_group_criterion_quality_info_quality_score {
    type: number
    description: "The quality score. This field may not be populated if Google does not have enough information to determine a value."
    sql: ${TABLE}.ad_group_criterion_quality_info_quality_score ;;
  }

  dimension: ad_group_criterion_quality_info_search_predicted_ctr {
    type: string
    description: "The click-through rate compared to that of other advertisers."
    sql: ${TABLE}.ad_group_criterion_quality_info_search_predicted_ctr ;;
  }

  dimension: ad_group_criterion_status {
    type: string
    description: "The status of the criterion."
    sql: ${TABLE}.ad_group_criterion_status ;;
  }

  dimension: ad_group_criterion_system_serving_status {
    type: string
    description: "Serving status of the criterion."
    sql: ${TABLE}.ad_group_criterion_system_serving_status ;;
  }

  dimension: ad_group_criterion_topic_topic_constant {
    type: string
    description: "The Topic Constant resource name."
    sql: ${TABLE}.ad_group_criterion_topic_topic_constant ;;
  }

  dimension: ad_group_criterion_tracking_url_template {
    type: string
    description: "The URL template for constructing a tracking URL."
    sql: ${TABLE}.ad_group_criterion_tracking_url_template ;;
  }

  dimension: ad_group_criterion_url_custom_parameters {
    type: string
    description: "The list of mappings used to substitute custom parameter tags in a `tracking_url_template`, `final_urls`, or `mobile_final_urls`."
    sql: ${TABLE}.ad_group_criterion_url_custom_parameters ;;
  }

  dimension: ad_group_id {
    type: number
    description: "The ID of the ad group."
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: campaign_bidding_strategy {
    type: string
    description: "Portfolio bidding strategy used by campaign."
    sql: ${TABLE}.campaign_bidding_strategy ;;
  }

  dimension: campaign_bidding_strategy_type {
    type: string
    description: "The type of bidding strategy. A bidding strategy can be created by setting either the bidding scheme to create a standard bidding strategy or the `bidding_strategy` field to create a portfolio bidding strategy. This field is read-only."
    sql: ${TABLE}.campaign_bidding_strategy_type ;;
  }

  dimension: campaign_id {
    type: number
    description: "The ID of the campaign."
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_manual_cpc_enhanced_cpc_enabled {
    type: yesno
    description: "Whether bids are to be enhanced based on conversion optimizer data."
    sql: ${TABLE}.campaign_manual_cpc_enhanced_cpc_enabled ;;
  }

  dimension: campaign_percent_cpc_enhanced_cpc_enabled {
    type: yesno
    description: "Adjusts the bid for each auction upward or downward, depending on the likelihood of a conversion. Individual bids may exceed cpc_bid_ceiling_micros, but the average bid amount for a campaign should not."
    sql: ${TABLE}.campaign_percent_cpc_enhanced_cpc_enabled ;;
  }

  dimension: customer_id {
    type: number
    description: "The ID of the customer."
    sql: ${TABLE}.customer_id ;;
  }
  measure: count {
    type: count
  }
}
