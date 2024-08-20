include: "/views/*/*.view"
include: "/views/*.view"
view: ad_impressions_derived_table {
  extension: required
  derived_table: {
    datagroup_trigger: adwords_etl_datagroup
    explore_source: ad_impressions_daily {
      column: date { field: fact._date }
      column: ad_network_type_1 { field: fact.ad_network_type1 }
      column: ad_network_type_2 { field: fact.ad_network_type2 }
      column: device { field: fact.device }
      column: clicks {field: fact.total_clicks }
      column: conversions {field: fact.total_conversions}
      column: conversion_value {field: fact.total_conversionvalue}
      column: cost {field: fact.total_cost}
      column: impressions { field: fact.total_impressions}
      column: interactions {field: fact.total_interactions}
    }
  }
}
