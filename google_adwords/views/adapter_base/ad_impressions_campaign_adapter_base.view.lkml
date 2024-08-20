include: "/views/*/*.view"
include: "/views/*.view"
view: ad_impressions_campaign_adapter_base {
  extends: [ad_impressions_adapter_base]

  dimension: campaign_primary_key {
    hidden: yes
    sql: concat(${account_primary_key}, "|", ${campaign_id_string}) ;;
  }
  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: ${campaign_primary_key} ;;
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
}
