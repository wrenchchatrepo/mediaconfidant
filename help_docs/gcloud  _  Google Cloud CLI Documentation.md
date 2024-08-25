# Gcloud

## Name

gcloud - manage Google Cloud resources and developer workflow

## Synopsis

gclo (\#gcloud) ud GRO (\#GROUP) UP | COMMA (\#COMM ND AND) [--accou (\#--account) nt =ACCOUNT]
[--billing-proje (\#--billing-pr ct oject)=BILLING_PROJECT]
[--configurati (\#--con on figuration)=CONFIGURATION] [--flags-fi (\#-- leflags-file)=YAML_FILE]
[--flatt (\#-- enflatten)=[KEY,…]] [--form (\#--format) at =FORMAT] [--he (\#--help) lp ]
[--proje (\#--pr ct oject)=PROJECT_ID] [--qui (\#--quiet) et , (\#-q) -q ] [--verbosi (\#--v ty erbosity)=VERBOSITY;
default="warning"] [--versi (\#--v on ersion), (\#-v) -v ] (\#-h) [-h ]
[--access-token-fi (\#--access-t le oken-file)=ACCESS_TOKEN_FILE]
[--impersonate-service-accou (\#--impersonate-ser nt vice-account)=SERVICE_ACCOUNT_EMAILS]
[--log-ht (\#--log-http) tp ] [--trace-tok (\#--tr en ace-token)=TRACE_TOKEN]
[--no-user-output-enabl (\#--user-output-enabled) ed ]

## Description

The gcloud CLI manages authentication, local configuration, developer workflow, and interactions with the Google Cloud APIs.

For a quick introduction to the gcloud CLI, a list of commonly used commands, and a look at how these commands are structured, run gcloud cheat-sheet
 (/sdk/gcloud/reference/cheat-sheet) or see the `gcloud` CLI cheat sheet (https://cloud.google.com/sdk/docs/cheatsheet).

## Global Flags

--account=ACCOUNT
Google Cloud user account to use for invocation. Overrides the default core/account property value for this command invocation.

--billing-project=BILLING_PROJECT
The Google Cloud project that will be charged quota for operations performed in gcloud. If you need to operate on one project, but need quota against a different project, you can use this flag to specify the billing project. If both billing/quota_project and --
billing-project are specified, --billing-project takes precedence. Run $ gcloud config set (/sdk/gcloud/reference/config/set) --help to see more information about billing/quota_project.

## --Configuration=Configuration

The configuration to use for this command invocation. For more information on how to use configurations, run: gcloud topic configurations (/sdk/gcloud/reference/topic/configurations). You can also use the CLOUDSDK_ACTIVE_CONFIG_NAME environment variable to set the equivalent of this flag for a terminal session.

## --Flags-File=Yaml_File

A YAML or JSON file that specifies a --flag:value dictionary. Useful for specifying complex flag values with special characters that work with any command interpreter.

Additionally, each --flags-file arg is replaced by its constituent flags. See $ gcloud topic flags-file (/sdk/gcloud/reference/topic/flags-file) for more information.

## --Flatten=[Key,…]

Flatten name[] output resource slices in KEY into separate records for each item in each slice. Multiple keys and slices may be specified. This also flattens keys for --format and
--filter. For example, --flatten=abc.def flattens abc.def[].ghi references to abc.def.ghi. A resource record containing abc.def[] with N elements will expand to N
records in the flattened output. This allows us to specify what resource-key the filter will operate on. This flag interacts with other flags that are applied in this order: --
flatten, --sort-by, --filter, --limit.

## --Format=Format

Sets the format for printing command output resources. The default is a commandspecific human-friendly output format. If both core/format and --format are specified, --format takes precedence. --format and core/format both take precedence over core/default_format. The supported formats are limited to: config, csv, default, diff, disable, flattened, get, json, list, multi, none, object, table, text, value, yaml. For more details run $ gcloud topic formats. Run $ gcloud config set (/sdk/gcloud/reference/config/set) --help to see more information about core/format
--help Display detailed help.

--project=PROJECT_ID
The Google Cloud project ID to use for this invocation. If omitted, then the current project is assumed; the current project can be listed using gcloud config list --
format='text(core.project)' and can be set using gcloud config set project PROJECTID. --project and its fallback core/project property play two roles in the invocation. It specifies the project of the resource to operate on. It also specifies the project for API enablement check, quota, and billing. To specify a different project for quota and billing, use --billing-project or billing/quota_project property.

--quiet, -q Disable all interactive prompts when running gcloud commands. If input is required, defaults will be used, or an error will be raised. Overrides the default core/disable_prompts property value for this command invocation.

This is equivalent to setting the environment variable CLOUDSDK_CORE_DISABLE_PROMPTS
to 1.

--verbosity=VERBOSITY; default="warning" Override the default verbosity for this command. Overrides the default core/verbosity property value for this command invocation. VERBOSITY must be one of: debug, info, warning, error, critical, none.

--version, -v Print version information and exit. This flag is only available at the global level.

-h Print a summary help and exit.

## Other Flags

--access-token-file=ACCESS_TOKEN_FILE
A file path to read the access token. Use this flag to authenticate gcloud with an access token. The credentials of the active account (if exists) will be ignored. The file should only contain an access token with no other information. Overrides the default auth/access_token_file property value for this command invocation.

--impersonate-service-account=SERVICE_ACCOUNT_EMAILS
For this gcloud invocation, all API requests will be made as the given service account or target service account in an impersonation delegation chain instead of the currently selected account. You can specify either a single service account as the impersonator, or a comma-separated list of service accounts to create an impersonation delegation chain. The impersonation is done without needing to create, download, and activate a key for the service account or accounts.

In order to make API requests as a service account, your currently selected account must have an IAM role that includes the iam.serviceAccounts.getAccessToken permission for the service account or accounts. The roles/iam.serviceAccountTokenCreator role has the iam.serviceAccounts.getAccessToken permission. You can also create a custom role.

You can specify a list of service accounts, separated with commas. This creates an impersonation delegation chain in which each service account delegates its permissions to the next service account in the chain. Each service account in the list must have the roles/iam.serviceAccountTokenCreator role on the next service account in the list.

For example, when --impersonate-service-account=
SERVICE_ACCOUNT_1,SERVICE_ACCOUNT_2, the active account must have the roles/iam.serviceAccountTokenCreator role on SERVICE_ACCOUNT_1, which must have the roles/iam.serviceAccountTokenCreator role on SERVICE_ACCOUNT_2.

SERVICE_ACCOUNT_1 is the impersonated service account and SERVICE_ACCOUNT_2 is the delegate.

Overrides the default auth/impersonate_service_account property value for this command invocation.

--log-http Log all HTTP server requests and responses to stderr. Overrides the default core/log_http property value for this command invocation.

--trace-token=TRACE_TOKEN
Token used to route traces of service requests for investigation of issues. Overrides the default core/trace_token property value for this command invocation.

--user-output-enabled
(DEPRECATED) Print user intended output to the console.

The --user-output-enabled flag will no longer support the explicit use of the true/false optional value in an upcoming release.

GROUPS
GROUP is one of the following:
access-approval (/sdk/gcloud/reference/access-approval)
Manage Access Approval requests and settings.

access-context-manager (/sdk/gcloud/reference/access-context-manager)
Manage Access Context Manager resources.

active-directory (/sdk/gcloud/reference/active-directory)
Manage Managed Microsoft AD resources.

ai (/sdk/gcloud/reference/ai)
Manage entities in Vertex AI.

ai-platform (/sdk/gcloud/reference/ai-platform)
Manage AI Platform jobs and models.

alloydb (/sdk/gcloud/reference/alloydb)
Create and manage AlloyDB databases.

alpha (/sdk/gcloud/reference/alpha)
(ALPHA) Alpha versions of gcloud commands.

anthos (/sdk/gcloud/reference/anthos)
Anthos command Group.

api-gateway (/sdk/gcloud/reference/api-gateway)
Manage Cloud API Gateway resources.

apigee (/sdk/gcloud/reference/apigee)
Manage Apigee resources.

app (/sdk/gcloud/reference/app)
Manage your App Engine deployments.

apphub (/sdk/gcloud/reference/apphub)
Manage App Hub resources.

artifacts (/sdk/gcloud/reference/artifacts)
Manage Artifact Registry resources.

asset (/sdk/gcloud/reference/asset)
Manage the Cloud Asset Inventory.

assured (/sdk/gcloud/reference/assured)
Read and manipulate Assured Workloads data controls.

auth (/sdk/gcloud/reference/auth)
Manage oauth2 credentials for the Google Cloud CLI.

backup-dr (/sdk/gcloud/reference/backup-dr)
Manage Backup and DR resources.

batch (/sdk/gcloud/reference/batch)
Manage Batch resources.

beta (/sdk/gcloud/reference/beta)
(BETA) Beta versions of gcloud commands.

bigtable (/sdk/gcloud/reference/bigtable)
Manage your Cloud Bigtable storage.

billing (/sdk/gcloud/reference/billing)
Manage billing accounts and associate them with projects.

bms (/sdk/gcloud/reference/bms)
Manage Bare Metal Solution resources.

builds (/sdk/gcloud/reference/builds)
Create and manage builds for Google Cloud Build.

certificate-manager (/sdk/gcloud/reference/certificate-manager)
Manage SSL certificates for your Google Cloud projects.

cloud-shell (/sdk/gcloud/reference/cloud-shell)
Manage Google Cloud Shell.

components (/sdk/gcloud/reference/components)
List, install, update, or remove Google Cloud CLI components.

composer (/sdk/gcloud/reference/composer)
Create and manage Cloud Composer Environments.

compute (/sdk/gcloud/reference/compute)
Create and manipulate Compute Engine resources.

config (/sdk/gcloud/reference/config)
View and edit Google Cloud CLI properties.

container (/sdk/gcloud/reference/container)
Deploy and manage clusters of machines for running containers.

data-catalog (/sdk/gcloud/reference/data-catalog)
Manage Data Catalog resources.

database-migration (/sdk/gcloud/reference/database-migration)
Manage Database Migration Service resources.

dataflow (/sdk/gcloud/reference/dataflow)
Manage Google Cloud Dataflow resources.

dataplex (/sdk/gcloud/reference/dataplex)
Manage Dataplex resources.

dataproc (/sdk/gcloud/reference/dataproc)
Create and manage Google Cloud Dataproc clusters and jobs.

datastore (/sdk/gcloud/reference/datastore)
Manage your Cloud Datastore resources.

datastream (/sdk/gcloud/reference/datastream)
Manage Cloud Datastream resources.

deploy (/sdk/gcloud/reference/deploy)
Create and manage Cloud Deploy resources.

deployment-manager (/sdk/gcloud/reference/deployment-manager)
Manage deployments of cloud resources.

dns (/sdk/gcloud/reference/dns)
Manage your Cloud DNS managed-zones and record-sets.

domains (/sdk/gcloud/reference/domains)
Manage domains for your Google Cloud projects.

edge-cache (/sdk/gcloud/reference/edge-cache)
Manage Media CDN resources.

edge-cloud (/sdk/gcloud/reference/edge-cloud)
Manage edge-cloud resources.

emulators (/sdk/gcloud/reference/emulators)
Set up your local development environment using emulators.

endpoints (/sdk/gcloud/reference/endpoints)
Create, enable and manage API services.

essential-contacts (/sdk/gcloud/reference/essential-contacts)
Manage Essential Contacts.

eventarc (/sdk/gcloud/reference/eventarc)
Manage Eventarc resources.

filestore (/sdk/gcloud/reference/filestore)
Create and manipulate Filestore resources.

firebase (/sdk/gcloud/reference/firebase)
Work with Google Firebase.

firestore (/sdk/gcloud/reference/firestore)
Manage your Cloud Firestore resources.

functions (/sdk/gcloud/reference/functions)
Manage Google Cloud Functions.

healthcare (/sdk/gcloud/reference/healthcare)
Manage Cloud Healthcare resources.

iam (/sdk/gcloud/reference/iam)
Manage IAM service accounts and keys.

iap (/sdk/gcloud/reference/iap)
Manage IAP policies.

identity (/sdk/gcloud/reference/identity)
Manage Cloud Identity Groups and Memberships resources.

ids (/sdk/gcloud/reference/ids)
Manage Cloud IDS.

immersive-stream (/sdk/gcloud/reference/immersive-stream)
Manage Immersive Stream resources.

infra-manager (/sdk/gcloud/reference/infra-manager)
Manage Infra Manager resources.

kms (/sdk/gcloud/reference/kms)
Manage cryptographic keys in the cloud.

logging (/sdk/gcloud/reference/logging)
Manage Cloud Logging.

looker (/sdk/gcloud/reference/looker)
Manage Looker resources.

memcache (/sdk/gcloud/reference/memcache)
Manage Cloud Memorystore Memcached resources.

metastore (/sdk/gcloud/reference/metastore)
Manage Dataproc Metastore resources.

ml (/sdk/gcloud/reference/ml)
Use Google Cloud machine learning capabilities.

ml-engine (/sdk/gcloud/reference/ml-engine)
Manage AI Platform jobs and models.

monitoring (/sdk/gcloud/reference/monitoring)
Manage Cloud Monitoring dashboards.

netapp (/sdk/gcloud/reference/netapp)
Create and manipulate Cloud NetApp Files resources.

network-connectivity (/sdk/gcloud/reference/network-connectivity)
Manage Network Connectivity Center resources.

network-management (/sdk/gcloud/reference/network-management)
Manage Network Management resources.

network-security (/sdk/gcloud/reference/network-security)
Manage Network Security resources.

network-services (/sdk/gcloud/reference/network-services)
Manage Network Services resources.

notebooks (/sdk/gcloud/reference/notebooks)
Notebooks Command Group.

org-policies (/sdk/gcloud/reference/org-policies)
Create and manage Organization Policies.

organizations (/sdk/gcloud/reference/organizations)
Create and manage Google Cloud Platform Organizations.

policy-intelligence (/sdk/gcloud/reference/policy-intelligence)
A platform to help better understand, use and manage policies at scale.

policy-troubleshoot (/sdk/gcloud/reference/policy-troubleshoot)
Troubleshoot Google Cloud Platform policies.

privateca (/sdk/gcloud/reference/privateca)
Manage private Certificate Authorities on Google Cloud.

projects (/sdk/gcloud/reference/projects)
Create and manage project access policies.

publicca (/sdk/gcloud/reference/publicca)
Manage accounts for Google Trust Services' Certificate Authority.

pubsub (/sdk/gcloud/reference/pubsub)
Manage Cloud Pub/Sub topics, subscriptions, and snapshots.

recaptcha (/sdk/gcloud/reference/recaptcha)
Manage reCAPTCHA Enterprise Keys.

recommender (/sdk/gcloud/reference/recommender)
Manage Cloud recommendations and recommendation rules.

redis (/sdk/gcloud/reference/redis)
Manage Cloud Memorystore Redis resources.

resource-manager (/sdk/gcloud/reference/resource-manager)
Manage Cloud Resources.

resource-settings (/sdk/gcloud/reference/resource-settings)
Create and manage Resource Settings.

run (/sdk/gcloud/reference/run)
Manage your Cloud Run applications.

scc (/sdk/gcloud/reference/scc)
Manage Cloud SCC resources.

scheduler (/sdk/gcloud/reference/scheduler)
Manage Cloud Scheduler jobs and schedules.

secrets (/sdk/gcloud/reference/secrets)
Manage secrets on Google Cloud.

service-directory (/sdk/gcloud/reference/service-directory)
Command groups for Service Directory.

service-extensions (/sdk/gcloud/reference/service-extensions)
Manage Service Extensions resources.

services (/sdk/gcloud/reference/services)
List, enable and disable APIs and services.

source (/sdk/gcloud/reference/source)
Cloud git repository commands.

spanner (/sdk/gcloud/reference/spanner)
Command groups for Cloud Spanner.

sql (/sdk/gcloud/reference/sql)
Create and manage Google Cloud SQL databases.

storage (/sdk/gcloud/reference/storage)
Create and manage Cloud Storage buckets and objects.

tasks (/sdk/gcloud/reference/tasks)
Manage Cloud Tasks queues and tasks.

telco-automation (/sdk/gcloud/reference/telco-automation)
Manage Telco Automation resources.

topic (/sdk/gcloud/reference/topic)
gcloud supplementary help.

transcoder (/sdk/gcloud/reference/transcoder)
Manage Transcoder jobs and job templates.

transfer (/sdk/gcloud/reference/transfer)
Manage Transfer Service jobs, operations, and agents.

vmware (/sdk/gcloud/reference/vmware)
Manage Google Cloud VMware Engine resources.

workbench (/sdk/gcloud/reference/workbench)
Workbench Command Group.

workflows (/sdk/gcloud/reference/workflows)
Manage your Cloud Workflows resources.

workspace-add-ons (/sdk/gcloud/reference/workspace-add-ons)
Manage Google Workspace Add-ons resources.

workstations (/sdk/gcloud/reference/workstations)
Manage Cloud Workstations resources.

COMMANDS
COMMAND is one of the following:
cheat-sheet (/sdk/gcloud/reference/cheat-sheet)
Display gcloud cheat sheet.

docker (/sdk/gcloud/reference/docker)
(DEPRECATED) Enable Docker CLI access to Google Container Registry.

feedback (/sdk/gcloud/reference/feedback)
Provide feedback to the Google Cloud CLI team.

help (/sdk/gcloud/reference)
Search gcloud help text.

info (/sdk/gcloud/reference/info)
Display information about the current gcloud environment.

init (/sdk/gcloud/reference/init)
Initialize or reinitialize gcloud.

survey (/sdk/gcloud/reference/survey)
Invoke a customer satisfaction survey for Google Cloud CLI.

version (/sdk/gcloud/reference/version)
Print version information for Google Cloud CLI components.

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License
 (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies
 (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-04-23 UTC.