include: "/views/base/google_adwords_base.view"
include: "/views/*/*.view"
include: "/views/*.view"
view: ad {
  extends: [ google_adwords_base]
  derived_table: {
    datagroup_trigger: adwords_etl_datagroup

    sql:SELECT
      a.*,c.CAMPAIGN_ID
      FROM
      @{GOOGLE_ADS_SCHEMA}.AD_HISTORY a
      INNER JOIN (
      SELECT
      ID,
      MAX(UPDATED_AT) AS LATEST_RECORD
      FROM @{GOOGLE_ADS_SCHEMA}.AD_HISTORY
      GROUP BY 1) b
      ON a.ID = b.ID
      AND a.UPDATED_AT = b.LATEST_RECORD
      INNER JOIN ${ad_group.SQL_TABLE_NAME} c
      ON a.AD_GROUP_ID = c.ID;;
  }

  dimension: ad_group_id {
    sql: ${TABLE}.ad_group_id ;;
    hidden: yes
  }

  dimension: ad_type {
    type: string
    sql: ${TABLE}.ad_type ;;
  }


  dimension: campaign_id {
    sql: ${TABLE}.campaign_id ;;
    hidden: yes
  }

  dimension: creative_approval_status {
    hidden: yes
    type: string
    sql: ${TABLE}.POLICY_SUMMARY_REVIEW_STATE ;;
  }

  dimension: creative_destination_url {
    type: string
    sql: ${TABLE}.DISPLAY_URL ;;
    group_label: "URLS"
  }

  dimension: creative_final_app_urls {
    type: string
    sql: ${TABLE}.FINAL_URL_SUFFIX ;;
    group_label: "URLS"
  }



  dimension: creative_id {
    sql: ${TABLE}.id ;;
    hidden: yes
  }




  dimension: device_preference {
    type: number
    sql: ${TABLE}.device_preference ;;
  }

  dimension: display_url {
    type: string
    sql: ${TABLE}.display_url ;;
    group_label: "URLS"
  }

  dimension: status {
    hidden: yes
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: status_active {
    type: yesno
    sql: ${status} = "enabled" ;;
  }

}
