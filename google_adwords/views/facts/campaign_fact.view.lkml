include: "/views/base/ad_metrics_parent_comparison_base.view"
include: "account_fact.view"

view: campaign_key_base {
  extends: [account_key_base]
  extension: required

  dimension: campaign_key_base {
    hidden: yes
    sql:
      {% if _dialect._name == 'snowflake' %}
        ${account_key_base} || '-' || TO_CHAR(${campaign_id})
      {% elsif _dialect._name == 'redshift' %}
        ${account_key_base} || '-' || CAST(${campaign_id} AS VARCHAR)
      {% else %}
        CONCAT(${account_key_base}, "-", CAST(${campaign_id} as STRING))
      {% endif %} ;;
  }

  dimension: key_base {
    hidden: yes
    sql: ${campaign_key_base} ;;
  }
}

view: campaign_date_fact {
  extends: [ad_metrics_parent_comparison_base, account_date_fact, campaign_key_base]

  derived_table: {
    datagroup_trigger: adwords_etl_datagroup
    explore_source: ad_impressions_campaign {
      column: _date { field: fact.date_date }
      column: campaign_id {field: fact.campaign_id}
      column: clicks {field: fact.total_clicks }
      column: conversions {field: fact.total_conversions}
      column: conversionvalue {field: fact.total_conversionvalue}
      column: cost {field: fact.total_cost}
      column: impressions { field: fact.total_impressions}
      column: interactions {field: fact.total_interactions}
    }
  }
  dimension: campaign_id {
    hidden: yes
  }
  set: detail {
    fields: [campaign_id]
  }
}
