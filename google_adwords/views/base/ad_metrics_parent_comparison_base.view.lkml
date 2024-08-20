view: ad_metrics_parent_comparison_base {
  extension: required

  dimension: cost_delta {
    hidden: yes
    type: number
    sql: ${parent_fact.cost} - ${fact.cost} ;;
    group_label: "Parent Comparisons"
  }
  measure: total_cost_delta {
    hidden: yes
    type: number
    sql: ${parent_fact.total_cost} - ${fact.total_cost} ;;
    group_label: "Parent Comparisons"
  }
  dimension: impressions_delta {
    hidden: yes
    type: number
    sql: ${parent_fact.impressions} - ${fact.impressions} ;;
    group_label: "Parent Comparisons"
  }
  measure: total_impressions_delta {
    hidden: yes
    type: number
    sql: ${parent_fact.total_impressions} - ${fact.total_impressions} ;;
    group_label: "Parent Comparisons"
  }
  dimension: clicks_delta {
    hidden: yes
    type: number
    sql: ${parent_fact.clicks} - ${fact.clicks} ;;
    group_label: "Parent Comparisons"
  }
  measure: total_clicks_delta {
    hidden: yes
    type: number
    sql: ${parent_fact.total_clicks} - ${fact.total_clicks} ;;
    group_label: "Parent Comparisons"
  }
  dimension: conversions_delta {
    hidden: yes
    type: number
    sql: ${parent_fact.conversions} - ${fact.conversions} ;;
    group_label: "Parent Comparisons"
  }
  measure: total_conversions_delta {
    hidden: yes
    type: number
    sql: ${parent_fact.total_conversions} - ${fact.total_conversions} ;;
    group_label: "Parent Comparisons"
  }
  dimension: conversionvalue_delta {
    hidden: yes
    type: number
    sql: ${parent_fact.conversionvalue} - ${fact.conversionvalue} ;;
    group_label: "Parent Comparisons"
  }
  measure: total_conversionvalue_delta {
    hidden: yes
    type: number
    sql: ${parent_fact.total_conversionvalue} - ${fact.total_conversionvalue};;
    group_label: "Parent Comparisons"
  }
  dimension: click_rate_ratio {
    hidden: yes
    type: number
    sql: ${fact.click_rate} / NULLIF(${parent_fact.click_rate},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  measure: average_click_rate_ratio {
    hidden: yes
    type: number
    sql: ${fact.average_click_rate} / NULLIF(${parent_fact.average_click_rate},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  dimension: conversion_rate_ratio {
    hidden: yes
    type: number
    sql: ${fact.conversion_rate} / NULLIF(${parent_fact.conversion_rate},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  measure: average_conversion_rate_ratio {
    hidden: yes
    type: number
    sql: ${fact.average_conversion_rate} / NULLIF(${parent_fact.average_conversion_rate},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  dimension: cost_per_conversion_delta {
    hidden: yes
    type: number
    sql: ${fact.cost_delta}*1.0 / NULLIF(${fact.conversions_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: usd
  }
  measure: average_cost_per_conversion_delta {
    hidden: yes
    type: number
    sql: ${fact.total_cost_delta}*1.0 / NULLIF(${fact.total_conversions_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: usd
  }
  dimension: value_per_cost_delta {
    hidden: yes
    type: number
    sql: ${fact.conversionvalue_delta}*1.0 / NULLIF(${fact.cost_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_1
  }
  measure: average_value_per_cost_delta {
    hidden: yes
    type: number
    sql: ${fact.total_conversionvalue_delta}*1.0 / NULLIF(${fact.total_cost_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: usd
  }
  dimension: cost_per_click_delta {
    hidden: yes
    type: number
    sql: ${fact.cost_delta}*1.0 / NULLIF(${fact.clicks_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: usd
  }
  measure: average_cost_per_click_delta {
    hidden: yes
    type: number
    sql: ${fact.total_cost_delta}*1.0 / NULLIF(${fact.total_clicks_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: usd
    drill_fields: [fact.date_date, campaign.name, average_cost_per_click]
  }
  dimension: cost_per_impression_delta {
    hidden: yes
    type: number
    sql: ${fact.cost_delta}*1.0 / NULLIF(${fact.impressions_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: usd
  }
  dimension: value_per_cost_delta_ratio {
    hidden: yes
    type: number
    sql: ${fact.value_per_cost} / NULLIF(${fact.value_per_cost_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  measure: average_value_per_cost_delta_ratio {
    hidden: yes
    type: number
    sql: ${fact.average_value_per_cost} / NULLIF(${fact.average_value_per_cost_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  measure: average_cost_per_impression_delta {
    hidden: yes
    type: number
    sql: ${fact.total_cost_delta}*1.0 / NULLIF(${fact.total_impressions_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: usd
  }
  dimension: cost_per_conversion_delta_ratio {
    hidden: yes
    type: number
    sql: ${fact.cost_per_conversion} / NULLIF(${fact.cost_per_conversion_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  measure: average_cost_per_conversion_delta_ratio {
    hidden: yes
    type: number
    sql: ${fact.average_cost_per_conversion} / NULLIF(${fact.average_cost_per_conversion_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  dimension: cost_per_click_delta_ratio {
    hidden: yes
    type: number
    sql: ${fact.cost_per_click} / NULLIF(${fact.cost_per_click_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  measure: average_cost_per_click_delta_ratio {
    hidden: yes
    type: number
    sql: ${fact.average_cost_per_click} / NULLIF(${fact.average_cost_per_click_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  dimension: cost_per_impression_delta_ratio {
    hidden: yes
    type: number
    sql: ${fact.cost_per_impression} / NULLIF(${cost_per_impression_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  measure: average_cost_per_impression_delta_ratio {
    hidden: yes
    type: number
    sql: ${fact.average_cost_per_impression} / NULLIF(${average_cost_per_impression_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  dimension: click_rate_delta {
    hidden: yes
    type: number
    sql: ${fact.clicks_delta}*1.0/NULLIF(${fact.impressions_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: percent_2
  }
  measure: average_click_rate_delta {
    hidden: yes
    type: number
    sql: ${fact.total_clicks_delta}*1.0/NULLIF(${fact.total_impressions_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: percent_2
  }
  dimension: conversion_rate_delta {
    hidden: yes
    type: number
    sql: ${fact.conversions_delta}*1.0/NULLIF(${fact.clicks_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: percent_2
  }
  measure: average_conversion_rate_delta {
    hidden: yes
    type: number
    sql: ${fact.total_conversions_delta}*1.0/NULLIF(${fact.total_clicks_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: percent_2
  }
  dimension: click_rate_delta_ratio {
    hidden: yes
    type: number
    sql: ${fact.click_rate} / NULLIF(${click_rate_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  measure: average_click_rate_delta_ratio {
    hidden: yes
    type: number
    sql: ${fact.average_click_rate} / NULLIF(${average_click_rate_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  dimension: conversion_rate_delta_ratio {
    hidden: yes
    type: number
    sql: ${fact.conversion_rate} / NULLIF(${conversion_rate_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  dimension: click_rate_or_cost_per_conversion_or_conversion_rate_bad {
    hidden: yes
    type: yesno
    sql: ${conversion_rate_bad} = true OR ${click_rate_bad} = true OR ${cost_per_conversion_bad} = true;;
    group_label: "Parent Comparisons"
  }

  measure: click_rate_or_cost_per_conversion_or_conversion_rate_count_bad {
    hidden: yes
    type: count_distinct
    sql: ${key_base} ;;
    filters: {
      field: click_rate_or_cost_per_conversion_or_conversion_rate_bad
      value: "Yes"
    }
    group_label: "Parent Comparisons"
  }

  measure: average_conversion_rate_delta_ratio {
    hidden: yes
    type: number
    sql: ${fact.average_conversion_rate} / NULLIF(${average_conversion_rate_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }

  dimension: click_rate_z_score {
    hidden: yes
    type: number
    sql:
    (
     (${fact.click_rate}) -
     (${fact.click_rate_delta})
    ) /
    NULLIF(SQRT(
     ${parent_fact.click_rate}  *
     (1 - IF(${parent_fact.click_rate}>1, NULL, ${parent_fact.click_rate})) *
     ((1 / IF(${fact.impressions}<=0, NULL, ${fact.impressions})) + (1 / IF(${fact.impressions_delta}<=0, NULL, ${fact.impressions_delta})))
    ),0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }

  measure: average_click_rate_z_score {
    hidden: yes
    type: number
    sql:
        (
         (${fact.average_click_rate}) -
         (${fact.average_click_rate_delta})
        ) /
        NULLIF(SQRT(
          ${parent_fact.average_click_rate} *
          (
            1 -
                IF(${parent_fact.average_click_rate} > 1,
                NULL,
                ${parent_fact.average_click_rate})
          ) *
          (
            (1 /
              IF(${fact.total_impressions} <= 0,
              NULL,
              ${fact.total_impressions})
            ) +
            (1 /
              IF(${fact.total_impressions_delta} <= 0,
              NULL,
             ${fact.total_impressions_delta})
            )
          )
        ),0)
    ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }

  dimension: click_rate_significant {
    hidden: yes
    type: yesno
    sql:  (${fact.click_rate_z_score} > 1.96) OR
      (${fact.click_rate_z_score} < -1.96) ;;
    group_label: "Parent Comparisons"
  }
  measure: average_click_rate_significant {
    hidden: yes
    type: yesno
    sql:  (${fact.average_click_rate_z_score} > 1.96) OR
      (${fact.average_click_rate_z_score} < -1.96) ;;
    group_label: "Parent Comparisons"
  }
  dimension: click_rate_better {
    hidden: yes
    type: yesno
    sql:  ${fact.click_rate} > ${parent_fact.click_rate} ;;
    group_label: "Parent Comparisons"
  }
  measure: average_click_rate_better {
    hidden: yes
    type: yesno
    sql:  ${fact.average_click_rate} > ${parent_fact.average_click_rate} ;;
    group_label: "Parent Comparisons"
  }

  dimension: conversion_rate_z_score {
    hidden: yes
    type: number
    sql:
    (
      (${fact.conversion_rate}) -
      (${fact.conversion_rate_delta})
    ) /
    NULLIF(SQRT(
      ${parent_fact.conversion_rate} *
       (1 - IF(${parent_fact.conversion_rate} > 1, NULL, ${parent_fact.conversion_rate})) *
      ((1 / IF(${fact.clicks} <=0, NULL, ${fact.clicks})) + (1 / IF(${fact.clicks_delta}<=0, NULL, ${fact.clicks_delta})))
    ),0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }

  measure: average_conversion_rate_z_score {
    hidden: yes
    type: number
    sql:
        (
         (${fact.average_conversion_rate}) -
         (${fact.average_conversion_rate_delta})
        ) /
        NULLIF(SQRT(
          ${parent_fact.average_conversion_rate} *
          (
            1 -
              IF(${parent_fact.average_conversion_rate} > 1,
              NULL,
              ${parent_fact.average_conversion_rate})
          ) *
          (
            (1 /
              IF(${fact.total_clicks} <= 0,
              NULL,
              ${fact.total_clicks})
            ) +
            (1 /
              IF (${fact.total_clicks_delta} <= 0,
              NULL,
              ${fact.total_clicks_delta})
            )
          )
        ),0)
    ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }

  dimension: conversion_rate_significant {
    hidden: yes
    type: yesno
    sql:  (${fact.conversion_rate_z_score} > 1.96) OR
      (${fact.conversion_rate_z_score} < -1.96) ;;
    group_label: "Parent Comparisons"
  }
  measure: average_conversion_rate_significant {
    hidden: yes
    type: yesno
    sql:  (${fact.average_conversion_rate_z_score} > 1.96) OR
      (${fact.average_conversion_rate_z_score} < -1.96) ;;
    group_label: "Parent Comparisons"
  }
  dimension: conversion_rate_better {
    hidden: yes
    type: yesno
    sql:  ${fact.conversion_rate} > ${parent_fact.conversion_rate} ;;
    group_label: "Parent Comparisons"
  }
  measure: average_conversion_rate_better {
    hidden: yes
    type: yesno
    sql:  ${fact.average_conversion_rate} > ${parent_fact.average_conversion_rate} ;;
    group_label: "Parent Comparisons"
  }

  dimension: cost_per_conversion_better {
    hidden: yes
    type: yesno
    sql:  ${fact.cost_per_conversion} < ${parent_fact.cost_per_conversion} ;;
    group_label: "Parent Comparisons"
  }

  dimension: cost_per_conversion_good {
    hidden: yes
    type: yesno
    sql: ${cost_per_conversion_better} AND ${conversion_rate_significant} ;;
    group_label: "Parent Comparisons"
  }

  dimension: value_per_cost_better {
    hidden: yes
    type: yesno
    sql:  ${fact.value_per_cost} < ${parent_fact.value_per_cost} ;;
    group_label: "Parent Comparisons"
  }

  dimension: value_per_cost_good {
    hidden: yes
    type: yesno
    sql: ${value_per_cost_better} AND ${conversion_rate_significant} ;;
    group_label: "Parent Comparisons"
  }

  dimension: conversion_rate_good {
    hidden: yes
    type: yesno
    sql: ${conversion_rate_better} AND ${conversion_rate_significant} ;;
    group_label: "Parent Comparisons"
  }

  dimension: click_rate_good {
    hidden: yes
    type: yesno
    sql: ${click_rate_better} AND ${click_rate_significant} ;;
    group_label: "Parent Comparisons"
  }

  measure: cost_per_conversion_count_good {
    hidden: yes
    type: count_distinct
    sql: ${key_base} ;;
    filters: {
      field: cost_per_conversion_good
      value: "Yes"
    }
    group_label: "Parent Comparisons"
  }

  measure: conversion_rate_count_good {
    hidden: yes
    type: count_distinct
    sql: ${key_base} ;;
    filters: {
      field: conversion_rate_good
      value: "Yes"
    }
    group_label: "Parent Comparisons"
  }

  measure: click_rate_count_good {
    hidden: yes
    type: count_distinct
    sql: ${key_base} ;;
    filters: {
      field: click_rate_good
      value: "Yes"
    }
    group_label: "Parent Comparisons"
  }

  dimension: cost_per_conversion_bad {
    hidden: yes
    type: yesno
    sql: (NOT ${cost_per_conversion_better} OR ${conversions} = 0) AND ${conversion_rate_significant} ;;
    group_label: "Parent Comparisons"
  }

  dimension: conversion_rate_bad {
    hidden: yes
    type: yesno
    sql: NOT ${conversion_rate_better} AND ${conversion_rate_significant} ;;
    group_label: "Parent Comparisons"
  }

  dimension: click_rate_bad {
    hidden: yes
    type: yesno
    sql: NOT ${click_rate_better} AND ${click_rate_significant} ;;
    group_label: "Parent Comparisons"
  }
  dimension: value_per_cost_bad {
    hidden: yes
    type: yesno
    sql: NOT ${value_per_cost_better} AND ${conversion_rate_significant} ;;
    group_label: "Parent Comparisons"
  }

  measure: cost_per_conversion_count_bad {
    hidden: yes
    type: count_distinct
    sql: ${key_base} ;;
    filters: {
      field: cost_per_conversion_bad
      value: "Yes"
    }
    group_label: "Parent Comparisons"
  }

  measure: conversion_rate_count_bad {
    hidden: yes
    type: count_distinct
    sql: ${key_base} ;;
    filters: {
      field: conversion_rate_bad
      value: "Yes"
    }
    group_label: "Parent Comparisons"
  }

  measure: click_rate_count_bad {
    hidden: yes
    type: count_distinct
    sql: ${key_base} ;;
    filters: {
      field: click_rate_bad
      value: "Yes"
    }
    group_label: "Parent Comparisons"
  }
}
