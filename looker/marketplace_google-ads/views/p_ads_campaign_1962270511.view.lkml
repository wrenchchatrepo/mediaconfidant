# The name of this view in Looker is "P Ads Campaign 1962270511"
view: p_ads_campaign_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_Campaign_1962270511` ;;

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
    # This dimension will be called "Bidding Strategy Name" in Explore.

  dimension: bidding_strategy_name {
    type: string
    description: "The name of the bidding strategy. All bidding strategies within an account must be named distinctly. The length of this string should be between 1 and 255, inclusive, in UTF-8 bytes, (trimmed)."
    sql: ${TABLE}.bidding_strategy_name ;;
  }

  dimension: campaign_advertising_channel_sub_type {
    type: string
    description: "Optional refinement to `advertising_channel_type`. Must be a valid sub-type of the parent channel type. Can be set only when creating campaigns. After campaign is created, the field can not be changed."
    sql: ${TABLE}.campaign_advertising_channel_sub_type ;;
  }

  dimension: campaign_advertising_channel_type {
    type: string
    description: "The primary serving target for ads within the campaign. The targeting options can be refined in `network_settings`. This field is required and should not be empty when creating new campaigns. Can be set only when creating campaigns. After the campaign is created, the field can not be changed."
    sql: ${TABLE}.campaign_advertising_channel_type ;;
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

  dimension: campaign_budget_amount_micros {
    type: number
    description: "The amount of the budget, in the local currency for the account. Amount is specified in micros, where one million is equivalent to one currency unit. Monthly spend is capped at 30.4 times this amount."
    sql: ${TABLE}.campaign_budget_amount_micros ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_campaign_budget_amount_micros {
    type: sum
    sql: ${campaign_budget_amount_micros} ;;  }
  measure: average_campaign_budget_amount_micros {
    type: average
    sql: ${campaign_budget_amount_micros} ;;  }

  dimension: campaign_budget_explicitly_shared {
    type: yesno
    description: "Specifies whether the budget is explicitly shared. Defaults to true if unspecified in a create operation. If true, the budget was created with the purpose of sharing across one or more campaigns. If false, the budget was created with the intention of only being used with a single campaign. The budget's name and status will stay in sync with the campaign's name and status. Attempting to share the budget with a second campaign will result in an error. A non-shared budget can become an explicitly shared. The same operation must also assign the budget a name. A shared campaign budget can never become non-shared."
    sql: ${TABLE}.campaign_budget_explicitly_shared ;;
  }

  dimension: campaign_budget_has_recommended_budget {
    type: yesno
    description: "Indicates whether there is a recommended budget for this campaign budget. This field is read-only."
    sql: ${TABLE}.campaign_budget_has_recommended_budget ;;
  }

  dimension: campaign_budget_period {
    type: string
    description: "Period over which to spend the budget. Defaults to DAILY if not specified."
    sql: ${TABLE}.campaign_budget_period ;;
  }

  dimension: campaign_budget_recommended_budget_amount_micros {
    type: number
    description: "The recommended budget amount. If no recommendation is available, this will be set to the budget amount. Amount is specified in micros, where one million is equivalent to one currency unit. This field is read-only."
    sql: ${TABLE}.campaign_budget_recommended_budget_amount_micros ;;
  }

  dimension: campaign_budget_total_amount_micros {
    type: number
    description: "The lifetime amount of the budget, in the local currency for the account. Amount is specified in micros, where one million is equivalent to one currency unit."
    sql: ${TABLE}.campaign_budget_total_amount_micros ;;
  }

  dimension: campaign_campaign_budget {
    type: string
    description: "The budget of the campaign."
    sql: ${TABLE}.campaign_campaign_budget ;;
  }

  dimension_group: campaign_end {
    type: time
    description: "The date when campaign ended. This field must not be used in WHERE clauses."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.campaign_end_date ;;
  }

  dimension: campaign_experiment_type {
    type: string
    description: "The type of campaign: normal, draft, or experiment."
    sql: ${TABLE}.campaign_experiment_type ;;
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

  dimension: campaign_maximize_conversion_value_target_roas {
    type: number
    description: "The target return on ad spend (ROAS) option. If set, the bid strategy will maximize revenue while averaging the target return on ad spend. If the target ROAS is high, the bid strategy may not be able to spend the full budget. If the target ROAS is not set, the bid strategy will aim to achieve the highest possible ROAS for the budget."
    sql: ${TABLE}.campaign_maximize_conversion_value_target_roas ;;
  }

  dimension: campaign_name {
    type: string
    description: "The name of the campaign. This field is required and should not be empty when creating new campaigns. It must not contain any null (code point 0x0), NL line feed (code point 0xA) or carriage return (code point 0xD) characters."
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: campaign_percent_cpc_enhanced_cpc_enabled {
    type: yesno
    description: "Adjusts the bid for each auction upward or downward, depending on the likelihood of a conversion. Individual bids may exceed cpc_bid_ceiling_micros, but the average bid amount for a campaign should not."
    sql: ${TABLE}.campaign_percent_cpc_enhanced_cpc_enabled ;;
  }

  dimension: campaign_serving_status {
    type: string
    description: "The ad serving status of the campaign."
    sql: ${TABLE}.campaign_serving_status ;;
  }

  dimension_group: campaign_start {
    type: time
    description: "The date when campaign started. This field must not be used in WHERE clauses."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.campaign_start_date ;;
  }

  dimension: campaign_status {
    type: string
    description: "The status of the campaign. When a new campaign is added, the status defaults to ENABLED."
    sql: ${TABLE}.campaign_status ;;
  }

  dimension: campaign_tracking_url_template {
    type: string
    description: "The URL template for constructing a tracking URL."
    sql: ${TABLE}.campaign_tracking_url_template ;;
  }

  dimension: campaign_url_custom_parameters {
    type: string
    description: "The list of mappings used to substitute custom parameter tags in a `tracking_url_template`, `final_urls`, or `mobile_final_urls`."
    sql: ${TABLE}.campaign_url_custom_parameters ;;
  }

  dimension: customer_id {
    type: number
    description: "The ID of the customer."
    sql: ${TABLE}.customer_id ;;
  }
  measure: count {
    type: count
    drill_fields: [bidding_strategy_name, campaign_name]
  }
}
