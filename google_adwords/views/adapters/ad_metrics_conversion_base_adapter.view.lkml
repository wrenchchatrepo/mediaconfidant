view: ad_metrics_conversion_base_adapter {
  extension: required

  measure: total_conversions {
    hidden: yes
    label: "Conversions"
    description: "Total conversions."
    type: sum
    sql: ${conversions} ;;
    value_format_name: decimal_0
  }

  measure: total_conversionvalue {
    hidden: yes
    label: "Conv. Value"
    description: "Total conversion value."
    type: sum
    sql: ${conversionvalue} ;;
    value_format_name: usd_0
  }

  measure: average_value_per_conversion {
    hidden: yes
    label: "Value per Conversion"
    description: "Average value per conversion."
    type: number
    sql: ${total_conversionvalue}*1.0 / NULLIF(${total_conversions},0) ;;
    value_format_name: usd
  }

  measure: average_cost_per_conversion {
    hidden: yes
    label: "Cost per Conversion"
    description: "Cost per conversion."
    type: number
    sql: ${fact.total_cost}*1.0 / NULLIF(${total_conversions},0) ;;
    value_format_name: usd
  }

  measure: average_value_per_click {
    hidden: yes
    label: "Value per Click"
    description: "Average value per ad click."
    type: number
    sql: ${total_conversionvalue}*1.0 / NULLIF(${fact.total_clicks},0) ;;
    value_format_name: usd
  }

  measure: average_value_per_impression {
    hidden: yes
    label: "Value per Impression"
    description: "Average value per ad impression viewed."
    type: number
    sql: ${total_conversionvalue}*1.0 / NULLIF(${fact.total_impressions},0) ;;
    value_format_name: usd
  }

  measure: average_value_per_cost {
    hidden: yes
    label: "ROAS"
    description: "Average Return on Ad Spend."
    type: number
    sql: ${total_conversionvalue}*1.0 / NULLIF(${fact.total_cost},0) ;;
    value_format_name: percent_0
  }

  measure: average_conversion_rate {
    hidden: yes
    label: "Conversion Rate"
    description: "Percent of people that convert after they interact with an ad."
    type: number
    sql: ${total_conversions}*1.0 / NULLIF(${fact.total_clicks},0) ;;
    value_format_name: percent_2
  }
}
