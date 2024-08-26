# Routing And Storage Overview

This document explains how Cloud Logging processes log entries, and describes the key components of Logging routing and storage. *Routing* refers to the process that Cloud Logging uses to determine what to do with a newly-arrived log entry. You can route log entries to destinations like Logging buckets, which store the log entry, or to Pub/Sub. To export your logs into third-party destinations, route your logs to a Pub/Sub topic, and then authorize the thirdparty destination to subscribe to the Pub/Sub topic.

At a high level, this is how Cloud Logging routes and stores log entries:

![1_image_0.png](1_image_0.png)

Route logs with the Log Router The following sections explain how Logging routes logs with the Log Router by using sinks.

Log Router A log entry is sent to the Google Cloud resource (/resource-manager/docs/cloud-platform-resource-hierarchy\#resource-hierarchy-detail) specified in its logName (/logging/docs/reference/v2/rest/v2/LogEntry) field during its entries.write (/logging/docs/reference/v2/rest/v2/entries/write) call. Cloud Logging receives log entries with the Cloud Logging API (/logging/docs/reference/api-overview) where they pass through the Log Router. The sinks (\#sinks) in the Log Router check each log entry against the existing inclusion filter (\#inclusion-filters) and exclusion filters (\#exclusions) that determine which destinations, including Cloud Logging buckets, that the log entry should be sent to. You can use combinations of sinks to route logs to multiple destinations. The Log Router stores the logs temporarily. This behavior buffers against temporary disruptions and outages that might occur when a sink routes logs to a destination. The buffering doesn't protect against sink configuration errors. If your sink is configured incorrectly, then Logging discards the logs, an error log is generated, and an email notifying you of a sink configuration error is sent. Note that the Log Router's temporary storage is distinct from the longer term storage provided by Logging buckets. Incoming log entries with timestamps that are more than the logs retention period
 (/logging/quotas\#logs_retention_periods) in the past or that are more than 24 hours in the future are discarded.

## Sinks

Sinks control how Cloud Logging routes logs. Using sinks, you can route some or all of your logs to supported destinations (\#destinations). Some of the reasons that you might want to control how your logs are routed include the following:
To store logs that are unlikely to be read but that must be retained for compliance purposes. To organize your logs in buckets in a format that is useful to you. To use big-data analysis tools on your logs. To stream your logs to other applications, other repositories, or third parties. For example, if you want to export your logs from Google Cloud so that you can view them on a third-party platform, then configure a sink to route your log entries to Pub/Sub.

Sinks belong to a given Google Cloud resource: Google Cloud projects, billing accounts, folders, and organizations. When the resource receives a log entry, it routes the log entry according to the sinks contained by that resource and, if enabled, any ancestral sinks belonging under the resource hierarchy (/resource-manager/docs/cloud-platform-resource-hierarchy\#resource-hierarchy-detail). The log entry is sent to the destination associated with each matching sink. Cloud Logging provides two predefined sinks for each Google Cloud project, billing account, folder, and organization: _Required and _Default. All logs that are generated in a resource are automatically processed through these two sinks and then are stored either in the correspondingly named _Required (\#required-bucket) or _Default (\#default-bucket) buckets. Sinks act independently of each other. Regardless of how the predefined sinks process your log entries, you can create your own sinks to route some or all of your logs to various supported destinations (\#destinations) or to exclude them from being stored by Cloud Logging. The routing behavior for each sink is controlled by configuring the inclusion filter (\#inclusion-filters) and exclusion filters (\#exclusions) for that sink. Depending on the sink's configuration, every log entry received by Cloud Logging falls into one or more of these categories:
Stored in Cloud Logging and not routed elsewhere.

Stored in Cloud Logging and routed to a supported destination. Not stored in Cloud Logging but routed to a supported destination. Neither stored in Cloud Logging nor routed elsewhere.

You usually create sinks (/logging/docs/export/configure_export_v2) at the Google Cloud project level, but if you want to combine and route logs from the resources contained by a Google Cloud organization or folder, you can create aggregated sinks (/logging/docs/export/aggregated_sinks). You can't route log entries that Logging received before your sink was created because routing happens as logs pass through the Logging API, and new routing rules only apply to logs written after those rules have been created. If you need to route log entries retroactively, see Copy logs (/logging/docs/routing/copy-logs).

## Inclusion Filters

For any new sink, if you don't specify filters, all logs match and are routed to the sink's destination. You can configure the sink to select specific logs by setting an inclusion filter. You can also set one or more exclusion filters to exclude logs from the sink's destination. When you configure sinks (/logging/docs/export/configure_export_v2), you create inclusion filters by using the Logging query language (/logging/docs/view/logging-query-language). Sinks can also contain multiple exclusion filters (\#exclusions). Every log entry received by Logging is routed based on these filtering rules:
The sink's exclusion filters override any of its defined inclusion filters. If a log matches any exclusion filter in the sink, then it doesn't match the sink regardless of any inclusion filters defined. The log entry isn't routed to that sink's destination. If the sink doesn't contain an inclusion filter, then the following happens:
If the log entry matches any exclusion filter, it isn't routed to the sink's destination. If the log entry doesn't match any exclusion filter, it is routed to the sink's destination. An empty inclusion filter selects all logs.

If the sink contains an inclusion filter, then the following happens:
If the log entry matches the inclusion filter, it is routed to the sink's destination.

If the log entry doesn't match the inclusion filter, it isn't routed to the sink's destination.

## Exclusion Filters

When you create a sink (/logging/docs/export/configure_export_v2), you can set multiple exclusion filters. Exclusion filters let you exclude matching log entries from being routed to the sink's destination or from being stored in a log bucket. You create exclusion filters by using the Logging query language (/logging/docs/view/logging-query-language). Log entries are excluded after they are received by the Logging API and therefore these log entries consume entries.write API quota (/logging/quotas\#api-limits). You can't reduce the number of entries.write API calls (/logging/quotas\#log-limits) by excluding log entries. Excluded log entries aren't available in the Logs Explorer.

Log entries that aren't routed to at least one log bucket, either explicitly with exclusion filters or because they don't match any sinks with a Logging storage destination, are also excluded from Error Reporting. Therefore, these logs aren't available to help troubleshoot failures. User-defined log-based metrics are computed from log entries in both included and excluded logs. For more information, see Monitor your logs (/logging/docs/alerting/monitoring-logs\#which-logs).

## Supported Destinations

You can use the Log Router to route certain logs to supported destinations in any Google Cloud project. Logging supports the following sink destinations:
Cloud Logging bucket: Provides storage in Cloud Logging. A log bucket (/logging/docs/routing/overview\#buckets) can store log entries that are received by multiple Google Cloud projects. You can combine your Cloud Logging data with other data by upgrading a log bucket to use Log Analytics, and then creating a linked BigQuery dataset. For information about viewing log entries stored in log buckets, see Query and view logs overview (/logging/docs/log-analytics) and View logs routed to Cloud Logging buckets (/logging/docs/export/using_exported_logs). BigQuery dataset: Provides storage of log entries in BigQuery datasets. You can use big data analysis capabilities on the stored log entries. To combine your Cloud Logging data with other data sources, we recommend that you upgrade your log buckets to use Log Analytics and then create a linked BigQuery dataset. For information about viewing log entries routed to BigQuery, see View logs routed to BigQuery (/logging/docs/export/bigquery) . Cloud Storage bucket: Provides storage of log entries in Cloud Storage. Log entries are stored as JSON files. For information about viewing log entries routed to Cloud Storage, see View logs routed to Cloud Storage (/logging/docs/export/storage). Pub/Sub topic: Provides support for third-party integrations. Log entries are formatted into JSON and then routed to a Pub/Sub topic. For information about viewing log entries routed to Pub/Sub, see View logs routed to Pub/Sub (/logging/docs/export/pubsub). Splunk: Provides support for Splunk (/architecture/exporting-stackdriver-logging-for-splunk). You must route your log entries to a Pub/Sub topic and then subscribe to that topic by using Splunk.

Google Cloud project: Route log entries to a different Google Cloud project. When you route log entries to a different Google Cloud project, the destination project's Log Router receives the log entries and processes them. The sinks in the destination project determine how the received log entries are routed. Error Reporting can analyze log entries when the destination project routes those log entries to a log bucket owned by the destination project. Other resources: Route your log entries to a supported destination that is in a different project. For information about the paths to use, see Destination path formats (/logging/docs/export/configure_export_v2\#destination-paths).

For more information, see Route logs to supported destinations (/logging/docs/export/configure_export_v2).

## Storing, Viewing, And Managing Logs

The following section details how logs are stored in Cloud Logging, and how you can view and manage them.

## Log Buckets

Cloud Logging uses log buckets as containers in your Google Cloud projects, billing accounts, folders, and organizations to store and organize your logs data. The logs that you store in Cloud Logging are indexed, optimized, and delivered to let you analyze your logs in real time. Cloud Logging buckets are different storage entities than the similarly named Cloud Storage buckets. For each Google Cloud project, billing account, folder, and organization, Logging automatically creates two log buckets: _Required and _Default. Logging automatically creates sinks named _Required and _Default that, in the default configuration, route logs to the correspondingly named buckets. You can disable the _Default sink, which routes logs to the _Default log bucket. You can change the behavior of the _Default sinks created for any new Google Cloud projects or folders. For more information, see Configure default settings for organizations and folders (/logging/docs/default-settings). You can't change routing rules for the _Required bucket. Additionally, you can create user-defined buckets (\#user-buckets) for any Google Cloud project. You create sinks to route all, or just a subset, of your logs to any log bucket. This flexibility allows you to choose the Google Cloud project in which your logs are stored and what other logs are stored with them. For more information, see Configure log buckets (/logging/docs/buckets). _Required **log bucket** Cloud Logging automatically routes the following types of logs to the _Required bucket:
Admin Activity audit logs (/logging/docs/audit\#admin-activity) System Event audit logs (/logging/docs/audit\#system-event) Google Workspace Admin Audit logs Enterprise Groups Audit logs Login Audit logs Access Transparency logs. For information about enabling Access Transparency logs, see the Access Transparency logs documentation
 (/assured-workloads/access-transparency/docs/overview).

Cloud Logging retains the logs in the _Required bucket for 400 days; you can't change this retention period. You can't modify or delete the _Required bucket. You can't disable the _Required sink, which routes logs to the _Required bucket. _Default **log bucket** Any log entry that isn't stored in the _Required bucket is routed by the _Default sink to the _Default bucket, unless you disable or otherwise edit the _Default sink. For instructions on modifying sinks, see Manage sinks (/logging/docs/export/configure_export_v2\#managing_sinks). For example, Cloud Logging automatically routes the following types of logs to the _Default bucket:
Data Access audit logs (/logging/docs/audit\#data-access) Policy Denied audit logs (/logging/docs/audit\#policy_denied)
Cloud Logging retains the logs in the _Default bucket for 30 days, unless you configure custom retention (/logging/docs/buckets\#custom-retention) for the bucket. You can't delete the _Default bucket. User-defined log buckets You can also create user-defined log buckets (/logging/docs/buckets\#create_bucket) in any Google Cloud project. By applying sinks to your user-defined log buckets, you can route any subset of your logs to any log bucket, letting you choose which Google Cloud project your logs are stored in and which other logs are stored with them. For example, for any log generated in Project-A, you can configure a sink to route that log to user-defined buckets in Project-A or Project-B. You can configure custom retention (/logging/docs/buckets\#custom-retention) for the bucket. For information about managing your user-defined log buckets, including deleting or updating them, see Configure and manage log buckets (/logging/docs/buckets).

## Regionalization

Log buckets (\#buckets) are regional resources. The infrastructure that stores, indexes, and searches your logs is located in a specific geographical location. Google manages that infrastructure so that your applications are available redundantly across the zones within that region. When you create a log bucket (/logging/docs/buckets\#create_bucket) or set an organization-level regional policy (/logging/docs/buckets\#org-region), you can choose to store your logs in any of the following regions: Africa

Region name Region description **Log Analytics**

support

africa-south1 Johannesburg Yes

Asia Pacific

| Americas Region name    | Region description   | Log Analytics support   |
|-------------------------|----------------------|-------------------------|
| northamerica-northeast1 | Montréal             | Yes                     |
| northamerica-northeast2 | Toronto              | Yes                     |
| southamerica-east1      | São Paulo            | Yes                     |
| southamerica-west1      | Santiago             | Yes                     |
| us-central1             | Iowa                 | Yes                     |
| us-east1                | South Carolina       | Yes                     |
| us-east4                | North Virginia       | Yes                     |
| us-east5                | Columbus             | Yes                     |
| us-south1               | Dallas               | Yes                     |
| us-west1                | Oregon               | Yes                     |
| us-west2                | Los Angeles          | Yes                     |
| us-west3                | Salt Lake City       | Yes                     |
| us-west4                | Las Vegas            | Yes                     |

| Region name   | Region description   | Log Analytics support   |
|---------------|----------------------|-------------------------|
| asia-east1    | Taiwan               | Yes                     |
| asia-east2    | Hong Kong            | Yes                     |

| Region name          | Region description   | Log Analytics support   |
|----------------------|----------------------|-------------------------|
| asia-northeast1      | Tokyo                | Yes                     |
| asia-northeast2      | Osaka                | Yes                     |
| asia-northeast3      | Seoul                | Yes                     |
| asia-south1          | Mumbai               | Yes                     |
| asia-south2          | Delhi                | Yes                     |
| asia-southeast1      | Singapore            | Yes                     |
| asia-southeast2      | Jakarta              | Yes                     |
| australia-southeast1 | Sydney               | Yes                     |
| australia-southeast2 | Melbourne            | Yes                     |
| Europe Region name   | Region description   | Log Analytics support   |
| europe-central2      | Warsaw               | Yes                     |
| europe-north1        | Finland              | Yes                     |
| europe-southwest1    | Madrid               | Yes                     |
| europe-west1         | Belgium              | Yes                     |
| europe-west2         | London               | Yes                     |
| europe-west3         | Frankfurt            | Yes                     |
| europe-west4         | Netherlands          | Yes                     |
| europe-west6         | Zurich               | Yes                     |
| europe-west8         | Milan                | Yes                     |
| europe-west9         | Paris                | Yes                     |
| europe-west10        | Berlin               | Yes                     |

| Region name             | Region description                                                                             | Log Analytics support   |
|-------------------------|------------------------------------------------------------------------------------------------|-------------------------|
| europe-west12           | Turin                                                                                          | Yes                     |
| Middle East Region name | Region description                                                                             | Log Analytics support   |
| me-central1             | Doha                                                                                           | Yes                     |
| me-central2             | Dammam                                                                                         | Yes                     |
| me-west1                | Tel Aviv                                                                                       | Yes                     |
| Other Region name       | Region description                                                                             | Log Analytics support   |
| eu                      | Logs stored in data centers within the European Union; no additional redundancy guarantees Yes |                         |
| us                      | Logs stored in data centers within the United States; no additional redundancy guarantees      | Yes                     |
| global                  | Logs stored in any data center in the world; Yes no additional redundancy guarantees           |                         |

In addition to these regions, you can set the location to global, which means that you don't need to specify where your logs are physically stored. You can automatically apply a particular storage region to the _Default and _Required buckets created in an organization or folder. For more information, see Configure default settings for organizations and folders (/logging/docs/default-settings). For more information about data regionality and where you can store your logs data, see Understand data regions (/logging/docs/region-support).

Note: Error Reporting (/error-reporting) is a global service built on Cloud Logging and doesn't analyze logs stored in regional log buckets, logs that are routed to other projects, or logs stored in log buckets that use customer-managed encryption keys.

Organization policy You can create an organization policy (/resource-manager/docs/organization-policy/overview) to ensure that your organization meets your compliance and regulatory needs. Using an organization policy, you can specify in which regions your organization can create new log buckets. You can also restrict your organization from creating new log buckets in specified regions. Cloud Logging doesn't enforce your newly created organization policy on existing log buckets; it only enforces the policy on new log buckets. For information about creating a location-based organization policy, see Restrict resource locations (/resource-manager/docs/organization-policy/defining-locations). In addition, you can configure a default storage location for the _Default and _Required buckets in an organization or in a folder. If you configure an organization policy that constrains where data can be stored, then you must ensure that the default storage location you specify is consistent with that constraint. For more information, see Configure default settings for organizations and folders (/logging/docs/default-settings).

## Retention

Note: Effective April 1, 2023, retention costs apply to logs data retained longer than the default retention period (/logging/quotas\#logs_retention_periods) of the _Default bucket and user-defined log buckets. For pricing details, see Cloud Logging pricing summary (/stackdriver/pricing\#logging-pricing-summary). To review the billable storage for your log buckets, go to the **Logs Storage** page of the Google Cloud console.

Cloud Logging retains logs according to retention rules applying to the log bucket type where the logs are held. You can configure Cloud Logging to retain logs between 1 day and 3650 days. Custom retention rules apply to all the logs in a bucket, regardless of the log type or whether that log has been copied from another location. For information about setting retention rules for a log bucket, see Configure custom retention (/logging/docs/buckets\#custom-retention). For information about the retention periods for different types of logs, see Quotas and limits (/logging/quotas\#logs_retention_periods).

## Log Views

Log views let you grant a user access to only a subset of the logs stored in a log bucket. For information about how to configure log views, and how to grant access to specific log views, see Configure log views on a log bucket (/logging/docs/logs-views). For every log bucket, Cloud Logging automatically creates the _AllLogs view, which shows all logs stored in that bucket. Cloud Logging also creates a view for the _Default bucket called _Default. The _Default view for the _Default bucket shows all logs except Data Access audit logs. The _AllLogs and _Default views aren't editable, and you can't delete the _Default log view. Custom log views provide you with an advanced and granular way to control access to your logs data. For example, consider a scenario in which you store all of your organization's logs (/logging/docs/central-log-storage) in a central Google Cloud project. Because log buckets can contain logs from multiple Google Cloud projects, you might want to control which Google Cloud projects different users can view logs from. Using custom log views, you can give one user access to logs only from a single Google Cloud project, while you give another user access to logs from all the Google Cloud projects.

## Using Logs In The Google Cloud Ecosystem

The following section provides information about how to use logs in the broader Google Cloud.

Log-based metrics Log-based metrics are Cloud Monitoring (/monitoring/docs) metrics that are derived from the content of log entries. For example, if Cloud Logging receives a log entry for a Google Cloud project that matches the filters of one of the Google Cloud project's metrics, then that log entry is counted in the metric data. Log-based metrics interact with routing differently, depending on whether the log-based metrics are defined by the system or by you. The following sections describe these differences. Log-based metrics and exclusion filters Sink exclusion filters apply to system-defined log-based metrics, which count only logs that are stored in log buckets. Sink exclusion filters don't apply to user-defined log-based metrics. Even if you exclude logs from being stored in any Logging buckets, you could see those logs counted in these metrics. Scope of log-based metrics System-defined log-based metrics apply at the Google Cloud project level. These metrics are calculated by the Log Router and apply to logs only in the Google Cloud project in which they're received. User-defined log-based metrics can apply at either the Google Cloud project level or at the level of a specific log bucket:
Project-level metrics are calculated like system-defined log-based metrics; these userdefined log-based metrics apply to logs only in the Google Cloud project in which they're received.

Bucket-scoped metrics apply to logs in the log bucket in which they're received, regardless of the Google Cloud project in which the log entries originated. With bucket-scoped log-based metrics, you can create log-based metrics that can evaluate logs in the following cases:
Logs that are routed from one project to a bucket in another project. Logs that are routed into a bucket through an aggregated sink.

For more information, see Log-based metrics overview (/logging/docs/logs-based-metrics).

Finding logs in supported destinations To learn about the format of routed log entries and how the logs are organized in destinations, see View logs in sink destinations (/logging/docs/export/using_exported_logs).

Common use cases To address common use cases for routing and storing logs, see the following documents and tutorials:
Aggregate your organization's log into a central log bucket
 (/logging/docs/central-log-storage)
Regionalize your logs (/logging/docs/regionalized-logs) Configure multi-tenant logging for Google Kubernetes Engine (GKE) clusters
 (/stackdriver/docs/solutions/gke/multi-tenant-logging)

## Compliance Needs

For best practices about using routing for data governance, see the following documents:
Configure CMEK for logs routing (/logging/docs/routing/managed-encryption) Logs data: A step by step guide for overcoming common compliance challenges
 (https://services.google.com/fh/files/misc/whitepaper_data_governance_logs_how_to.pdf)
Data governance: Principles for securing and managing logs
 (/resources/data-governance-logs-best-practices-whitepaper)

## Access Control With Iam

For information about how you use Identity and Access Management (IAM) (/iam/docs/overview) roles and permissions to control access to Cloud Logging data, see the Access control with IAM (/logging/docs/access-control).

Pricing Cloud Logging doesn't charge to route logs to a supported destination; however, the destination might apply charges. With the exception of the _Required log bucket, Cloud Logging charges to stream logs into log buckets and for storage longer than the default retention period of the log bucket. Cloud Logging doesn't charge for copying logs, or for queries issued through the **Logs Explorer** page or through the **Log Analytics** page. For more information, see the following documents:
Cloud Logging pricing summary (/stackdriver/pricing\#logs-pricing-summary) Destination costs:
Cloud Storage pricing (/storage/pricing) BigQuery pricing (/bigquery/pricing\#data_ingestion_pricing) Pub/Sub pricing (/pubsub/pricing) Cloud Logging pricing (/stackdriver/pricing\#logging-cost)
VPC flow log generation charges (/vpc/network-pricing\#network-telemetry) apply when you send and then exclude your Virtual Private Cloud flow logs from Cloud Logging.

## What'S Next

To help you route and store Cloud Logging data, see the following documents:
To create sinks to route logs to supported destinations, see Configure sinks (/logging/docs/export/configure_export_v2). For routing and sinks troubleshooting information, see Troubleshoot routing and sinks (/logging/docs/export/troubleshoot).

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-05-23 UTC.