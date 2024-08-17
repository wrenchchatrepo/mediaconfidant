# The name of this view in Looker is "Ads Audience 1962270511"
view: ads_audience_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_Audience_1962270511` ;;

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
    # This dimension will be called "Audience Description" in Explore.

  dimension: audience_description {
    type: string
    sql: ${TABLE}.audience_description ;;
  }

  dimension: audience_dimensions {
    type: string
    sql: ${TABLE}.audience_dimensions ;;
  }

  dimension: audience_exclusion_dimension {
    type: string
    sql: ${TABLE}.audience_exclusion_dimension ;;
  }

  dimension: audience_id {
    type: string
    sql: ${TABLE}.audience_id ;;
  }

  dimension: audience_name {
    type: string
    sql: ${TABLE}.audience_name ;;
  }

  dimension: audience_status {
    type: string
    sql: ${TABLE}.audience_status ;;
  }
  measure: count {
    type: count
    drill_fields: [audience_name]
  }
}
