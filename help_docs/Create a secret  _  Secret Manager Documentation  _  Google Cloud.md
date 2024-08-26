# Create A Secret

This topic describes how to create a secret. A secret contains one or more secret versions, along with metadata such as labels and replication information. The actual contents of a secret are stored in a secret version (/secret-manager/docs/add-secret-version).

Important: To use Secret Manager with workloads running on Compute Engine or Google Kubernetes Engine, the underlying instance or node must have the cloud-platform OAuth scope. See accessing the Secret Manager API (/secret-manager/docs/accessing-the-api\#oauth-scopes) for more information.

## Before You Begin

1. Enable the Secret Manager API (/secret-manager/docs/configuring-secret-manager), once per project. 2. Assign the Secret Manager Admin role (roles/secretmanager.admin) on the project, folder, or organization. 3. Authenticate to the Secret Manager API using one of the following ways:
If you use client libraries to access the Secret Manager API, set up Application Default Credentials (/docs/authentication/provide-credentials-adc). If you use the Google Cloud CLI to access the Secret Manager API, use your Google Cloud CLI credentials (/sdk/docs/authorizing) to authenticate. To authenticate a REST call, use either Google Cloud CLI credentials or Application Default Credentials.

## Create A Secret

Console (\#console)gcloud
 (\#gcloud)
C\# (\#c)Go (\#go)Java (\#java)Node.js (\#node.js)PHP (\#php)Python (\#python)Ruby (\#ruby)API (\#api)
To use Secret Manager on the command line, first Install or upgrade to version 378.0.0 or higher of the Google Cloud CLI (/sdk/install). On Compute Engine or GKE, you must authenticate with the **cloud-platform** scope
 (/secret-manager/docs/accessing-the-api\#oauth-scopes).

$ gcloud secrets create \
--replication-policy="automatic" secret-id edit To select the right replication policy for your secret, see Choose a replication policy (/secret-manager/docs/choosing-replication).

## Add A Secret Version

Secret Manager automatically versions secret data using secret versions, and most operations like access, destroy, disable, and enable take place on a secret version. With Secret Manager, you can pin a secret to specific versions like 42 or floating aliases like latest. Learn how to Add a secret version (/secret-manager/docs/add-secret-version).

## Access A Secret Version

To access the secret data from a particular secret version for successful authentication, see Access a secret version (/secret-manager/docs/access-secret-version).

## What'S Next

Learn how to choose a replication policy (/secret-manager/docs/choosing-replication). Learn how to manage access to secrets (/secret-manager/docs/access-control). Learn how to set up notifications on a secret (/secret-manager/docs/event-notifications).

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies).

Java is a registered trademark of Oracle and/or its affiliates. Last updated 2024-05-31 UTC.