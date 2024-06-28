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

## [About Git Large File Storage](https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-git-large-file-storage)
Git LFS handles large files by storing references to the file in the repository, but not the actual file itself. To work around Git's architecture, Git LFS creates a pointer file which acts as a reference to the actual file (which is stored somewhere else). GitHub manages this pointer file in your repository. When you clone the repository down, GitHub uses the pointer file as a map to go and find the large file for you.
### Different maximum size limits for Git LFS apply depending on your GitHub plan.
**Product	Maximum file size**
GitHub Free	2 GB
GitHub Pro	2 GB
**GitHub Team	4 GB**
GitHub Enterprise Cloud	5 GB
If you exceed the per-file limit of 5 GB, the file will be rejected by Git LFS with an error message. You can also use Git LFS with GitHub Desktop. For more information about cloning Git LFS repositories in GitHub Desktop, see [Cloning a repository from GitHub to GitHub Desktop](https://docs.github.com/en/desktop/adding-and-cloning-repositories/cloning-a-repository-from-github-to-github-desktop). You can choose whether Git LFS objects are included in source code archives, such as ZIP files and tarballs, that GitHub creates for your repository. For more information, see [Managing Git LFS objects in archives of your repository.](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings/managing-git-lfs-objects-in-archives-of-your-repository)
### [Pointer file format](https://docs.github.com/en/desktop/adding-and-cloning-repositories/cloning-a-repository-from-github-to-github-desktop)
Git LFS's pointer file looks like this:
```
version https://git-lfs.github.com/spec/v1
oid sha256:4cac19622fc3ada9c0fdeadb33f88f367b541f38b89102a3f1261ac81fd5bcb5
size 84977953
```
It tracks the version of Git LFS you're using, followed by a unique identifier for the file (oid). It also stores the size of the final file.
### Notes:
Git LFS cannot be used with GitHub Pages sites.
#### Git LFS cannot be used with template repositories.
