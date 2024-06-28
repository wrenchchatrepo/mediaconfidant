# MediaConfidant
# Ad Performance Data Integration and Analysis

## Project Overview
This project integrates advertising data from various platforms using BigQuery, Dataform, and Looker to provide comprehensive insights into ad performance.

## Data Sources
	Google Ads
	Facebook Ads
	Bing Ads
	TikTok Ads
	Google Analytics

## Issues
<!-- issueTable -->
| Title                                                                                                  |         Status          | Assignee | Body           |
| :----------------------------------------------------------------------------------------------------- | :---------------------: | :------: | :------------- |
| <a href="https://github.com/wrenchchatrepo/orale_customer/issues/1">Just a test of a github action</a> | :eight_spoked_asterisk: |          | Please ignore. |
<!-- issueTable -->

## Directory Structure
```
/dataform
	/definitions
	standardized_ads_data.sqlx
	combined_metrics.sqlx
	/dataform.json
/bigquery
	google_ads_schema.sql
	facebook_ads_schema.sql
	bing_ads_schema.sql
	tiktok_ads_schema.sql
	google_analytics_schema.sql
/looker
	/views
	standardized_ads_data.view.lkml
	combined_metrics.view.lkml
	logistic_regression_predictions.view.lkml
	arima_plus_forecasts.view.lkml
	/models
	data_product.model.lkml
	/manifest
	manifest.lkml
	/dashboards
	combined_metrics_dashboard.dashboard.lkml
	logistic_regression_predictions_dashboard.dashboard.lkml
	arima_plus_forecasts_dashboard.dashboard.lkml
/scripts
	create_standardized_ads_data_view.py
	create_combined_metrics_view.py
	create_logistic_regression_predictions_view.py
	create_arima_plus_forecasts_view.py
	create_model_file.py
	create_manifest_file.py
	create_combined_metrics_dashboard.py
	create_logistic_regression_predictions_dashboard.py
	create_arima_plus_forecasts_dashboard.py
```

## Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/mediaconfidant.git
   cd your_project_repo
2.	Set up the environment and install dependencies.

## Usage Instructions
1.	Load raw data into BigQuery tables using the schemas in /bigquery.
2.	Run Dataform transformations.
3.	Use the scripts in /scripts to create LookML files and dashboards in Looker.

## Security and Access Control
Configure Looker User Attributes to securely deliver data to customers.

