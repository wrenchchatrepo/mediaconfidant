# The name of this view in Looker is "Ads Campaign Asset Stats 1962270511"
view: ads_campaign_asset_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.ads_CampaignAssetStats_1962270511` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: _data {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension_group: _latest {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._LATEST_DATE ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Campaign Asset Asset" in Explore.

  dimension: campaign_asset_asset {
    type: string
    sql: ${TABLE}.campaign_asset_asset ;;
  }

  dimension: campaign_asset_campaign {
    type: string
    sql: ${TABLE}.campaign_asset_campaign ;;
  }

  dimension: campaign_asset_field_type {
    type: string
    sql: ${TABLE}.campaign_asset_field_type ;;
  }

  dimension: campaign_asset_resource_name {
    type: string
    sql: ${TABLE}.campaign_asset_resource_name ;;
  }

  dimension: campaign_asset_source {
    type: string
    sql: ${TABLE}.campaign_asset_source ;;
  }

  dimension: campaign_asset_status {
    type: string
    sql: ${TABLE}.campaign_asset_status ;;
  }

  dimension: metrics_average_cpc {
    type: number
    sql: ${TABLE}.metrics_average_cpc ;;
  }

  dimension: metrics_average_cpe {
    type: number
    sql: ${TABLE}.metrics_average_cpe ;;
  }

  dimension: metrics_average_cpm {
    type: number
    sql: ${TABLE}.metrics_average_cpm ;;
  }

  dimension: metrics_average_cpv {
    type: number
    sql: ${TABLE}.metrics_average_cpv ;;
  }

  dimension: metrics_clicks {
    type: number
    sql: ${TABLE}.metrics_clicks ;;
  }

  dimension: metrics_conversions {
    type: number
    sql: ${TABLE}.metrics_conversions ;;
  }

  dimension: metrics_conversions_from_interactions_rate {
    type: number
    sql: ${TABLE}.metrics_conversions_from_interactions_rate ;;
  }

  dimension: metrics_conversions_value {
    type: number
    sql: ${TABLE}.metrics_conversions_value ;;
  }

  dimension: metrics_cost_micros {
    type: number
    sql: ${TABLE}.metrics_cost_micros ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_metrics_cost_micros {
    type: sum
    sql: ${metrics_cost_micros} ;;  }
  measure: average_metrics_cost_micros {
    type: average
    sql: ${metrics_cost_micros} ;;  }

  dimension: metrics_cost_per_conversion {
    type: number
    sql: ${TABLE}.metrics_cost_per_conversion ;;
  }

  dimension: metrics_ctr {
    type: number
    sql: ${TABLE}.metrics_ctr ;;
  }

  dimension: metrics_impressions {
    type: number
    sql: ${TABLE}.metrics_impressions ;;
  }

  dimension: metrics_interactions {
    type: number
    sql: ${TABLE}.metrics_interactions ;;
  }

  dimension: metrics_top_impression_percentage {
    type: number
    sql: ${TABLE}.metrics_top_impression_percentage ;;
  }

  dimension: segments_ad_network_type {
    type: string
    sql: ${TABLE}.segments_ad_network_type ;;
  }

  dimension_group: segments {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_date ;;
  }

  dimension: segments_day_of_week {
    type: string
    sql: ${TABLE}.segments_day_of_week ;;
  }

  dimension: segments_device {
    type: string
    sql: ${TABLE}.segments_device ;;
  }

  dimension_group: segments_month {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_month ;;
  }

  dimension_group: segments_quarter {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_quarter ;;
  }

  dimension_group: segments_week {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_week ;;
  }

  dimension: segments_year {
    type: number
    sql: ${TABLE}.segments_year ;;
  }
  measure: count {
    type: count
    drill_fields: [campaign_asset_resource_name]
  }
}
