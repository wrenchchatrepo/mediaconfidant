dashboard: cyberdyne_comparison_dashboard
title: "Cyberdyne Comparison Dashboard"
layout: newspaper
preferred_viewer: dashboards-next

elements:
- name: compare_activity
  title: "Compare Activity Across Vendors"
  type: looker_column
  model: core_hub
  explore: cyberdyne_ga4
  merge_results:
sources:
- explore: cyberdyne_ga4
  fields: ["event_name", "event_value_in_usd"]
- explore: cyberdyne_bing
  fields: ["event_name", "event_value_in_usd"]
- explore: cyberdyne_google
  fields: ["event_name", "event_value_in_usd"]
- explore: cyberdyne_facebook
  fields: ["event_name", "event_value_in_usd"]
- explore: cyberdyne_tiktok
  fields: ["event_name", "event_value_in_usd"]
  filters:
- event_name: "is not null"
  sorts: ["event_name asc"]
  limit: 500
