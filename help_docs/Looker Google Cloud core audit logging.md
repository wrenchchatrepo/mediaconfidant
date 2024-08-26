Note that you are viewing Looker documentation. For Looker Studio documentation, visit https://support.google.com/looker-studio (https://support.google.com/looker-studio).

## Looker (Google Cloud Core) Audit Logging

This document describes the audit logs created by Looker (Google Cloud core) as part of Cloud Audit Logs (/logging/docs/audit).

## Overview

Google Cloud services write audit logs to help you answer the questions, "Who did what, where, and when?" within your Google Cloud resources. Your Google Cloud projects contain only the audit logs for resources that are directly within the Google Cloud project. Other Google Cloud resources, such as folders, organizations, and billing accounts, contain the audit logs for the entity itself. For a general overview of Cloud Audit Logs, see Cloud Audit Logs overview (/logging/docs/audit). For a deeper understanding of the audit log format, see Understand audit logs (/logging/docs/audit/understanding-audit-logs).

## Available Audit Logs

The following types of audit logs are available for Looker (Google Cloud core):
Admin Activity audit logs Includes "admin write" operations that write metadata or configuration information. You can't disable Admin Activity audit logs. Data Access audit logs Includes "admin read" operations that read metadata or configuration information. Also includes "data read" and "data write" operations that read or write user-provided data. To receive Data Access audit logs, you must explicitly enable (/logging/docs/audit/configure-data-access\#config-console-enable) them.

