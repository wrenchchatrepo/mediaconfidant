# Secret Manager Overview

This document explains the main Secret Manager concepts.

## Secrets Management And Key Management

Secret Manager lets you store, manage, and access secrets (\#secret) as binary blobs or text strings. With the appropriate permissions, you can view the contents of the secret. Secret Manager works well for storing configuration information such as database passwords, API keys, or TLS certificates needed by an application at runtime. A key management system, such as Cloud KMS (/kms), lets you manage cryptographic keys and to use them to encrypt or decrypt data. However, you cannot view, extract, or export the key material itself.

Similarly, you can use a key management system to encrypt sensitive data before transmitting it or storing it. You can then decrypt the sensitive data before using it. Using a key management system to protect a secret in this way is more complex and less efficient than using Secret Manager. Cloud KMS is designed to handle large encryption workloads, such as encrypting rows in a database or encrypting binary data such as images and files. You can also use Cloud KMS to perform other cryptographic operations such as signing and verification. To learn about limitations on payload sizes, resource quantities, and rate limiting, see Secret Manager quotas (/secret-manager/quotas).

## Secret

A secret is a project-global object that contains a collection of metadata and secret versions. The metadata can include replication locations, labels, annotations, and permissions. The secret versions store the actual secret data, such as an API key or credential.

## Version

A secret version stores the actual secret data, such as API keys, passwords, or certificates. You can address individual versions of a secret. You cannot modify a version, but you can delete it.

## Rotation

You rotate a secret by adding a new secret version to the secret. Any version of a given secret can be accessed, as long as that version is enabled. To prevent a secret version from being used, you can disable that version. You can also schedule a secret for rotation (/secret-manager/docs/secret-rotation).

# What'S Next

Learn how to create a secret (/secret-manager/docs/creating-and-accessing-secrets). Learn how to add a secret version (/secret-manager/docs/add-secret-version). Learn how to edit a secret (/secret-manager/docs/edit-secrets). Learn about quotas and limitations (/secret-manager/quotas). Learn about best practices (/secret-manager/docs/best-practices).

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies).

Java is a registered trademark of Oracle and/or its affiliates. Last updated 2024-05-31 UTC.