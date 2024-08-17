# The name of this view in Looker is "Ads Budget 1962270511"
view: ads_budget_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_Budget_1962270511` ;;

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
    # This dimension will be called "Campaign Budget Amount Micros" in Explore.

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

  dimension: campaign_budget_delivery_method {
    type: string
    sql: ${TABLE}.campaign_budget_delivery_method ;;
  }

  dimension: campaign_budget_explicitly_shared {
    type: yesno
    sql: ${TABLE}.campaign_budget_explicitly_shared ;;
  }

  dimension: campaign_budget_has_recommended_budget {
    type: yesno
    sql: ${TABLE}.campaign_budget_has_recommended_budget ;;
  }

  dimension: campaign_budget_id {
    type: number
    sql: ${TABLE}.campaign_budget_id ;;
  }

  dimension: campaign_budget_name {
    type: string
    sql: ${TABLE}.campaign_budget_name ;;
  }

  dimension: campaign_budget_period {
    type: string
    sql: ${TABLE}.campaign_budget_period ;;
  }

  dimension: campaign_budget_recommended_budget_amount_micros {
    type: number
    sql: ${TABLE}.campaign_budget_recommended_budget_amount_micros ;;
  }

  dimension: campaign_budget_reference_count {
    type: number
    sql: ${TABLE}.campaign_budget_reference_count ;;
  }

  dimension: campaign_budget_status {
    type: string
    sql: ${TABLE}.campaign_budget_status ;;
  }

  dimension: campaign_budget_total_amount_micros {
    type: number
    sql: ${TABLE}.campaign_budget_total_amount_micros ;;
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
    drill_fields: [customer_descriptive_name, campaign_budget_name]
  }
}
