# Understanding Audit Logs

This page describes Cloud Audit Logs log entries in detail: their structure, how to read them, and how to interpret them. Cloud Audit Logs provides the following audit logs for each Google Cloud project, folder, and organization:
Admin Activity audit logs Data Access audit logs System Event audit logs Policy Denied audit logs For a general overview of Cloud Audit Logs, see Cloud Audit Logs (/logging/docs/audit).

## Format Of Audit Log Entries

An audit log entry is a type of Cloud Logging log entry. Like all Logging log entries, an audit log entry is stored in a LogEntry (/logging/docs/reference/v2/rest/v2/LogEntry) object. What distinguishes an audit log entry from other log entries is the protoPayload field. In audit log entries, the log entry's protoPayload field contains an AuditLog
 (/logging/docs/audit/api/ref/rest/Shared.Types/AuditLog) object that stores the audit logging data.

In short, every audit log entry is characterized by the following information:
The project, folder, or organization that owns the log entry.

The resource to which the log entry applies. This information consists of a resource type from the Monitored resource list (/logging/docs/api/v2/resource-list) and additional values that denote a specific instance. For example, you can view audit log entries from a single Compute Engine VM instance or from all VM instances.

A timestamp.

A service: Services are individual Google Cloud products, such as Compute Engine, Cloud SQL, or Pub/Sub. Each service is identified by name: Compute Engine is compute.googleapis.com, Cloud SQL is cloudsql.googleapis.com, and so forth. This information is listed in the protoPayload.serviceName field of the audit log entry.

Resource types belongs to a single service, but a service can have several resource types.

