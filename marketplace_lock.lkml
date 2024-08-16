###################################################################################
# This is a read-only file! Its contents can be edited through the Marketplace UI #
# See the docs at: https://cloud.google.com/looker/docs/data-modeling/marketplace              #
###################################################################################

marketplace_ref: {
  listing: "google-ads-transfer-v2"
  version: "3.0.0"
  models: ["block_google_ads_transfer_new_v2"]
  override_constant: CONNECTION_NAME { value:"youfit" }
  override_constant: GOOGLE_ADS_SCHEMA { value:"google_ads" }
  override_constant: GOOGLE_ADS_CUSTOMER_ID { value:"1962270511" }
}
