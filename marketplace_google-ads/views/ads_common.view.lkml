view: ads_common{
  extension: required

# Drill Selector
  parameter: drill_by {
    type: string
    default_value: "campaign"
    allowed_value: { label: "Account" value: "account" }
    allowed_value: { label: "Campaign" value: "campaign" }
    allowed_value: { label: "Ad Group" value: "ad_group" }
    allowed_value: { label: "Ad Desc." value: "ad" }
    allowed_value: { label: "Keyword" value: "keyword" }
  }

  dimension: drill_field {
    hidden: yes
    type: string
    label_from_parameter: drill_by
    sql:
      {% case  drill_by._parameter_value %}
        {% when "'account'" %}
          ${customer.account_descriptive_name}
        {% when "'campaign'" %}
          ${campaign.campaign_name}
        {% when "'ad_group'" %}
          ${ad_group.ad_group_name}
        {% when "'ad'" %}
          ${ad.description}
        {% when "'keyword'" %}
          ${keyword.criteria}
        {% else %}
         null
      {% endcase %} ;;
      drill_fields: [customer.account_descriptive_name,campaign.campaign_name,ad_group.ad_group_name,ad.description,keyword.criteria]
    link: {
      label: "{% case  drill_by._parameter_value %}
                {% when \"'campaign'\" %} See {{value}} Detail Dashboard
              {% else %} Drill Dashboard Not Implemented
              {% endcase %}"
      url:  "{% case  drill_by._parameter_value %}
               {% when \"'campaign'\" %} /dashboards/block_google_ads_transfer_v2::campaign_details_lookup?CampaignName={{ value }}&Period={{ fact.period._parameter_value | replace: \"'\", '' | url_encode }}
              {% else %} https://github.com/looker/block-google-ads-transfer-v2/issues
              {% endcase %}"
      ##TODO - all objects##
    }
  }


  dimension: click_rate {
    hidden: yes
    label: "Click Through Rate"
    description: "Percent of people that click on an ad."
    type: number
    sql: ${clicks}*1.0/nullif(${impressions},0) ;;
    value_format_name: percent_2
    drill_fields: [drill_field, click_rate]
  }

  dimension: cost_per_conversion {
    hidden: yes
    label: "Cost per Conversion"
    description: "Cost per conversion."
    type: number
    sql: ${cost}*1.0 / NULLIF(${conversions},0) ;;
    value_format_name: large_usd
    drill_fields: [drill_field, cost_per_conversion]
  }

  dimension: value_per_conversion {
    hidden: yes
    label: "Value per Conversion"
    description: "Conv. Value per conversion."
    type: number
    sql: ${conversion_value}*1.0 / NULLIF(${conversions},0) ;;
    value_format_name: large_usd
    drill_fields: [drill_field, value_per_conversion]
  }

  dimension: cost_per_click {
    hidden: yes
    label: "Cost per Click"
    description: "Average cost per ad click."
    type: number
    sql: ${cost}*1.0 / NULLIF(${clicks},0) ;;
    value_format_name: large_usd
    drill_fields: [drill_field, cost_per_click]
  }

  dimension: value_per_click {
    hidden: yes
    label: "Value per Click"
    description: "Conv. Value per Click."
    type: number
    sql: ${conversion_value}*1.0 / NULLIF(${clicks},0) ;;
    value_format_name: large_usd
    drill_fields: [drill_field, value_per_click]
  }

  dimension: cost_per_impression {
    hidden: yes
    label: "CPM"
    description: "Average cost per 1000 ad impressions."
    type: number
    sql: ${cost}*1.0 / NULLIF(${impressions},0) * 1000.0 ;;
    value_format_name: large_usd
    drill_fields: [drill_field, cost_per_impression]
  }

  dimension: value_per_impression {
    hidden: yes
    label: "Value per Impression"
    description: "Conv. Value per Impression."
    type: number
    sql: ${conversion_value}*1.0 / NULLIF(${impressions},0) ;;
    value_format_name: large_usd
    drill_fields: [drill_field, average_value_per_impression]

  }

  dimension: value_per_cost {
    hidden: yes
    label: "ROAS"
    description: "Return on Ad Spend."
    type: number
    sql: ${conversion_value}*1.0 / NULLIF(${cost},0) ;;
    value_format_name: percent_0
    drill_fields: [drill_field, value_per_cost]
  }

  dimension: conversion_rate {
    hidden: yes
    label: "Conversion Rate"
    description: "Percent of people that convert after they interact with an ad."
    type: number
    sql: ${conversions}*1.0 / NULLIF(${clicks},0) ;;
    value_format_name: percent_2
    drill_fields: [drill_field, conversion_rate]
  }


  measure: average_click_rate {
    label: "Click Through Rate"
    description: "Percent of people that click on an ad."
    type: number
    sql: ${total_clicks}*1.0/nullif(${total_impressions},0) ;;
    value_format_name: percent_2
    drill_fields: [drill_field, average_click_rate]
  }

  measure: average_cost_per_conversion {
    label: "Cost per Conversion"
    description: "Cost per conversion."
    type: number
    sql: ${total_cost}*1.0 / NULLIF(${total_conversions},0) ;;
    value_format_name: large_usd
    drill_fields: [drill_field,average_cost_per_conversion]
  }

  measure: average_cost_per_value {
    label: "Cost per value"
    description: "Cost per value."
    type: number
    sql: ${total_cost}*1.0 / NULLIF(${total_conversionvalue},0) ;;
    value_format_name: large_usd
    drill_fields: [drill_field, average_cost_per_conversion]
  }

  measure: average_value_per_conversion {
    label: "Value per Conversion"
    description: "Average value per conversion."
    type: number
    sql: ${total_conversionvalue}*1.0 / NULLIF(${total_conversions},0) ;;
    value_format_name: large_usd
    drill_fields: [drill_field, average_value_per_conversion]
  }

  measure: average_cost_per_click {
    label: "Cost per Click"
    description: "Average cost per ad click."
    type: number
    sql: ${total_cost}*1.0 / NULLIF(${total_clicks},0) ;;
    value_format_name: large_usd
    drill_fields: [drill_field, average_cost_per_click]
  }

  measure: average_value_per_click {
    label: "Value per Click"
    description: "Average value per ad click."
    type: number
    sql: ${total_conversionvalue}*1.0 / NULLIF(${total_clicks},0) ;;
    value_format_name: large_usd
    drill_fields: [drill_field,average_value_per_click]
  }

  measure: average_cost_per_impression {
    label: "CPM"
    description: "Average cost per ad impression viewed."
    type: number
    sql: ${total_cost}*1.0 / NULLIF(${total_impressions},0) * 1000.0 ;;
    value_format_name: large_usd
    drill_fields: [drill_field,average_cost_per_impression]
  }

  measure: average_value_per_impression {
    label: "Value per Impression"
    description: "Average value per ad impression viewed."
    type: number
    sql: ${total_conversionvalue}*1.0 / NULLIF(${total_impressions},0) ;;
    value_format_name: large_usd
    drill_fields: [drill_field,average_value_per_impression]
  }

  measure: average_value_per_cost {
    label: "ROAS"
    description: "Average Return on Ad Spend."
    type: number
    sql: ${total_conversionvalue}*1.0 / NULLIF(${total_cost},0) ;;
    value_format_name: percent_0
    drill_fields: [drill_field,average_value_per_cost]
  }

  measure: average_conversion_rate {
    label: "Conversion Rate"
    description: "Percent of people that convert after they interact with an ad."
    type: number
    sql: ${total_conversions}*1.0 / NULLIF(${total_clicks},0) ;;
    value_format_name: percent_2
    drill_fields: [drill_field, average_conversion_rate]
  }

  measure: cumulative_spend {
    type: running_total
    sql: ${total_cost} ;;
    drill_fields: [drill_field, total_cost]
    value_format_name: large_usd
    direction: "column"
  }

  measure: cumulative_conversions {
    type: running_total
    sql: ${total_conversions} ;;
    drill_fields: [drill_field, total_conversions]
    value_format_name: large_number
    direction: "column"
  }

  measure: total_clicks {
    label: "Clicks"
    description: "Total ad clicks."
    type: sum
    sql: ${clicks} ;;
    value_format_name: large_number
    drill_fields: [drill_field, total_clicks]
  }

  measure: total_conversions {
    label: "Conversions"
    description: "Total conversions. Note decimal numbers (i.e. 0.5) mean you're using a non-last-click attribution method."
    type: sum
    sql: ${conversions} * 1.0 ;;
    value_format_name: decimal_2
    drill_fields: [drill_field, total_conversions]
  }

  measure: total_conversionvalue {
    label: "Conv. Value"
    description: "Total conversion value."
    type: sum
    sql: ${conversion_value} ;;
    value_format_name: large_usd
    drill_fields: [drill_field, total_conversionvalue]
  }

  measure: total_cost {
    label: "Cost"
    description: "Total cost."
    type: sum
    sql: ${cost} ;;
    value_format_name: large_usd
    drill_fields: [drill_field, total_cost]
  }

  measure: avg_cost {
    label: "avg. Cost"
    description: "Average cost."
    type: average
    sql: ${cost} ;;
    value_format_name: large_usd
    drill_fields: [drill_field, total_cost]
  }

  measure: total_impressions {
    label: "Impressions"
    description: "Total ad impressions."
    type:  sum
    sql:  ${impressions} ;;
    drill_fields: [drill_field, total_impressions]
    value_format_name: large_number
  }

  measure: total_view_through_conversions {
    label: "View Through Conversions"
    type: sum
    description: "These happen when a customer sees a Display network ad, then later completes a conversion on your site without interacting with (e.g. clicking on) another ad."
    sql: ${view_through_conversions} ;;
    drill_fields: [drill_field,  total_view_through_conversions]
  }

}
