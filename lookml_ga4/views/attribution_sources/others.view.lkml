view: others {
  derived_table: {
    datagroup_trigger:attribution_channel
    sql: select  '(direct)' as medium, 'Direct'  as source UNION ALL
select '(direct)(none)' as medium, 'Direct' as source UNION ALL
      select  'referral' as medium, 'Referral' as source UNION ALL
      select  'audio'  as medium, 'Audio' as source UNION ALL
      select  'sms'  as medium, 'SMS'  as source UNION ALL
      select  'mobile' as medium, 'Mobile' as source UNION ALL
      select  'push' as medium, 'Mobile Push Notifications' as source  UNION ALL
      select 'affiliate' as medium, 'Affiliates' as source UNION ALL
      select 'email' as medium, 'Email' as source UNION ALL
      select 'cross network' as medium, 'Cross Network' as source;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  set: detail {
    fields: [
      medium,
      source
    ]
  }
}
