view: +demo_bing {

  dimension: vendor {
    type: string
    sql: 'Bing' ;;
  }

  dimension: gclid {
    label: "UserID"
    primary_key: yes
    type: string
    sql: ${TABLE}.gclid ;;
  }

  dimension: browser_version_info {
    label: "Browser"
    type: string
    sql: ${TABLE}.BrowserVersionInfo ;;
  }

  dimension: device_category {
    label: "DeviceCategory"
    type: string
    sql: ${TABLE}.DeviceCategory ;;
  }

  dimension: event_item_attribute {
    label: "Campaign"
    type: string
    sql: ${TABLE}.EventItemAttribute ;;
  }

  dimension: geo_point_info {
    label: "Country"
    type: string
    sql: ${TABLE}.GeoPointInfo ;;
  }

  dimension: geo_point_info_city {
    label: "CityState"
    type: string
    sql: ${TABLE}.GeoPointInfoCity ;;
  }

  dimension: geo_point_info_state {
    label: "State"
    type: string
    sql: ${TABLE}.GeoPointInfoState ;;
  }

  dimension: mobile_device_info {
    label: "Manufacturer"
    type: string
    sql: ${TABLE}.MobileDeviceInfo ;;
  }

  dimension: money {
    label: "Revenue"
    type: number
    sql: ${TABLE}.Money ;;
    value_format: "$#.00;($#.00)"
  }
 
  measure: total_money {
    label: "Total Revenue"
    type: sum
    sql: ${money} ;;
    value_format: "$#.00;($#.00)"
  }

  measure: average_money {
    label: "Average Revenue"
    type: average
    sql: ${money} ;;
    value_format: "$#.00;($#.00)"
  }

  dimension: operating_system_version_info {
    label: "OS"
    type: string
    sql: ${TABLE}.OperatingSystemVersionInfo ;;
  }

  dimension_group: user_list_date_rule_item_info_time {
    group_label: "DTS"
    type: time
    timeframes: [time, date, week, month, quarter, year]
    sql: ${TABLE}.user_list_date_rule_item_info ;;  # Assuming the original field is called user_list_date_rule_item_info
  }
}
