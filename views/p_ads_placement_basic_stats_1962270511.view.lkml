# The name of this view in Looker is "P Ads Placement Basic Stats 1962270511"
view: p_ads_placement_basic_stats_1962270511 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `google_ads.p_ads_PlacementBasicStats_1962270511` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: _partitiondate {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONDATE ;;
  }

  dimension_group: _partitiontime {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONTIME ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Ad Group Base Ad Group" in Explore.

  dimension: ad_group_base_ad_group {
    type: string
    description: "For draft or experiment ad groups, this field is the resource name of the base ad group from which this ad group was created. If a draft or experiment ad group does not have a base ad group, then this field is null. For base ad groups, this field equals the ad group resource name. This field is read-only."
    sql: ${TABLE}.ad_group_base_ad_group ;;
  }

  dimension: ad_group_criterion_criterion_id {
    type: number
    description: "The ID of the criterion. This field is ignored for mutates."
    sql: ${TABLE}.ad_group_criterion_criterion_id ;;
  }

  dimension: ad_group_id {
    type: number
    description: "The ID of the ad group."
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: campaign_base_campaign {
    type: string
    description: "The resource name of the base campaign of a draft or experiment campaign. For base campaigns, this is equal to `resource_name`. This field is read-only."
    sql: ${TABLE}.campaign_base_campaign ;;
  }

  dimension: campaign_id {
    type: number
    description: "The ID of the campaign."
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: customer_id {
    type: number
    description: "The ID of the customer."
    sql: ${TABLE}.customer_id ;;
  }

  dimension: metrics_active_view_impressions {
    type: number
    description: "A measurement of how often your ad has become viewable on a Display Network site."
    sql: ${TABLE}.metrics_active_view_impressions ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_metrics_active_view_impressions {
    type: sum
    sql: ${metrics_active_view_impressions} ;;  }
  measure: average_metrics_active_view_impressions {
    type: average
    sql: ${metrics_active_view_impressions} ;;  }

  dimension: metrics_active_view_measurability {
    type: number
    description: "The ratio of impressions that could be measured by Active View over the number of served impressions."
    sql: ${TABLE}.metrics_active_view_measurability ;;
  }

  dimension: metrics_active_view_measurable_cost_micros {
    type: number
    description: "The cost of the impressions you received that were measurable by Active View."
    sql: ${TABLE}.metrics_active_view_measurable_cost_micros ;;
  }

  dimension: metrics_active_view_measurable_impressions {
    type: number
    description: "The number of times your ads are appearing on placements in positions where they can be seen."
    sql: ${TABLE}.metrics_active_view_measurable_impressions ;;
  }

  dimension: metrics_active_view_viewability {
    type: number
    description: "The percentage of time when your ad appeared on an Active View enabled site (measurable impressions) and was viewable (viewable impressions)."
    sql: ${TABLE}.metrics_active_view_viewability ;;
  }

  dimension: metrics_all_conversions {
    type: number
    description: "The total number of conversions. This only includes conversion actions which include_in_conversions_metric attribute is set to true."
    sql: ${TABLE}.metrics_all_conversions ;;
  }

  dimension: metrics_all_conversions_value {
    type: number
    description: "The total value of all conversions."
    sql: ${TABLE}.metrics_all_conversions_value ;;
  }

  dimension: metrics_clicks {
    type: number
    description: "The number of clicks."
    sql: ${TABLE}.metrics_clicks ;;
  }

  dimension: metrics_conversions {
    type: number
    description: "The number of conversions. This only includes conversion actions which include_in_conversions_metric attribute is set to true."
    sql: ${TABLE}.metrics_conversions ;;
  }

  dimension: metrics_conversions_value {
    type: number
    description: "The total value of conversions. This only includes conversion actions which include_in_conversions_metric attribute is set to true."
    sql: ${TABLE}.metrics_conversions_value ;;
  }

  dimension: metrics_cost_micros {
    type: number
    description: "The sum of your cost-per-click (CPC) and cost-per-thousand impressions (CPM) costs during this period."
    sql: ${TABLE}.metrics_cost_micros ;;
  }

  dimension: metrics_cross_device_conversions {
    type: number
    description: "Conversions from when a customer clicks on a Google Ads ad on one device, then converts on a different device or browser. Cross-device conversions are already included in all_conversions."
    sql: ${TABLE}.metrics_cross_device_conversions ;;
  }

  dimension: metrics_impressions {
    type: number
    description: "Count of how often your ad has appeared on a search results page or website on the Google Network."
    sql: ${TABLE}.metrics_impressions ;;
  }

  dimension: metrics_interaction_event_types {
    type: string
    description: "The types of payable and free interactions."
    sql: ${TABLE}.metrics_interaction_event_types ;;
  }

  dimension: metrics_interactions {
    type: number
    description: "The number of interactions. An interaction is the main user action associated with an ad format-clicks for text and shopping ads, views for video ads, and so on."
    sql: ${TABLE}.metrics_interactions ;;
  }

  dimension: metrics_view_through_conversions {
    type: number
    description: "The total number of view-through conversions. These happen when a customer sees an image or rich media ad, then later completes a conversion on your site without interacting with (e.g., clicking on) another ad."
    sql: ${TABLE}.metrics_view_through_conversions ;;
  }

  dimension: segments_ad_network_type {
    type: string
    description: "Ad network type."
    sql: ${TABLE}.segments_ad_network_type ;;
  }

  dimension_group: segments {
    type: time
    description: "Date to which metrics apply. yyyy-MM-dd format, e.g., 2018-04-17."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_date ;;
  }

  dimension: segments_device {
    type: string
    description: "Device to which metrics apply."
    sql: ${TABLE}.segments_device ;;
  }
  measure: count {
    type: count
  }
}
