include: "/views/cyberdyne/refined/cyberdyne_ga4_refined.view.lkml"
include: "/views/cyberdyne/refined/cyberdyne_bing_refined.view.lkml"
include: "/views/cyberdyne/refined/cyberdyne_google_refined.view.lkml"
include: "/views/cyberdyne/refined/cyberdyne_facebook_refined.view.lkml"
include: "/views/cyberdyne/refined/cyberdyne_tiktok_refined.view.lkml"
include: "/views/shared/shared_data.view.lkml"

view: cyberdyne_vendor_comparison {
  extends: [cyberdyne_ga4_refined, cyberdyne_bing_refined, cyberdyne_google_refined, cyberdyne_facebook_refined, cyberdyne_tiktok_refined]
}
