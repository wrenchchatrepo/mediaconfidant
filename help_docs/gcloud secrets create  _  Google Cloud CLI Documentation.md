# Gcloud Secrets Create

NAME
gcloud secrets create - create a new secret

## Synopsis

gcloud secrets create SECR (\#SECRE ET T) [--data-fi (\#--data- le file)=PATH]
[--labe (\#--labels) ls =[KEY=VALUE,…]] [--set-annotatio (\#--set-annotations) ns =[KEY=VALUE,…]] [--topi (\#--t cs opics)=[TOPICS,…]] [--version-destroy-t (\#--v tl ersion-destroy-ttl)=VERSION-DESTROY-TTL] [--expire-ti (\#--expir me e-time)=EXPIRE-TIME     | --t (\#--ttl) tl =TTL] [--next-rotation-ti (\#--next-r me otation-time)=NEXT_ROTATION_TIME --rotation-peri (\#--r od otation-period)=ROTATION_PERIOD] [--replication-policy-fi (\#--r le eplication-policy-file)=REPLICATION-POLICY-FILE     | --kms-key-na (\#--kms-k me ey-name)=KMS-KEY-NAME --locatio (\#--locations) ns =[LOCATION,…] --replication-poli (\#--r cy eplication-policy)=POLICY] [GCLOUD_WIDE_FLAG
 (\#GCLOUD-WIDE-FLAGS) …]

## Description

Create a secret with the given name and creates a secret version with the given data, if any. If a secret already exists with the given name, this command will return an error.

## Examples

Create a secret with an automatic replication policy without creating any versions:
$    
Create a new secret named 'my-secret' with an automatic replication policy and data from a file:
$     --data-file=/tmp/secret Create a new secret named 'my-secret' in 'us-central1' with data from a file:
$ gcloud secrets create my-secret --data-file=/tmp/secret --replication-policy=user-managed --locations=us-central1 Create a new secret named 'my-secret' in 'us-central1' and 'us-east1' with the value "s3cr3t":
$ printf "s3cr3t" | gcloud secrets create my-secret --data-file=- --replication-policy=user-managed --locations=us-central1,us-east1 Create a new secret named 'my-secret' in 'us-central1' and 'us-east1' with the value "s3cr3t" in PowerShell (Note: PowerShell will add a newline to the resulting secret):
$ Write-Output "s3cr3t" | gcloud secrets create my-secret --data-file=- --replication-policy=user-managed --locations=us-central1,us-east1 Create a secret with an automatic replication policy and a next rotation time:
$ gcloud secrets create my-secret --next-rotation-time="2030-0101T15:30:00-05:00" Create a secret with an automatic replication policy and a rotation period:
$     --next-rotation-time="2030-0101T15:30:00-05:00" --rotation-period="7200s" Create a secret with delayed secret version destroy enabled:
$     --version-destroy-ttl="86400s"

## Positional Arguments

Secret resource - The secret to create. This represents a Cloud resource. (NOTE) Some attributes are not given arguments in this group but can be set in other ways. To set the project attribute:
provide the argument SECRET on the command line with a fully specified name; provide the argument --project on the command line; set the property core/project.

This must be specified.

SECRET

ID of the secret or fully qualified identifier for the secret. To set the secret attribute:
provide the argument SECRET on the command line.

## Flags

--data-file=PATH
File path from which to read secret data. Set this to "-" to read the secret data from stdin.

--labels=[KEY=VALUE,…]
List of label KEY=VALUE pairs to add. Keys must start with a lowercase character and contain only hyphens (-), underscores (_), lowercase characters, and numbers. Values must contain only hyphens (-), underscores (_), lowercase characters, and numbers.

Annotations --set-annotations=[KEY=VALUE,…]
List of key-value pairs to set as Annotations. All existing Annotations will be removed first.

--topics=[TOPICS,…]
List of Pub/Sub topics to configure on the secret.

--version-destroy-ttl=VERSION-DESTROY-TTL
Secret Version Time To Live (TTL) after destruction request. For secret with TTL>0, version destruction does not happen immediately on calling destroy; instead, the version goes to a disabled state and destruction happens after the TTL expires. See $ gcloud topic datetimes (/sdk/gcloud/reference/topic/datetimes) for information on duration formats.

Expiration. At most one of these can be specified: --expire-time=EXPIRE-TIME
Timestamp at which to automatically delete the secret.

--ttl=TTL
Duration of time (in seconds) from the running of the command until the secret is automatically deleted.

Rotation. --next-rotation-time=NEXT_ROTATION_TIME
Timestamp at which to send rotation notification.

--rotation-period=ROTATION_PERIOD
Duration of time (in seconds) between rotation notifications.

Replication policy. At most one of these can be specified: --replication-policy-file=REPLICATION-POLICY-FILE
JSON or YAML file to use to read the replication policy. The file must conform to https://cloud.google.com/secretmanager/docs/reference/rest/v1/projects.secrets\#replication.Set
 (https://cloud.google.com/secretmanager/docs/reference/rest/v1/projects.secrets\#replication.Set)
this to "-" to read from stdin.

Inline replication arguments. --kms-key-name=KMS-KEY-NAME
Global KMS key with which to encrypt and decrypt the secret. Only valid for secrets with an automatic replication policy.

--locations=[LOCATION,…]
Comma-separated list of locations in which the secret should be replicated.

--replication-policy=POLICY
The type of replication policy to apply to this secret. Allowed values are "automatic" and "user-managed". If user-managed then --locations must also be provided.

## Gcloud Wide Flags

These flags are available to all commands: --access-token-file (/sdk/gcloud/reference\#--access-token-file), --account (/sdk/gcloud/reference\#--account), -- billing-project (/sdk/gcloud/reference\#--billing-project), --configuration (/sdk/gcloud/reference\#--configuration), --flags-file (/sdk/gcloud/reference\#--flags-file), -- flatten (/sdk/gcloud/reference\#--flatten), --format (/sdk/gcloud/reference\#--format), --help (/sdk/gcloud/reference\#--help), --impersonate-service-account (/sdk/gcloud/reference\#--impersonate-service-account), --log-http (/sdk/gcloud/reference\#--log-http), --project (/sdk/gcloud/reference\#--project), --quiet (/sdk/gcloud/reference\#--quiet), --trace-token (/sdk/gcloud/reference\#--trace-token), --useroutput-enabled (/sdk/gcloud/reference\#--user-output-enabled), --verbosity (/sdk/gcloud/reference\#--verbosity). Run $ gcloud help (/sdk/gcloud/reference) for details.

NOTES
This variant is also available:
$  beta   (/sdk/gcloud/reference/beta/secrets/create)
Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-06-11 UTC.