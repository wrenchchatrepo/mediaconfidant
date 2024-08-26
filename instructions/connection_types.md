1. API Connection (e.g., TikTok Ads)

Objective: Set up a connection to an external API and integrate the data into your analytic pipeline.

Steps:

	1.	Create an API Gateway:
	•	Use GCP’s API Gateway to create a secure endpoint for the TikTok Ads API.
	•	Configure the gateway with the necessary authentication (username, password, and any required tokens).
	2.	Write the API Script:
	•	Develop a Python or Node.js script in Cloud Functions to handle API requests and responses.
	•	Implement error handling for authentication failures, rate limiting, and API changes.
	3.	Store Credentials:
	•	Store API credentials securely in Secret Manager and access them within your Cloud Function.
	4.	Data Ingestion:
	•	Set up a Cloud Scheduler to trigger the Cloud Function at regular intervals (e.g., daily).
	•	The function should extract data from the TikTok Ads API and load it into a staging table in BigQuery.
	5.	Data Transformation:
	•	Use Dataform or another ETL tool to transform the raw API data into a format compatible with your existing analytic pipeline.
	•	Write SQLX scripts to model the data in the required schema.
	6.	Integration with Looker:
	•	Create or update the LookML files to include the new data source.
	•	Test the connection in Looker to ensure data is correctly ingested and modeled.

2. BigQuery Database Connection

Objective: Integrate data from a shared BigQuery dataset with your analytic pipeline.

Steps:

	1.	Verify Access:
	•	Confirm that your service account has the required permissions (BigQuery Admin, Storage Admin, etc.) on the shared dataset.
	2.	Create the Looker Database Connection:
	•	In Looker, create a new connection using the shared BigQuery dataset.
	•	Set the correct billing project ID, dataset, and other parameters.
	3.	Validate Data Access:
	•	Run simple SQL queries to verify that the connection is working correctly and that you can access the data without errors.
	4.	Integrate with Dataform:
	•	If necessary, import the shared dataset into your Dataform project and write SQLX scripts to transform the data as needed.
	•	Ensure the transformed data aligns with your existing models.
	5.	Update LookML:
	•	Modify the LookML files to include the new data from the shared BigQuery dataset.
	•	Deploy and validate the changes in Looker.
	6.	Ongoing Maintenance:
	•	Set up monitoring to ensure data integrity and access to the shared dataset.
	•	Implement alerts for any access issues or permission changes.

3. Looker Database Connection with Limited Permissions

Objective: Resolve permission issues and set up a Looker connection with limited access.

Steps:

	1.	Verify Permissions:
	•	Ensure that the service account (bq-looker@doit-new-project) has the bigquery.jobs.create permission in both the customer’s project and your project.
	2.	Request Additional Access:
	•	If the permission is missing, request that the customer grants your service account access with a greater scope (e.g., BigQuery Job User or BigQuery Data Viewer).
	3.	Set Up Looker Connection:
	•	Once permissions are confirmed, configure the Looker connection with the provided parameters (billing project ID, dataset, scratch schema).
	•	Test the connection to ensure no errors related to permissions.
	4.	Handling Errors:
	•	If you encounter a bigquery.jobs.create error, review IAM permissions and roles in the customer’s project.
	•	Ensure that your service account is granted access at both the project and dataset levels.
	5.	Integration:
	•	Once the connection is successful, integrate the data into your LookML model.
	•	Test queries in Looker to validate data access and accuracy.
	6.	Monitoring and Alerts:
	•	Set up monitoring for permission changes or access issues.
	•	Implement alerts for any failures in querying or data access through Looker.