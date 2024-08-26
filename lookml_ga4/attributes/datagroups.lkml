datagroup: bqml_datagroup {
  #retrain model every week
  sql_trigger: SELECT EXTRACT(week from CURRENT_DATE()) ;;
}
datagroup: attribution_channel{
  # re builds dummy tables for channel acquisition
  sql_trigger: SELECT EXTRACT(month from CURRENT_DATE()) ;;
}
