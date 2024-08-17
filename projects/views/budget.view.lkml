view: budget {
  sql_table_name: `@{GOOGLE_ADS_SCHEMA}.ads_Budget_@{GOOGLE_ADS_CUSTOMER_ID}`
    ;;

dimension: prim_key {
  type: string
  primary_key: yes
  sql: CONCAT(${_data_date},${budget_id}) ;;
}
  dimension_group: _data {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension_group: _latest {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._LATEST_DATE ;;
  }

  dimension: account_descriptive_name {
    type: string
    sql: ${TABLE}.account_descriptive_name ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.campaign_budget_amount_micros / 1000000.0 ;;
  }

  dimension: budget_id {
    type: number
    sql: ${TABLE}.campaign_budget_id;;
  }

  dimension: budget_name {
    type: string
    sql: ${TABLE}.budget_name ;;
  }

  dimension: budget_reference_count {
    type: number
    sql: ${TABLE}.budget_reference_count ;;
  }

  dimension: budget_status {
    type: string
    sql: ${TABLE}.budget_status ;;
  }

  dimension: delivery_method {
    type: string
    sql: ${TABLE}.delivery_method ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: has_recommended_budget {
    type: yesno
    sql: ${TABLE}.has_recommended_budget ;;
  }

  dimension: is_budget_explicitly_shared {
    type: yesno
    sql: ${TABLE}.is_budget_explicitly_shared ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension: recommended_budget_amount {
    type: string
    sql: ${TABLE}.recommended_budget_amount ;;
  }

  dimension: total_amount {
    type: string
    sql: ${TABLE}.total_amount ;;
  }

  dimension: latest {
    hidden: yes
    type: yesno
    sql: ${_data_raw} = ${_latest_raw} ;;
  }

measure: bu_amount {
  view_label: "Budget"
  label: "Budget"
  type: sum
  value_format_name: large_usd
  sql: ${amount} ;;
}

  measure: Current_Budget {
    view_label: "Current Budget"
    label: "Current Budget"
    type: average
    value_format_name: large_usd
  filters: [latest: "yes"]
    sql: ${amount}
    ;;
    drill_fields: [budetails*]
  }


  measure: count {
    type: count
    drill_fields: [account_descriptive_name, budget_name]
  }
set: budetails {
  fields: [campaign.campaign_name, campaign.advertising_channel_type, Current_Budget]
}
}
