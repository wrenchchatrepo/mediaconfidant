# Define the database connection to be used for this model.
# connection: "youfit"

# include all the views
# include: "/views/ads_account*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

# datagroup: marketplace_google_ads_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  # max_cache_age: "1 hour"
# }

# persist_with: marketplace_google_ads_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Marketplace Google-ads"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

# explore: ads_account_basic_stats_1962270511 {}
# explore: ads_account_stats_1962270511 {}
# explore: ads_account_conversion_stats_1962270511 {}
# explore: ads_account_non_click_stats_1962270511 {}

# explore: ads_ad_basic_stats_1962270511 {}
# explore: ads_ad_conversion_stats_1962270511 {}
# explore: ads_ad_cross_device_stats_1962270511 {}
# explore: ads_ad_cross_device_conversion_stats_1962270511 {}
# explore: ads_ad_group_ad_label_1962270511 {}
# explore: ads_ad_group_audience_1962270511 {}
# explore: ads_ad_group_audience_basic_stats_1962270511 {}
# explore: ads_ad_group_audience_conversion_stats_1962270511 {}
# explore: ads_ad_group_basic_stats_1962270511 {}
# explore: ads_ad_group_bid_modifier_1962270511 {}
# explore: ads_ad_group_audience_stats_1962270511 {}
# explore: ads_ad_group_audience_non_click_stats_1962270511 {}
# explore: ads_ad_group_criterion_label_1962270511 {}
# explore: ads_ad_group_cross_device_stats_1962270511 {}
# explore: ads_ad_group_cross_device_conversion_stats_1962270511 {}
# explore: ads_ad_group_criterion_1962270511 {}
# explore: ads_ad_group_conversion_stats_1962270511 {}
# explore: ads_ad_group_label_1962270511 {}
# explore: ads_ad_group_stats_1962270511 {}
# explore: ads_ad_stats_1962270511 {}
# explore: ads_ad_group_1962270511 {}
# explore: ads_age_range_basic_stats_1962270511 {}
# explore: ads_ad_1962270511 {}
# explore: ads_age_range_non_click_stats_1962270511 {}
# explore: ads_age_range_conversion_stats_1962270511 {}
# explore: ads_age_range_stats_1962270511 {}
# explore: ads_age_range_1962270511 {}
# explore: ads_asset_group_listing_group_filter_1962270511 {}
# explore: ads_asset_group_asset_1962270511 {}
# explore: ads_asset_group_product_group_stats_1962270511 {}
# explore: ads_asset_group_1962270511 {}
# explore: ads_asset_group_signal_1962270511 {}
# explore: ads_asset_1962270511 {}
# explore: ads_bid_goal_conversion_stats_1962270511 {}
# explore: ads_audience_1962270511 {}
# explore: ads_bid_goal_1962270511 {}
# explore: ads_bid_goal_stats_1962270511 {}
# explore: ads_budget_stats_1962270511 {}
# explore: ads_campaign_audience_conversion_stats_1962270511 {}
# explore: ads_budget_1962270511 {}
# explore: ads_campaign_audience_basic_stats_1962270511 {}
# explore: ads_campaign_asset_stats_1962270511 {}
# explore: ads_campaign_audience_non_click_stats_1962270511 {}
# explore: ads_campaign_audience_stats_1962270511 {}
# explore: ads_campaign_audience_1962270511 {}
# explore: ads_campaign_basic_stats_1962270511 {}
# explore: ads_campaign_conversion_stats_1962270511 {}
# explore: ads_campaign_criterion_1962270511 {}
# explore: ads_campaign_location_target_stats_1962270511 {}
# explore: ads_campaign_label_1962270511 {}
# explore: ads_campaign_cross_device_conversion_stats_1962270511 {}
# explore: ads_campaign_stats_1962270511 {}
# explore: ads_campaign_1962270511 {}
# explore: ads_campaign_cross_device_stats_1962270511 {}
# explore: ads_click_stats_1962270511 {}
# explore: ads_customer_1962270511 {}
# explore: ads_campaign_cookie_stats_1962270511 {}
# explore: ads_gender_conversion_stats_1962270511 {}
# explore: ads_display_video_keyword_stats_1962270511 {}
# explore: ads_display_video_topic_stats_1962270511 {}
# explore: ads_gender_basic_stats_1962270511 {}
# explore: ads_gender_non_click_stats_1962270511 {}
# explore: ads_gender_1962270511 {}
# explore: ads_gender_stats_1962270511 {}
# explore: ads_geo_conversion_stats_1962270511 {}
# explore: ads_hourly_account_conversion_stats_1962270511 {}
# explore: ads_hourly_ad_group_conversion_stats_1962270511 {}
# explore: ads_hourly_account_stats_1962270511 {}
# explore: ads_geo_stats_1962270511 {}
# explore: ads_display_video_automatic_placements_stats_1962270511 {}
# explore: ads_hourly_bid_goal_stats_1962270511 {}
# explore: ads_hourly_ad_group_stats_1962270511 {}
# explore: ads_hourly_campaign_conversion_stats_1962270511 {}
# explore: ads_hourly_campaign_stats_1962270511 {}
# explore: ads_keyword_basic_stats_1962270511 {}
# explore: ads_keyword_cross_device_stats_1962270511 {}
# explore: ads_keyword_conversion_stats_1962270511 {}
# explore: ads_keyword_cross_device_conversion_stats_1962270511 {}
# explore: ads_keyword_stats_1962270511 {}
# explore: ads_keyword_1962270511 {}
# explore: ads_landing_page_stats_1962270511 {}
# explore: ads_location_based_campaign_criterion_1962270511 {}
# explore: ads_locations_distance_stats_1962270511 {}
# explore: ads_paid_organic_stats_1962270511 {}
# explore: ads_parental_status_basic_stats_1962270511 {}
# explore: ads_locations_user_locations_stats_1962270511 {}
# explore: ads_parental_status_conversion_stats_1962270511 {}
# explore: ads_placement_basic_stats_1962270511 {}
# explore: ads_parental_status_non_click_stats_1962270511 {}
# explore: ads_parental_status_1962270511 {}
# explore: ads_parental_status_stats_1962270511 {}
# explore: ads_placement_conversion_stats_1962270511 {}
# explore: ads_placement_stats_1962270511 {}
# explore: ads_placement_non_click_stats_1962270511 {}
# explore: ads_product_group_stats_1962270511 {}
# explore: ads_search_query_conversion_stats_1962270511 {}
# explore: ads_shopping_product_stats_1962270511 {}
# explore: ads_shopping_product_conversion_stats_1962270511 {}
# explore: ads_search_query_stats_1962270511 {}
# explore: ads_video_conversion_stats_1962270511 {}
# explore: ads_video_non_click_stats_1962270511 {}
# explore: ads_video_stats_1962270511 {}
# explore: p_ads_account_basic_stats_1962270511 {}
# explore: ads_video_1962270511 {}
# explore: ads_video_basic_stats_1962270511 {}
# explore: ads_placement_1962270511 {}
# explore: p_ads_account_stats_1962270511 {}
# explore: p_ads_account_conversion_stats_1962270511 {}
# explore: p_ads_account_non_click_stats_1962270511 {}
# explore: p_ads_ad_conversion_stats_1962270511 {}
# explore: p_ads_ad_cross_device_conversion_stats_1962270511 {}
# explore: p_ads_ad_basic_stats_1962270511 {}
# explore: p_ads_ad_cross_device_stats_1962270511 {}
# explore: p_ads_ad_group_ad_label_1962270511 {}
# explore: p_ads_ad_group_audience_basic_stats_1962270511 {}
# explore: p_ads_ad_group_audience_non_click_stats_1962270511 {}
# explore: p_ads_ad_group_audience_conversion_stats_1962270511 {}
# explore: p_ads_ad_group_audience_stats_1962270511 {}
# explore: p_ads_ad_group_audience_1962270511 {}
# explore: p_ads_ad_group_bid_modifier_1962270511 {}
# explore: p_ads_ad_group_conversion_stats_1962270511 {}
# explore: p_ads_ad_group_basic_stats_1962270511 {}
# explore: p_ads_ad_group_criterion_label_1962270511 {}
# explore: p_ads_ad_group_criterion_1962270511 {}
# explore: p_ads_ad_group_cross_device_stats_1962270511 {}
# explore: p_ads_ad_group_label_1962270511 {}
# explore: p_ads_ad_group_1962270511 {}
# explore: p_ads_ad_group_stats_1962270511 {}
# explore: p_ads_ad_1962270511 {}
# explore: p_ads_ad_stats_1962270511 {}
# explore: p_ads_age_range_basic_stats_1962270511 {}
# explore: p_ads_age_range_conversion_stats_1962270511 {}
# explore: p_ads_age_range_non_click_stats_1962270511 {}
# explore: p_ads_age_range_stats_1962270511 {}
# explore: p_ads_asset_group_asset_1962270511 {}
# explore: p_ads_ad_group_cross_device_conversion_stats_1962270511 {}
# explore: p_ads_asset_group_listing_group_filter_1962270511 {}
# explore: p_ads_asset_group_product_group_stats_1962270511 {}
# explore: p_ads_asset_group_signal_1962270511 {}
# explore: p_ads_age_range_1962270511 {}
# explore: p_ads_asset_group_1962270511 {}
# explore: p_ads_asset_1962270511 {}
# explore: p_ads_audience_1962270511 {}
# explore: p_ads_bid_goal_conversion_stats_1962270511 {}
# explore: p_ads_bid_goal_stats_1962270511 {}
# explore: p_ads_budget_1962270511 {}
# explore: p_ads_budget_stats_1962270511 {}
# explore: p_ads_campaign_asset_stats_1962270511 {}
# explore: p_ads_bid_goal_1962270511 {}
# explore: p_ads_campaign_audience_stats_1962270511 {}
# explore: p_ads_campaign_audience_basic_stats_1962270511 {}
# explore: p_ads_campaign_audience_1962270511 {}
# explore: p_ads_campaign_cookie_stats_1962270511 {}
# explore: p_ads_campaign_cross_device_conversion_stats_1962270511 {}
# explore: p_ads_campaign_basic_stats_1962270511 {}
# explore: p_ads_campaign_conversion_stats_1962270511 {}
# explore: p_ads_campaign_audience_conversion_stats_1962270511 {}
# explore: p_ads_campaign_criterion_1962270511 {}
# explore: p_ads_campaign_1962270511 {}
# explore: p_ads_campaign_cross_device_stats_1962270511 {}
# explore: p_ads_campaign_location_target_stats_1962270511 {}
# explore: p_ads_campaign_stats_1962270511 {}
# explore: p_ads_campaign_audience_non_click_stats_1962270511 {}
# explore: p_ads_click_stats_1962270511 {}
# explore: p_ads_customer_1962270511 {}
# explore: p_ads_display_video_keyword_stats_1962270511 {}
# explore: p_ads_campaign_label_1962270511 {}
# explore: p_ads_display_video_automatic_placements_stats_1962270511 {}
# explore: p_ads_gender_basic_stats_1962270511 {}
# explore: p_ads_display_video_topic_stats_1962270511 {}
# explore: p_ads_gender_stats_1962270511 {}
# explore: p_ads_gender_conversion_stats_1962270511 {}
# explore: p_ads_geo_conversion_stats_1962270511 {}
# explore: p_ads_gender_non_click_stats_1962270511 {}
# explore: p_ads_gender_1962270511 {}
# explore: p_ads_hourly_account_stats_1962270511 {}
# explore: p_ads_geo_stats_1962270511 {}
# explore: p_ads_hourly_account_conversion_stats_1962270511 {}
# explore: p_ads_hourly_ad_group_conversion_stats_1962270511 {}
# explore: p_ads_hourly_bid_goal_stats_1962270511 {}
# explore: p_ads_hourly_campaign_conversion_stats_1962270511 {}
# explore: p_ads_hourly_campaign_stats_1962270511 {}
# explore: p_ads_hourly_ad_group_stats_1962270511 {}
# explore: p_ads_keyword_basic_stats_1962270511 {}
# explore: p_ads_keyword_conversion_stats_1962270511 {}
# explore: p_ads_keyword_stats_1962270511 {}
# explore: p_ads_landing_page_stats_1962270511 {}
# explore: p_ads_location_based_campaign_criterion_1962270511 {}
# explore: p_ads_keyword_cross_device_stats_1962270511 {}
# explore: p_ads_keyword_cross_device_conversion_stats_1962270511 {}
# explore: p_ads_keyword_1962270511 {}
# explore: p_ads_locations_distance_stats_1962270511 {}
# explore: p_ads_parental_status_non_click_stats_1962270511 {}
# explore: p_ads_parental_status_conversion_stats_1962270511 {}
# explore: p_ads_paid_organic_stats_1962270511 {}
# explore: p_ads_parental_status_1962270511 {}
# explore: p_ads_parental_status_basic_stats_1962270511 {}
# explore: p_ads_locations_user_locations_stats_1962270511 {}
# explore: p_ads_parental_status_stats_1962270511 {}
# explore: p_ads_placement_basic_stats_1962270511 {}
# explore: p_ads_placement_conversion_stats_1962270511 {}
# explore: p_ads_placement_stats_1962270511 {}
# explore: p_ads_search_query_stats_1962270511 {}
# explore: p_ads_placement_non_click_stats_1962270511 {}
# explore: p_ads_product_group_stats_1962270511 {}
# explore: p_ads_placement_1962270511 {}
# explore: p_ads_search_query_conversion_stats_1962270511 {}
# explore: p_ads_shopping_product_conversion_stats_1962270511 {}
# explore: p_ads_shopping_product_stats_1962270511 {}
# explore: p_ads_video_basic_stats_1962270511 {}
# explore: p_ads_video_non_click_stats_1962270511 {}
# explore: p_ads_video_conversion_stats_1962270511 {}
# explore: p_ads_video_1962270511 {}
# explore: p_ads_video_stats_1962270511 {}
