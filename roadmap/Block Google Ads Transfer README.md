# Google Ads Block
### What does this Block do for me?

**(1) Combine Multiple Data Sources** - Combine your Google Ads data with data from GA, DoubleClick, Facebook Ads, Salesforce, and more to get a holistic view of all your customer data in one central view (see bottom of this page for instructions).

**(2) Work with Complex Account Hierarchies** - Provides possibilities for custom permissions structures and singular views when you have MCC codes with thousands of accounts or perhaps multiple Data Transfer Service accounts going into multiple BigQuery projects.

**(3) Unbounded Custom Metrics** - With Looker's modeling language (LookML) there are no limitations to the kinds of complex custom metrics that can be created including filtered measures, measures that require advanced mathematical functions, custom groupings. Anything is possible.

**(4) Utilize Machine Learning (ML)** - Through the power of [BQML](https://cloud.google.com/bigquery-ml/docs), unleash advanced use cases like click fraud prevention.

**(5) Take Advantage of Blocks Ecosystem** - Want to add powerful machine learning with BQML? Add the [BQML block](https://looker.com/platform/blocks/source/bigquery-machine-learning-by-google), there are 100s of blocks in the [blocks directory](https://looker.com/platform/directory/home).

**(6) Enterprise Data Platform** - Take advantage of Looker's data platform functionality, including [data actions](https://looker.com/platform/actions), scheduling, permissions, alerting, parameterization (each user can only see their own data), and more. Get immediate alerts when budgets are exceeded, ads are underperforming, or any other business criteria.

**(7) Usable / Shareable Dashboards** - create centralized dashboards for the entire team, and departmental or individual dashboards for each user, and rest easy knowing everyone is looking at the same information at all times. Then schedule the dashboard for emails or alerts, period-end reporting, anomaly detection, or whatever else serves your use-case.

### Block Info and Requirements

This Block is modeled on the schema brought in by Google [BigQuery Transfer Service for Google Ads](https://cloud.google.com/bigquery/docs/google-ads-transformation). This block does not cover every table in the Google Ads schema, it’s designed to help you begin modeling the complex structure of the BigQuery data transfer for Google Ads.


The schema documentation for Google Ads can be found in [Google's docs](https://developers.google.com/google-ads/api/docs/start). This block was developed with [Google Ads API v14](https://developers.google.com/google-ads/api/reference/rpc/v14/overview)

### Google Ads Raw Data Structure

* **Entity Tables and Stats Tables** - There are several primary entities included in the Google Ads data set, such as ad, ad group, campaign, customer, keyword, etc.. Each of these tables has a corresponding _Stats_ table, which includes all the various metrics for that entity. For example, the _campaign_ entity table contains attributes for each campaign, such as the campaign name and campaign status. The corresponding stats table - _Campaign Basic Stats_ contains metrics such as impressions, clicks, and conversions. This [blog post](https://www.bounteous.com/insights/2019/08/21/navigating-google-ad-data-transfer-bigquery/) does a good job of explaining some of the main concepts.

* **Snapshots** - Google Ads dimension tables keep records over time by snapshotting all data at the end of each day. The following day, a new snapshot is taken, and appended to the table. There are two columns on each table: '_DATA_DATE' and '_LATEST_DATE'. '_DATA_DATE' tells you the day the data was recorded, while '_LATEST_DATE' is a **mutable** field that tells you the most recent date a snapshot was taken. Querying the table using '_DATA_DATE' = '_LATEST_DATE' in the 'WHERE' clause would give you only the data for the latest day. **Note** dimension tables like campaign, ad_group are currently joined with the latest data, if you prefer slowly changing dimension join them to the fact tables by date instead.

* **About Partitioning** Currently the block uses Views (i.e. AdBasicStats) not tables (i.e. p_AdBasicStats) - if you are using partitioning then consider changing to use the tables and add [partitioning logic](https://discourse.looker.com/t/analytic-block-partitioned-date-filters-in-bigquery/4380).

### Block Structure

* **upstream_views** - these are views coming directly from BigQuery (with minor modifications). Generate more files as needed and store them in this folder.
* **shared_views** - These are common throughout the model
  * **date_base & period_base** - These are used to provide period over period comparisons
  * **ads_common** - This file contains common metrics in Ads fact tables
* **lookml_dashboards** - Dashboards included with the block
* **pdts** - Transformation tables and BQML demo
* **bqml** - BigQuery Machine Learning Example


### Implementation Instructions / Required Customizations

* **Manifest file** - The manifest file contains [constants](https://docs.looker.com/reference/manifest-params/constant) that should be adapted to your BigQuery project and account numbers. These constants will be set during the installation process initiated on the Marketplace.

* **Refinements** - This block utilizes Refinement files for customization. This method will be required for all customizations/extensions added to this block. For more information on using refinements to customize marketplace blocks, please see [this documentation](https://docs.looker.com/data-modeling/marketplace/customize-blocks).

* **Multiple Accounts** - Union fact and dimension tables if you have multiple accounts. Use a persisted derived table to store the result of the union.

* **Add Stats and Entity tables** - _ad_basic_stats_ is added as an example stats table, along with ad, campaign, keyword, other tables should be imported and joined as needed.

### Ad Traffic Fraud Detection Example ###

Utilizing BigQuery Machine Learning (BQML) and Autoregressive integrated moving average ([ARIMA](https://towardsdatascience.com/how-to-do-time-series-forecasting-in-bigquery-af9eb6be8159)) analysis, the last year's click data is analyzed and patterns are predicted for the following 30 days, allowing you to see irregularities in traffic patterns. The _click_fraud_analysis.view_ file contains embedded documentation about the use case as well as the _Click Analysis Dashboard_

**Note, this functionality is for demo purposes only** Read more about Ad Traffic Quality [here](https://www.google.com/ads/adtrafficquality)
