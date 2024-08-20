view: geotargeting {
  sql_table_name: @{GOOGLE_ADS_SCHEMA}.GEOTARGET ;;

  dimension: canonical_name {
    type: string
    sql: ${TABLE}.Canonical_Name ;;
  }

  dimension: country_code {
    map_layer_name: countries
    type: string
    sql: ${TABLE}.Country_Code ;;
  }

  dimension: criteria_id {
    type: number
    sql: ${TABLE}.Criteria_ID ;;
  }

  dimension: criteria_id_string {
    type: number
    sql: CAST(${TABLE}.Criteria_ID AS STRING) ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }



  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: target_type {
    type: string
    sql: ${TABLE}.Target_Type ;;
  }



}
