# The name of this view in Looker is "Demo Facebook"
view: demo_facebook {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `customers.demo_facebook` ;;
  drill_fields: [gclid]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: gclid {
    primary_key: yes
    type: string
    sql: ${TABLE}.gclid ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Browser Version Info" in Explore.

  dimension: browser_version_info {
    type: string
    sql: ${TABLE}.BrowserVersionInfo ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.DeviceCategory ;;
  }

  dimension: event_item_attribute {
    type: string
    sql: ${TABLE}.EventItemAttribute ;;
  }

  dimension: geo_point_info {
    type: string
    sql: ${TABLE}.GeoPointInfo ;;
  }

  dimension: geo_point_info_city {
    type: string
    sql: ${TABLE}.GeoPointInfoCity ;;
  }

  dimension: geo_point_info_state {
    type: string
    sql: ${TABLE}.GeoPointInfoState ;;
  }

  dimension: mobile_device_info {
    type: string
    sql: ${TABLE}.MobileDeviceInfo ;;
  }

  dimension: money {
    type: number
    sql: ${TABLE}.Money ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_money {
    type: sum
    sql: ${money} ;;  }
  measure: average_money {
    type: average
    sql: ${money} ;;  }

  dimension: operating_system_version_info {
    type: string
    sql: ${TABLE}.OperatingSystemVersionInfo ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: user_list_date_rule_item_info {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.UserListDateRuleItemInfo ;;
  }
  measure: count {
    type: count
    drill_fields: [gclid]
  }
}