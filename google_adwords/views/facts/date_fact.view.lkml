include: "/views/base/ad_metrics_base.view"
include: "/views/base/google_ad_metrics_base.view"

view: date_fact {
  extends: [ad_metrics_base, google_ad_metrics_base]

  derived_table: {
    explore_source: ad_impressions {
      column: date_period { field: fact.date_period }
      column: clicks {field: fact.total_clicks }
      column: conversions {field: fact.total_conversions}
      column: conversionvalue {field: fact.total_conversionvalue}
      column: cost {field: fact.total_cost}
      column: impressions { field: fact.total_impressions}
      column: interactions {field: fact.total_interactions}
      bind_filters: {
        from_field: fact.period
        to_field: fact.period
      }
    }
  }

  dimension: date_period {
    allow_fill: no
    hidden: yes
    primary_key: yes
    type: date
    convert_tz: no
  }
}
