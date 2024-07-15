view: ga4_bigquery_export {
  sql_table_name: my_dataset.ga4_bigquery_export ;;
  
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
    value_format: "$#,##0.00"
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
  
  measure: event_count {
    type: count
    sql: ${TABLE}.event_name ;;
  }
  
  measure: total_event_value {
    type: sum
    sql: ${TABLE}.event_value_in_usd ;;
    value_format: "$#,##0.00"
  }
}