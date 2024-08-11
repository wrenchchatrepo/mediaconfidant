# The name of this view in Looker is "Ads Bid Goal 1962270511"
view: ads_bid_goal_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_BidGoal_1962270511` ;;

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
    # This dimension will be called "Bidding Strategy ID" in Explore.

  dimension: bidding_strategy_id {
    type: number
    sql: ${TABLE}.bidding_strategy_id ;;
  }

  dimension: bidding_strategy_name {
    type: string
    sql: ${TABLE}.bidding_strategy_name ;;
  }

  dimension: bidding_strategy_status {
    type: string
    sql: ${TABLE}.bidding_strategy_status ;;
  }

  dimension: bidding_strategy_target_cpa_cpc_bid_ceiling_micros {
    type: number
    sql: ${TABLE}.bidding_strategy_target_cpa_cpc_bid_ceiling_micros ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_bidding_strategy_target_cpa_cpc_bid_ceiling_micros {
    type: sum
    sql: ${bidding_strategy_target_cpa_cpc_bid_ceiling_micros} ;;  }
  measure: average_bidding_strategy_target_cpa_cpc_bid_ceiling_micros {
    type: average
    sql: ${bidding_strategy_target_cpa_cpc_bid_ceiling_micros} ;;  }

  dimension: bidding_strategy_target_cpa_cpc_bid_floor_micros {
    type: number
    sql: ${TABLE}.bidding_strategy_target_cpa_cpc_bid_floor_micros ;;
  }

  dimension: bidding_strategy_target_cpa_target_cpa_micros {
    type: number
    sql: ${TABLE}.bidding_strategy_target_cpa_target_cpa_micros ;;
  }

  dimension: bidding_strategy_target_roas_cpc_bid_ceiling_micros {
    type: number
    sql: ${TABLE}.bidding_strategy_target_roas_cpc_bid_ceiling_micros ;;
  }

  dimension: bidding_strategy_target_roas_cpc_bid_floor_micros {
    type: number
    sql: ${TABLE}.bidding_strategy_target_roas_cpc_bid_floor_micros ;;
  }

  dimension: bidding_strategy_target_roas_target_roas {
    type: number
    sql: ${TABLE}.bidding_strategy_target_roas_target_roas ;;
  }

  dimension: bidding_strategy_target_spend_cpc_bid_ceiling_micros {
    type: number
    sql: ${TABLE}.bidding_strategy_target_spend_cpc_bid_ceiling_micros ;;
  }

  dimension: bidding_strategy_target_spend_target_spend_micros {
    type: number
    sql: ${TABLE}.bidding_strategy_target_spend_target_spend_micros ;;
  }

  dimension: bidding_strategy_type {
    type: string
    sql: ${TABLE}.bidding_strategy_type ;;
  }

  dimension: customer_descriptive_name {
    type: string
    sql: ${TABLE}.customer_descriptive_name ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }
  measure: count {
    type: count
    drill_fields: [customer_descriptive_name, bidding_strategy_name]
  }
}
