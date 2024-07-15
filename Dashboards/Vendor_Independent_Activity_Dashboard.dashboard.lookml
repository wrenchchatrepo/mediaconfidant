dashboard: cyberdyne_activity_dashboard
title: "Cyberdyne Activity Dashboard"
layout: newspaper
preferred_viewer: dashboards-next

elements:
- name: cyberdyne_ga4_activity
  title: "GA4 Activity"
  type: looker_column
  model: core_hub
  explore: cyberdyne_ga4
  fields: ["event_name", "event_value_in_usd"]
  filters:
  - event_name: "is not null"
  sorts: ["event_name asc"]
  limit: 500

- name: cyberdyne_bing_activity
  title: "Bing Activity"
  type: looker_column
  model: core_hub
  explore: cyberdyne_bing
  fields: ["event_name", "event_value_in_usd"]
  filters:
  - event_name: "is not null"
  sorts: ["event_name asc"]
  limit: 500

- name: cyberdyne_google_activity
  title: "Google Activity"
  type: looker_column
  model: core_hub
  explore: cyberdyne_google
  fields: ["event_name", "event_value_in_usd"]
  filters:
  - event_name: "is not null"
  sorts: ["event_name asc"]
  limit: 500

- name: cyberdyne_facebook_activity
  title: "Facebook Activity"
  type: looker_column
  model: core_hub
  explore: cyberdyne_facebook
  fields: ["event_name", "event_value_in_usd"]
  filters:
  - event_name: "is not null"
  sorts: ["event_name asc"]
  limit: 500

- name: cyberdyne_tiktok_activity
  title: "TikTok Activity"
  type: looker_column
  model: core_hub
  explore: cyberdyne_tiktok
  fields: ["event_name", "event_value_in_usd"]
  filters:
  - event_name: "is not null"
  sorts: ["event_name asc"]
  limit: 500
