# Step 1: Setting Up Your Google Cloud Environment
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable cloudbilling.googleapis.com

# Step 2: Creating a Project Owner Service Account
gcloud projects add-iam-policy-binding mediaconfidant --member="serviceAccount:svcacct@mediaconfidant.iam.gserviceaccount.com" --role="roles/owner"
gcloud iam service-accounts create svcacct --display-name 
"Project Owner Service Account"
gcloud services enable securitycenter.googleapis.com --project=mediaconfidant
gcloud services enable compute.googleapis.com --project=mediaconfidant
gcloud services enable monitoring.googleapis.com --project=mediaconfidant
gcloud services enable logging.googleapis.com --project=mediaconfidant
gcloud services enable bigquery.googleapis.com --project=mediaconfidant
gcloud services enable storage.googleapis.com --project=mediaconfidant
gcloud services enable cloudscheduler.googleapis.com --project=mediaconfidant
gcloud services enable composer.googleapis.com --project=mediaconfidant
gcloud services enable datacatalog.googleapis.com --project=mediaconfidant
gcloud services enable dataform.googleapis.com --project=mediaconfidant
gcloud services enable cloudfunctions.googleapis.com --project=mediaconfidant
gcloud services enable aiplatform.googleapis.com --project=mediaconfidant
gcloud services enable bigquerydatatransfer.googleapis.com --project=mediaconfidant
gcloud iam service-accounts keys create svcacct_key.json --iam-account=svcacct@mediaconfidant.iam.gserviceaccount.com

# Step 3: Verify Billing is Enabled
PLEASE REVIEW DOCUMENTATION FOR THIS COMMAND.

# Step 4: Securing Cloud Resources
gcloud compute networks create mediaconfidant-vpc --subnet-mode=custom --bgp-routing-mode=regional
gcloud compute networks subnets create mediaconfidant-subnet --network=mediaconfidant-vpc --range=10.0.0.0/24 --region=us-central1
gcloud compute firewall-rules create mediaconfidant-allow-ssh --direction=INGRESS --priority=1000 --network=mediaconfidant-vpc --action=ALLOW --rules=tcp:22 --source-ranges=0.0.0.0/0

# Step 5: Managing and Monitoring Cloud Resources
PLEASE REVIEW DOCUMENTATION FOR THIS COMMAND.

# Step 6: Setting Up Data Sources and BigQuery Datasets
bq mk --dataset mediaconfidant:google_analytics_dataset
bq mk --dataset mediaconfidant:google_ads_dataset
bq mk --dataset mediaconfidant:facebook_ads_dataset

# Create a Cloud Composer environment
gcloud composer environments create mediaconfidant-env \
    --location=us-central1 \
    --zone=us-central1-f \
    --machine-type=n1-standard-1 \
    --network=default \
    --disk-size=30GB

# Assuming the BigQuery Data Transfer Service is enabled, you can set up transfers like this:

# Setup for Google Ads
gcloud beta bigquery data-transfers create \
    --data-source='google_ads' \
    --display-name='Google Ads Transfer' \
    --target-dataset='google_ads_dataset' \
    --params='{"customer_id":"your_google_ads_customer_id"}' \
    --schedule='every 24 hours' \
    --project=mediaconfidant

# Setup for Facebook Ads
gcloud beta bigquery data-transfers create \
    --data-source='facebook_ads' \
    --display-name='Facebook Ads Transfer' \
    --target-dataset='facebook_ads_dataset' \
    --params='{"page_id":"your_facebook_page_id", "api_key":"your_facebook_api_key"}' \
    --schedule='every 24 hours' \
    --project=mediaconfidant

# Enable the Secret Manager API
gcloud services enable secretmanager.googleapis.com --project=mediaconfidant
gcloud services enable secretmanager.googleapis.com --project=${Project_ID}

# Create a secret to store an API key
gcloud secrets create facebook-api-key --replication-policy="automatic" --project=mediaconfidant
gcloud services enable secretmanager.googleapis.com --project=${Project_ID}

# Add a secret version. In practice, replace `your_api_key_here` with the actual API key value
echo -n "your_api_key_here" | gcloud secrets versions add facebook-api-key --data-file=- --project=mediaconfidant

gcloud scheduler jobs create http google-ads-transfer \
    --location=us-central1 \
    --schedule="0 7 * * *" \
    --time-zone="America/Chicago" \
    --http-method=POST \
    --uri="https://bigquerydatatransfer.googleapis.com/v1/projects/${Project_ID}/locations/us/transferConfigs?dataSource=google_ads" \
    --message-body='{"dataSourceId": "google_ads", "params": {"name": "Google Ads Transfer"}}' \
    --oauth-service-account-email="${Service_Account}"

gcloud scheduler jobs create http facebook-ads-transfer \
    --location=us-central1 \
    --schedule="0 7 * * *" \
    --time-zone="America/Chicago" \
    --http-method=POST \
    --uri="https://bigquerydatatransfer.googleapis.com/v1/projects/${Project_ID}/locations/us/transferConfigs?dataSource=facebook_ads" \
    --message-body='{"dataSourceId": "facebook_ads", "params": {"name": "Facebook Ads Transfer"}}' \
    --oauth-service-account-email="${Service_Account}"




gcloud iam service-accounts list --project=mediaconfidant

gcloud projects add-iam-policy-binding mediaconfidant \    --member=serviceAccount:707664316556-compute@developer.gserviceaccount.com \
    --role=roles/composer.worker


gcloud composer environments create mediaconfidant-env \
    --location=us-central1 \
    --network=projects/mediaconfidant/global/networks/mediaconfidant-vpc \
    --subnetwork=projects/mediaconfidant/regions/us-central1/subnetworks/mediaconfidant-subnet \
    --image-version=composer-3-airflow-2

gcloud composer environments describe mediaconfidant-env --location=us-central1



gcloud composer environments describe mediaconfidant-env --location=us-central1




gsutil cp /Users/dionedge/dev/customers/mediaconfidant/ga4_googleads_to_bigquery_dag.py gs://us-central1-mediaconfidant--c9c539d5-bucket/dags/











