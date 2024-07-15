include: "/views/cyberdyne/cyberdyne_ga4.view.lkml"

view: cyberdyne_ga4_refined {
  extends: [cyberdyne_ga4]

  dimension_group: event_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.event_timestamp ;;
  }
}
