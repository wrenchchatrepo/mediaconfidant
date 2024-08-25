# Looker User Level Cost And **Usage** Of **Bigquery**

![0_Image_0.Png](0_Image_0.Png)

Manasa Kallakuri · *Follow* Published in Searce · 5 min read · Jul 1, *2022* As your data grows in the cloud, there is also an increased need to track the usage and understand more details on where the spend come *from.* If you are using BigQuery as a data warehouse and are visualising your data with Looker, you might need to answer the following questions to understand the BigQuery usage and track the spend from Looker *end.*
1. Which user has run which query/report from Looker and what is the cost of each query?

2. How many times has each user run the query from Looker? and so on.

Problem *Statement:* We have a few dashboards built in Looker to view and analyse the *data* in BigQuery. Our use case is to analyse the amount of data billed by each *Looker* 2:50 PM  User  Cost and  of  | by   | user in BigQuery when they refresh or filter by certain columns in *these* dashboards. But here is the issue, when a user accesses the dashboard or applies filters on dashboards in Looker, all the queries from Looker to BigQuery will funnel through a single service account which is used during BigQuery *connection* setup in Looker. So, directly with INFORMATION_SCHEMA.JOBS_BY_PROJECT *view* in BigQuery, we will not be able to analyse the granular information about the amount of data scanned and billed in BigQuery from Looker per Looker user. In order to achieve the above, we designed a solution which is *explained* below. Solution *Architecture:*

![1_image_0.png](1_image_0.png)

Solution *Architecture* Prerequisites:
Uncheck Disable Context Comment in BigQuery Connection in Looker. When we uncheck this, Looker will add a unique comment to the query when it is fired from *Looker* The following is the sample looker query context *comment:*
- Looker Query **Context** '{"user_id":1,"history_id":123,"instance_slug":"1234567"}'
user_id - Specifies the unique id for each user in the Looker instance. *This* will help us in understanding which user from Looker has fired the **query** through dashboard or Looker SQL **Runner** history_id - Unique id for each query that is run on BigQuery by **Looker** Instance. instance_slug - ID of Looker instance which issued the *query* Create a Cloud Storage Bucket in the GCP project to store Looker Metadata files Create a Cloud Function in the GCP project with the above created GCS Bucket events as trigger Create a BigQuery Dataset in GCP to store BigQuery information schema view and other looker metadata *tables* Solution *Steps:*
When a user executes a query in BigQuery, after the query *execution,* BigQuery provides us with the total bytes processed, billed by that *query* along with other details like *duration* BigQuery Job Information The above details can also be accessed through metadata *views* in BigQuery. INFORMATION_SCHEMA.JOBS_BY_PROJECT view in BigQuery provides information about all the jobs run/submitted in the *project.* We can understand which user has run what queries, the number of *queries* run by each user and amount of data scanned, billed by each user etc. For all the queries that are run from Looker, Looker Query Context will be added as a comment to the query if we uncheck Disable Context Comment Option as mentioned in the prerequisites. So, Looker *user* id and history id details can be fetched from the comments of the *query.* We 2:50 PM  User  Cost and  of  | by   | created a view on top of this INFORMATION_SCHEMA view with details from the looker as columns in our *dataset* select REGEXP_EXTRACT(query, r'user_id":([0–9]*)') as *looker_user_id,*
REGEXP_EXTRACT(query, r'history_id":([0–9]*)') as looker_history_id, * **from** region-us.INFORMATION_SCHEMA.JOBS_BY_PROJECT
Create a Look in Looker with user details that are available in the *History* Open in app

## Explore Section Of The System Activity Console In Looker. Looker User Id, User Name And User Email Details Are Available In History Explore Along

Search *Write* with the History ID of each *query*

![4_image_0.png](4_image_0.png)

Looker Metadata Details - History View *from System Activity* Schedule the Look with filter on Completed Date value set to last one complete day to write results to a CSV file in the Cloud Storage *bucket* of the GCP project.

![5_image_0.png](5_image_0.png)

