include: /views/shared_views/*

view: customer{
  sql_table_name: `@{GOOGLE_ADS_SCHEMA}.ads_Customer_@{GOOGLE_ADS_CUSTOMER_ID}` ;;

  dimension_group: _data {
    hidden: yes
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
    hidden: yes
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
    sql: ${TABLE}._LATEST_DATE;;
  }

  dimension: latest {
    hidden: yes
    type: yesno
    sql: ${_data_raw} = ${_latest_raw} ;;
  }


  dimension: account_currency_code {
    type: string
    sql: ${TABLE}.account_currency_code ;;
  }

  dimension: account_descriptive_name {
    type: string
    sql: ${TABLE}.account_descriptive_name ;;
  }

  dimension: account_time_zone {
    type: string
    sql: ${TABLE}.account_time_zone ;;
  }

  dimension: account_time_zone_id {
    type: string
    sql: ${TABLE}.account_time_zone_id ;;
  }

  dimension: can_manage_clients {
    type: yesno
    sql: ${TABLE}.can_manage_clients ;;
  }

  dimension: customer_descriptive_name {
    drill_fields: [campaign.campaign_name]
    type: string
    sql: ${TABLE}.customer_descriptive_name ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: is_auto_tagging_enabled {
    type: yesno
    sql: ${TABLE}.is_auto_tagging_enabled ;;
  }

  dimension: is_test_account {
    type: yesno
    sql: ${TABLE}.is_test_account ;;
  }

  dimension: primary_company_name {
    type: string
    sql: ${TABLE}.primary_company_name ;;
  }

  measure: count {
    type: count
    drill_fields: [account_descriptive_name, customer_descriptive_name, primary_company_name]
  }
}
