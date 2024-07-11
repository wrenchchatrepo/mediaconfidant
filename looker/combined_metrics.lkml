view: combined_metrics {
  sql_table_name: my_dataset.combined_metrics ;;
  
  dimension: client_user_id {
    type: string
    sql: ${TABLE}.client_user_id ;;
  }
  
  dimension: event_timestamp {
    type: timestamp
    sql: ${TABLE}.event_timestamp ;;
  }
  
  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }
  
  dimension: event_value_in_usd {
    type: number
    sql: ${TABLE}.event_value_in_usd ;;
  }
  
  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
  }
  
  dimension: device_brand_name {
    type: string
    sql: ${TABLE}.device_brand_name ;;
  }
  
  dimension: device_operating_system_version {
    type: string
    sql: ${TABLE}.device_operating_system_version ;;
  }
  
  dimension: device_web_info_browser_version {
    type: string
    sql: ${TABLE}.device_web_info_browser_version ;;
  }
  
  dimension: geo_country {
    type: string
    sql: ${TABLE}.geo_country ;;
  }
  
  dimension: geo_region {
    type: string
    sql: ${TABLE}.geo_region ;;
  }
  
  dimension: geo_city {
    type: string
    sql: ${TABLE}.geo_city ;;
  }
  
  dimension: gclid {
    type: string
    sql: ${TABLE}.gclid ;;
  }
  
  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }
}