The Cloud Function created in the GCP project will get triggered *daily* when a new object is created in the above scheduled Cloud Storage bucket. This Cloud Function will append the data from a CSV *file(created* above which essentially has Looker Metadata details) to the BigQuery table. Now, we have two tables in BigQuery, one contains BigQuery *Metadata* details and the other has Looker Metadata details. These two tables are joined on the most granular unique value which is *history_id(unique* id generated for each query that is fired in BigQuery from Looker). Now, the joined table provides us with all the required information and we can analyse the amount of data billed by each user from Looker in BigQuery and calculate the cost *incurred.*

## Sample **Results:**

The following image has details about which user from Looker has run how many queries, what is the amount of data scanned and its respective cost.

Query Results with Required *Details* Conclusion: We can also build dashboards in Looker on the above views to understand and visualise the query usage and cost incurred per Looker user in *BigQuery.* This is quite useful in decision making around cost controls and *access* management. Useful *Documentations:*
1. Send data to Google Cloud Storage from *Looker* 2:50 PM  User  Cost and  of  | by   | 2. Schema of BigQuery INFORMATION_SCHEMA.JOBS_BY_PROJECT view 3. Looker Context Comments for SQL Queries I would like to give special thanks to Pankaj Baliharia for his *contributions* in designing and implementing the above *solution.* Happy *reading!!*
Bigquery Looker Cost Data *Analytics* Written by Manasa *Kallakuri*

![7_image_0.png](7_image_0.png)

9 Followers · Writer for Searce

![7_image_1.png](7_image_1.png)

More from Manasa Kallakuri and *Searce* 2:50 PM  User  Cost and  of  | by   | 

![8_image_1.png](8_image_1.png)

Prasad Midde *Searce* in A Step-by-Step Guide for *Private* API Gateway and EKS *Integration* API Gateway private endpoints allows us for building private API–based services inside…
Aditya Chandrakar *Searce*

![8_image_0.png](8_image_0.png)

in Using Helm with *Terraform* to deploy AWS Load *Balancer…*
What is Helm?

Jun 28

![8_image_3.png](8_image_3.png)

$\uparrow$ . 
8 1

$$\mathbb{C}^{+}$$

Jun 23, *2023*

![8_image_2.png](8_image_2.png)

49 1 Sheetal Agarwal Searce in Diving into Seamless Code *Quality:* Unleashing the Power of…
Developer is working on source code using GitLab as version control system and *GitLab…*
Jul 14, 2023 18 1 Juzer Patanwala *Searce* in Transform Kubernetes **Manifests** into Helm *Chart* Kubernetes is one of the most popular Container Orchestration tool in the market…

$\square$
Apr 4, *2023*

56 1 See all from Manasa Kallakuri See all from Searce

# Recommended From **Medium**

![9_Image_1.Png](9_Image_1.Png)

Ishana Shinde Google Cloud for *Startups* in Harnessing BigQuery with **Gemini:** Empowering Startups with *Data-…*
In today's fiercely competitive *startup* landscape, data has emerged as the most…
Aug 15 6 Michaël *Scherding*

![9_image_0.png](9_image_0.png)

A step-by-step **guide** to maintaining a clean *Looker…*
Cleaning an instance is crucial for *maintaining* optimal performance and resource utilizatio…
Apr 15 1 Lists

![9_image_2.png](9_image_2.png)

ChatGPT *prompts* 48 stories · 1919 *saves* Natural Language *Processing* 1656 stories · 1231 *saves* MODERN *MARKETING*

![9_image_3.png](9_image_3.png)

177 stories · 797 *saves* 2:50 PM  User  Cost and  of  | by   | 

![10_image_0.png](10_image_0.png)

in Dynamically Generating **MERGE** Queries with BigQuery's *Procedur…*
BigQuery's scripting language, a highly scalable data warehouse, offers powerful yet…
May 29

![10_image_2.png](10_image_2.png)

Mastering Google BigQuery **with** Python: A Comprehensive *Guide* t…
Introduction: In today's data-centric era, the ability to harness vast amounts of data…
Apr 3 Vortex Vortex Cloud Epsilon India Epsilon Engineering Blog in How to transform and export GA4 event data from *BigQuery* By Khushalie Nagpal and Prateek Shekhar Feb 29

![10_image_1.png](10_image_1.png)

55 1 Akshay Bagal Venkatesh M The Cloudside *View* in Building a Secure Data Lake *using* DataPlex: Orchestrating *Data…*
What is Dataplex?

Jul 11 31 See more *recommendations*