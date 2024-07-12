dashboard: standard_reports {
  title: "Standard Reports"
  layout: newspaper
  
  section: {
    title: "User Behavior"
    
    element: {
      title: "Event Count by Device Category"
      type: bar
      query: {
        measures: [ga4_bigquery_export.event_count]
        dimensions: [ga4_bigquery_export.device_category]
      }
    }
    
    element: {
      title: "Event Value by Region"
      type: bar
      query: {
        measures: [ga4_bigquery_export.total_event_value]
        dimensions: [ga4_bigquery_export.geo_region]
      }
    }
  }
  
  section: {
    title: "Ad Performance"
    
    element: {
      title: "Ad Spend by Campaign"
      type: bar
      query: {
        measures: [google_ads.total_ad_spend]
        dimensions: [google_ads.event_item_attribute]
      }
    }
  }
}