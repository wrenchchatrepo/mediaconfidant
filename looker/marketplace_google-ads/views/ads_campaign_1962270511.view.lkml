# The name of this view in Looker is "Ads Campaign 1962270511"
view: ads_campaign_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_Campaign_1962270511` ;;

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
    # This dimension will be called "Bidding Strategy Name" in Explore.

  dimension: bidding_strategy_name {
    type: string
    sql: ${TABLE}.bidding_strategy_name ;;
  }

  dimension: campaign_advertising_channel_sub_type {
    type: string
    sql: ${TABLE}.campaign_advertising_channel_sub_type ;;
  }

  dimension: campaign_advertising_channel_type {
    type: string
    sql: ${TABLE}.campaign_advertising_channel_type ;;
  }

  dimension: campaign_bidding_strategy {
    type: string
    sql: ${TABLE}.campaign_bidding_strategy ;;
  }

  dimension: campaign_bidding_strategy_type {
    type: string
    sql: ${TABLE}.campaign_bidding_strategy_type ;;
  }

  dimension: campaign_budget_amount_micros {
    type: number
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
    sql: ${TABLE}.campaign_budget_explicitly_shared ;;
  }

  dimension: campaign_budget_has_recommended_budget {
    type: yesno
    sql: ${TABLE}.campaign_budget_has_recommended_budget ;;
  }

  dimension: campaign_budget_period {
    type: string
    sql: ${TABLE}.campaign_budget_period ;;
  }

  dimension: campaign_budget_recommended_budget_amount_micros {
    type: number
    sql: ${TABLE}.campaign_budget_recommended_budget_amount_micros ;;
  }

  dimension: campaign_budget_total_amount_micros {
    type: number
    sql: ${TABLE}.campaign_budget_total_amount_micros ;;
  }

  dimension: campaign_campaign_budget {
    type: string
    sql: ${TABLE}.campaign_campaign_budget ;;
  }

  dimension_group: campaign_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.campaign_end_date ;;
  }

  dimension: campaign_experiment_type {
    type: string
    sql: ${TABLE}.campaign_experiment_type ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_manual_cpc_enhanced_cpc_enabled {
    type: yesno
    sql: ${TABLE}.campaign_manual_cpc_enhanced_cpc_enabled ;;
  }

  dimension: campaign_maximize_conversion_value_target_roas {
    type: number
    sql: ${TABLE}.campaign_maximize_conversion_value_target_roas ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: campaign_percent_cpc_enhanced_cpc_enabled {
    type: yesno
    sql: ${TABLE}.campaign_percent_cpc_enhanced_cpc_enabled ;;
  }

  dimension: campaign_serving_status {
    type: string
    sql: ${TABLE}.campaign_serving_status ;;
  }

  dimension_group: campaign_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.campaign_start_date ;;
  }

  dimension: campaign_status {
    type: string
    sql: ${TABLE}.campaign_status ;;
  }

  dimension: campaign_tracking_url_template {
    type: string
    sql: ${TABLE}.campaign_tracking_url_template ;;
  }

  dimension: campaign_url_custom_parameters {
    type: string
    sql: ${TABLE}.campaign_url_custom_parameters ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }
  measure: count {
    type: count
    drill_fields: [bidding_strategy_name, campaign_name]
  }
}
