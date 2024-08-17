# The name of this view in Looker is "Ads Customer 1962270511"
view: ads_customer_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_Customer_1962270511` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: _data {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension_group: _latest {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._LATEST_DATE ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Customer Auto Tagging Enabled" in Explore.

  dimension: customer_auto_tagging_enabled {
    type: yesno
    sql: ${TABLE}.customer_auto_tagging_enabled ;;
  }

  dimension: customer_currency_code {
    type: string
    sql: ${TABLE}.customer_currency_code ;;
  }

  dimension: customer_descriptive_name {
    type: string
    sql: ${TABLE}.customer_descriptive_name ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_manager {
    type: yesno
    sql: ${TABLE}.customer_manager ;;
  }

  dimension: customer_test_account {
    type: yesno
    sql: ${TABLE}.customer_test_account ;;
  }

  dimension: customer_time_zone {
    type: string
    sql: ${TABLE}.customer_time_zone ;;
  }
  measure: count {
    type: count
    drill_fields: [customer_descriptive_name]
  }
}
