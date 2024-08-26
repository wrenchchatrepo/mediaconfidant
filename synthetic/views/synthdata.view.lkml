# The name of this view in Looker is "Synthdata"
view: synthdata {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `synthetic.synthdata` ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Buys T1000" in Explore.

  dimension: buys_t1000 {
    type: number
    sql: ${TABLE}.buys_t1000 ;;
  }

  dimension: buys_t800 {
    type: number
    sql: ${TABLE}.buys_t800 ;;
  }

  dimension: city_state {
    type: string
    sql: ${TABLE}.city_state ;;
  }

  dimension: clicks_t1000 {
    type: number
    sql: ${TABLE}.clicks_t1000 ;;
  }

  dimension: clicks_t800 {
    type: number
    sql: ${TABLE}.clicks_t800 ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: dts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dts ;;
  }

  dimension: impressions_t1000 {
    type: number
    sql: ${TABLE}.impressions_t1000 ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_impressions_t1000 {
    type: sum
    sql: ${impressions_t1000} ;;  }
  measure: average_impressions_t1000 {
    type: average
    sql: ${impressions_t1000} ;;  }

  dimension: impressions_t800 {
    type: number
    sql: ${TABLE}.impressions_t800 ;;
  }

  dimension: rev_t000 {
    type: number
    sql: ${TABLE}.rev_t000 ;;
  }

  dimension: rev_t800 {
    type: number
    sql: ${TABLE}.rev_t800 ;;
  }

  dimension: vendors {
    type: string
    sql: ${TABLE}.vendors ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
