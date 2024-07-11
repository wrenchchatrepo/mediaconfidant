view: google_ads {
  sql_table_name: my_dataset.google_ads ;;
  
  dimension: gclid {
    type: string
    sql: ${TABLE}.gclid ;;
  }
  
  dimension: user_list_date_rule_item_info {
    type: timestamp
    sql: ${TABLE}.user_list_date_rule_item_info ;;
  }
  
  dimension: event_item_attribute {
    type: string
    sql: ${TABLE}.event_item_attribute ;;
  }
  
  dimension: money {
    type: number
    sql: ${TABLE}.money ;;
  }
  
  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
  }
  
  dimension: mobile_device_info {
    type: string
    sql: ${TABLE}.mobile_device_info ;;
  }
  
  dimension: operating_system_version_info {
    type: string
    sql: ${TABLE}.operating_system_version_info ;;
  }
  
  dimension: browser_version_info {
    type: string
    sql: ${TABLE}.browser_version_info ;;
  }
  
  dimension: geo_point_info {
    type: string
    sql: ${TABLE}.geo_point_info ;;
  }
  
  dimension: geo_point_info_state {
    type: string
    sql: ${TABLE}.geo_point_info_state ;;
  }
  
  dimension: geo_point_info_city {
    type: string
    sql: ${TABLE}.geo_point_info_city ;;
  }
}