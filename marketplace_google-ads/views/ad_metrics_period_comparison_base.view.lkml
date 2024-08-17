view: ad_metrics_period_comparison_base {
  extension: required

  dimension: impressions_period_delta {
    hidden: yes
    type: number
    sql: ${fact.impressions} - ${last_fact.impressions} ;;
    group_label: "Period Comparisons"
  }
  dimension: clicks_period_delta {
    hidden: yes
    type: number
    sql: ${fact.clicks} - ${last_fact.clicks} ;;
    group_label: "Period Comparisons"
  }
  dimension: conversions_period_delta {
    hidden: yes
    type: number
    sql: ${fact.conversions} - ${last_fact.conversions} ;;
    group_label: "Period Comparisons"
  }
  dimension: conversionvalue_period_delta {
    hidden: yes
    type: number
    sql: ${fact.conversionvalue} - ${last_fact.conversionvalue} ;;
    group_label: "Period Comparisons"
  }
  dimension: click_rate_period_percent_change {
    hidden: yes
    type: number
    sql: (${fact.click_rate} - ${last_fact.click_rate}) / NULLIF(${last_fact.click_rate}, 0) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  dimension: click_rate_period_percent_change_abs {
    hidden: yes
    type: number
    sql: abs(${fact.click_rate_period_percent_change}) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  dimension: value_per_cost_period_percent_change {
    hidden: yes
    type: number
    sql: (${fact.value_per_cost} - ${last_fact.value_per_cost}) / NULLIF(${last_fact.value_per_cost}, 0) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  dimension: value_per_cost_period_percent_change_abs {
    hidden: yes
    type: number
    sql: abs(${fact.value_per_cost_period_percent_change}) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  dimension: conversion_rate_period_percent_change {
    hidden: yes
    type: number
    sql: (${fact.conversion_rate} - ${last_fact.conversion_rate}) / NULLIF(${last_fact.conversion_rate}, 0) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  dimension: conversion_rate_period_percent_change_abs {
    hidden: yes
    type: number
    sql: abs(${fact.conversion_rate_period_percent_change}) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  dimension: cost_per_click_period_percent_change {
    hidden: yes
    type: number
    sql: (${fact.cost_per_click} - ${last_fact.cost_per_click}) / NULLIF(${last_fact.cost_per_click}, 0) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  dimension: cost_per_click_period_percent_change_abs {
    hidden: yes
    type: number
    sql: abs(${fact.cost_per_click_period_percent_change}) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  dimension: cost_per_conversion_period_percent_change {
    hidden: yes
    type: number
    sql: (${fact.cost_per_conversion} - ${last_fact.cost_per_conversion}) / NULLIF(${last_fact.cost_per_conversion}, 0) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  dimension: cost_per_conversion_period_percent_change_abs {
    hidden: yes
    type: number
    sql: abs(${fact.cost_per_conversion_period_percent_change}) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }

  dimension: click_rate_both_periods {
    hidden: yes
    type: number
    sql:  IF((${fact.clicks} + ${last_fact.clicks}) / NULLIF((${fact.impressions} + ${last_fact.impressions}),0)>1,
            NULL,
           (${fact.clicks} + ${last_fact.clicks}) / NULLIF((${fact.impressions} + ${last_fact.impressions}),0));;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }

  dimension: click_rate_period_z_score {
    hidden: yes
    type: number
    sql:
    (
      (${fact.click_rate}) -
      (${last_fact.click_rate})
    ) /
    NULLIF(SQRT(
      ${click_rate_both_periods} *
      (1 - ${click_rate_both_periods}) *
      ((1 / NULLIF(${fact.impressions},0)) + (1 / NULLIF(${last_fact.impressions},0)))
    ),0) ;;
    group_label: "Period Comparisons"
    value_format_name: decimal_2
  }
  dimension: click_rate_period_significant {
    hidden: yes
    type: yesno
    sql:  (${fact.click_rate_period_z_score} > 1.96) OR
      (${fact.click_rate_period_z_score} < -1.96) ;;
    group_label: "Period Comparisons"
  }
  dimension: click_rate_period_better {
    hidden: yes
    type: yesno
    sql:  ${fact.click_rate} > ${last_fact.click_rate} ;;
    group_label: "Period Comparisons"
  }

  dimension: conversion_rate_both_periods {
    hidden: yes
    type: number
    sql:  IF((${fact.conversions} + ${last_fact.conversions}) / NULLIF((${fact.clicks} + ${last_fact.clicks}),0) > 1,
            NULL,
            (${fact.conversions} + ${last_fact.conversions}) / NULLIF((${fact.clicks} + ${last_fact.clicks}),0)) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }

  dimension: conversion_rate_period_z_score {
    hidden: yes
    type: number
    sql:
    (
      (${fact.conversion_rate}) -
      (${last_fact.conversion_rate})
    ) /
    NULLIF(SQRT(
      ${conversion_rate_both_periods} *
      (1 - ${conversion_rate_both_periods}) *
      ((1 / NULLIF(${fact.clicks},0)) + (1 / NULLIF(${last_fact.clicks},0)))
    ),0) ;;
    group_label: "Period Comparisons"
    value_format_name: decimal_2
  }
  dimension: conversion_rate_period_significant {
    hidden: yes
    type: yesno
    sql:  (${fact.conversion_rate_period_z_score} > 1.96) OR
      (${fact.conversion_rate_period_z_score} < -1.96) ;;
    group_label: "Period Comparisons"
  }
  dimension: conversion_rate_period_better {
    hidden: yes
    type: yesno
    sql:  ${fact.conversion_rate} > ${last_fact.conversion_rate} ;;
    group_label: "Period Comparisons"
  }
  measure: total_cost_period_delta {
    hidden: yes
    type: number
    sql: ${fact.total_cost} - ${last_fact.total_cost} ;;
    group_label: "Period Comparisons"
  }
  measure: total_impressions_period_delta {
    hidden: yes
    type: number
    sql: ${fact.total_impressions} - ${last_fact.total_impressions} ;;
    group_label: "Period Comparisons"
  }
  measure: total_clicks_period_delta {
    hidden: yes
    type: number
    sql: ${fact.total_clicks} - ${last_fact.total_clicks} ;;
    group_label: "Period Comparisons"
  }
  measure: total_conversions_period_delta {
    hidden: yes
    type: number
    sql: ${fact.total_conversions} - ${last_fact.total_conversions} ;;
    group_label: "Period Comparisons"
  }
  measure: total_conversionvalue_period_delta {
    hidden: yes
    type: number
    sql: ${fact.total_conversionvalue} - ${last_fact.total_conversionvalue} ;;
    group_label: "Period Comparisons"
  }
  measure: total_cost_period_delta_abs {
    hidden: yes
    type: number
    sql: abs(${fact.total_cost_period_delta}) ;;
    group_label: "Period Comparisons"
  }
  measure: total_impressions_period_delta_abs {
    hidden: yes
    type: number
    sql: abs(${fact.total_impressions_period_delta}) ;;
    group_label: "Period Comparisons"
  }
  measure: total_clicks_period_delta_abs {
    hidden: yes
    type: number
    sql: abs(${fact.total_clicks_period_delta}) ;;
    group_label: "Period Comparisons"
  }
  measure: total_conversions_period_delta_abs {
    hidden: yes
    type: number
    sql: abs(${fact.total_conversions_period_delta}) ;;
    group_label: "Period Comparisons"
  }
  measure: total_conversionvalue_period_delta_abs {
    hidden: yes
    type: number
    sql: abs(${total_conversionvalue_period_delta}) ;;
    group_label: "Period Comparisons"
  }
  measure: average_click_rate_period_percent_change {
    hidden: yes
    type: number
    sql: (${fact.average_click_rate} - ${last_fact.average_click_rate}) / NULLIF(${last_fact.average_click_rate}, 0) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_click_rate_period_percent_change_abs {
    hidden: yes
    type: number
    sql: abs(${fact.average_click_rate_period_percent_change}) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_conversion_rate_period_percent_change {
    hidden: yes
    type: number
    sql: (${fact.average_conversion_rate} - ${last_fact.average_conversion_rate}) / NULLIF(${last_fact.average_conversion_rate}, 0) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_conversion_rate_period_percent_change_abs {
    hidden: yes
    type: number
    sql: abs(${fact.average_conversion_rate_period_percent_change}) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }

  measure: total_impressions_period_percent_change {
    hidden: yes
    type: number
    sql: (${fact.total_impressions} - ${last_fact.total_impressions}) / NULLIF(${last_fact.total_impressions}, 0) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }

  measure: total_impressions_period_percent_change_abs {
    hidden: yes
    type: number
    sql: abs(${fact.total_impressions_period_percent_change}) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }

  measure: average_cost_per_impression_period_percent_change {
    hidden: yes
    type: number
    sql: (${fact.average_cost_per_impression} - ${last_fact.average_cost_per_impression}) / NULLIF(${last_fact.average_cost_per_impression}, 0) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }

  measure: average_cost_per_impression_period_percent_change_abs {
    hidden: yes
    type: number
    sql: abs(${fact.average_cost_per_impression_period_percent_change}) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }

  measure: total_clicks_period_percent_change {
    hidden: yes
    type: number
    sql: (${fact.total_clicks} - ${last_fact.total_clicks}) / NULLIF(${last_fact.total_clicks}, 0) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: total_clicks_period_percent_change_abs {
    hidden: yes
    type: number
    sql: abs(${fact.total_clicks_period_percent_change}) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_cost_per_click_period_percent_change {
    hidden: yes
    type: number
    sql: (${fact.average_cost_per_click} - ${last_fact.average_cost_per_click}) / NULLIF(${last_fact.average_cost_per_click}, 0) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_cost_per_click_period_percent_change_abs {
    hidden: yes
    type: number
    sql: abs(${fact.average_cost_per_click_period_percent_change}) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }

  measure: average_value_per_cost_period_percent_change {
    hidden: yes
    type: number
    sql: (${fact.average_value_per_cost} - ${last_fact.average_value_per_cost}) / NULLIF(${last_fact.average_value_per_cost}, 0) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_value_per_cost_period_percent_change_abs {
    hidden: yes
    type: number
    sql: abs(${fact.average_value_per_cost_period_percent_change}) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_cost_per_conversion_period_percent_change {
    hidden: yes
    type: number
    sql: (${fact.average_cost_per_conversion} - ${last_fact.average_cost_per_conversion}) / NULLIF(${last_fact.average_cost_per_conversion}, 0) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_cost_per_conversion_period_percent_change_abs {
    hidden: yes
    type: number
    sql: abs(${fact.average_cost_per_conversion_period_percent_change}) ;;
    group_label: "Period Comparisons"
    value_format_name: percent_1
  }
  measure: average_click_rate_period_z_score {
    hidden: yes
    type: number
    sql:
    (
      (${fact.average_click_rate}) -
      (${last_fact.average_click_rate})
    ) /
    NULLIF(SQRT(
      (${fact.total_clicks} + ${last_fact.total_clicks}) / (${fact.total_impressions} + ${last_fact.total_impressions}) *
      (1 - (${fact.total_clicks} + ${last_fact.total_clicks}) / (${fact.total_impressions} + ${last_fact.total_impressions})) *
      ((1 / NULLIF(${fact.total_impressions},0)) + (1 / NULLIF(${last_fact.total_impressions},0)))
    ),0) ;;
    group_label: "Period Comparisons"
    value_format_name: decimal_2
  }
  measure: average_click_rate_period_significant {
    hidden: yes
    type: yesno
    sql:  (${fact.average_click_rate_period_z_score} > 1.96) OR
      (${fact.average_click_rate_period_z_score} < -1.96) ;;
    group_label: "Period Comparisons"
  }
  measure: average_click_rate_period_better {
    hidden: yes
    type: yesno
    sql:  ${fact.average_click_rate} > ${last_fact.average_click_rate} ;;
    group_label: "Period Comparisons"
  }
  measure: average_conversion_rate_period_z_score {
    hidden: yes
    type: number
    sql:
    (
      (${fact.average_conversion_rate}) -
      (${last_fact.average_conversion_rate})
    ) /
    NULLIF(SQRT(
      (${fact.total_conversions} + ${last_fact.total_conversions}) / (${fact.total_clicks} + ${last_fact.total_clicks}) *
      (1 - (${fact.total_conversions} + ${last_fact.total_conversions}) / (${fact.total_clicks} + ${last_fact.total_clicks})) *
      ((1 / NULLIF(${fact.total_clicks},0)) + (1 / NULLIF(${last_fact.total_clicks},0)))
    ),0) ;;
    group_label: "Period Comparisons"
    value_format_name: decimal_2
  }
  measure: average_conversion_rate_period_significant {
    hidden: yes
    type: yesno
    sql:  (${fact.average_conversion_rate_period_z_score} > 1.96) OR
      (${fact.average_conversion_rate_period_z_score} < -1.96) ;;
    group_label: "Period Comparisons"
  }
  measure: average_conversion_rate_period_better {
    hidden: yes
    type: yesno
    sql:  ${fact.average_conversion_rate} > ${last_fact.average_conversion_rate} ;;
    group_label: "Period Comparisons"
  }

  dimension: cost_per_click_big_mover {
    hidden: yes
    type: yesno
    sql: ${cost_per_click_period_percent_change_abs} > .2 ;;
    group_label: "Period Comparisons"
  }
  dimension: cost_per_conversion_big_mover {
    hidden: yes
    type: yesno
    sql: ${cost_per_conversion_period_percent_change_abs} > .2 ;;
    group_label: "Period Comparisons"
  }
  dimension: value_per_cost_big_mover {
    hidden: yes
    type: yesno
    sql: ${value_per_cost_period_percent_change_abs} > .2 ;;
    group_label: "Period Comparisons"
  }

  dimension: conversion_rate_big_mover {
    hidden: yes
    type: yesno
    sql: ${conversion_rate_period_percent_change_abs} > .2 AND ${conversion_rate_period_significant};;
    group_label: "Period Comparisons"
  }

  dimension: click_rate_big_mover {
    hidden: yes
    type: yesno
    sql: ${click_rate_period_percent_change_abs} > .2 AND ${click_rate_period_significant};;
    group_label: "Period Comparisons"
  }

  measure: cost_per_conversion_count_big_mover {
    hidden: yes
    type: count_distinct
    sql: ${key_base} ;;
    filters: {
      field: cost_per_conversion_big_mover
      value: "Yes"
    }
    group_label: "Period Comparisons"
  }

  measure: conversion_rate_count_big_mover {
    hidden: yes
    type: count_distinct
    sql: ${key_base} ;;
    filters: {
      field: conversion_rate_big_mover
      value: "Yes"
    }
    group_label: "Period Comparisons"
  }

  measure: click_rate_count_big_mover {
    hidden: yes
    type: count_distinct
    sql: ${key_base} ;;
    filters: {
      field: click_rate_big_mover
      value: "Yes"
    }
    group_label: "Period Comparisons"
  }
}