For a list of services and resources, go to Mapping services to resources
 (/logging/docs/api/v2/resource-list\#service-names). A payload, which is the protoPayload type. The payload of each audit log entry is an object of type AuditLog (/logging/docs/audit/api/ref/rest/Shared.Types/AuditLog), which defines a set of fields specific to Cloud Audit Logs, such as serviceName and authenticationInfo. It also has an optional field, metadata, that Google Cloud services use to list service-specific information in the audit log entry. Some Google Cloud services still use the older serviceData field to list service-specific information. For a list of services that use the serviceData field, see Service-specific audit data (\#servicedata-services). A log name: Audit log entries belong to logs within projects, folders, and organizations. The log names are listed below:
PROJECT_ID edit projects/ /logs/cloudaudit.googleapis.com%2Factivity projects/ /logs/cloudaudit.googleapis.com%2Fdata_access projects/ /logs/cloudaudit.googleapis.com%2Fsystem_event projects/ /logs/cloudaudit.googleapis.com%2Fpolicy PROJECT_ID edit PROJECT_ID edit PROJECT_ID edit FOLDER_ID edit folders/ /logs/cloudaudit.googleapis.com%2Factivity folders/ /logs/cloudaudit.googleapis.com%2Fdata_access folders/ /logs/cloudaudit.googleapis.com%2Fsystem_event folders/ /logs/cloudaudit.googleapis.com%2Fpolicy FOLDER_ID edit FOLDER_ID edit FOLDER_ID edit billingAccounts/ /logs/cloudaudit.googleapis.com%2Factivity billingAccounts/ /logs/cloudaudit.googleapis.com%2Fdata_acces billingAccounts/ /logs/cloudaudit.googleapis.com%2Fsystem_eve billingAccounts/ /logs/cloudaudit.googleapis.com%2Fpolicy BILLING_ACCOUNT_ID edit BILLING_ACCOUNT_ID edit BILLING_ACCOUNT_ID edit BILLING_ACCOUNT_ID edit ORGANIZATION_ID edit organizations/ /logs/cloudaudit.googleapis.com%2Factivity organizations/ /logs/cloudaudit.googleapis.com%2Fdata_access organizations/ /logs/cloudaudit.googleapis.com%2Fsystem_event organizations/ /logs/cloudaudit.googleapis.com%2Fpolicy ORGANIZATION_ID edit ORGANIZATION_ID edit ORGANIZATION_ID edit Within a project, folder, or organization, these log names are typically abbreviated **activity**, data_access, **system_event**, and **policy**.

Sample audit log entry This section uses a sample audit log entry to explain how to find the most important information in audit log entries. The following sample is an Admin Activity audit log entry written by App Engine (/appengine/docs)
to record a change to an Identity and Access Management (IAM) policy with *PROJECT_ID* mygcp-project-id. For brevity, some parts of the log entry are omitted, and some fields are highlighted:
protoPayload
@type: "type.googleapis.com/google.cloud.audit.AuditLog" serviceName: "appengine.googleapis.com" methodName: "SetIamPolicy" serviceData
@type: "type.googleapis.com/google.appengine.legacy.AuditData" resource: {
type: "gae_app",
labels: { project_id: "my-gcp-project-id" }
}
logName: "projects/my-gcp-project-id/logs/cloudaudit.googleapis.com%2Factivit Here is the query that was used to select the audit log entry sample above. It can be used in the Logs Explorer, Logging API, or Google Cloud CLI. The project identifier is in the log's name, and the query is fast because the logName field is indexed:
resource.type = "gae_app" logName = "projects/PROJECT_ID edit/logs/cloudaudit.googleapis.com%2Factivity" If you are looking for audit logs from a single instance of a resource type, such as gce_instance, add an instance qualifier:
resource.type = "gce_instance" resource.instance_id = " " logName = "projects/ /logs/cloudaudit.googleapis.com%2Factivity" INSTANCE_ID edit PROJECT_ID edit Interpreting the sample audit log entry In the audit log entry sample (\#sample) above, the protoPayload, insertId, resource, timestamp, severity and logName fields shown are part of the LogEntry
 (/logging/docs/reference/v2/rest/v2/LogEntry) object. The value of the protoPayload field is an AuditLog (/logging/docs/audit/api/ref/rest/Shared.Types/AuditLog) object. It encapsulates the audit logging data. Looking at the audit log entry sample above, you might have some questions:
Is this an audit log entry? It is, which you can tell in two ways:
The protoPayload.@type field is type.googleapis.com/google.cloud.audit.AuditLog.

The logName field includes the domain cloudaudit.googleapis.com.

What service wrote the audit log? The log was written by App Engine. This information is listed in the protoPayload.serviceName field of the audit log entry.

What operation is being audited? SetIamPolicy, as specified in the protoPayload.methodName field, is being audited. More information about the audited operation is in the AuditData object in protoPayload.serviceData.

What resource is being audited? An application running in App Engine, associated with a Google Cloud project my-gcp-project-id, is being audited. You can determine this from the resource field, which specifies the resource type gae_app and the project identifier mygcp-project-id. In this example, you would find details on the resource type in the monitored resource type list (/logging/docs/api/v2/resource-list).

For more information, see the LogEntry type (/logging/docs/reference/v2/rest/v2/LogEntry), the AuditLog type (/logging/docs/audit/api/ref/rest/Shared.Types/AuditLog), and the IAM AuditData type
 (/logging/docs/audit/api/ref/rest/Shared.Types/AuditData).

## Large Or Long-Running Audit Log Entries

A single audited operation splits across multiple log entries if the operation runs asynchronously or if it generates a large AuditLog (/logging/docs/audit/api/ref/rest/Shared.Types/AuditLog) record.

When there is more than one log entry for the same operation, the LogEntry
 (/logging/docs/reference/v2/rest/v2/LogEntry) object will contain an operation field and the entries for the same operation will have the same value for LogEntry.operation.id and LogEntry.operation.producer.

In the preceding audit log entry sample (\#sample), the operation field is not present, meaning that all the audit information is contained in a single log entry.

## Service-Specific Audit Data

Some services extend the information stored in their AuditLog
 (/logging/docs/audit/api/ref/rest/Shared.Types/AuditLog) by placing a supplementary data structure in the audit log's serviceData field. The following table lists the services that use serviceData field and provides a link to their AuditData type.

| Service                                                                                                                                                                                                                                                                                                                                                                                                                                             | Service data type                                              |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| App Engine                                                                                                                                                                                                                                                                                                                                                                                                                                          | type.googleapis.com/google.appengine.v1.AuditData              |
| (/appengine/docs)                                                                                                                                                                                                                                                                                                                                                                                                                                   | (/logging/docs/audit/api/ref_gae4/rest/Shared.Types/AuditData) |
| App Engine (legacy) type.googleapis.com/google.appengine.legacy.AuditData  (/appengine/docs)  (/logging/docs/audit/api/ref_gaeL/rest/Shared.Types/AuditData) BigQuery type.googleapis.com/google.cloud.bigquery.logging.v1.AuditData  (/bigquery/docs)  (/logging/docs/audit/api/ref_bq/rest/Shared.Types/AuditData) IAM (/iam/docs) type.googleapis.com/google.iam.v1.logging.AuditData  (/logging/docs/audit/api/ref/rest/Shared.Types/AuditData) |                                                                |

## Viewing Audit Logs

You can query for all audit logs or you can query for logs by their audit log name (\#log_name). The audit log name includes the resource identifier
 (/resource-manager/docs/creating-managing-projects\#identifying_projects) of the Google Cloud project, folder, billing account, or organization for which you want to view audit logging information. Your queries can specify indexed LogEntry (/logging/docs/reference/v2/rest/v2/LogEntry) fields, and if you use the **Log Analytics** page, which supports SQL queries, then you can view your query results as a chart (/logging/docs/analyze/charts).

For more information about querying your logs, see the following pages:
Build queries in the Logs Explorer (/logging/docs/view/building-queries). Query and view logs in Log Analytics (/logging/docs/analyze/query-and-view). Sample queries for security insights (/logging/docs/analyze/analyze-audit-logs).

You can view audit logs in Cloud Logging by using the Google Cloud console, the Google Cloud CLI, or the Logging API.

```
Console
       
   (#console)
      gcloud (#gcloud)API (#api)

```

In the Google Cloud console, you can use the Logs Explorer to retrieve your audit log entries for your Google Cloud project, folder, or organization:
star **Note:** You can't view audit logs for Cloud Billing accounts in the Google Cloud console. You must use the API or the gcloud CLI.

1. In the navigation panel of the Google Cloud console, select **Logging**, and then select Logs Explorer:
Go to Logs Explorer (https://console.cloud.google.com/logs/query)
2. Select an existing Google Cloud project, folder, or organization.

3. To display all audit logs, enter either of the following queries into the query-editor field, and then click **Run query**:
logName:"cloudaudit.googleapis.com" protoPayload."@type"="type.googleapis.com/google.cloud.audit.AuditLog" 4. To display the audit logs for a specific resource and audit log type, in the **Query**
builder pane, do the following:
In **Resource type**, select the Google Cloud resource whose audit logs you want to see.

In **Log name**, select the audit log type that you want to see:
For Admin Activity audit logs, select **activity**. For Data Access audit logs, select **data_access**.

For System Event audit logs, select **system_event**.

For Policy Denied audit logs, select **policy**.

Click **Run query**.

If you don't see these options, then there aren't any audit logs of that type available in the Google Cloud project, folder, or organization.

If you're experiencing issues when trying to view logs in the Logs Explorer, see the troubleshooting (/logging/docs/view/logs-explorer-interface\#troubleshooting) information.

For more information about querying by using the Logs Explorer, see Build queries in the Logs Explorer (/logging/docs/view/building-queries). For information about summarizing log entries in the Logs Explorer by using Gemini, see Summarize log entries with Gemini assistance (/logging/docs/view/summarize-log-entries-duet-ai).

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License
 (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies
 (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-04-16 UTC.