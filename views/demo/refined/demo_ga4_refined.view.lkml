include: "/views/demo/generated/demo_ga4.view.lkml"

view: demo_ga4_refined {
  extends: [demo_ga4]

  # Add any necessary refined dimensions or measures if needed
  # For now, only including user_list_date_rule_item_info dimension group
  dimension_group: user_list_date_rule_item_info {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.user_list_date_rule_item_info ;;
  }

# Add dimensions for vendor selection
  dimension: vendor {
    type: string
    case: {
      when: {
        label: "Google Analytics 4"
        sql: ${demo_ga4_refined.client_user_id} is not null ;;
      }
      when: {
        label: "Bing Ads"
        sql: ${demo_bing_refined.gclid} is not null ;;
      }
      when: {
        label: "Google Ads"
        sql: ${demo_google_refined.gclid} is not null ;;
      }
      when: {
        label: "Facebook Ads"
        sql: ${demo_facebook_refined.gclid} is not null ;;
      }
      when: {
        label: "TikTok Ads"
        sql: ${demo_tiktok_refined.gclid} is not null ;;
      }
      else: "Unknown"
    }
  }
}
