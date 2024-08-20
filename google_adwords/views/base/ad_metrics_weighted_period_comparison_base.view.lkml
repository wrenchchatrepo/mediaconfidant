view: ad_metrics_weighted_period_comparison_base {
  extension: required

  measure: weighted_total_impressions {
    hidden: yes
    type:  sum
    sql:  (${impressions} + ${last_fact.impressions}) / NULLIF((${total.impressions} + ${last_total.impressions}), 0) ;;
  }
  measure: weighted_average_click_rate_period_percent_change {
    hidden: yes
    type: number
    sql: ${average_click_rate_period_percent_change} * ${weighted_total_impressions} ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_click_rate_period_percent_change_abs {
    hidden: yes
    sql: abs(${weighted_average_click_rate_period_percent_change}) ;;
  }
  measure: weighted_total_clicks {
    hidden: yes
    type:  sum
    sql:  (${clicks} + ${last_fact.clicks}) / NULLIF((${total.clicks} + ${last_total.clicks}), 0) ;;
  }
  measure: weighted_average_conversion_rate_period_percent_change {
    hidden: yes
    type: number
    sql: ${average_conversion_rate_period_percent_change} * ${weighted_total_clicks} ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_conversion_rate_period_percent_change_abs {
    hidden: yes
    sql: abs(${weighted_average_conversion_rate_period_percent_change}) ;;
  }
  measure: weighted_average_cost_per_click_period_percent_change {
    hidden: yes
    type: number
    sql: ${average_cost_per_click_period_percent_change} * ${weighted_total_clicks} ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_cost_per_click_period_percent_change_abs {
    hidden: yes
    sql: abs(${weighted_average_cost_per_click_period_percent_change}) ;;
  }
  measure: weighted_total_cost {
    hidden: yes
    type:  sum
    sql:  (${cost} + ${last_fact.cost}) / NULLIF((${total.cost} + ${last_total.cost}), 0) ;;
  }
  measure: weighted_average_value_per_cost_period_percent_change {
    hidden: yes
    type: number
    sql: ${average_value_per_cost_period_percent_change} * ${weighted_total_cost} ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_value_per_cost_percent_change_abs {
    hidden: yes
    sql: abs(${weighted_average_value_per_cost_period_percent_change}) ;;
  }
  measure: weighted_total_conversions {
    hidden: yes
    type:  sum
    sql:  (${conversions} + ${last_fact.conversions}) / NULLIF((${total.conversions} + ${last_total.conversions}), 0) ;;
  }
  measure: weighted_average_cost_per_conversion_period_percent_change {
    hidden: yes
    type: number
    sql: ${average_cost_per_conversion_period_percent_change} * ${weighted_total_conversions} ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_cost_per_conversion_period_percent_change_abs {
    hidden: yes
    sql: abs(${weighted_average_cost_per_conversion_period_percent_change}) ;;
  }
  measure: weighted_total_conversionvalue {
    hidden: yes
    type:  sum
    sql:  (${conversionvalue} + ${last_fact.conversionvalue}) / NULLIF((${total.conversionvalue} + ${last_total.conversionvalue}), 0) ;;
  }
}
