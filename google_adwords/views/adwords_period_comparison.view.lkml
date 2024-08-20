include: "/views/base/*.view"

view: adwords_period_comparison {
  extends: [period_fact]
}

view: period_fact {
  extends: [date_base, period_base, ad_metrics_period_comparison_base, ad_metrics_weighted_period_comparison_base, ad_metrics_parent_comparison_base, google_ad_metrics_base]


  dimension: campaign_id {
    hidden: yes
  }
  dimension: ad_group_id {
    hidden: yes
  }
  dimension: creative_id {
    hidden: yes
  }
  dimension: criterion_id {
    hidden: yes
  }
  dimension: _date {
    type: date_raw
    sql:
      {% if _dialect._name == 'snowflake' %}
        TO_DATE(${TABLE}._date)
      {% else %}
        CAST(${TABLE}._date AS DATE)
      {% endif %} ;;
  }

  sql_table_name:
  {% if (ad._in_query or fact.creative_id._in_query) %}
    ${ad_date_fact.SQL_TABLE_NAME}

  {% elsif (ad_group._in_query or fact.ad_group_id._in_query) %}
    ${ad_group_date_fact.SQL_TABLE_NAME}
  {% elsif (campaign._in_query or fact.campaign_id._in_query) %}
    ${campaign_date_fact.SQL_TABLE_NAME}
  {% else %}
    ${account_date_fact.SQL_TABLE_NAME}
  {% endif %} ;;

    dimension: key_base {
      hidden: yes
      sql:
      {% if _dialect._name == 'snowflake' %}
          {% if (campaign._in_query or fact.campaign_id._in_query or ad_group._in_query or fact.ad_group_id._in_query or ad._in_query ) %}
            || '-' || TO_CHAR(${campaign_id})
          {% endif %}
          {% if (ad_group._in_query or fact.ad_group_id._in_query or ad._in_query ) %}
            || '-' || TO_CHAR(${ad_group_id})
          {% endif %}
          {% if (ad._in_query or fact.creative_id._in_query) %}
            || '-' || TO_CHAR(${creative_id})

          {% endif %}
      {% elsif _dialect._name == 'redshift' %}

          {% if (campaign._in_query or fact.campaign_id._in_query or ad_group._in_query or fact.ad_group_id._in_query or ad._in_query ) %}
            || '-' || CAST(${campaign_id} AS VARCHAR)
          {% endif %}
          {% if (ad_group._in_query or fact.ad_group_id._in_query or ad._in_query ) %}
            || '-' || CAST(${ad_group_id} AS VARCHAR)
          {% endif %}
          {% if (ad._in_query ) %}
            '-' || CAST(${creative_id} AS VARCHAR)

          {% endif %}
      {% else %}
        CONCAT(

          {% if (campaign._in_query or fact.campaign_id._in_query or ad_group._in_query or fact.ad_group_id._in_query or ad._in_query ) %}
            ,"-", CAST(${campaign_id} AS STRING)
          {% endif %}
          {% if (ad_group._in_query or fact.ad_group_id._in_query or ad._in_query ) %}
            ,"-", CAST(${ad_group_id} AS STRING)
          {% endif %}
          {% if (ad._in_query or fact.creative_id._in_query) %}
            ,"-", CAST(${creative_id} AS STRING)

          {% endif %}
        )
          {% endif %}
      ;;
    }
    dimension: primary_key {
      primary_key: yes
      hidden: yes
      sql:
      {% if _dialect._name == 'snowflake' %}
        TO_CHAR(${date_period}) || '-' || TO_CHAR(${date_day_of_period}) || '-' ||  ${key_base}
      {% elsif _dialect._name == 'redshift' %}
        CAST(${date_period} as STRING) || '-' || CAST(${date_day_of_period} as STRING) || '-' ||  ${key_base}
      {% else %}
        concat(CAST(${date_period} as STRING), CAST(${date_day_of_period} as STRING), ${key_base})
      {% endif %} ;;
    }
  }
