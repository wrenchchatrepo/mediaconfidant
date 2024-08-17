# The name of this view in Looker is "P Ads Customer 1962270511"
view: p_ads_customer_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_Customer_1962270511` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: _partitiondate {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONDATE ;;
  }

  dimension_group: _partitiontime {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONTIME ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Customer Auto Tagging Enabled" in Explore.

  dimension: customer_auto_tagging_enabled {
    type: yesno
    description: "Whether auto-tagging is enabled for the customer."
    sql: ${TABLE}.customer_auto_tagging_enabled ;;
  }

  dimension: customer_currency_code {
    type: string
    description: "The currency in which the account operates. A subset of the currency codes from the ISO 4217 standard is supported."
    sql: ${TABLE}.customer_currency_code ;;
  }

  dimension: customer_descriptive_name {
    type: string
    description: "Optional, non-unique descriptive name of the customer."
    sql: ${TABLE}.customer_descriptive_name ;;
  }

  dimension: customer_id {
    type: number
    description: "The ID of the customer."
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_manager {
    type: yesno
    description: "Whether the customer is a manager."
    sql: ${TABLE}.customer_manager ;;
  }

  dimension: customer_test_account {
    type: yesno
    description: "Whether the customer is a test account."
    sql: ${TABLE}.customer_test_account ;;
  }

  dimension: customer_time_zone {
    type: string
    description: "The local timezone ID of the customer."
    sql: ${TABLE}.customer_time_zone ;;
  }
  measure: count {
    type: count
    drill_fields: [customer_descriptive_name]
  }
}
