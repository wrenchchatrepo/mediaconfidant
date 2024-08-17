# The name of this view in Looker is "P Ads Budget 1962270511"
view: p_ads_budget_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_Budget_1962270511` ;;

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
    # This dimension will be called "Campaign Budget Amount Micros" in Explore.

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

  dimension: campaign_budget_delivery_method {
    type: string
    description: "The delivery method that determines the rate at which the campaign budget is spent. Defaults to STANDARD if unspecified in a create operation."
    sql: ${TABLE}.campaign_budget_delivery_method ;;
  }

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

  dimension: campaign_budget_id {
    type: number
    description: "The ID of the campaign budget. A campaign budget is created using the CampaignBudgetService create operation and is assigned a budget ID. A budget ID can be shared across different campaigns; the system will then allocate the campaign budget among different campaigns to get optimum results."
    sql: ${TABLE}.campaign_budget_id ;;
  }

  dimension: campaign_budget_name {
    type: string
    description: "The name of the campaign budget. When creating a campaign budget through CampaignBudgetService, every explicitly shared campaign budget must have a non-null, non-empty name. Campaign budgets that are not explicitly shared derive their name from the attached campaign's name. The length of this string must be between 1 and 255, inclusive, in UTF-8 bytes, (trimmed)."
    sql: ${TABLE}.campaign_budget_name ;;
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

  dimension: campaign_budget_reference_count {
    type: number
    description: "The number of campaigns actively using the budget. This field is read-only."
    sql: ${TABLE}.campaign_budget_reference_count ;;
  }

  dimension: campaign_budget_status {
    type: string
    description: "The status of this campaign budget. This field is read-only."
    sql: ${TABLE}.campaign_budget_status ;;
  }

  dimension: campaign_budget_total_amount_micros {
    type: number
    description: "The lifetime amount of the budget, in the local currency for the account. Amount is specified in micros, where one million is equivalent to one currency unit."
    sql: ${TABLE}.campaign_budget_total_amount_micros ;;
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
    drill_fields: [customer_descriptive_name, campaign_budget_name]
  }
}
