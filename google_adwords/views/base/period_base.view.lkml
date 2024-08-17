view: period_base {
  extension: required

  filter: date_range {
    hidden: yes
    type: date
    convert_tz: no
    sql: ${in_date_range} ;;
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
      {% elsif period._parameter_value contains "week" %}DATEADD('week',2,${date_period})
      {% elsif period._parameter_value contains "month" %}DATEADD('month',2,${date_period})
      {% elsif period._parameter_value contains "quarter" %}DATEADD('quarter',2,${date_period})
      {% elsif period._parameter_value contains "year" %}DATEADD('year',2,${date_period})
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
      sql: DATEADD(        {% if fact.period._parameter_value contains "day" %}'day'
        {% elsif fact.period._parameter_value contains "week" %}'week'
        {% elsif fact.period._parameter_value contains "month" %}'month'
        {% elsif fact.period._parameter_value contains "quarter" %}'quarter'
        {% elsif fact.period._parameter_value contains "year" %}'year'
        {% endif %},-{% if fact.period._parameter_value == "'7 day'" %}7
        {% elsif fact.period._parameter_value == "'28 day'" %}28
        {% elsif fact.period._parameter_value == "'91 day'" %}91
        {% elsif fact.period._parameter_value == "'364 day'" %}364
        {% else %}1
        {% endif %},${date_period}) ;;
      allow_fill: no
    }
  }
