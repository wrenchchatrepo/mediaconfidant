connection: "bigquery_connection"

include: "/views/*.view"

explore: ga4_bigquery_export {
  view_name: ga4_bigquery_export
  join: google_ads {
    type: left_outer
    sql_on: ${ga4_bigquery_export.client_user_id} = ${google_ads.gclid} ;;
    relationship: many_to_one
  }
}

explore: combined_metrics {
  view_name: combined_metrics
}