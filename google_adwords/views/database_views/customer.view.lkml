include: "../base/google_adwords_base.view"
include: "/views/*/*.view"
include: "/views/*.view"
view: customer {
  extends: [account_table_name_base, google_adwords_base]
  sql_table_name:
  (
    SELECT account.*
    FROM @{GOOGLE_ADS_SCHEMA}."ACCOUNT" as account

  ) ;;

    dimension: account_currency_code {
      hidden: yes
      type: string
      sql: ${TABLE}.account_currency_code ;;
    }

    dimension: account_descriptive_name {
      type: string
      sql: ${TABLE}.account_descriptive_name ;;
#     required_fields: [external_customer_id]
    }

    dimension: account_time_zone {
      hidden: yes
      type: string
      sql: ${TABLE}.account_time_zone ;;
    }

    dimension: customer_descriptive_name {
      hidden: yes
      type: string
      sql: ${TABLE}.customer_descriptive_name ;;
    }
}

view: account_table_name_base {
  extension: required
  dimension: account_table_name {
    hidden: yes
    sql:account;;
  }
}
