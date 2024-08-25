view: date_primary_key_base {
  extension: required

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${_date} AS STRING), "-", ${key_base}) ;;
  }
}
