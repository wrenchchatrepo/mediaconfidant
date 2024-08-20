include: "/marketplace_google-ads/**/*"

explore: ad_basic_stats {
  group_label: "Block Google Ads"
  view_label: "Ad Performance (Current Period)"
  description: "Ad Performance including Ad Groups, Keywords and Campaigns"
  view_name: fact
  from: ad_basic_stats

  conditionally_filter: {
    filters: [
      fact.period: "28 day",
      fact.date_period_latest: "Yes"
    ]
    unless: [fact.date_date]
  }



  join: last_fact {
    from: ad_stats
    view_label: "Ad Performance (Last Period)"
    sql_on:
      ${fact.external_customer_id} = ${last_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_fact.campaign_id} AND
      ${fact.ad_group_id} = ${last_fact.ad_group_id} AND
      ${fact.creative_id} = ${last_fact.creative_id} AND
      ${fact.date_last_period} = ${last_fact.date_period} AND
      ${fact.date_day_of_period} = ${last_fact.date_day_of_period} ;;
    relationship: many_to_many
  }

  join: ad {
    from: ad
    view_label: "Ads"
    sql_on: ${fact.creative_id} = ${ad.creative_id} AND
      ${fact.ad_group_id} = ${ad.ad_group_id} AND
      ${fact.campaign_id} = ${ad.campaign_id} AND
      ${fact.external_customer_id} = ${ad.external_customer_id} AND
      ${ad.latest} ;;
    relationship:  many_to_one
  }

  join: ad_group {
    fields: [ad_group.ad_group_name]
    from: ad_group
    view_label: "Ad Groups"
    sql_on: ${fact.ad_group_id} = ${ad_group.ad_group_id} AND
      ${fact.campaign_id} = ${ad_group.campaign_id} AND
      ${fact.external_customer_id} = ${ad_group.external_customer_id} AND
      ${ad_group.latest} ;;
    relationship: many_to_one
  }

  join: keyword {
    fields: [keyword.criteria,keyword.criteria_destination_url]
    from: keyword
    view_label: "Keyword"
    sql_on: ${fact.ad_group_id} = ${keyword.ad_group_id} AND
            ${fact.campaign_id} = ${keyword.campaign_id} AND
            ${fact.external_customer_id} = ${keyword.external_customer_id} AND
            ${keyword.latest} ;;
    relationship: many_to_one
  }

  join: customer {
    view_label: "Customer"
    sql_on: ${fact.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.latest} ;;
    relationship: many_to_one
  }

  join: campaign {
    view_label: "Campaign"
    sql_on: ${fact.campaign_id} = ${campaign.campaign_id} AND
      ${fact.external_customer_id} = ${campaign.external_customer_id} AND
      ${campaign.latest};;
    relationship: many_to_one
  }
  join: budget {
    view_label: "Budget"
    sql_on: ${campaign.budget_id}=${budget.budget_id} AND  ${budget._data_date} = ${fact._data_date} ;;
    relationship: many_to_one
  }
}
