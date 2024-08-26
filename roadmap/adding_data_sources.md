# Adding Data Sources

## Overview

This document provides instructions on how to add data sources, such as Bing Ads, TikTok Ads, Meta (Facebook/Instagram), and Google Ads, to your Looker instance. Additionally, it recommends using Stitch for integrating a wide variety of data sources into BigQuery.

### 1. Bing Ads

Overview

The Bing Ads Block provides dashboards that offer in-depth analysis of ad/campaign performance over time. The block includes dashboards for clicks, conversions, impressions, and spend.

Steps to Add Bing Ads Data Source

1. Install the Bing Ads Block:
+ This block is deprecated, but if you’re still using it, you’ll need to include the Bing Ads Block Config project and ensure your manifest file points to the correct commit in the block-bing-ads repository.
2. Configure Connection:
+ Specify the schema and connection name in the Bing Ads Block Config project.
+ For more details on the schema, refer to Bing’s documentation.
3. Customizations:
+ If you’re using Fivetran’s Bing Ads ETL, ensure your Looker instance is configured correctly for the data model.
+ Update the LookML constants for your specific schema and connection.

Reference

+ For more details, see the [Bing Ads Block README](Block Bing Ads README.md).

### 2. TikTok Ads

Overview

The TikTok Ads Block provides insights into your TikTok ad performance, including metrics like clicks, spend, impressions, and cost totals.

Steps to Add TikTok Ads Data Source

1. Install the TikTok Ads Block:
+ Install the block from the Looker Marketplace or by following the instructions in the README file.
2. Configure Connection:
+ Provide the connection name and schema for your TikTok Ads data during installation.
+ Customize the block using refinements, as needed, to tailor the LookML content to your needs.
3. Dashboards:
+ The block includes dashboards like TikTok Metrics, which provide high-level metrics and visualizations for campaign performance.

Reference

+ For more details, see the [TikTok Ads Block README](Block TikTok README.md).

### 3. Meta (Facebook/Instagram)

Overview

The Google Cloud Cortex Framework for Meta provides insights into your campaign performance across platforms like Facebook, Instagram, and Facebook Audience Network.

Steps to Add Meta Data Source

1. Install the Meta Block:
+ Install the block via the Looker Marketplace or by forking the repository and connecting it to a new LookML project.
2. Configure Connection:
+ Update the constants in the manifest.lkml file with your Google Cloud project ID and the Meta reporting dataset in BigQuery.
3. Customizations:
+ Adjust derived tables and unhide additional dimensions/measures if necessary.
4. Dashboards:
+ The block provides various dashboards, including campaign performance, impressions by platform, and engagement metrics.

Reference

+ For more details, see the [Meta Block README](Cortex Meta README.md).

### 4. Google Ads

Overview

The Google Ads Block is designed to help you model and analyze Google Ads data using BigQuery.

Steps to Add Google Ads Data Source

1. Install the Google Ads Block:
+ Install the block via the Looker Marketplace or manually by including the repository in your LookML project.
2. Configure Connection:
+ Update the constants in the manifest.lkml file with your BigQuery project ID and Google Ads dataset information.
3. Customizations:
+ Use refinements to customize the block to suit your needs, especially if working with complex account hierarchies.
4. Dashboards:
+ The block includes various dashboards, such as campaign performance, ad traffic fraud detection, and machine learning examples using BQML.

Reference

+ For more details, see the [Google Ads Block README](Block Google Ads Transfer README.md).

### 5. Recommendation: Stitch for Data Integration

Why Stitch?

Stitch is a cloud-based ETL (Extract, Transform, Load) service that can connect various data sources to your BigQuery instance. It simplifies data integration by handling the extraction and loading of data from sources like MySQL, Salesforce, and Google Analytics.

Steps to Use Stitch

1. Sign Up for Stitch:
+ Create a Stitch account and start a free trial.
2. Connect a Destination:
+ Connect BigQuery as your destination for replicated data.
3. Add Integrations:
+ Add data sources (integrations) like databases, SaaS applications, or APIs to Stitch.
4. Monitor Replication:
+ Configure replication settings and monitor the data pipeline as Stitch moves data into BigQuery.

Reference

+ For more details, see the Stitch Documentation.
https://www.stitchdata.com/docs/destinations/google-bigquery/v2
https://www.stitchdata.com/docs/integrations/saas/lookml