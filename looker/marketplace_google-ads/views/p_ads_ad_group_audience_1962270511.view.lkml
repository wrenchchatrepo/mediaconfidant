# The name of this view in Looker is "P Ads Ad Group Audience 1962270511"
view: p_ads_ad_group_audience_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_AdGroupAudience_1962270511` ;;

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
    # This dimension will be called "Ad Group Base Ad Group" in Explore.

  dimension: ad_group_base_ad_group {
    type: string
    description: "For draft or experiment ad groups, this field is the resource name of the base ad group from which this ad group was created. If a draft or experiment ad group does not have a base ad group, then this field is null. For base ad groups, this field equals the ad group resource name. This field is read-only."
    sql: ${TABLE}.ad_group_base_ad_group ;;
  }

  dimension: ad_group_campaign {
    type: string
    description: "The campaign to which the ad group belongs."
    sql: ${TABLE}.ad_group_campaign ;;
  }

  dimension: ad_group_criterion_bid_modifier {
    type: number
    description: "The modifier for the bid when the criterion matches. The modifier must be in the range: 0.1 - 10.0. Most targetable criteria types support modifiers."
    sql: ${TABLE}.ad_group_criterion_bid_modifier ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_ad_group_criterion_bid_modifier {
    type: sum
    sql: ${ad_group_criterion_bid_modifier} ;;  }
  measure: average_ad_group_criterion_bid_modifier {
    type: average
    sql: ${ad_group_criterion_bid_modifier} ;;  }

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

  dimension: ad_group_criterion_effective_cpm_bid_source {
    type: string
    description: "Source of the effective CPM bid."
    sql: ${TABLE}.ad_group_criterion_effective_cpm_bid_source ;;
  }

  dimension: ad_group_criterion_final_mobile_urls {
    type: string
    description: "The list of possible final mobile URLs after all cross-domain redirects."
    sql: ${TABLE}.ad_group_criterion_final_mobile_urls ;;
  }

  dimension: ad_group_criterion_final_urls {
    type: string
    description: "The list of possible final URLs after all cross-domain redirects for the ad."
    sql: ${TABLE}.ad_group_criterion_final_urls ;;
  }

  dimension: ad_group_criterion_keyword_text {
    type: string
    description: "The text of the keyword (at most 80 characters and 10 words)."
    sql: ${TABLE}.ad_group_criterion_keyword_text ;;
  }

  dimension: ad_group_criterion_status {
    type: string
    description: "The status of the criterion."
    sql: ${TABLE}.ad_group_criterion_status ;;
  }

  dimension: ad_group_id {
    type: number
    description: "The ID of the ad group."
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: ad_group_targeting_setting_target_restrictions {
    type: string
    description: "The per-targeting-dimension setting to restrict the reach of your campaign or ad group."
    sql: ${TABLE}.ad_group_targeting_setting_target_restrictions ;;
  }

  dimension: ad_group_tracking_url_template {
    type: string
    description: "The URL template for constructing a tracking URL."
    sql: ${TABLE}.ad_group_tracking_url_template ;;
  }

  dimension: ad_group_url_custom_parameters {
    type: string
    description: "The list of mappings used to substitute custom parameter tags in a `tracking_url_template`, `final_urls`, or `mobile_final_urls`."
    sql: ${TABLE}.ad_group_url_custom_parameters ;;
  }

  dimension: campaign_base_campaign {
    type: string
    description: "The resource name of the base campaign of a draft or experiment campaign. For base campaigns, this is equal to `resource_name`. This field is read-only."
    sql: ${TABLE}.campaign_base_campaign ;;
  }

  dimension: campaign_bidding_strategy {
    type: string
    description: "Portfolio bidding strategy used by campaign."
    sql: ${TABLE}.campaign_bidding_strategy ;;
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