For fuller descriptions of the audit log types, see Types of audit logs (/logging/docs/audit\#types).

## Audited Operations

The following table summarizes which API operations correspond to each audit log type in Looker (Google Cloud core):

| Audit logs category                 | Looker (Google Cloud core) methods                           |
|-------------------------------------|--------------------------------------------------------------|
| Admin Activity audit logs           | CreateInstance DeleteInstance UpdateInstance RestartInstance |
| Data Access (ADMIN_READ) audit logs | ListInstance GetInstance                                     |

## Audit Log Format

Audit log entries include the following objects:
The log entry itself, which is an object of type LogEntry (/logging/docs/reference/v2/rest/v2/LogEntry) . Useful fields include the following:
The logName contains the resource ID and audit log type. The resource contains the target of the audited operation. The timeStamp contains the time of the audited operation. The protoPayload contains the audited information.

The audit logging data, which is an AuditLog (/logging/docs/reference/audit/auditlog/rest/Shared.Types/AuditLog) object held in the protoPayload field of the log entry. Optional service-specific audit information, which is a service-specific object. For earlier integrations, this object is held in the serviceData field of the AuditLog object; later integrations use the metadata field.

For other fields in these objects, and how to interpret them, review Understand audit logs (/logging/docs/audit/understanding-audit-logs).

## Log Name

Cloud Audit Logs log names include resource identifiers indicating the Google Cloud project or other Google Cloud entity that owns the audit logs, and whether the log contains Admin Activity, Data Access, Policy Denied, or System Event audit logging data. The following are the audit log names, including variables for the resource identifiers:
projects/ /logs/cloudaudit.googleapis.com%2Factivity projects/ /logs/cloudaudit.googleapis.com%2Fdata_access projects/ /logs/cloudaudit.googleapis.com%2Fsystem_event projects/ /logs/cloudaudit.googleapis.com%2Fpolicy PROJECT_ID edit PROJECT_ID edit PROJECT_ID edit PROJECT_ID edit folders/ /logs/cloudaudit.googleapis.com%2Factivity folders/ /logs/cloudaudit.googleapis.com%2Fdata_access folders/ /logs/cloudaudit.googleapis.com%2Fsystem_event folders/ /logs/cloudaudit.googleapis.com%2Fpolicy FOLDER_ID edit FOLDER_ID edit FOLDER_ID edit FOLDER_ID edit billingAccounts/ /logs/cloudaudit.googleapis.com%2Factivity billingAccounts/ /logs/cloudaudit.googleapis.com%2Fdata_access billingAccounts/ /logs/cloudaudit.googleapis.com%2Fsystem_event billingAccounts/ /logs/cloudaudit.googleapis.com%2Fpolicy BILLING_ACCOUNT_ID edit BILLING_ACCOUNT_ID edit BILLING_ACCOUNT_ID edit BILLING_ACCOUNT_ID edit organizations/ /logs/cloudaudit.googleapis.com%2Factivity organizations/ /logs/cloudaudit.googleapis.com%2Fdata_access organizations/ /logs/cloudaudit.googleapis.com%2Fsystem_event organizations/ /logs/cloudaudit.googleapis.com%2Fpolicy ORGANIZATION_ID edit ORGANIZATION_ID edit ORGANIZATION_ID edit ORGANIZATION_ID edit Note: The part of the log name following /logs/ must be URL-encoded. The forward-slash character, /, must be written as %2F.

Service name Looker (Google Cloud core) audit logs use the service name looker.googleapis.com. For a list of all the Cloud Logging API service names and their corresponding monitored resource type, see Map services to resources (/logging/docs/api/v2/resource-list\#service-names).

Resource types Looker (Google Cloud core) audit logs use the resource type audited_resource for all audit logs. For a list of all the Cloud Logging monitored resource types and descriptive information, see Monitored resource types (/logging/docs/api/v2/resource-list\#resource-types).

## Caller Identities

The IP address of the caller is held in the RequestMetadata.caller_ip field of the AuditLog (/logging/docs/reference/audit/auditlog/rest/Shared.Types/AuditLog) object. Logging might redact certain caller identities and IP addresses. For information about what information is redacted in audit logs, see Caller identities in audit logs (/logging/docs/audit\#user-id).

## Enable Audit Logging

Admin Activity audit logs are always enabled; you can't disable them. Data Access audit logs are disabled by default and aren't written unless explicitly enabled (the exception is Data Access audit logs for BigQuery, which can't be disabled).

For information about enabling some or all of your Data Access audit logs, see Enable Data Access audit logs (/logging/docs/audit/configure-data-access).

## Permissions And Roles

IAM (/iam/docs) permissions and roles determine your ability to access audit logs data in Google Cloud resources. When deciding which Logging-specific permissions and roles (/logging/docs/access-control\#permissions_and_roles) apply to your use case, consider the following:
The Logs Viewer role (roles/logging.viewer) gives you read-only access to Admin Activity, Policy Denied, and System Event audit logs. If you have just this role, you cannot view Data Access audit logs that are in the _Default bucket. The Private Logs Viewer role(roles/logging.privateLogViewer) includes the permissions contained in roles/logging.viewer, plus the ability to read Data Access audit logs in the _Default bucket. Note that if these private logs are stored in user-defined buckets, then any user who has permissions to read logs in those buckets can read the private logs. For more information about log buckets, see Routing and storage overview (/logging/docs/routing/overview).

For more information about the IAM permissions and roles that apply to audit logs data, see Access control with IAM (/logging/docs/access-control).

## View Logs

You can query for all audit logs or you can query for logs by their audit log name (\#log_name). The audit log name includes the resource identifier
 (/resource-manager/docs/creating-managing-projects\#identifying_projects) of the Google Cloud project, folder, billing account, or organization for which you want to view audit logging information. Your queries can specify indexed LogEntry (/logging/docs/reference/v2/rest/v2/LogEntry) fields, and if you use the Log Analytics page, which supports SQL queries, then you can view your query results as a chart (/logging/docs/analyze/charts). For more information about querying your logs, see the following pages:
Build queries in the Logs Explorer (/logging/docs/view/building-queries). Query and view logs in Log Analytics (/logging/docs/analyze/query-and-view). Sample queries for security insights (/logging/docs/analyze/analyze-audit-logs).

You can view audit logs in Cloud Logging by using the Google Cloud console, the Google Cloud CLI, or the Logging API.

```
Console
       
   (#console)
       gcloud (#gcloud)API (#api)

```

In the Google Cloud console, you can use the Logs Explorer to retrieve your audit log entries for your Google Cloud project, folder, or organization:
star Note: You can't view audit logs for Cloud Billing accounts in the Google Cloud console. You must use the API or the gcloud CLI.

1. In the navigation panel of the Google Cloud console, select **Logging**, and then select Logs Explorer:
Go to Logs Explorer (https://console.cloud.google.com/logs/query)
2. Select an existing Google Cloud project, folder, or organization. 3. To display all audit logs, enter either of the following queries into the query-editor field, and then click **Run query**:
logName:"cloudaudit.googleapis.com" protoPayload."@type"="type.googleapis.com/google.cloud.audit.AuditLog" 4. To display the audit logs for a specific resource and audit log type, in the **Query builder**
pane, do the following:
In **Resource type**, select the Google Cloud resource whose audit logs you want to see.

In **Log name**, select the audit log type that you want to see:
For Admin Activity audit logs, select **activity**. For Data Access audit logs, select **data_access**. For System Event audit logs, select **system_event**. For Policy Denied audit logs, select **policy**.

Click **Run query**.

If you don't see these options, then there aren't any audit logs of that type available in the Google Cloud project, folder, or organization. If you're experiencing issues when trying to view logs in the Logs Explorer, see the troubleshooting (/logging/docs/view/logs-explorer-interface\#troubleshooting) information.

For more information about querying by using the Logs Explorer, see Build queries in the Logs Explorer (/logging/docs/view/building-queries). For information about summarizing log entries in the Logs Explorer by using Gemini, see Summarize log entries with Gemini assistance (/logging/docs/view/summarize-log-entries-duet-ai).

For example, to view all the project-level audit logs for Looker (Google Cloud core), use the following query, supplying a valid resource identifier in each of the log names:
logName=("projects/ /logs/cloudaudit.googleapis.com%2Factivity" OR "projects/ /logs/cloudaudit.googleapis.com%2Fdata_access" PROJECT_ID edit PROJECT_ID edit OR "projects/ /logs/cloudaudit.googleapis.com%2Fsystem_event" OR "projects/ /logs/cloudaudit.googleapis.com%2Fpolicy")
protoPayload.serviceName="looker.googleapis.com" PROJECT_ID edit PROJECT_ID edit

## Route Audit Logs

You can route audit logs (/logging/docs/routing/overview) to supported destinations in the same way that you can route other kinds of logs. Here are some reasons you might want to route your audit logs:
To keep audit logs for a longer period of time or to use more powerful search capabilities, you can route copies of your audit logs to Cloud Storage, BigQuery, or Pub/Sub. Using Pub/Sub, you can route to other applications, other repositories, and to third parties. To manage your audit logs across an entire organization, you can create aggregated sinks (/logging/docs/export/aggregated_sinks) that can route logs from any or all Google Cloud projects in the organization. If your enabled Data Access audit logs are pushing your Google Cloud projects over your log allotments, you can create sinks that exclude the Data Access audit logs from Logging.

For instructions about routing logs, see Route logs to supported destinations (/logging/docs/export/configure_export_v2).

## Pricing

For more information about pricing, see Cloud Logging pricing summary (/stackdriver/pricing\#logs-costs).

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-04-16 UTC.