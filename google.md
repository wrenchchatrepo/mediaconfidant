google:
   gcp_project: mediaconfidant
   gcp_organization: wrench.chat
   region: us-central1
   user: dion@wrench.chat
   service_account: svcacct@mediaconfidant.iam.gserviceaccount.com
   oauth_credentials:
     client_id: "707664316556-4rsr1q2v2id77uaemriohv92cbqv34a6.apps.googleusercontent.com"
     client_secret: "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
   gemini:
     mediaconfidant: "AIzaSyDtJP3SOnkQTJvLuPwoIQsX9tQ8tlLSogc
   bigquery:
      datasets:
         mediaconfidant.bing_ads_dataset
         mediaconfidant.facebook_ads_dataset
         mediaconfidant.google_ads_dataset
         mediaconfidant.google_analytics_dataset
         mediaconfidant.tiktok_ads_dataset
   google_sheets_datasource:
     url: https://docs.google.com/spreadsheets/d/1qmk4HCRPIrz91FBoxe6ez2Nmh3bO3N3osU5fvw-azaQ/edit?usp=sharing
     sheets:
      Bing_Ads
      Bing_Ads
      Google_Ads
      TikTok_Ads
      GA4
   looker_instance: https://0cfc9b4a-1c33-4584-b1dc-25c9ab5c7999.looker.app/browse
   google_cloud_storage_bucket: gs://mediaconfidant_docs_bucket
github_repo: https://github.com/wrenchchatrepo/mediaconfidant.git
   github_org: https://github.com/wrenchchatrepo
   github_org_token: GH_TOKEN
   github_pat_key: "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"


DONE: 1. **Install Google Cloud SDK**: - Ensure that you have the Google Cloud SDK installed. If not, install it by following the instructions at: https://cloud.google.com/sdk/docs/install

DONE: 2. **Authenticate with Google Cloud**: - Authenticate with your Google Cloud account using the following command: ``` gcloud auth login ```

DONE: 3. **Set the Google Cloud Project**: - Set the active project to the one where you want to create the BigQuery dataset and tables: ``` gcloud config set project YOUR_PROJECT_ID ```

DONE: 4. **Enable the BigQuery API**: - Ensure the BigQuery API is enabled for your project: ``` gcloud services enable bigquery.googleapis.com ```

DONE: 5. **Create a BigQuery Dataset**: - Create a BigQuery dataset to hold your tables: ``` bq --location=YOUR_LOCATION mk -d YOUR_DATASET_NAME ```

DONE: 6. **Install and Authenticate with `gsutil`**: - `gsutil` is part of the Google Cloud SDK. Use it to authenticate and access Google Sheets: ``` gcloud auth application-default login ```

This sequence of commands will create native tables in a single dataset in BigQuery for each of the specified sheets from your Google Sheets workbook.

DONE: 7. **Prepare Google Sheets for BigQuery**: - Ensure your Google Sheets workbook is shared with the email `mediaconfidant@appspot.gserviceaccount.com`.

8. **Load Data from Google Sheets to BigQuery**: - For each sheet in your Google Sheets workbook, run the following command to load data into BigQuery. Replace `YOUR_SHEET_NAME` and `YOUR_SHEET_URL` with appropriate values.

   **GA4 Sheet**: ``` bq --location=YOUR_LOCATION load --autodetect --source_format=GOOGLE_SHEETS YOUR_DATASET_NAME.GA4 'YOUR_SHEET_URL' ```

   **Google_Ads Sheet**: ``` bq --location=YOUR_LOCATION load --autodetect --source_format=GOOGLE_SHEETS YOUR_DATASET_NAME.Google_Ads 'YOUR_SHEET_URL' ```

   **Bing_Ads Sheet**: ``` bq --location=YOUR_LOCATION load --autodetect --source_format=GOOGLE_SHEETS YOUR_DATASET_NAME.Bing_Ads 'YOUR_SHEET_URL' ```

   **Facebook_Ads Sheet**: ``` bq --location=YOUR_LOCATION load --autodetect --source_format=GOOGLE_SHEETS YOUR_DATASET_NAME.Facebook_Ads 'YOUR_SHEET_URL' ```

   **TikTok_Ads Sheet**: ``` bq --location=YOUR_LOCATION load --autodetect --source_format=GOOGLE_SHEETS YOUR_DATASET_NAME.TikTok_Ads 'YOUR_SHEET_URL' ```

### Notes: - Replace `YOUR_PROJECT_ID` with your Google Cloud project ID. - Replace `YOUR_LOCATION` with the location of your BigQuery dataset (e.g., `US`). - Replace `YOUR_DATASET_NAME` with the desired name of your BigQuery dataset. - Replace `YOUR_SHEET_URL` with the URL of the specific Google Sheets sheet you are loading.

