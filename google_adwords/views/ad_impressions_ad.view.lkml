include: "/views/**/*.view"
view: ad_impressions_ad {
  extends: [ google_adwords_base,  google_ad_metrics_base]
  sql_table_name: @{GOOGLE_ADS_SCHEMA}.ad_stats ;;



  filter: date_range {
    hidden: yes
    type: date
    convert_tz: no
    sql: ${in_date_range} ;;
  }
  parameter: period {
    description: "Prior Period for Comparison"
    type: string
    allowed_value: {
      value: "day"
      label: "Day"
    }
    allowed_value: {
      value: "week"
      label: "Week (Mon - Sun)"
    }
    allowed_value: {
      value: "month"
      label: "Month"
    }
    allowed_value: {
      value: "quarter"
      label: "Quarter"
    }
    allowed_value: {
      value: "year"
      label: "Year"
    }
    allowed_value: {
      value: "7 day"
      label: "Last 7 Days"
    }
    allowed_value: {
      value: "28 day"
      label: "Last 28 Days"
    }
    allowed_value: {
      value: "91 day"
      label: "Last 91 Days"
    }
    allowed_value: {
      value: "364 day"
      label: "Last 364 Days"
    }
    default_value: "28 day"
  }


  dimension: _date {
    hidden: yes
    type: date_raw
    sql: CAST(${TABLE}.date AS DATE) ;;
  }

  dimension: date_string {
    hidden: yes
    sql: CAST(${TABLE}.date AS STRING) ;;
  }

  dimension: latest {
    hidden: yes
    type: yesno
    sql: 1=1 ;;
  }



  dimension_group: date {
    group_label: "Event"
    label: ""
    type: time
    datatype: date
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year
    ]
    convert_tz: no
    sql: CAST(${_date} as DATE) ;;
  }
  dimension: date_week_date {
    group_label: "Event"
    label: "Week Date"
    hidden: yes
    type: date
    convert_tz: no
    sql: CAST(${date_week} AS DATE) ;;
  }
  dimension: date_month_date {
    group_label: "Event"
    label: "Month Date"
    hidden: yes
    type: date
    convert_tz: no
    sql: DATE_TRUNC(${date_date}, MONTH) ;;
  }
  dimension: date_quarter_date {
    group_label: "Event"
    label: "Quarter Date"
    hidden: yes
    type: date
    convert_tz: no
    sql: DATE_TRUNC(${date_date}, QUARTER) ;;
  }
  dimension: date_year_date {
    group_label: "Event"
    label: "Year Date"
    hidden: yes
    type: date
    convert_tz: no
    sql: DATE_TRUNC(${date_date}, YEAR) ;;
  }
  dimension: date_day_of_quarter {
    group_label: "Event"
    label: "Day of Quarter"
    hidden: yes
    type: number
    sql: DATEDIFF('day',${date_date}, ${date_quarter_date})  ;;
  }
  dimension: date_last_week {
    group_label: "Event"
    label: "Last Week"
    hidden: yes
    type: date
    convert_tz: no
    sql: DATEADD('week',-1,${date_date}) ;;
  }
  dimension: date_last_month {
    group_label: "Event"
    label: "Last Month"
    hidden: yes
    type: date
    convert_tz: no
    sql: DATEADD('month',-1,${date_date});;
  }
  dimension: date_last_quarter {
    group_label: "Event"
    label: "Last Quarter"
    hidden: yes
    type: date
    convert_tz: no
    sql: DATEADD('quarter',-1,${date_date}) ;;
  }
  dimension: date_next_week {
    hidden: yes
    type: date
    convert_tz: no
    sql:  DATEADD('week',1,${date_date});;
  }
  dimension: date_next_month {
    hidden: yes
    type: date
    convert_tz: no
    sql: DATEADD('month',1,${date_date}) ;;
  }
  dimension: date_next_quarter {
    hidden: yes
    type: date
    convert_tz: no
    sql: DATEADD('quarter',1,${date_date}) ;;
  }
  dimension: date_next_year {
    hidden: yes
    type: date
    convert_tz: no
    sql: DATEADD('year',1,${date_date}) ;;
  }
  dimension: date_last_year {
    hidden: yes
    type: date
    convert_tz: no
    sql: DATEADD('year',-1,${date_date}) ;;
  }
  dimension: date_days_prior {
    hidden: yes
    type: number
    sql: DATEDIFF('day',${date_date}, CURRENT_DATE()) ;;
  }
  dimension: date_day_of_7_days_prior {
    hidden: yes
    type: number
    sql: MOD(MOD(${date_days_prior}, 7) + 7, 7) ;;
  }
  dimension: date_day_of_28_days_prior {
    hidden: yes
    type: number
    sql: MOD(MOD(${date_days_prior}, 28) + 28, 28) ;;
  }
  dimension: date_day_of_91_days_prior {
    hidden: yes
    type: number
    sql: MOD(MOD(${date_days_prior}, 91) + 91, 91) ;;
  }
  dimension: date_day_of_364_days_prior {
    hidden: yes
    type: number
    sql: MOD(MOD(${date_days_prior}, 364) + 364, 364) ;;
  }
  dimension: date_date_7_days_prior {
    hidden: yes
    type: date
    convert_tz: no
    sql: DATEADD('day',-${date_day_of_7_days_prior},${date_date}) ;;
  }
  dimension: date_date_28_days_prior {
    hidden: yes
    type: date
    convert_tz: no
    sql: DATEADD('day',-${date_day_of_28_days_prior},${date_date}) ;;
  }
  dimension: date_date_91_days_prior {
    hidden: yes
    type: date
    convert_tz: no
    sql: DATEADD('day',-${date_day_of_91_days_prior},${date_date}) ;;
  }
  dimension: date_date_364_days_prior {
    hidden: yes
    type: date
    convert_tz: no
    sql: DATEADD('day',-${date_day_of_364_days_prior},${date_date}) ;;
  }

  dimension: date_start_date_range {
    hidden: yes
    type: date
    convert_tz: no
    sql: {% date_start date_range %} ;;
  }
  dimension: date_end_date_range {
    hidden: yes
    type: date
    convert_tz: no
    sql: {% date_end date_range %} ;;
  }
  dimension: date_range_difference {
    hidden: yes
    type: number
    sql: DATEDIFF('day',${date_end_date_range}, ${date_start_date_range}) ;;
#     expression: diff_days(${date_end_date_range}, ${date_start_date_range}) ;;
  }
  dimension: in_date_range {
    hidden: yes
    type: yesno
    sql: {% condition date_range %}CAST(${fact.date_raw} AS TIMESTAMP){% endcondition %} ;;
  }
  dimension: date_range_day_of_range_prior {
    hidden: yes
    type: number
    sql: MOD(MOD(${date_days_prior}, ${date_range_difference}) + ${date_range_difference}, ${date_range_difference}) ;;
#     expression: mod(mod(${date_days_prior},  ${date_range_difference}) +  ${date_range_difference},  ${date_range_difference}) ;;
  }
  dimension: date_range_days_prior {
    hidden: yes
    type: date
    convert_tz: no
    sql: DATEADD('day',-${date_range_day_of_range_prior},${date_date}) ;;
#     expression: add_days(-1 * ${date_range_difference}, ${date_date}) ;;
  }
  dimension: date_period {
    type: date
    convert_tz: no
    label_from_parameter: period
    group_label: "Event"
    sql: ({% if fact.period._parameter_value contains "day" %}
        {% if fact.period._parameter_value == "'7 day'" %}${date_date_7_days_prior}
        {% elsif fact.period._parameter_value == "'28 day'" %}${date_date_28_days_prior}
        {% elsif fact.period._parameter_value == "'91 day'" %}${date_date_91_days_prior}
        {% elsif fact.period._parameter_value == "'364 day'" %}${date_date_364_days_prior}
        {% else %}${date_date}
        {% endif %}
        {% elsif fact.period._parameter_value contains "week" %}${date_week}
        {% elsif fact.period._parameter_value contains "month" %}${date_month_date}
        {% elsif fact.period._parameter_value contains "quarter" %}${date_quarter_date}
        {% elsif fact.period._parameter_value contains "year" %}${date_year_date}
      {% endif %}) ;;
    allow_fill: no
  }
  dimension: date_end_of_period {
    type: date
    convert_tz: no
    label_from_parameter: period
    group_label: "Event"
    sql: ({% if fact.period._parameter_value contains "day" %}
        {% if fact.period._parameter_value == "'7 day'" %}DATEADD('day',7,${date_period})
        {% elsif fact.period._parameter_value == "'28 day'" %}DATEADD('day',28,${date_period})
        {% elsif fact.period._parameter_value == "'91 day'" %}DATEADD('day',91,${date_period})
        {% elsif fact.period._parameter_value == "'364 day'" %}DATEADD('day',364,${date_period})
        {% else %}DATEADD('day',1,${date_date})
        {% endif %}
        {% elsif fact.period._parameter_value contains "week" %}DATEADD('week',1,${date_period})
        {% elsif fact.period._parameter_value contains "month" %}DATEADD('month',1,${date_period})
        {% elsif fact.period._parameter_value contains "quarter" %}DATEADD('quarter',1,${date_period})
        {% elsif fact.period._parameter_value contains "year" %}DATEADD('year',1,${date_period})
        {% endif %}) ;;
    allow_fill: no
  }
  dimension: date_period_latest {
    type: yesno
    group_label: "Event"
    sql: ${date_period} < CURRENT_DATE() AND ${date_end_of_period} >= CURRENT_DATE() ;;
    # expression: ${date_period} < now() AND ${date_end_of_period} >= now() ;;
  }
  dimension: date_period_before_latest {
    type: yesno
    group_label: "Event"
    sql: ${date_period} < CURRENT_DATE() ;;
    # expression: ${date_period} < now() ;;
  }
  dimension: date_period_comparison_period {
    hidden: yes
    description: "Is the selected period (This Period) in the last two periods?"
    type: yesno
    group_label: "Event"
    sql: ${date_period} >=
      {% if period._parameter_value contains "day" %}
        {% if period._parameter_value == "'7 day'" %}DATEADD('day',-2*7,CURRENT_DATE())
        {% elsif period._parameter_value == "'28 day'" %}DATEADD('day',-2*28,CURRENT_DATE())
        {% elsif period._parameter_value == "'91 day'" %}DATEADD('day',-2*91,CURRENT_DATE())
        {% elsif period._parameter_value == "'364 day'" %}DATEADD('day',-2*364,CURRENT_DATE())
        {% else %}DATEADD('day',-2*1,CURRENT_DATE())
        {% endif %}
      {% elsif period._parameter_value contains "week" %}DATEADD('week',-2,CURRENT_DATE())
      {% elsif period._parameter_value contains "month" %}DATEADD('month',-2,CURRENT_DATE())
      {% elsif period._parameter_value contains "quarter" %}DATEADD('quarter',-2,CURRENT_DATE())
      {% elsif period._parameter_value contains "year" %}DATEADD('year',-2,CURRENT_DATE())
      {% endif %} ;;
  }
  dimension: date_period_dynamic_grain {
    datatype: date
    hidden: yes
    type: date
    convert_tz: no
    group_label: "Event"
    label: "{% if fact.period._parameter_value contains 'year'
    or fact.period._parameter_value contains '364 day' %}Month{% elsif fact.period._parameter_value contains 'quarter'
    or fact.period._parameter_value contains '91 day' %}Week{% else %}Date{% endif %}"
    sql: {% if fact.period._parameter_value contains 'year'
        or fact.period._parameter_value contains '364 day' %}${date_month_date}
      {% elsif fact.period._parameter_value contains 'quarter'
        or fact.period._parameter_value contains '91 day' %}${date_week}
      {% else %} ${date_raw}
      {% endif %} ;;
    allow_fill: no
  }
  dimension: date_day_of_period {
    hidden: yes
    type: number
    label: "{% if fact.period._parameter_value contains 'day' %}Day of Period
    {% elsif fact.period._parameter_value contains 'week' %}Day of Week
    {% elsif fact.period._parameter_value contains 'month' %}Day of Month
    {% elsif fact.period._parameter_value contains 'quarter' %}Day of Quarter
    {% elsif fact.period._parameter_value contains 'year' %}Day of Year
    {% endif %}"
    group_label: "Event"
    sql: {% if fact.period._parameter_value contains "day" %}
        {% if fact.period._parameter_value == "'7 day'" %}${date_day_of_7_days_prior}
        {% elsif fact.period._parameter_value == "'28 day'" %}${date_day_of_28_days_prior}
        {% elsif fact.period._parameter_value == "'91 day'" %}${date_day_of_91_days_prior}
        {% elsif fact.period._parameter_value == "'364 day'" %}${date_day_of_364_days_prior}
        {% else %}0
        {% endif %}
        {% elsif fact.period._parameter_value contains "week" %}${date_day_of_week_index}
        {% elsif fact.period._parameter_value contains "month" %}${date_day_of_month}
        {% elsif fact.period._parameter_value contains "quarter" %}${date_day_of_quarter}
        {% elsif fact.period._parameter_value contains "year" %}${date_day_of_year}
        {% endif %} ;;
    # html: {{ value | plus: 1 }} - {{ date_date }};;
    # required_fields: [date_date]
    }
    dimension: date_last_period {
      group_label: "Event"
      label: "Prior Period"
      type: date
      convert_tz: no
      sql: DATEADD({% if fact.period._parameter_value contains "day" %}'day'
        {% elsif fact.period._parameter_value contains "week" %}'week'
        {% elsif fact.period._parameter_value contains "month" %}'month'
        {% elsif fact.period._parameter_value contains "quarter" %}'quarter'
        {% elsif fact.period._parameter_value contains "year" %}'year'
        {% endif %},
       -{% if fact.period._parameter_value == "'7 day'" %}7
        {% elsif fact.period._parameter_value == "'28 day'" %}28
        {% elsif fact.period._parameter_value == "'91 day'" %}91
        {% elsif fact.period._parameter_value == "'364 day'" %}364
        {% else %}1
        {% endif %},
        ${date_period}) ;;
      allow_fill: no
    }

    dimension: criterion_id_string {
      hidden: yes
      sql: CAST(${TABLE}.id as STRING) ;;
    }
    dimension: slot {
      hidden: yes
      type: string
      sql: ${TABLE}.slot ;;
    }
    dimension: ad_group_primary_key {
      hidden: yes
      sql: concat(${campaign_primary_key}, "|", ${ad_group_id_string}) ;;
    }
    dimension: campaign_primary_key {
      hidden: yes
      sql: concat(${account_primary_key}, "|", ${campaign_id_string}) ;;
    }
    dimension: account_primary_key {
      hidden: yes
      sql: concat(
              ${date_string}, "|",
              ${ad_network_type1},  "|",
              ${ad_network_type2}, "|",
              ${device}) ;;
    }
    dimension: active_view_impressions {
      hidden: yes
      type: number
      sql: ${TABLE}.active_view_impressions ;;
    }
    dimension: active_view_measurability {
      hidden: yes
      type: number
      sql: ${TABLE}.active_view_measurability ;;
    }
    dimension: active_view_measurable_cost {
      hidden: yes
      type: number
      sql: ${TABLE}.active_view_measurable_cost ;;
    }
    dimension: active_view_measurable_impressions {
      hidden: yes
      type: number
      sql: ${TABLE}.active_view_measurable_impressions ;;
    }
    dimension: active_view_viewability {
      hidden: yes
      type: number
      sql: ${TABLE}.active_view_viewability ;;
    }
    dimension: ad_network_type1 {
      hidden: yes
      type: string
      sql: ${TABLE}.ad_network_type_1 ;;
    }
    dimension: ad_network_type2 {
      hidden: yes
      type: string
      sql: ${TABLE}.ad_network_type_2 ;;
    }
    dimension: device {
      hidden: yes
      type: string
      sql: ${TABLE}.device ;;
    }
    dimension: interaction_types {
      hidden: yes
      type: string
      sql: ${TABLE}.interaction_types ;;
    }
    dimension: view_through_conversions {
      hidden: yes
      type: number
      sql: ${TABLE}.view_through_conversions ;;
    }
    dimension: base_campaign_id {
      hidden: yes
      sql: ${TABLE}.base_campaign_id ;;
    }
    dimension: campaign_id {
      hidden: yes
      sql: ${TABLE}.campaign_id ;;
    }
    dimension: campaign_id_string {
      hidden: yes
      sql: CAST(${TABLE}.campaign_id as STRING) ;;
    }
    dimension: ad_group_id {
      hidden: yes
      sql: ${TABLE}.ad_group_id ;;
    }
    dimension: ad_group_id_string {
      hidden: yes
      sql: CAST(${TABLE}.ad_group_id as STRING) ;;
    }
    dimension: base_ad_group_id {
      hidden: yes
      sql: ${TABLE}.base_ad_group_id ;;
    }
    dimension: keyword_primary_key {
      hidden: yes
      sql: concat(${ad_group_primary_key}, "|", ${criterion_id_string}, "|", ${slot}) ;;
    }
    dimension: ad_primary_key {
      hidden: yes
      sql: concat(${keyword_primary_key}, "|", ${creative_id_string}, "|", ${is_negative_string}) ;;
    }
    dimension: primary_key {
      primary_key: yes
      hidden: yes
      sql: ${ad_primary_key} ;;
    }
    dimension: criterion_id {
      hidden: yes
      sql: ${TABLE}.criterion_id ;;
    }
    dimension: criterion_type {
      hidden: yes
      sql: ${TABLE}.criterion_type ;;
    }
    dimension: creative_id {
      hidden: yes
      sql: ${TABLE}.id ;;
    }
    dimension: creative_id_string {
      hidden: yes
      sql: CAST(${TABLE}.id as STRING) ;;
    }
    dimension: is_negative {
      hidden: yes
      type: yesno
      sql: ${TABLE}.is_negative ;;
    }
    dimension: is_negative_string {
      hidden: yes
      sql: CAST(${TABLE}.is_negative AS STRING) ;;
    }
    dimension: interactions {
      hidden: yes
      type: number
      sql: ${TABLE}.Interactions ;;
    }
    dimension: average_position {
      hidden: yes
      type: number
      sql:0;;
    }
    dimension: clicks {
      hidden: yes
      type: number
      sql: ${TABLE}.clicks ;;
    }
    dimension: conversions {
      hidden: yes
      type: number
      sql: ${TABLE}.conversions ;;
    }
    dimension: conversionvalue {
      hidden: yes
      type: number
      sql: ${TABLE}.conversion_value ;;
    }
    dimension: cost {
      hidden: yes
      type: number
      sql: ${TABLE}.cost ;;
    }
    dimension: impressions {
      hidden: yes
      type: number
      sql: ${TABLE}.impressions ;;
    }
    dimension: click_rate {
      hidden: yes
      label: "Click Through Rate"
      description: "Percent of people that click on an ad."
      type: number
      sql: ${clicks}*1.0/nullif(${impressions},0) ;;
      value_format_name: percent_2
    }
    dimension: cost_per_conversion {
      hidden: yes
      label: "Cost per Conversion"
      description: "Cost per conversion."
      type: number
      sql: ${cost}*1.0 / NULLIF(${conversions},0) ;;
      value_format_name: usd
    }
    dimension: value_per_conversion {
      hidden: yes
      label: "Value per Conversion"
      description: "Conv. Value per conversion."
      type: number
      sql: ${conversionvalue}*1.0 / NULLIF(${conversions},0) ;;
      value_format_name: usd
    }
    dimension: cost_per_click {
      hidden: yes
      label: "Cost per Click"
      description: "Average cost per ad click."
      type: number
      sql: ${cost}*1.0 / NULLIF(${clicks},0) ;;
      value_format_name: usd
    }
    dimension: value_per_click {
      hidden: yes
      label: "Value per Click"
      description: "Conv. Value per Click."
      type: number
      sql: ${conversionvalue}*1.0 / NULLIF(${clicks},0) ;;
      value_format_name: usd
    }
    dimension: cost_per_impression {
      hidden: yes
      label: "CPM"
      description: "Average cost per 1000 ad impressions."
      type: number
      sql: ${cost}*1.0 / NULLIF(${impressions},0) * 1000.0 ;;
      value_format_name: usd
    }
    dimension: value_per_impression {
      hidden: yes
      label: "Value per Impression"
      description: "Conv. Value per Impression."
      type: number
      sql: ${conversionvalue}*1.0 / NULLIF(${impressions},0) ;;
      value_format_name: usd
    }
    dimension: value_per_cost {
      hidden: yes
      label: "ROAS"
      description: "Return on Ad Spend."
      type: number
      sql: ${conversionvalue}*1.0 / NULLIF(${cost},0) ;;
      value_format_name: percent_0
    }
    dimension: conversion_rate {
      hidden: yes
      label: "Conversion Rate"
      description: "Percent of people that convert after they interact with an ad."
      type: number
      sql: ${conversions}*1.0 / NULLIF(${clicks},0) ;;
      value_format_name: percent_2
    }

    measure: average_interaction_rate {
      label: "Interaction Rate"
      description: "Percent of people that interact with an ad."
      type: number
      sql: ${total_interactions}*1.0/nullif(${total_impressions},0) ;;
      value_format_name: percent_2
    }
    measure: average_cost_per_interaction {
      label: "Cost per Interaction"
      description: "Average cost per interaction with an ad."
      type: number
      sql: ${total_cost}*1.0 / NULLIF(${total_interactions},0) ;;
      value_format_name: usd
      link: {
        label: "By Keyword"
        url: "/explore/marketing_analytics/ad_impressions?fields=keyword.criteria,fact.average_cost_per_interaction&f[fact.date_date]=this quarter"
      }
    }
    measure: weighted_average_position {
      label: "Average Position"
      description: "Average auction position."
      type: number
      sql: SUM(${average_position}*${impressions}) / NULLIF(${total_impressions},0) ;;
      value_format_name: decimal_1
    }
    measure: total_interactions {
      label: "Interactions"
      description: "Total ad interactions."
      type:  sum
      sql:  ${interactions} ;;
      drill_fields: [ total_impressions]
      value_format_name: decimal_0
    }
    measure: average_click_rate {
      label: "Click Through Rate"
      description: "Percent of people that click on an ad."
      type: number
      sql: ${total_clicks}*1.0/nullif(${total_impressions},0) ;;
      value_format_name: percent_2
      drill_fields: [fact.date_date, campaign.name, average_click_rate]
    }
    measure: average_cost_per_conversion {
      label: "Cost per Conversion"
      description: "Cost per conversion."
      type: number
      sql: ${total_cost}*1.0 / NULLIF(${total_conversions},0) ;;
      value_format_name: usd
      drill_fields: [fact.date_date, campaign.name, fact.total_conversions, fact.total_cost, fact.average_cost_per_conversion]
    }
    measure: average_cost_per_value {
      label: "Cost per value"
      description: "Cost per value."
      type: number
      sql: ${total_cost}*1.0 / NULLIF(${total_conversionvalue},0) ;;
      value_format_name: usd
      drill_fields: [fact.date_date, campaign.name, fact.total_conversionvalue, fact.total_cost, fact.average_cost_per_conversion]
    }
    measure: average_value_per_conversion {
      label: "Value per Conversion"
      description: "Average value per conversion."
      type: number
      sql: ${total_conversionvalue}*1.0 / NULLIF(${total_conversions},0) ;;
      value_format_name: usd
    }
    measure: average_cost_per_click {
      label: "Cost per Click"
      description: "Average cost per ad click."
      type: number
      sql: ${total_cost}*1.0 / NULLIF(${total_clicks},0) ;;
      value_format_name: usd
      drill_fields: [fact.date_date, campaign.name, average_cost_per_click]
    }
    measure: average_value_per_click {
      label: "Value per Click"
      description: "Average value per ad click."
      type: number
      sql: ${total_conversionvalue}*1.0 / NULLIF(${total_clicks},0) ;;
      value_format_name: usd
    }
    measure: average_cost_per_impression {
      label: "CPM"
      description: "Average cost per ad impression viewed."
      type: number
      sql: ${total_cost}*1.0 / NULLIF(${total_impressions},0) * 1000.0 ;;
      value_format_name: usd
    }
    measure: average_value_per_impression {
      label: "Value per Impression"
      description: "Average value per ad impression viewed."
      type: number
      sql: ${total_conversionvalue}*1.0 / NULLIF(${total_impressions},0) ;;
      value_format_name: usd
    }
    measure: average_value_per_cost {
      label: "ROAS"
      description: "Average Return on Ad Spend."
      type: number
      sql: ${total_conversionvalue}*1.0 / NULLIF(${total_cost},0) ;;
      value_format_name: percent_0
    }
    measure: average_conversion_rate {
      label: "Conversion Rate"
      description: "Percent of people that convert after they interact with an ad."
      type: number
      sql: ${total_conversions}*1.0 / NULLIF(${total_clicks},0) ;;
      value_format_name: percent_2
      drill_fields: [fact.date_date, campaign.name, average_conversion_rate]
    }
    measure: cumulative_spend {
      type: running_total
      sql: ${total_cost} ;;
      drill_fields: [fact.date_date, campaign.name, fact.total_cost]
      value_format_name: usd_0
      direction: "column"
    }
    measure: cumulative_conversions {
      type: running_total
      sql: ${total_conversions} ;;
      drill_fields: [fact.date_date, campaign.name, fact.total_conversions]
      value_format_name: decimal_0
      direction: "column"
    }
    measure: total_clicks {
      label: "Clicks"
      description: "Total ad clicks."
      type: sum
      sql: ${clicks} ;;
      value_format_name: decimal_0
      drill_fields: [fact.date_date, campaign.name, total_clicks]
    }
    measure: total_conversions {
      label: "Conversions"
      description: "Total conversions."
      type: sum
      sql: ${conversions} ;;
      value_format_name: decimal_0
      drill_fields: [fact.date_date, campaign.name, total_conversions]
    }
    measure: total_conversionvalue {
      label: "Conv. Value"
      description: "Total conversion value."
      type: sum
      sql: ${conversionvalue} ;;
      value_format_name: usd_0
    }
    measure: total_cost {
      label: "Cost"
      description: "Total cost."
      type: sum
      sql: ${cost} ;;
      value_format_name: usd_0
      drill_fields: [fact.date_date, campaign.name, total_cost]
    }
    measure: total_impressions {
      label: "Impressions"
      description: "Total ad impressions."
      type:  sum
      sql:  ${impressions} ;;
      value_format_name: decimal_0
    }
    set: ad_metrics_set {
      fields: [
        cost,
        impressions,
        clicks,
        conversions,
        conversionvalue,
        click_rate,
        conversion_rate,
        cost_per_impression,
        cost_per_click,
        cost_per_conversion,
        total_cost,
        total_impressions,
        total_clicks,
        total_conversions,
        total_conversionvalue,
        average_click_rate,
        average_conversion_rate,
        average_cost_per_impression,
        average_cost_per_click,
        average_cost_per_conversion,
        cumulative_conversions,
        cumulative_spend,
        average_value_per_cost
      ]
    }

  }
