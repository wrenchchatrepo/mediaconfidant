# The name of this view in Looker is "P Ads Bid Goal 1962270511"
view: p_ads_bid_goal_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_BidGoal_1962270511` ;;

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
    # This dimension will be called "Bidding Strategy ID" in Explore.

  dimension: bidding_strategy_id {
    type: number
    description: "The ID of the bidding strategy."
    sql: ${TABLE}.bidding_strategy_id ;;
  }

  dimension: bidding_strategy_name {
    type: string
    description: "The name of the bidding strategy. All bidding strategies within an account must be named distinctly. The length of this string should be between 1 and 255, inclusive, in UTF-8 bytes, (trimmed)."
    sql: ${TABLE}.bidding_strategy_name ;;
  }

  dimension: bidding_strategy_status {
    type: string
    description: "The status of the bidding strategy. This field is read-only."
    sql: ${TABLE}.bidding_strategy_status ;;
  }

  dimension: bidding_strategy_target_cpa_cpc_bid_ceiling_micros {
    type: number
    description: "Maximum bid limit that can be set by the bid strategy. The limit applies to all keywords managed by the strategy."
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
    description: "Minimum bid limit that can be set by the bid strategy. The limit applies to all keywords managed by the strategy."
    sql: ${TABLE}.bidding_strategy_target_cpa_cpc_bid_floor_micros ;;
  }

  dimension: bidding_strategy_target_cpa_target_cpa_micros {
    type: number
    description: "Average CPA target. This target should be greater than or equal to minimum billable unit based on the currency for the account."
    sql: ${TABLE}.bidding_strategy_target_cpa_target_cpa_micros ;;
  }

  dimension: bidding_strategy_target_roas_cpc_bid_ceiling_micros {
    type: number
    description: "Maximum bid limit that can be set by the bid strategy. The limit applies to all keywords managed by the strategy."
    sql: ${TABLE}.bidding_strategy_target_roas_cpc_bid_ceiling_micros ;;
  }

  dimension: bidding_strategy_target_roas_cpc_bid_floor_micros {
    type: number
    description: "Minimum bid limit that can be set by the bid strategy. The limit applies to all keywords managed by the strategy."
    sql: ${TABLE}.bidding_strategy_target_roas_cpc_bid_floor_micros ;;
  }

  dimension: bidding_strategy_target_roas_target_roas {
    type: number
    description: "Required. The desired revenue (based on conversion data) per unit of spend. Value must be between 0.01 and 1000.0, inclusive."
    sql: ${TABLE}.bidding_strategy_target_roas_target_roas ;;
  }

  dimension: bidding_strategy_target_spend_cpc_bid_ceiling_micros {
    type: number
    description: "Maximum bid limit that can be set by the bid strategy. The limit applies to all keywords managed by the strategy."
    sql: ${TABLE}.bidding_strategy_target_spend_cpc_bid_ceiling_micros ;;
  }

  dimension: bidding_strategy_target_spend_target_spend_micros {
    type: number
    description: "The spend target under which to maximize clicks. A TargetSpend bidder will attempt to spend the smaller of this value or the natural throttling spend amount. If not specified, the budget is used as the spend target."
    sql: ${TABLE}.bidding_strategy_target_spend_target_spend_micros ;;
  }

  dimension: bidding_strategy_type {
    type: string
    description: "The type of the bidding strategy. Create a bidding strategy by setting the bidding scheme. This field is read-only."
    sql: ${TABLE}.bidding_strategy_type ;;
  }

  dimension: customer_descriptive_name {
    type: string
    description: "Optional, non-unique descriptive name of the customer."
    sql: ${TABLE}.customer_descriptive_name ;;
  }

  dimension: customer_id {
    type: number
    description: "The ID of the customer."
    sql: ${TABLE}.customer_id ;;
  }
  measure: count {
    type: count
    drill_fields: [customer_descriptive_name, bidding_strategy_name]
  }
}
