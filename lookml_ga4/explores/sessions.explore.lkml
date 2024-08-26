include: "/views/*.view.lkml"
include: "/views/*/*.view.lkml"
include: "/views/*/*/*.view.lkml"
include: "/attributes/*.lkml"

explore: sessions {
  label: "GA4 Sessions Beta"
  description: "Explores Google Analytics sessions data."

  join: audience_cohorts {
    type: left_outer
    sql_on: ${sessions.audience_trait} = ${audience_cohorts.audience_trait} ;;
    relationship: many_to_one
  }

  join: events {
    view_label: "Events"
    sql: LEFT JOIN UNNEST(${sessions.event_data}) as events with offset as event_row ;;
    relationship: one_to_many
  }

  join: event_data_items {
    view_label: "Events"
    sql: LEFT JOIN UNNEST(${events.items}) as event_data_items  ;;
    relationship: one_to_many
    required_joins: [events]
  }

  join: user_previous_session {
    view_label: "GA4 Sessions"
    sql_on: ${sessions.sl_key} = ${user_previous_session.sl_key} ;;
    relationship: one_to_one
  }
  join: user_first_session {
    view_label: "GA4 Sessions"
    sql_on: ${sessions.sl_key} = ${user_first_session.sl_key} ;;
    relationship: one_to_one
  }

  join: user_segment {
    type: left_outer
    sql_on: ${sessions.user_pseudo_id} = ${user_segment.user_pseudo_id} ;;
    relationship: many_to_one
  }

  join: future_purchase_prediction {
    view_label: "Propensity to Purchase"
    relationship: one_to_one
    # sql_on: ${sessions.sl_key} = ${future_purchase_prediction.sl_key} ;;
    sql_on: ${sessions.user_pseudo_id} = ${future_purchase_prediction.user_pseudo_id} ;;
  }

  join: paid_shopping {
    fields: []
    sql_on: ${sessions.session_attribution_source}=${paid_shopping.channel}
    or REGEXP_CONTAINS(${sessions.session_attribution_campaign}, r"^(.*(([^a-df-z]|^)shop|shopping).*)$") = true
    and REGEXP_CONTAINS(${sessions.session_attribution_medium}, r"^(.*cp.*|ppc|paid.*)$") = true;;
    relationship: many_to_one
  }
  join: paid_social {
    fields: []
    sql_on: ${sessions.session_attribution_source}=${paid_social.channel} and
    REGEXP_CONTAINS(${sessions.session_attribution_medium}, r"^(.*cp.*|ppc|paid.*)$") = true ;;
    relationship: many_to_one
  }

  join: paid_video {
    fields: []
    sql_on: ${sessions.session_attribution_source}=${paid_video.channel} and
    REGEXP_CONTAINS(${sessions.session_attribution_medium}, r"^(.*cp.*|ppc|paid.*)$") = true;;
    relationship: many_to_one
  }
  join: paid_search {
    fields: []
    sql_on: ${sessions.session_attribution_source}=${paid_search.channel}
    and REGEXP_CONTAINS(${sessions.session_attribution_medium}, r"^(.*cp.*|ppc|paid.*)$") = true;;
    relationship: many_to_one
  }
  join: organic_shopping {
    fields: []
    sql_on: ${sessions.session_attribution_source}=${organic_shopping.channel}
      or REGEXP_CONTAINS(${sessions.session_attribution_campaign}, r"^(.*(([^a-df-z]|^)shop|shopping).*)$") = true;;
    relationship: many_to_one
  }
  join: organic_social {
    fields: []
    sql_on: ${sessions.session_attribution_source}=${organic_social.channel}
      or REGEXP_CONTAINS(${sessions.session_attribution_medium}, r"(social|social-network|social-media|sm|social network|social media)") = true;;
    relationship: many_to_one
  }
  join: organic_video {
    fields: []
    sql_on: ${sessions.session_attribution_source}=${organic_video.channel}
       or REGEXP_CONTAINS(${sessions.session_attribution_medium}, r"^(.*video.*)$") = true;;
    relationship: many_to_one
  }
  join: organic_search {
    fields: []
    sql_on: ${sessions.session_attribution_source}=${organic_video.channel}
     or ${sessions.session_attribution_medium} = 'organic';;
    relationship: many_to_one
  }
  join: others {
    fields: []
    sql_on: ${sessions.session_attribution_medium} = ${others.medium};;
    relationship: many_to_one
  }
  join: attribution_sources {
    sql:  ;;
  relationship: one_to_one
    view_label: "Acquisition"
  }
  join: forecasting {
    type: full_outer
    sql_on:${forecasting.forecast_timestamp}=${events.event_time_date} ;;#${events.event_name}=${forecasting.events_event_name} AND
    relationship: one_to_one
    view_label: "ARIMA"
  }
  #join: arima_join {
  #  type: inner
  #  sql_on: ${forecasting.forecast_timestamp}=${arima_join.date_join} OR
  #  ${sessions.session_date}=${arima_join.date_join};;
  #  relationship: many_to_one
  #  view_label: "ARIMA"
  #}

}
