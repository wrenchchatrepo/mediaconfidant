include: "/views/*.view"
include: "/views/*.view"
# Daily Account Aggregation
explore: ad_impressions {
  persist_with: adwords_etl_datagroup
  extends: [customer_join]
  from: ad_impressions
  view_name: fact
  group_label: "Google Ads"
  label: "AdWord Impressions"
  view_label: "Impressions"
  hidden: yes
}
explore: ad_impressions_daily {
  persist_with: adwords_etl_datagroup
  extends: [customer_join]
  from: ad_impressions_daily
  view_name: fact
  group_label: "Google Ads"
  label: "AdWord Impressions by Day"
  view_label: "Impressions by Day"
  hidden: yes
}
explore: ad_impressions_campaign {
  persist_with: adwords_etl_datagroup
  extends: [customer_join, campaign_join]
  from: ad_impressions_campaign
  view_name: fact
  label: "AdWord Impressions by Campaign"
  view_label: "Impressions by Campaign"
  group_label: "Block Adwords"
  hidden: yes
}
explore: ad_impressions_campaign_daily {
  persist_with: adwords_etl_datagroup
  extends: [customer_join, campaign_join]
  from: ad_impressions_campaign_daily
  view_name: fact
  group_label: "Google Ads"
  label: "AdWord Impressions by Campaign"
  view_label: "Impressions by Campaign"
  hidden: yes
}
explore: ad_impressions_ad_group {
  persist_with: adwords_etl_datagroup
  extends: [customer_join, campaign_join, ad_group_join]
  from: ad_impressions_ad_group
  view_name: fact
  group_label: "Google Ads"
  label: "AdWord Impressions by Ad Group"
  view_label: "Impressions by Ad Group"
  hidden: yes
}
explore: ad_impressions_ad_group_daily {
  extends: [customer_join, campaign_join, ad_group_join]
  from: ad_impressions_ad_group_daily
  view_name: fact
  group_label: "Google AdWords"
  label: "AdWord Impressions by Ad Group"
  view_label: "Impressions by Ad Group"
  hidden: yes
}
explore: ad_impressions_ad {
  persist_with: adwords_etl_datagroup
  extends: [customer_join, campaign_join, ad_group_join, ad_join]
  from: ad_impressions_ad
  view_name: fact
  group_label: "Block Adwords"
  label: "AdWord Impressions by Ad"
  view_label: "Impressions by Ad"
  hidden: no
  join: conversion {
    from: ad_impressions_ad_conversion_adapter
    view_label: "Conversions by Ad"
    sql_on:  ${fact.campaign_id} = ${conversion.campaign_id}
      AND ${fact.ad_group_id} = ${conversion.ad_group_id}
      AND ${fact.criterion_id} = ${conversion.criterion_id}
      AND ${fact.creative_id} = ${conversion.creative_id}
      AND ${fact._date} = ${conversion._date}
      AND ${fact.slot} = ${conversion.slot}
      AND ${fact.is_negative} = ${conversion.is_negative}
      AND ${fact.device} = ${conversion.device}
      AND ${fact.ad_network_type1} = ${conversion.ad_network_type1}
      AND ${fact.ad_network_type2} = ${conversion.ad_network_type2} ;;
    relationship: one_to_many
  }
}
explore: ad_impressions_keyword {
  persist_with: adwords_etl_datagroup
  extends: [customer_join, campaign_join, ad_group_join]
  from: ad_impressions_keyword
  view_name: fact
  group_label: "Google Ads"
  label: "AdWord Impressions by Keyword"
  view_label: "Impressions by Keyword"
  hidden: yes
}
explore: ad_impressions_geo {
  persist_with: adwords_etl_datagroup
  extends: [customer_join, campaign_join, ad_group_join]
  from: ad_impressions_geo
  view_name: fact
  group_label: "Google Ads"
  label: "AdWord Impressions by Geo"
  view_label: "Impressions by Geo"
  hidden: yes
  join: geo_country {
    from: geotargeting
    view_label: "Country"
    fields: [country_code]
    sql_on: ${fact.country_criteria_id} = ${geo_country.criteria_id_string} ;;
    relationship: many_to_one
  }
}

# Multi-Use Joins
explore: ad_join {
  extension: required
  join: ad {
    from: ad
    view_label: "Ads"
    sql_on: ${fact.creative_id} = ${ad.creative_id} AND
      ${fact.ad_group_id} = ${ad.ad_group_id};;
    relationship:  many_to_one
  }
}
explore: ad_group_join {
  extension: required
  join: ad_group {
    from: ad_group
    view_label: "Ad Groups"
    sql_on: ${fact.ad_group_id} = ${ad_group.ad_group_id} AND
      ${fact.campaign_id} = ${ad_group.campaign_id};;
    relationship: many_to_one
  }
}
explore: customer_join {
  extension: required
  join: customer {
    from: customer
    view_label: "Customer"
    sql_on:
      ${fact._date} = ${customer._date} ;;
    relationship: many_to_one
  }
}
explore: campaign_join {
  extension: required
  join: campaign {
    from: campaign
    view_label: "Campaign"
    sql_on: ${fact.campaign_id} = ${campaign.campaign_id};;
    relationship: many_to_one
  }
}

