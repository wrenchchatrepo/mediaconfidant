Note that you are viewing Looker documentation. For Looker Studio documentation, visit https://support.google.com/looker-studio (https://support.google.com/looker-studio).

## Google Bigquery

Overview This page explains how to set up a connection in Looker to Google BigQuery Standard SQL
 (/blog/products/gcp/bigquery-111-now-with-standard-sql-iam-and-partitioned-tables) or Google BigQuery Legacy SQL.

The general steps for setting up a Google BigQuery Standard SQL or Google BigQuery Legacy SQL
connection are as follows:
1. On your BigQuery database, configure the authentication that Looker will use to access your BigQuery database. Looker supports the following authentication options for BigQuery:
Service account: See the Authentication with BigQuery service accounts (\#bigquery_service_accounts) section on this page for information. OAuth: See the Authentication with OAuth (\#oauth_for_bigquery_connections) section on this page for information.

star Note: Looker (Google Cloud core) (/looker/docs/looker-core-overview) instances also support Application Default Credentials (ADC) (/docs/authentication/application-default-credentials) as a method of authentication. See the Looker (Google Cloud core) documentation (/looker/docs/looker-core-dialects\#setup_data_from_gcp) for more information.

2. On your BigQuery database, if you want to use persistent derived tables (PDTs)
 (/looker/docs/derived-tables\#persistent-derived-tables) on the connection, create a temporary dataset that Looker can use to create PDTs on your database. See the section Creating a temporary dataset for persistent derived tables (\#creating_a_temporary_dataset_for_persistent_derived_tables) on this page for the procedure.

star Note: If you are using OAuth (\#oauth_for_bigquery_connections) and you want to enable PDTs on the connection, you need to create a BigQuery service account specifically for Looker to use for PDT processes on your BigQuery database. See the section Enabling PDTs for Looker connections to BigQuery with OAuth (\#bq_pdts_oauth) on this page for the procedure.

3. In Looker, set up the Looker connection to your BigQuery database. See the section Connecting Looker to BigQuery (\#connecting_looker_to_bigquery) on this page for the procedure.

4. In Looker, test the connection between Looker and your BigQuery database. See the section Testing the connection (\#testing_the_connection) on this page for the procedure.

## Encrypting Network Traffic

It is a best practice to encrypt network traffic between the Looker application and your database.

Consider one of the options described on the Enabling secure database access (/looker/docs/enabling-secure-db-access) documentation page.

## Authentication With Bigquery Service Accounts

One way that Looker can authenticate into your BigQuery database is with a BigQuery service account. You create the service account on your BigQuery database using the API Manager in the Google Cloud console (https://console.cloud.google.com/apis/credentials). You must have Google Cloud administrator permissions to create the service account. See the documentation on creating a service account (/iam/docs/service-accounts) and generating a private key (/storage/docs/authentication\#generating-a-private-key).

Creating a service account and downloading the JSON credentials certificate To create a BigQuery service account, follow these steps:
1. Open the credentials page in the API Manager in the Google Cloud console
 (https://console.cloud.google.com/apis/credentials) and select your project.

2. Select **CREATE CREDENTIALS** and choose **Service account**.

3. Enter a name for the new service account, optionally add a description, and select **CREATE**
AND CONTINUE.

4. Your service account requires two Google BigQuery predefined roles
 (/bigquery/access-control\#curated_roles_comparison_matrix):
- BigQuery > BigQuery Data Editor
-   BigQuery > BigQuery Job User Select the first role in the Select a role field, select ADD ANOTHER ROLE, and then select the second role.

Service account details Grant this service account access to project
(optional)

![2_image_0.png](2_image_0.png)

After selecting both roles, select CONTINUE, and then select DONE.

5. In the Credentials page, select your new service account:
Credentials
← CREATE CREDENTIALS
- DELETE

![3_image_0.png](3_image_0.png)

![3_image_1.png](3_image_1.png)

![3_image_2.png](3_image_2.png)

OAuth 2.0 Client IDs

![3_image_3.png](3_image_3.png)

## 6. Select Keys, And Then Select Add Key, And Then, In The Drop-Down, Select Create New Key:

![3_image_4.png](3_image_4.png)

7. Select JSON under Key type, and then select CREATE:

# Create Private Key For "Looker-Big-Query"

Downloads a file that contains the private key. Store the file securely because this key can't be recovered if lost.

![4_image_0.png](4_image_0.png)

![4_image_1.png](4_image_1.png)

For backward compatibility with code using the P12 format CANCEL
CREATE
8. The JSON key will be saved to your computer.

Caution: You will not be able to download the key again. Take note of where you save it. After noting the download location, select CLOSE:
Private key saved to your computer

![4_image_2.png](4_image_2.png)

![4_image_4.png](4_image_4.png)

![4_image_5.png](4_image_5.png)

json allows access to your cloud resources, so store it securely. Learn more

![4_image_3.png](4_image_3.png)

![4_image_6.png](4_image_6.png)

## 9. Select Done.

10. Find the email address that corresponds to the service account. You will need this address to configure the Looker connection to BigQuery:
Service Accounts

![4_image_7.png](4_image_7.png)

![4_image_8.png](4_image_8.png)

11. Once you create the service account on your BigQuery database, you will enter this service account information and the certificate file details in the **Service Account Email**
 (\#service_account_email), **Service Account JSON/P12 File** (\#service_account_file), and **Password** (\#service_account_password) fields of Looker's **Connections** window when you set up the Looker connection to BigQuery (\#connecting_looker_to_bigquery).

## Authentication With Oauth

Looker supports OAuth for Google BigQuery connections, meaning that each Looker user authenticates in to Google with their own Google OAuth credentials and authorizes Looker to access the database.

OAuth lets database administrators perform the following functions:
Audit which Looker users are running queries against the database.

Enforce role-based access controls using Google permissions. Use OAuth tokens for all processes and actions that access Google BigQuery, instead of embedding BigQuery IDs and passwords in multiple places.

Note the following for BigQuery connections with OAuth:
If a database administrator changes the BigQuery OAuth client credentials, any schedules or alerts that a user owns will be affected. Users must sign in again if their administrator changes the BigQuery OAuth credentials. Users can also go to their Looker **Account** page from their user profile account page (/looker/docs/user-account\#configuring_oauth_connection_credentials) to sign in to Google.

Because BigQuery connections that use OAuth are "per user," caching policies are also per user and not just per query. This means that, instead of using cached results whenever the same query is run within the caching period, Looker will use cached results only if the *same user has* run the same query within the caching period. For further information on caching, see the Caching queries (/looker/docs/caching-and-datagroups) documentation page. If you want to use persistent derived tables (PDTs) (/looker/docs/derived-tables\#persistent_derived_table) on a BigQuery connection with OAuth, you must create an additional service account for Looker to access your database for PDT processes. See the Persistent derived tables on a BigQuery connection (\#persistent_derived_tables_on_a_bigquery_connection) section on this page for information.

Admins, when they sudo as another user, will use that user's OAuth authorization token. See the Users (/looker/docs/admin-panel-users-users\#impersonating-users) documentation page for information on using the sudo command.

## Configuring A Bigquery Database Project For Oauth

The following sections describe how to generate OAuth credentials
 (\#generating_google_oauth_credentials) and how to configure an OAuth consent screen (\#configuring_an_oauth_consent_screen). If you've already configured an OAuth consent screen for another application in your project, you won't need to create another - you configure only one consent screen for all applications in a project.

OAuth credentials and the OAuth consent screen must be configured in the Google Cloud console (https://console.cloud.google.com). The Google generic description is on the Google Cloud support (https://support.google.com/cloud/answer/6158849) site and on the Google Dev console (https://developers.google.com/console/help/) site.

Depending on the type of users who are accessing BigQuery data in Looker and whether your BigQuery data is public or private, OAuth may not be the most appropriate authentication (/docs/authentication) method. Likewise, the type of data requested from the user and degree of access needed to that user's data when they're authenticating in to Google to use Looker may require verification by Google (https://support.google.com/cloud/answer/9110914). See more about verification in the Generating Google OAuth credentials (\#generating_google_oauth_credentials) section on this page.

## Generating Google Oauth Credentials

1. Go to the Google Cloud console (https://console.cloud.google.com).

2. In the **Select a project** drop-down, navigate to your BigQuery project. This should take you to your project dashboard.

3. In the left menu, select the **APIs & Services** page. Then select **Credentials**. On the **Credentials**
page, select the down arrow in the **Create credentials** button, and select **OAuth client ID** from the drop-down menu:
4. Google requires that you configure an OAuth consent screen, which lets your users choose how to grant access to their private data, before you can generate your OAuth credentials. To configure your OAuth consent screen, see the Configuring an OAuth consent screen (\#configuring_an_oauth_consent_screen) section on this page.

5. If you've already configured an OAuth consent screen, Google displays the **Create OAuth client**
ID page, which lets you create an OAuth client ID and secret to use in your BigQuery connection to Looker. From the **Application type** drop-down, select **Web application**. The page will expand and display additional options:

## L Create Oauth Client Id

A client ID is used to identify a single app to Google's OAuth servers. If your app runs on multiple platforms, each will need its own client ID. See Setting up OAuth 2.0 for more information. Learn more about OAuth client types.

s Application type *
Web application a Name *
Looker The name of your OAuth 2.0 client. This name is only used to identify the client in the console and will not be shown to end users.

0 The domains of the URIs you add below will be automatically added to your OAuth consent screen as authorized domains.

## Authorized Javascript Origins  �

For use with requests from a browser URIs 1 *
https://myinstance.looker.com
✦ ADD URI

## Authorized Redirect Uris   �

For use with requests from a web server 8 URIs 1 *
https://myinstance.looker.com/external_oauth/redirect
✦ ADD URI
Note: It may take 5 minutes to a few hours for settings to take effect

![8_image_0.png](8_image_0.png)

CANCEL
6. In the **Name** field, enter a name for the app, such as Looker.

7. In the **Authorized JavaScript origins** section, select **+ ADD URI** to display the **URIs 1** field. In the URIs 1 field, enter the URL to your Looker instance, including the https://. For example:
If Looker hosts your instance: https://<instancename>.looker.com If you have a customer-hosted Looker instance: https://looker.<mycompany>.com If your Looker instance requires a port number: https://looker.

<mycompany>.com:9999 8. In the **Authorized redirect URIs** section, select **+ ADD URI** to display the **URIs 1** field. In the URIs 1 field, enter the URL to your Looker instance, followed by /external_oauth/redirect. For example: https://<instancename>.looker.com/external_oauth/redirect or https://looker.<mycompany>.com:9999/external_oauth/redirect.

9. Select **Create**. Google displays your **Client ID** and your **Client Secret**.

10. Copy your client ID and your client secret values. You will need them to configure the OAuth for the BigQuery connection in Looker (\#configuring_oauth_for_a_bigquery_connection).

Configuring an OAuth consent screen Note: If you've already configured an OAuth consent screen for another application in your project, Looker will not display this option. If you've already generated your OAuth credentials, you can proceed to configuring your BigQuery connection for OAuth in Looker (\#configuring_oauth_for_a_bigquery_connection).

Google requires that you configure an OAuth consent screen (https://support.google.com/cloud/answer/6158849\#userconsent), which lets your users choose how to grant access to their private data and provides a link to your organization's terms of service and privacy policy.

In the left menu, select the **OAuth consent screen** page. Before you can configure your OAuth consent screen, you must choose the type of users to whom you're making this app available. Depending on your selection, your app may require verification by Google (https://support.google.com/cloud/answer/9110914).

Make your selection and select **Create**. Google displays the **OAuth consent screen** page. You can

![10_image_0.png](10_image_0.png) configure this screen for all applications in your project, including both internal and public (https://support.google.com/cloud/answer/6158849\#public-and-internal) applications.

Google will perform a verification for *public* applications if any of these are true:
The application uses Google APIs that use restricted or sensitive scopes. The OAuth consent screen includes an application logo. The project has exceeded the domain threshold.

Do the following to configure your OAuth consent screen:

## App Information

This shows in the consent screen, and helps end users know who you are and contact you App name *
The name of the app asking for consent User support email *
For users to contact you with questions about their consent App logo BROWSE
Upload an image, not larger than 1MB on the consent screen that will help users recognize your app. Allowed image formats are JPG, PNG, and BMP. Logos should be square and 120px by 120px for the best results.

## App Domain

To protect you and your users, Google only allows apps using OAuth to use Authorized Domains. The following information will be shown to your users on the consent screen.

Application home page Provide users a link to your home page Application privacy policy link Provide users a link to your public privacy policy Application terms of service link Provide users a link to your public terms of service

## Authorized Domains   �

When a domain is used on the consent screen or in an OAuth client's configuration, it must be pre-registered here. If your app needs to go through verification, please go to the Google Search Console to check if your domains are authorized. Learn more about the authorized domain limit.

Authorized domain 1 ⋆

![11_image_0.png](11_image_0.png)

example.com
✦ ADD DOMA
1. In the **App name** field, enter the name of the application that the user is granting access to - in

![12_image_0.png](12_image_0.png)

![12_image_1.png](12_image_1.png)

this case, Looker.

2. In the **User support email** field, enter the support email that users should contact with login or consent issues.

3. Select **ADD DOMAIN** to reveal the **Authorized domain 1** field. In this field, enter the domain of the URL to your Looker instance. For example, if Looker hosts your instance at https://<instance_name>.cloud.looker.com, the domain is cloud.looker.com. For customer-hosted Looker deployments, enter the domain on which you host Looker.

4. In the **Developer contact information** section, enter one or more email addresses that Google can use to contact you about your project. The remaining fields are optional, but you can use them to further customize your consent screen.

## 5. Select **Save And Continue**.

6. Google displays the **Scopes** page, where you can configure scopes
 (https://developers.google.com/identity/protocols/oauth2/scopes). Looker requires only the default scopes, so no additional scope configuration is required. Select **SAVE AND CONTINUE**.

7. On the **Summary** page, select **BACK TO DASHBOARD**.

You can now continue the procedure for generating your OAuth credentials (\#resume_oauth).

For more information about configuring the Google **OAuth consent screen**, see the Google support (https://support.google.com/cloud/answer/6158849\#userconsent) documentation.

Configuring the Looker connection for BigQuery with OAuth To enable OAuth for your BigQuery connection, select the **OAuth** (\#use_oauth) option on the Looker Connection page when you are setting up the Looker connection to BigQuery (\#connecting_looker_to_bigquery). When you enable the **OAuth** option, Looker will display the **OAuth**
Client ID (\#oauth_client_id) and **OAuth Client Secret** (\#oauth_client_secret) fields. Paste in the **Client ID**
and **Client Secret** values that you obtained as a step (\#oauth_client_info) in the Generating Google OAuth credentials (\#generating_google_oauth_credentials) procedure on this page.

Note: If you have set a session length for BigQuery OAuth, to avoid Looker session timeouts you will need to use the **Exempt Trusted Apps** feature to add Looker to your trusted apps. Refer to the Set session length for Google Cloud services help article (https://support.google.com/a/answer/9368756) to view the steps for this procedure.

How Looker users authenticate in to BigQuery with OAuth Once the Looker connection to BigQuery is set up for OAuth, users can use Looker to perform their initial authentication into your BigQuery database by doing one of the following:
Authenticating in to Google from a Looker query (\#authenticating_into_google_from_a_query) that uses the BigQuery connection Authenticating in to Google from the **OAuth Connection Credentials** section on their Looker Account page (\#authenticating_into_google_from_the_user_account_page)

## Authenticating In To Google From A Query

Once the Looker connection to BigQuery is set up for OAuth, Looker will prompt users to sign in with their Google Account before running queries that use the BigQuery connection. Looker shows this prompt from Explores, dashboards, Looks, and SQL Runner.

![14_image_0.png](14_image_0.png)

![14_image_1.png](14_image_1.png)

![14_image_2.png](14_image_2.png)

![14_image_3.png](14_image_3.png)

![14_image_4.png](14_image_4.png)

![14_image_5.png](14_image_5.png)

![14_image_6.png](14_image_6.png)

![14_image_7.png](14_image_7.png)

![14_image_9.png](14_image_9.png)

The user must select **Log In** and authenticate with OAuth. After the user authenticates into BigQuery,

![14_image_8.png](14_image_8.png)

![14_image_10.png](14_image_10.png)

![14_image_11.png](14_image_11.png) the user can select the Run button in the Explore and Looker will load the data into the Explore.

Authenticating in to Google from the user account page Once the Looker connection to BigQuery is set up for OAuth, a user can authenticate into their Google Account from the Looker user account page (/looker/docs/user-account\#oauth):
1. From Looker, select the profile icon and select **Account** from the user menu.

2. Go to the **OAuth Connection Credentials** section, and select the **Log In** button for the appropriate BigQuery database connection.

3. Select the appropriate account from the **Sign in with Google** page. 4. Select **Allow** on the OAuth consent screen to allow Looker to view and manage your data in Google BigQuery.

Once you authenticate in to Google through Looker, you can log out or reauthorize your credentials at any time through your **Account** page, as described on the Personalizing your user account (/looker/docs/user-account\#oauth) documentation page. Although Google BigQuery tokens don't expire, a user may select **Reauthorize** to sign in with a different Google Account.

Revoking OAuth tokens Users can revoke (https://support.google.com/accounts/answer/3466521\#remove-access) access from applications like Looker to the Google Account by visiting their Google Account settings
 (https://myaccount.google.com/permissions).

Google BigQuery tokens don't expire; however, if a database admin changes the database connection's OAuth credentials in a way that invalidates the existing credentials, users will have to sign in with their Google Account again before running any queries that use that connection.

Note: Some schedules (/looker/docs/scheduling) or alerts (/looker/docs/alerts-overview) may be based on models with a BigQuery database connection using OAuth. If a BigQuery database admin changes the existing database connection's OAuth credentials, existing users' credentials may be invalidated. Any schedules or alerts created by that user will fail until the user logs in again through Google OAuth.

## Persistent Derived Tables On A Bigquery Connection

If you want to use persistent derived tables (PDTs) (/looker/docs/derived-tables\#persistent_derived_tables_(pdts)) for your BigQuery connection, you may need to do the following, depending on your connection configuration:
Use the Google Cloud console to create a temporary dataset in your BigQuery database that Looker can use to write PDTs. See the Creating a temporary dataset for persistent derived tables (\#creating_a_temporary_dataset_for_persistent_derived_tables) section on this page for the procedure. This step is required for PDTs, regardless of the other configuration options on the connection. Use the API Manager in the Google Cloud console to create a separate service account for Looker's PDT processes. See the section Creating a service account and downloading the JSON credentials certificate (\#creating_bigquery_service_accounts) on this page for the procedure. The type of authentication on your connection affects whether a PDT service account is required, and also where you enter the PDT service account information in Looker's Connections window when you set up the Looker connection to BigQuery
 (\#connecting_looker_to_bigquery):
If your connection uses OAuth (\#oauth_for_bigquery_connections) for user authentication, you must create a separate service account for PDT processes. You will enter the service account information and the certificate file details in the **PDT Overrides** section of Looker's **Connections** window. Looker's **Connections** window displays the **PDT Overrides** section automatically when you turn on the **Enable PDTs** toggle for a connection that is also configured with the **OAuth** option in the **Authentication** (\#authentication) field. See the Enabling PDTs for Looker connections to BigQuery with OAuth (\#bq_pdts_oauth) section for more information.

If your connection uses service accounts (\#bigquery_service_accounts) for user authentication, you have the option of creating a separate service account for PDT
processes. If you choose to have a separate PDT service account, you will enter the service account information in the **PDT Overrides** section for the **Service Account Email** (\#service_account_email), **Service Account JSON/P12 File** (\#service_account_file), and Password (\#service_account_password) fields of Looker's **Connections** window. The PDT Overrides section appears when you turn on the **Enable PDTs** (\#persistent_derived_tables) toggle for a Looker connection to BigQuery using service account authentication.

## Creating A Temporary Dataset For Persistent Derived Tables

To enable persistent derived tables (PDTs) for your BigQuery connection, turn on the **Enable PDTs** (\#persistent_derived_tables) toggle on the Looker **Connection** page when you are setting up the Looker connection to BigQuery (\#connecting_looker_to_bigquery). When you enable PDTs, Looker will display the **Temp Dataset** (\#temp_dataset) field. In this field, you'll enter the dataset name that Looker can use to create PDTs. You should configure this database or schema ahead of time, with the appropriate write permissions.

Warning: If your BigQuery connection is configured for OAuth user authentication, you will need to grant users permissions to the temp dataset in order for the users to query PDTs. Be careful when granting users permissions to the temporary dataset, since PDTs may expose data from underlying tables that the user otherwise wouldn't be able to access. When defining PDTs, LookML developers should be aware that with OAuth connections, permissioning for PDTs is independent of permissioning for users. Developers need to consider data access rules when defining PDTs.

You can set up a temporary dataset using the Google Cloud console:
1. Open the Google Cloud console (https://console.cloud.google.com/bigquery) and select your project.

2. Select the three-dot menu, and then select **Create dataset**.

m Google Cloud 80 Looker Demo Instance Admin g D
>
BigQuery

![17_image_0.png](17_image_0.png)

3. Enter a Dataset ID (typically looker_scratch), and then select your Data location (optional),
Default table expiration, and encryption key management solution. Select CREATE DATASET
to finish.

## Create Dataset

Project ID -
looker-demo-instance-admin CHANGE
Dataset ID *
looker_scratch Letters, numbers, and underscores allowed Data location
�
Default table expiration Enable table expiration �
Default maximum table age Days

## Advanced Options

<
Encryption �
- Google-managed encryption key No configuration required C Customer-managed encryption key (CMEK)
Manage via Google Cloud Key Management Service

![18_image_0.png](18_image_0.png)

CANCEL
Now that you have created the dataset, you can specify the name of the dataset in the Temp Dataset
(\#temp_dataset) field of Looker's Connections window when you set up the Looker connection to BigQuery (\#connecting_looker_to_bigquery).

Enabling PDTs for Looker connections to BigQuery with OAuth For BigQuery connections that use OAuth (\#authentication_with_oauth), your users authenticate into Looker with their OAuth credentials. Looker supports PDTs for BigQuery connections with OAuth, but Looker itself cannot use OAuth, so you must set up a BigQuery service account specifically to allow Looker to access your database for PDT processes.

You can set up a PDT service account on your BigQuery database using the Google Cloud API
Manager. See the Creating a service account and downloading the JSON credentials certificate (\#creating_a_service_account_and_downloading_the_json_credentials_certificate) section on this page.

Once you create the service account on your BigQuery database, you will enter the service account information and the certificate file details in the **PDT Overrides** section of Looker's **Connections**
window when you set up the Looker connection to BigQuery (\#connecting_looker_to_bigquery). Looker's Connections window displays the **PDT Overrides** section automatically when you turn on the Enable PDTs toggle for a connection that is also configured with the **OAuth** option in the **Authentication** (\#authentication) field. Use the following fields in the **PDT Overrides** section to enter the information for the service account that Looker can use for PDT processes on your database:
Upload p12 or json: Use the **Upload File** button to upload the certificate file for the BigQuery service account that you want to use for PDT processes on the connection. You can get this file from the Google Cloud API Manager as a step (\#json_certificate_downloaded) in the Creating a service account and downloading the JSON credentials certificate
 (/looker/docs/creating_a_service_account_and_downloading_the_json_credentials_certificate) procedure. Username: This field applies only if you upload a P12 file in the **Upload p12 or json** field of the PDT Overrides section. Enter the email address for the BigQuery service account that you want to use for PDT processes on the connection. You can get this email address from the Google Cloud API Manager as a step (\#find_email_address) in the Creating a service account and downloading the JSON credentials certificate (\#creating_a_service_account_and_downloading_the_json_credentials_certificate) procedure.

Password: This field applies only if you upload a P12 file in the **Upload p12 or json** field of the PDT Overrides section. Enter the password to the .p12 credentials file for the BigQuery service account that you want to use for PDT processes on the connection.

## Connecting Looker To Bigquery

In the **Admin** section of Looker, select **Connections** to open the **Connections** page, then do one of the following:
To create a new connection, select the **Add Connection** button.

star To edit an existing connection, find the connection from the **Databases** table, and then select the **Edit** button in the connection's listing.

Fill out the connection details. The majority of these settings are common to most database dialects and are described on the Connecting Looker to your database (/looker/docs/connecting-to-your-db)
documentation page. The following settings are mentioned either to highlight them or to clarify how they apply specifically to BigQuery connections:
Dialect: Select Google BigQuery Standard SQL or **Google BigQuery Legacy SQL**.

Note: If you are on a Looker (Google Cloud core) (/looker/docs/looker-core-overview) instance and you don't see your dialect listed in the **Dialect** drop-down menu, see the Looker (Google Cloud core) documentation
 (/looker/docs/looker-core-dialects\#supported_dialects_for) to verify that the dialect is supported for Looker (Google Cloud core) instances.

Billing Project ID: The name of the Google Cloud billing project. The billing project is the Google Cloud project that gets billed, but you can still query datasets in a different Google Cloud project if your LookML developers specify fully scoped table names in the sql_table_name parameter of your LookML views (/looker/docs/reference/param-view-sql-table-name), Explores
 (/looker/docs/reference/param-explore-sql-table-name), or joins (/looker/docs/reference/param-join-sql-table-name). For BigQuery, a fully scoped table name uses the format <project_name>.<dataset_name>.<table_name>. Without a fully scoped reference, BigQuery looks for the table in the billing project and dataset that you specify in Looker's **Connections** page for the BigQuery connection to Looker. See the BigQuery documentation (/bigquery/docs/resource-hierarchy) for an explanation of the resource hierarchy in BigQuery.

Dataset: The name of the dataset that you want Looker to default to when it queries your database. The default dataset must be located within the billing project (\#billing_project_id) that is specified for the connection; you cannot enter a value such as project_name.dataset_name in the **Database** field to specify a dataset in a different project.

Your LookML project can access tables in other datasets (including tables in public datasets) if your LookML developers specify fully scoped table names in the sql_table_name parameter of your LookML views (/looker/docs/reference/param-view-sql-table-name), Explores (/looker/docs/reference/param-explore-sql-table-name), or joins (/looker/docs/reference/param-join-sql-table-name). For BigQuery, a fully scoped table name uses the format <project_name>.<dataset_name>.<table_name>. To query a table in another dataset, the table must be accessible by the service account (for connections that use service account authentication (\#use_service_account)) or by the user running the query (for connections that use OAuth authentication (\#use_oauth)). If your LookML code does not specify fully scoped table names, BigQuery will search for the table in the dataset that you specify in the **Dataset**
field of the BiqQuery connection. If your project doesn't have any datasets (which may be the case if you separate compute and storage in separate projects), you can provide an arbitrary **Dataset** value, but then you must always use fully scoped table names in your LookML. Authentication: The type of authentication that Looker will use to access your database, either Service Account or OAuth:
Service Account: Select this option to use a BigQuery service account for Looker to authenticate into your database (see the Authentication with BigQuery service accounts
 (\#authentication_with_bigquery_service_accounts) for more information). When Service Account is selected, you will see the following fields:
Upload service JSON or P12 File: Use the **Upload File** button to upload the certificate file for the BigQuery service account. You can get this file from the Google Cloud API Manager as a step (\#json_certificate_downloaded) in the Creating a service account and downloading the JSON credentials certificate (\#creating_a_service_account_and_downloading_the_json_credentials_certificate) procedure.

Service Account Email: This field applies only if you upload a P12 file in the **Upload** service JSON or P12 File field. Enter the email address for the BigQuery service account, which you get from the Google Cloud API Manager as a step
 (\#find_email_address) in the Creating a service account and downloading the JSON credentials certificate (\#creating_a_service_account_and_downloading_the_json_credentials_certificate) procedure. Password: The password for the P12 credentials file for the BigQuery service account. The **Password** field applies only if you upload a P12 (\#select_json) file in the Upload service JSON or P12 File field.

OAuth: Select this option to enable each Looker user to authenticate into Google BigQuery and authorize Looker to access the database with the user's BigQuery account.

See the Authentication with OAuths (\#oauth_for_bigquery_connections) section on this page for more information on implementing OAuth for your BigQuery connection. When **OAuth** is selected, you will see the following fields:
OAuth Client ID: The OAuth client ID. You get this information from the Google Cloud console as a step (\#oauth_client_info) in the Generating Google OAuth credentials (\#generating_google_oauth_credentials) procedure.

OAuth Client Secret: The OAuth client secret. You get this information from the Google Cloud console as a step (\#oauth_client_info) in the Generating Google OAuth credentials (\#generating_google_oauth_credentials) procedure.

Enable PDTs: Enable this toggle to allow persistent derived tables (PDTs)
 (/looker/docs/derived-tables\#persistent_derived_tables_(pdts)) on the connection. You will need to specify the temporary dataset on your database that Looker will use to write PDTs. See the Creating a temporary dataset for persistent derived tables (\#creating_a_temporary_dataset_for_persistent_derived_tables) section on this page for the procedure. Note: If your connection is configured for **OAuth** (\#authentication_with_oauth), you will need to use the **PDT Overrides** section to specify a service account that Looker can use for PDT processes on your BigQuery connection. See the Enabling PDTs for Looker connections to BigQuery with OAuth (\#bq_pdts_oauth) section for details.

Temp Dataset: The BigQuery dataset that you created in the Google Cloud console to allow Looker to write persistent derived tables to your database. See the Creating a temporary dataset for persistent derived tables (\#temporary_dataset) section for the procedure. Database Time Zone: The default time zone for BigQuery is UTC. The time zone setting that you specify here needs to match your BigQuery time zone setting. See the Database Time Zone (/looker/docs/connecting-to-your-db\#database_time_zone) section of the **Connecting Looker to your**
database page for more information. Query Time Zone: See the Query Time Zone (/looker/docs/connecting-to-your-db\#query_time_zone)
section of the **Connecting Looker to your database** page for more information. Additional JDBC parameters: Add any additional JDBC parameters, such as BigQuery labels (see the Job labels and context comments for BigQuery connections (\#context_comments) section on this page for more information.) These are some of the other supported parameters:
connectTimeout: Number of milliseconds to wait for a connection. Defaults to 240000.

readTimeout: Number of milliseconds to wait for a read. Defaults to 240000.

rootUrl: If you have a BigQuery instance in a private network, specify an alternate endpoint to connect to BigQuery other than the default public endpoint.

Max Billing Gigabytes: On BigQuery connections, you are charged for each query based on its size. To help prevent users from accidentally running a query that is too expensive, you can set a maximum number of gigabytes that a user is allowed to pull in a single query. You can leave the **Max Billing Gigabytes** field blank if you aren't limiting query size. Read more details about pricing on the BigQuery pricing page (/bigquery/pricing\#high-compute).

Max connections per node: Can be left at the default value initially. Read more about this setting in the Max connections per node (/looker/docs/connecting-to-your-db\#max_connections)
section of the **Connecting Looker to your database** documentation page. Connection Pool Timeout: Can be left at the default value initially. Read more about this setting in the Connection Pool Timeout (/looker/docs/connecting-to-your-db\#connection-pool-timeout) section of the **Connecting Looker to your database** documentation page. Disable Context: This option disables context comments (/looker/docs/admin-panel-server-usage\#context_comments_for_sql_queries) on a BigQuery connection. Context comments on Google BigQuery connections (\#context_comments) are disabled by default because context comments invalidate Google BigQuery's ability to cache and can negatively impact cache performance. You can enable context comments for a BigQuery connection by turning off the **Disable Context** toggle. See the Job labels and context comments for BigQuery connections (\#context_comments) section for more information. SQL Runner Precache: If you want SQL Runner to not preload table information and, instead, to load table information only when a table is selected, clear this option. See the SQL Runner Precache (/looker/docs/connecting-to-your-db\#sql_runner_precache) section of the Connecting Looker to your database page for more information.

Once you fill in all the applicable fields for the connection, you can test your connection (\#testing_the_connection) as needed. To save these settings, click **Connect**.

## Testing The Connection

You can test your connection settings from a couple of places in the Looker UI:
Select the **Test** button at the bottom of the **Connections Settings** page, as described on the Connecting Looker to your database (/looker/docs/connecting-to-your-db\#testing_your_connection_settings) documentation page. Select the **Test** button by the connection's listing on the **Connections** admin page, as described on the Connections (/looker/docs/admin-panel-database-connections\#testing_connections) documentation page.

For new connections, if Looker displays **Can connect**, then select **Add connection**. Looker will run the rest of the connection tests to verify that the service account was set up correctly and with the proper roles.

## Testing A Connection That Uses Oauth

1. In Looker, go into Development Mode (/looker/docs/dev-mode-prod-mode).

2. For an existing BigQuery connection that uses OAuth, navigate to the project files
 (/looker/docs/accessing-project-files) for a Looker project that uses your BigQuery connection. For new BigQuery connections that use OAuth, open a model file (/looker/docs/model-and-view-files\#model_files) and replace the model's connection (/looker/docs/reference/param-model-connection) value with the name of the your new BigQuery connection, and then save the model file.

3. Open one of the model's Explores or dashboards and run a query. When you try to run a query, Looker will prompt you to log in
 (/looker/docs/db-config-google-bigquery\#authenticating_into_google_from_a_query) with your Google Account. Follow the Google OAuth login prompts.

## Job Labels And Context Comments For Bigquery Connections

For BigQuery connections, Looker sends query context in the form of BigQuery job labels (/bigquery/docs/viewing-labels\#viewing_job_labels). By default, Looker sends the following context label keys for BigQuery connections:
looker-context-user_id: The unique identifier for each user on the Looker instance. You can match this user ID to the user IDs on the **Users** (/looker/docs/admin-panel-users-users\#viewing_and_searching_users) page in the **Admin** menu. looker-context-history_slug: The unique identifier for each query that is run on the database by the Looker instance.

looker-context-instance_slug: The ID number of the Looker instance that issued the query. Looker support can use this information to help you troubleshoot, if necessary.

You can configure additional job labels for Looker to send with every query on the BigQuery connection by using the **Additional JDBC parameters** (\#additional_params) text field of the Connections page. In the **Additional JDBC parameters** field, add an additional JDBC parameter, labels, and provide a comma-separated list of URL-encoded key=value pairs. For example, if you include this in the **Additional JDBC parameters** field:
labels=this%3Dconnection-label,that%3Danother-connection-label The %3D is the URL-encoding for =, so this would add the following two labels to every query that Looker sends to the BigQuery database, in addition to the default Looker context labels:
this: connection-label that: another-connection-label Note that BigQuery has restrictions on job labels (/bigquery/docs/labels-intro\#requirements):
Any connection label that has the same key as a context label will be ignored. If the union of connection labels and context labels exceeds the maximum of 64 total labels, context labels are the first to be dropped, followed by connection labels, until the total number of labels is at most 64.

Looker ensures that context labels conform to all BigQuery's label validity requirements, but does not check connection labels for validity. Configuring invalid connection labels may cause queries to fail.

The BigQuery job labels that Looker sends by default (looker-context-user_id, looker-contexthistory_id, and looker-context-instance_slug) correspond to the SQL context comments (/looker/docs/admin-panel-server-usage\#sql_comments) that Looker attaches to SQL queries for database dialects other than BigQuery. For BigQuery connections, context comments are disabled by default because they invalidate BigQuery's ability to cache (/bigquery/docs/cached-results), and can negatively impact cache performance. You can enable context comments for a BigQuery connection by turning off the **Disable Context** (\#disable_context_comments) toggle for the BigQuery connection. We recommend that you keep the default setting for **Disable Context Comment**, so that you are able to use BigQuery's cache. But if you deselect the **Disable Context Comment** option for a BigQuery connection, Looker will send SQL context comments and BigQuery job labels to your database.

SQL context comments and BigQuery job labels convey the same information. For example, Looker might generate the following SQL context comments for a query:
-- Looker Query Context
'{"user_id":1,"history_id":4757,"instance_slug":"ec2804ddef74c466f2a43e0afaa3ff6b"}'
Then Looker would generate the following BigQuery job labels for the same query:
[{"value":"1","key":"looker-context-user_id"},
{"value":"4757","key":"looker-context-history_id"}, {"value":"ec2804ddef74c466f2a43e0afaa3ff6b","key":"looker-context-instance_slug"}]
Feature support For Looker to support some features, your database dialect must also support them.

Google BigQuery Standard SQL

Google BigQuery Standard SQL supports the following features as of Looker 24.10:

| Feature                          | Supported?   |
|----------------------------------|--------------|
| Support Level                    | Supported    |
| Looker (Google Cloud core)       | Yes          |
| Symmetric Aggregates             | Yes          |
| Derived Tables                   | Yes          |
| Persistent SQL Derived Tables    | Yes          |
| Persistent Native Derived Tables | Yes          |
| Stable Views                     | Yes          |
| Query Killing                    | Yes          |
| SQL-based Pivots                 | Yes          |
| Timezones                        | Yes          |
| SSL                              | Yes          |
| Subtotals                        | Yes          |
| JDBC Additional Params           | Yes          |
| Case Sensitive                   | Yes          |
| Location Type                    | Yes          |
| List Type                        | Yes          |
| Percentile                       | Yes          |
| Distinct Percentile              | Yes          |
| SQL Runner Show Processes        | No           |
| SQL Runner Describe Table        | No           |
| SQL Runner Show Indexes          | No           |
| SQL Runner Select 10             | Yes          |
| SQL Runner Count                 | Yes          |
| SQL Explain                      | No           |
| Oauth Credentials                | Yes          |

| Feature                    | Supported?   |
|----------------------------|--------------|
| Context Comments           | Yes          |
| Connection Pooling         | No           |
| HLL Sketches               | Yes          |
| Aggregate Awareness        | Yes          |
| Incremental PDTs           | Yes          |
| Milliseconds               | Yes          |
| Microseconds               | Yes          |
| Materialized Views         | Yes          |
| Approximate Count Distinct | Yes          |

## Google Bigquery Legacy Sql

| Google BigQuery Legacy SQL supports the following features as of Looker 24.10: Feature Supported? Support Level Supported Looker (Google Cloud core) No Symmetric Aggregates Yes Derived Tables Yes Persistent SQL Derived Tables Yes Persistent Native Derived Tables Yes Stable Views No Query Killing Yes SQL-based Pivots Yes Timezones No SSL Yes   |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| Feature                    | Supported?   |
|----------------------------|--------------|
| Subtotals                  | No           |
| JDBC Additional Params     | Yes          |
| Case Sensitive             | Yes          |
| Location Type              | Yes          |
| List Type                  | Yes          |
| Percentile                 | Yes          |
| Distinct Percentile        | Yes          |
| SQL Runner Show Processes  | No           |
| SQL Runner Describe Table  | No           |
| SQL Runner Show Indexes    | No           |
| SQL Runner Select 10       | Yes          |
| SQL Runner Count           | Yes          |
| SQL Explain                | No           |
| Oauth Credentials          | Yes          |
| Context Comments           | Yes          |
| Connection Pooling         | No           |
| HLL Sketches               | No           |
| Aggregate Awareness        | Yes          |
| Incremental PDTs           | No           |
| Milliseconds               | Yes          |
| Microseconds               | Yes          |
| Materialized Views         | No           |
| Approximate Count Distinct | Yes          |

Next steps After you've connected your database to Looker, configure sign-in options for your users
 (/looker/docs/getting-started-with-users).

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies
 (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-07-11 UTC.