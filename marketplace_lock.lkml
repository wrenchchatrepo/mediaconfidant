###################################################################################
# This is a read-only file! Its contents can be edited through the Marketplace UI #
# See the docs at: https://cloud.google.com/looker/docs/data-modeling/marketplace              #
###################################################################################

marketplace_ref: {
  listing: "ga4"
  version: "3.0.1"
  models: ["ga4"]
  override_constant: GA4_CONNECTION { value:"" }
  override_constant: GA4_SCHEMA { value:"ga4_export" }
  override_constant: GA4_TABLE_VARIABLE { value:"events_*" }
  override_constant: EVENT_COUNT { value:"" }
}