# Supplemental
explore: ad {
  extension: required
  persist_with: adwords_etl_datagroup
  from: ad
  view_name: ad
  hidden: yes
  join: ad_group {
    from: ad_group
    view_label: "Ad Group"
    sql_on: ${ad.ad_group_id} = ${ad_group.ad_group_id} AND
      ${ad.ad_group_id} = ${ad_group.ad_group_id} AND
      ${ad._date} = ${ad_group._date};;
    relationship: many_to_one
  }
  join: campaign {
    from: campaign
    view_label: "Campaign"
    sql_on: ${ad_group_id.campaign_id} = ${campaign.campaign_id} ;;
    relationship: many_to_one
  }
  join: customer {
    from: customer
    view_label: "Customer"
    sql_on: ${ad._date} = ${customer._date} ;;
    relationship: many_to_one
  }
}
explore: ad_group {
  extension: required
  persist_with: adwords_etl_datagroup
  from: ad_group
  view_name: ad_group
  hidden: yes
  join: campaign {
    from: campaign
    view_label: "Campaign"
    sql_on: ${ad_group.campaign_id} = ${campaign.campaign_id};;
    relationship: many_to_one
  }
  join: customer {
    from: customer
    view_label: "Customer"
    sql_on: ${ad_group._date} = ${customer._date} ;;
    relationship: many_to_one
  }
}
explore: campaign {
  persist_with: adwords_etl_datagroup
  from: campaign
  view_name: campaign
  hidden: yes
}
explore: campaign_budget_date_fact {
  persist_with: adwords_etl_datagroup
  hidden: yes
  label: "Campaign Budget Date Fact"
  view_label: "Campaign Budget Date Fact"
  from: campaign_budget_date_fact
  view_name: fact
  join: campaign {
    from: campaign
    view_label: "Campaign"
    sql_on: ${fact.campaign_id} = ${campaign.campaign_id};;
    relationship: many_to_one
  }
}
explore: customer {
  persist_with: adwords_etl_datagroup
  from: customer
  view_name: customer
  hidden: yes
}

explore: period_fact {
  extends: [customer_join, campaign_join, ad_group_join,  ad_join]
  persist_with: adwords_etl_datagroup
  from: period_fact
  view_name: fact
  group_label: "Block Adwords"
  label: "Adwords Period Comparison"
  view_label: "This Period"

  join: last_fact {
    from: period_fact
    view_label: "Prior Period"
    sql_on:
      ${fact.date_last_period} = ${last_fact.date_period}
      AND ${fact.date_day_of_period} = ${last_fact.date_day_of_period}
      {% if (ad._in_query or fact.creative_id._in_query) %}
        AND ${fact.creative_id} = ${last_fact.creative_id}

      {% endif %}
      {% if (ad_group._in_query or fact.ad_group_id._in_query) or (ad._in_query )  %}
        AND ${fact.ad_group_id} = ${last_fact.ad_group_id}
      {% endif %}
      {% if (campaign._in_query or fact.campaign_id._in_query) or (ad_group._in_query or fact.ad_group_id._in_query) or (ad._in_query)  %}
        AND ${fact.campaign_id} = ${last_fact.campaign_id}
      {% endif %};;
    relationship: one_to_one
  }
  join: parent_fact {
    from: period_fact
    view_label: "Parent This Period"
    sql_on:
      ${fact.date_period} = ${parent_fact.date_period}
      AND ${fact.date_day_of_period} = ${last_fact.date_day_of_period}
      {% if (ad._in_query)  %}
        AND ${fact.ad_group_id} = ${parent_fact.ad_group_id}
      {% endif %}
      {% if (ad_group._in_query or fact.ad_group_id._in_query) or (ad._in_query )  %}
        AND ${fact.campaign_id} = ${parent_fact.campaign_id}
      {% endif %}
 ;;
    relationship: many_to_one
  }
  join: total {
    from: date_fact
    view_label: "Total This Period"
    sql_on: ${fact.date_period} = ${total.date_period} ;;
    relationship: many_to_one
  }
  join: last_total {
    from: date_fact
    view_label: "Total Last Period"
    sql_on: ${fact.date_last_period} = ${last_total.date_period} ;;
    relationship: many_to_one
  }
}
