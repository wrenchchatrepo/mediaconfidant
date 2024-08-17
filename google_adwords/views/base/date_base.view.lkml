view: date_base {
  extension: required

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
    sql: DATEADD('week',1,${date_date}) ;;
  }

  dimension: date_last_month {
    group_label: "Event"
    label: "Last Month"
    hidden: yes
    type: date
    convert_tz: no
    sql: DATEADD('month',1,${date_date});;
  }

  dimension: date_last_quarter {
    group_label: "Event"
    label: "Last Quarter"
    hidden: yes
    type: date
    convert_tz: no
    sql: DATEADD('quarter',1,${date_date}) ;;
  }

  dimension: date_next_week {
    hidden: yes
    type: date
    convert_tz: no
    sql:  DATEADD('week',1,${date_date}) ;;
  }

  dimension: date_next_month {
    hidden: yes
    type: date
    convert_tz: no
    sql:  DATEADD('month',1,${date_date}) ;;
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

}
