# Bing Ads Block

THIS BLOCK IS DEPRECATED AS OF 4/2/2021.

This repository contains views and explores used for the Bing Ads Block dashboards. There are 5 dashboards that come with this block: Bing Adwords Overview, Bing Adwords - Clicks, Bing Adwords - Conversions, Bing Adwords - Impressions and Bing Adwords - Spend. Each of the dashboards provides in-depth analysis of ad/campaign performance over a given timeframe.

This project is remotely included through the Bing Ads Block Config project.
To pull updates from this project, update the `ref:` parameter in the manifest file. It should point to the latest commit in [block-bing-ads](https://github.com/looker/block-bing-ads/commits/master).

The LookML constants are used to specify the name of the schema and connection. They are defined in the Bing Ads Block Config project.

### Block Info

This Block is modeled on the schema from Fivetrans's [Bing Ads ETL](https://fivetran.com/directory/bing-ads) brought over with Looker-specific connector (https://fivetran.com/integrations/bing_ads_for_looker).

The schema documentation for Bing Ads can be found in [Bing's docs](https://docs.microsoft.com/en-us/advertising/guides/reference?view=bingads-13).

