include: "/views/*/*.view"
include: "/views/*.view"
view: ad_impressions_ad_conversion_adapter {
  extends: [ google_adwords_base,  ad_metrics_conversion_base_adapter]
  sql_table_name: @{GOOGLE_ADS_SCHEMA}.ad_conversion_stats ;;

  dimension: ad_conversion_primary_key {
    hidden: yes
    sql: concat(
      ${date_string}, "|",
      ${ad_network_type1}, "|",
      ${ad_network_type2}, "|",
      ${device}, "|",
      ${campaign_id_string}, "|",
      ${ad_group_id_string}, "|",
      ${criterion_id_string}, "|",
      ${slot}, "|",
      ${creative_id_string}, "|",
      ${is_negative_string}, "|",
      ${conversion_category_name}, "|",
      ${conversion_tracker_id}, "|",
      ${conversion_type_name},) ;;
  }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: ${ad_conversion_primary_key} ;;
  }

  dimension: base_campaign_id {
    hidden: yes
    sql: ${TABLE}.base_campaign_id ;;
  }

  dimension: campaign_id {
    hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_id_string {
    hidden: yes
    sql: CAST(${TABLE}.campaign_id as STRING) ;;
  }

  dimension: ad_group_id {
    hidden: yes
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: ad_group_id_string {
    hidden: yes
    sql: CAST(${TABLE}.ad_group_id as STRING) ;;
  }

  dimension: base_ad_group_id {
    hidden: yes
    sql: ${TABLE}.base_ad_group_id ;;
  }

  dimension: criterion_id {
    hidden: yes
    sql: ${TABLE}.criterion_id ;;
  }

  dimension: criterion_id_string {
    hidden: yes
    sql: CAST(${TABLE}.criterion_id as STRING) ;;
  }

  dimension: slot {
    hidden: yes
    type: string
    sql: ${TABLE}.slot ;;
  }

  dimension: is_negative {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_negative ;;
  }

  dimension: is_negative_string {
    hidden: yes
    sql: CAST(${TABLE}.is_negative AS STRING) ;;
  }

  dimension: creative_id {
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: creative_id_string {
    hidden: yes
    sql: CAST(${TABLE}.id as STRING) ;;
  }

  dimension: ad_network_type1 {
    hidden: yes
    type: string
    sql: ${TABLE}.ad_network_type_1 ;;
  }

  dimension: ad_network_type2 {
    hidden: yes
    type: string
    sql: ${TABLE}.ad_network_type_2 ;;
  }

  dimension: conversion_category_name {
    hidden: yes
    type: string
    sql: ${TABLE}.conversion_category_name ;;
  }

  dimension: conversion_tracker_id {
    hidden: yes
    type: number
    sql: ${TABLE}.conversion_tracker_id ;;
  }

  dimension: conversion_type_name {
    type: string
    sql: ${TABLE}.conversion_type_name ;;
    label: "Conversion Type"
  }

  dimension: conversions {
    hidden: yes
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: conversionvalue {
    hidden: yes
    type: number
    sql: ${TABLE}.conversion_value ;;
  }

  dimension: device {
    hidden: yes
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: view_through_conversions {
    hidden: yes
    type: number
    sql: ${TABLE}.view_through_conversions ;;
  }

  measure: custom_conversions {
    type: sum
    sql: ${TABLE}.conversions ;;
    description: "Custom Conversions"
    value_format_name: decimal_0
  }

  measure: custom_conversion_value {
    type: sum
    sql: ${TABLE}.conversion_value ;;
    description: "Custom Conversions"
    value_format_name: usd_0
  }

}
