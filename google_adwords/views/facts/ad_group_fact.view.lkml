include: "campaign_fact.view"

view: ad_group_key_base {
  extends: [campaign_key_base]
  extension: required

  dimension: ad_group_key_base {
    hidden: yes
    sql:
      {% if _dialect._name == 'snowflake' %}
        ${campaign_key_base} || '-' || TO_CHAR(${ad_group_id})
      {% elsif _dialect._name == 'redshift' %}
        ${campaign_key_base} || '-' || CAST(${ad_group_id} AS VARCHAR)
      {% else %}
        CONCAT(${campaign_key_base}, "-", CAST(${ad_group_id} as STRING))
      {% endif %} ;;
  }

  dimension: key_base {
    hidden: yes
    sql: ${ad_group_key_base} ;;
  }
}

view: ad_group_date_fact {
  extends: [campaign_date_fact, ad_group_key_base]

  derived_table: {
    datagroup_trigger: adwords_etl_datagroup
    explore_source: ad_impressions_ad_group {
      column: _date { field: fact.date_date}
      column: campaign_id {field: fact.campaign_id}
      column: ad_group_id {field: fact.ad_group_id}
      column: clicks {field: fact.total_clicks }
      column: conversions {field: fact.total_conversions}
      column: conversionvalue {field: fact.total_conversionvalue}
      column: cost {field: fact.total_cost}
      column: impressions { field: fact.total_impressions}
      column: interactions {field: fact.total_interactions}
    }
  }
  dimension: ad_group_id {
    hidden: yes
  }
  set: detail {
    fields: [ campaign_id, ad_group_id]
  }
}
