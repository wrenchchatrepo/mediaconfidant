# Google Ads Block
## What Does This Block Do For Me? ##

This block contains views, explores and dashboards used for analysis in Looker of exported Google Ads data. It is modeled on the schema from Fivetrans's [Google Ads ETL](https://fivetran.com/directory/google-ads) brought over with Looker-specific connector (https://fivetran.com/integrations/adwords_for_looker).
The schema documentation for Ads can be found in [Google's docs](https://developers.google.com/adwords/api/docs/appendix/reports).

## Explores ##
* AdWord Impressions by Ad
* Adwords Period Comparison

## Dashboards ##
* Adwords Overview
* Clicks Overview
* Conversions Overview

## Installation ##
This block is installed via the Looker Marketplace. For more information about the Looker Marketplace, please visit this [link](https://docs.looker.com/data-modeling/marketplace).

#### Constants ####
During installation you will provide two values to populate the following constants:
* Connection Name - the Looker connection with access to and permission to retrieve data from your Google Ads tables.
* Google Ads Schema - the schema name for your exported Google Ads data.

#### Customization ####
- This block uses Refinements to allow for modification or extension of the LookML content. For more information on using refinements to customize marketplace blocks, please see [this documentation](https://docs.looker.com/data-modeling/marketplace/customize-blocks).
- There are several included explores that are not visible by default. These explores can easily be un-hidden using refinements, or changed to better suit the specific needs of your instance.
