include: "/views/sessions/*.view.lkml"
view: session_event_packing {
  derived_table:{
    sql_trigger_value: ${session_facts.SQL_TABLE_NAME} ;;
    partition_keys: ["session_date"]
    cluster_keys: ["sl_key","user_pseudo_id","session_date"]
    increment_key: "session_date"
    increment_offset: 0
    sql:select sl.session_date session_date
      ,  sl.ga_session_id ga_session_id
      ,  sl.ga_session_number ga_session_number
      ,  sl.user_pseudo_id user_pseudo_id
      ,  sl.sl_key
      ,  ARRAY_AGG(STRUCT(sl.sl_key
                          , sl.event_rank
                          , sl.page_view_rank
                          , sl.page_view_reverse_rank
                          , sl.time_to_next_event
                          , sl.time_to_next_page
                          , sl.event_date
                          , sl.event_timestamp
                          , sl.event_name
                          , sl.event_params
                          , sl.event_previous_timestamp
                          , sl.event_value_in_usd
                          , sl.event_bundle_sequence_id
                          , sl.event_server_timestamp_offset
                          , sl.user_id
                          , sl.user_pseudo_id
                          , sl.user_properties
                          , sl.user_first_touch_timestamp
                          , sl.user_ltv
                          , sl.device
                          , sl.geo
                          , sl.app_info
                          , sl.traffic_source
                          , sl.stream_id
                          , sl.platform
                          , sl.event_dimensions
                          , sl.ecommerce
                          , sl.items)) event_data
    from ${session_list_with_event_history.SQL_TABLE_NAME} AS sl
    WHERE sl.sl_key IN (SELECT sl_key FROM ${session_facts.SQL_TABLE_NAME}
    WHERE CASE WHEN "@{EVENT_COUNT}" = "" THEN 1=1 WHEN "@{EVENT_COUNT}" != "" THEN
    session_event_count< SAFE_CAST("@{EVENT_COUNT}" AS INT64) END)
    AND {% incrementcondition %} session_date {%  endincrementcondition %}
  group by 1,2,3,4,5;;
  }
  dimension: session_date{
    type: date
    hidden: yes
  }
}
