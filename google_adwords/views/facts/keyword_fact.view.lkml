include: "ad_group_fact.view"

view: keyword_key_base {
  extends: [ad_group_key_base]
  extension: required

  dimension: ad_key_base {
    hidden: yes
    sql:
      {% if _dialect._name == 'snowflake' %}
        ${ad_group_key_base} || '-' || TO_CHAR(${criterion_id})
      {% elsif _dialect._name == 'redshift' %}
        ${ad_group_key_base} || '-' || CAST(${criterion_id} AS VARCHAR)
      {% else %}
        CONCAT(${ad_group_key_base}, "-", CAST(${criterion_id} as STRING))
      {% endif %} ;;
  }
  dimension: key_base {
    sql: ${ad_key_base} ;;
  }
}


view: keyword_date_fact {
  extends: [keyword_key_base, ad_group_date_fact]

  derived_table: {
    datagroup_trigger: adwords_etl_datagroup
    explore_source: ad_impressions_keyword {
      column: _date { field: fact.date_date }
      column: campaign_id {field: fact.campaign_id}
      column: ad_group_id {field: fact.ad_group_id}
      column: criterion_id {field: fact.criterion_id}
      column: clicks {field: fact.total_clicks }
      column: conversions {field: fact.total_conversions}
      column: conversionvalue {field: fact.total_conversionvalue}
      column: cost {field: fact.total_cost}
      column: impressions { field: fact.total_impressions}
      column: interactions {field: fact.total_interactions}
    }
  }
  dimension: criterion_id {
    hidden: yes
  }
  set: detail {
    fields: [campaign_id, ad_group_id, criterion_id]
  }
}
