# Troubleshooting

This page describes troubleshooting methods for common errors you may encounter while using Cloud Storage.

See the Google Cloud Service Health Dashboard (https://status.cloud.google.com/summary) for information about incidents affecting Google Cloud services such as Cloud Storage.

## Logging Raw Requests

Important: Never share your credentials. When you print out HTTP protocol details, your authentication credentials, such as OAuth 2.0 tokens, are visible in the headers. If you need to post request or response details to a message board or need to supply them for troubleshooting, make sure that you sanitize or revoke any credentials that appear as part of the output.

When using tools such as gcloud or the Cloud Storage client libraries, much of the request and response information is handled by the tool. However, it is sometimes useful to see details to aid in troubleshooting or when posting questions to forums such as Stack Overflow (https://stackoverflow.com/questions/tagged/google-cloud-storage). Use the following instructions to return request and response headers for your tool:

```
Console
       
   (#console)
       Command line… Client libraries…

```

Viewing request and response information depends on the browser you're using to access the Google Cloud console. For the Google Chrome browser:
1. Click Chrome's **main menu** button (more_vert).

2. Select **More Tools**. 3. Click **Developer Tools**. 4. In the pane that appears, click the **Network** tab.

Adding custom headers Adding custom headers to requests is a common tool for debugging purposes, such as for enabling debug headers or for tracing a request. The following example shows how to set request headers for different Cloud Storage tools:

```
Command line
         
   (#command-line)
         Client libraries…
                    

```

Use the --additional-headers flag, which is available for most commands. For example:
gcloud storage objects describe gs://my-bucket/my-object --additional-heade Where HEADER_NAME and HEADER_VALUE define the header you are adding to the request.

Note: The --additional-headers flag is not available for all gcloud storage commands, such as commands working with IAM policies and buckets notifications commands.

## Star Accessing Buckets With A Cors Configuration

If you have set a CORS configuration on your bucket and notice that incoming requests from client browsers are failing, try the following troubleshooting steps:
1. Review the CORS configuration (/storage/docs/using-cors\#viewing-cors-bucket) on the target bucket. If there are multiple CORS configuration entries, make sure that the request values you use for troubleshooting map to values in a single CORS configuration entry.

2. When testing issuing a CORS request, check that you are not making a request to the storage.cloud.google.com endpoint, which doesn't allow CORS requests. For more information about supported endpoints for CORS, see Cloud Storage CORS support (/storage/docs/cross-origin\#server-side-support).

3. Review a request and response using the tool of your choice. In a Chrome browser, you can use the standard developer tools to see this information:
a. Click the Chrome menu (more_vert) on the browser toolbar.

b. Select More Tools > **Developer Tools**.

c. Click the **Network** tab.

d. From your application or command line, send the request.

e. In the pane displaying the network activity, locate the request.

f. In the **Name** column, click the name corresponding to the request.

g. Click the **Headers** tab to see the response headers, or the **Response** tab to see the content of the response.

If you don't see a request and response, it's possible that your browser has cached an earlier failed preflight request attempt. Clearing your browser's cache should also clear the preflight cache. If it doesn't, set the MaxAgeSec value in your CORS configuration to a lower value than the default value of 1800 (30 minutes), wait for however long the old MaxAgeSec was, then try the request again. This performs a new preflight request, which fetches the new CORS configuration and purges the cache entries. Once you have debugged your problem, raise MaxAgeSec back to a higher value to reduce the preflight traffic to your bucket.

4. Ensure that the request has an Origin header and that the header value matches at least one of the Origins values in the bucket's CORS configuration. Note that the scheme, host, and port of the values must match exactly. Some examples of acceptable matches are the following:
http://origin.example.com matches http://origin.example.com:80 (because 80 is the default HTTP port) but does not match https://origin.example.com, http://origin.example.com:8080, http://origin.example.com:5151, or http://sub.origin.example.com. https://example.com:443 matches https://example.com but not http://example.com or http://example.com:443. http://localhost:8080 only matches exactly http://localhost:8080 and does not match http://localhost:5555 or http://localhost.example.com:8080.

5. For simple requests, ensure that the HTTP method of the request matches at least one of the Methods values in the bucket's CORS configuration. For preflight requests, ensure that the method specified in Access-Control-Request-Method matches at least one of the Methods values.

6. For preflight requests, check if it includes one or more Access-Control-Request-
Header headers. If so, ensure that each Access-Control-Request-Header value matches a ResponseHeader value in the bucket's CORS configuration. All headers named in the Access-Control-Request-Header must be in the CORS configuration for the preflight request to succeed and include CORS headers in the response.

## Error Codes

The following are common HTTP status codes you may encounter.

301: Moved Permanently Issue: I'm setting up a static website (/storage/docs/hosting-static-website), and accessing a directory path returns an empty object and a 301 HTTP response code. Solution: If your browser downloads a zero byte object and you get a 301 HTTP response code when accessing a directory, such as http://www.example.com/dir/, your bucket most likely contains an empty object of that name. To check that this is the case and fix the issue:
1. In the Google Cloud console, go to the Cloud Storage **Buckets** page.

Go to Buckets (https://console.cloud.google.com/storage/browser)
2. Click the **Activate Cloud Shell** button at the top of the Google Cloud console.

3. Run gcloud storage ls --recursive gs://www.example.com/dir/. If the output includes http://www.example.com/dir/, you have an empty object at that location.

4. Remove the empty object with the command: gcloud storage rm gs://www.example.com/dir/
You can now access http://www.example.com/dir/ and have it return that directory's index.html file instead of the empty object.

400: Bad Request Issue: While performing a resumable upload (/storage/docs/resumable-uploads), I received this error and the message Failed to parse Content-Range header. Solution: The value you used in your Content-Range header is invalid. For example, Content- Range: */* is invalid and instead should be specified as Content-Range: bytes */*. If you receive this error, your current resumable upload is no longer active, and you must start a new resumable upload.

401: Unauthorized Issue: Requests to a public bucket directly, or using Cloud CDN, are failing with a HTTP 401: Unauthorized and an Authentication Required response. Solution: Check that your client, or any intermediate proxy, is not adding an Authorization header to requests to Cloud Storage. Any request with an Authorization header, even if empty, is validated as if it were an authentication attempt.

403: Account Disabled Issue: I tried to create a bucket but got a 403 Account Disabled error. Solution: This error indicates that you have not yet turned on billing for the associated project. For steps for enabling billing, see Enable billing for a project (/billing/docs/how-to/modify-project\#enable_billing_for_a_project). If billing is turned on and you continue to receive this error message, you can reach out to support (https://support.google.com/cloud/answer/6282346) with your project ID (/docs/overview\#projects) and a description of your problem.

## 403: Forbidden

Issue: I should have permission to access a certain bucket or object, but when I attempt to do so, I get a 403 - Forbidden error with a message that is similar to: example@email.com does not have storage.objects.get access to the Google Cloud Storage object. Solution: You are missing a IAM permission for the bucket or object that is required to complete the request. If you expect to be able to make the request but cannot, perform the following checks:
1. Is the grantee referenced in the error message the one you expected? If the error message refers to an unexpected email address or to "Anonymous caller", then your request is not using the credentials you intended. This could be because the tool you are using to make the request was set up with the credentials from another alias or entity, or it could be because the request is being made on your behalf by a service account (/storage/docs/projects\#service-accounts).

2. Is the permission referenced in the error message one thought you needed? If the permission is unexpected, it's likely because the tool you're using requires additional access in order to complete your request. For example, in order to bulk delete objects in a bucket, gcloud must first construct a list of objects in the bucket to delete. This portion of the bulk delete action requires the storage.objects.list permission, which might be surprising, given that the goal is object deletion, which normally requires only the storage.objects.delete permission. If this is the cause of your error message, make sure you're granted IAM roles (/storage/docs/access-control/iam-roles\#standard-roles) that have the additional necessary permissions.

3. Are you granted the IAM role on the intended resource or parent resource? For example, if you're granted the Storage Object Viewer role for a project and you're trying to download an object, make sure the object is in a bucket that's in the project; you might inadvertently have the Storage Object Viewer permission for a different project.

4. Is your permission to access a certain bucket or object given through a convenience value (/storage/docs/access-control/iam\#convenience-values)? The removal of access granted to a convenience value can cause previously enabled principals to lose access to resources. For example, say jane@example.com has the Owner (roles/owner) basic role for a project named my-example-project, and the project's IAM policy grants the Storage Object Creator (roles/storage.objectCreator) role to the convenience value projectOwner:my-example-project. This means that jane@example.com has the permissions associated with the Storage Object Creator role for buckets within myexample-project. If this grant gets removed, jane@example.com loses the permissions associated with the Storage Object Creator role. In such a scenario, you can regain access to the bucket or object by granting yourself the necessary bucket-level or object-level permissions required to perform the actions you need.

5. Is there an IAM Deny policy (/iam/docs/deny-overview) that prevents you from using certain permissions? You can contact your organization administrator to find out whether an IAM Deny policy has been put in place.

## 403: Forbidden

Issue: I am downloading my content from storage.cloud.google.com, and I receive a 403: Forbidden error when I use the browser to navigate to the object using the URL:
https://storage.cloud.google.com/BUCKET_NAME/OBJECT_NAME
Solution: Using storage.cloud.google.com to download objects is known as authenticated browser downloads (/storage/docs/request-endpoints\#cookieauth), which uses cookie-based authentication. If you have configured Data Access audit logs in Cloud Audit Logs (/storage/docs/audit-logging) to track access to objects, one of the restrictions (/storage/docs/audit-logging\#restrictions) of that feature is that authenticated browser downloads cannot be used to download a tracked object, unless one of the following applies:
The object is publicly readable The object is being accessed from the Google Cloud console Any other attempt to use an authenticated browser download results in a 403 response. This restriction exists to prevent phishing for Google IDs, which are used for cookie-based authentication. To avoid this issue, do one of the following:
Use direct API calls (/storage/docs/request-endpoints\#access_to_public_objects), which support unauthenticated downloads, instead of using authenticated browser downloads.

Disable the Cloud Storage Data Access audit logs (/logging/docs/audit/configure-data-access\#config-console-disable) that are tracking access to the affected objects. Be aware that Data Access audit logs are set at or above the project level and can be enabled simultaneously at multiple levels. Set exemptions (/logging/docs/audit/configure-data-access\#config-console-exempt) to exclude specific users from Data Access audit log tracking, which allows those users to perform authenticated browser downloads. Make affected objects publicly readable, by granting read permission to either allUsers or allAuthenticatedUsers. Data Access audit logs do not record access to public objects.

409: Conflict Issue: I tried to create a bucket but received the following error:
409 Conflict. Sorry, that name is not available. Please try a different one.

Solution: The bucket name you tried to use (e.g. gs://cats or gs://dogs) is already taken. Cloud Storage has a global namespace so you may not name a bucket with the same name as an existing bucket. Choose a name that is not being used.

412: Custom constraints violated Issue: My requests are being rejected with a 412 orgpolicy error. Issue: My requests are being rejected with a 412 Multiple constraints were violated error. Solution: Check with your security administrator team to see if the bucket to which you're sending requests is being affected by an organization policy that uses a custom constraint. Your bucket might also be affected by different organization policies that conflict with one another. For example, where one policy specifies that buckets must have the Standard storage class and another policy specifies that buckets must have the Coldline storage class.

429: Too Many Requests Issue: My requests are being rejected with a 429 Too Many Requests error. Solution: You are hitting a limit to the number of requests Cloud Storage allows for a given resource. See the Cloud Storage quotas (/storage/quotas) for a discussion of limits in Cloud Storage.

If your workload consists of 1000's of requests per second to a bucket, see Request rate and access distribution guidelines (/storage/docs/request-rate) for a discussion of best practices, including ramping up your workload gradually and avoiding sequential filenames. If your workload is potentially using 50 Gbps or more of network egress to specific locations, check your bandwidth usage (/storage/docs/bandwidth-usage\#bandwidth-monitoring) to ensure you're not encountering a bandwidth quota.

## Diagnosing Google Cloud Console Errors

Issue: When using the Google Cloud console to perform an operation, I get a generic error message. For example, I see an error message when trying to delete a bucket, but I don't see details for why the operation failed. Solution: Use the Google Cloud console's notifications to see detailed information about the failed operation:
1. Click the **Notifications** button (notifications) in the Google Cloud console header.

A drop-down displays the most recent operations performed by the Google Cloud console.

2. Click the item you want to find out more about.

A page opens up and displays detailed information about the operation.

3. Click each row to expand the detailed error information.

Issue: When using the Google Cloud console, I don't see a particular column displayed.

Solution: To see a particular column displayed in the Google Cloud console, click the **Column**
display options icon (view_column) and select the column you want displayed.

## Simulated Folders And Managed Folders

Issue: I deleted some objects in my bucket, and now the folder that contained them does not appear in the Google Cloud console. Solution: While the Google Cloud console displays your bucket's contents as if there was a directory structure, folders don't fundamentally exist (/storage/docs/objects\#namespace) in Cloud Storage. As a result, when you remove all objects with a common prefix from a bucket, the folder icon representing that group of objects no longer appears in the Google Cloud console. Issue: I can't create managed folders. Solution: To create managed folders (/storage/docs/creating-managing-managed-folders), make sure the following requirements are met:
You have an IAM role that contains the storage.managedfolders.create permission, such as the Storage Object Admin (roles/storage.objectAdmin) role. For instructions on granting roles, see Use IAM permissions (/storage/docs/access-control/using-iam-permissions). Uniform bucket-level access is enabled on the bucket (/storage/docs/using-uniform-bucket-level-access) in which you want to create managed folders. There are no IAM Conditions on the bucket or the project that use the bucket resource type (storage.googleapis.com/Bucket) or the object resource type (storage.googleapis.com/Object). If any bucket within a project has an IAM Condition that uses either of these resource types, managed folders cannot be created in any of the buckets within that project, even if the condition is later removed.

Issue: I can't disable uniform bucket-level access because there are managed folders in my bucket. Solution: Uniform bucket-level access cannot be disabled if there are managed folders (/storage/docs/managed-folders) in the bucket. To disable uniform bucket-level access, you'll need to first delete all managed folders (/storage/docs/creating-managing-managed-folders\#delete) in the bucket.

## Static Website Errors

The following are common issues that you may encounter when setting up a bucket to host a static website (/storage/docs/hosting-static-website).

HTTPS serving Issue: I want to serve my content over HTTPS without using a load balancer (/load-balancing/docs/https). Solution: You can serve static content through HTTPS using direct URIs such as https://storage.googleapis.com/my-bucket/my-object. For other options to serve your content through a custom domain over SSL, you can:
Use a third-party Content Delivery Network (/network-connectivity/docs/cdn-interconnect) with Cloud Storage. Serve your static website content from Firebase Hosting (https://firebase.google.com/docs/hosting/) instead of Cloud Storage.

Domain verification Issue: I can't verify my domain. Solution: Normally, the verification process in Search Console (https://www.google.com/webmasters/tools/) directs you to upload a file to your domain, but you may not have a way to do this without first having an associated bucket, which you can only create *after* you have performed domain verification. In this case, verify ownership using the **Domain name provider** verification method. See Ownership verification (/storage/docs/domain-name-verification\#verification) for steps to accomplish this. This verification can be done before the bucket is created.

Inaccessible page Issue: I get an Access denied error message for a web page served by my website. Solution: Check that the object is shared publicly. If it is not, see Making Data Public (/storage/docs/access-control/making-data-public) for instructions on how to do this. If you previously uploaded and shared an object, but then upload a new version of it, then you must reshare the object publicly. This is because the public permission is replaced with the new upload.

Permission update failed Issue: I get an error when I attempt to make my data public (/storage/docs/access-control/making-data-public). Solution: Make sure that you have the storage.buckets.setIamPolicy permission or the storage.objects.setIamPolicy permission. These permissions are granted, for example, in the Storage Admin (roles/storage.admin) role (/storage/docs/access-control/iam-roles\#standard-roles). If you have the storage.buckets.setIamPolicy permission or the storage.objects.setIamPolicy permission and you still get an error, your bucket might be subject to public access prevention (/storage/docs/public-access-prevention), which does not allow access to allUsers or allAuthenticatedUsers. Public access prevention might be set on the bucket directly, or it might be enforced through an organization policy (/storage/docs/org-policy-constraints\#public-access-prevention) that is set at a higher level.

Content download Issue: I am prompted to download my page's content, instead of being able to view it in my browser. Solution: If you specify a MainPageSuffix as an object that does not have a web content type, site visitors are prompted to download the content instead of being able to see served page content. To resolve this issue, update the Content-Type (/storage/docs/metadata\#content-type) metadata entry to a suitable value, such as text/html. For instructions, see Editing object metadata (/storage/docs/viewing-editing-metadata\#edit).

## Latency

The following are common latency issues you might encounter. In addition, the Google Cloud Service Health Dashboard (https://status.cloud.google.com/summary) provides information about incidents affecting Google Cloud services such as Cloud Storage.

Upload or download latency Issue: I'm seeing increased latency when uploading or downloading. Solution: Consider the following common causes of upload and download latency:
CPU or memory constraints: The affected environment's operating system should have tooling to measure local resource consumption such as CPU usage and memory usage. Disk IO constraints: The performance impact might be caused by local disk IO. Geographical distance: Performance can be impacted by the physical separation of your Cloud Storage bucket and affected environment, particularly in cross-continental cases.

Testing with a bucket located in the same region as your affected environment can identify the extent to which geographic separation is contributing to your latency.

If applicable, the affected environment's DNS resolver should use the EDNS(0) protocol (https://datatracker.ietf.org/doc/html/rfc6891) so that requests from the environment are routed through an appropriate Google Front End.

## Cli Or Client Library Latency

Issue: I'm seeing increased latency when accessing Cloud Storage with the Google Cloud CLI or one of the client libraries (/storage/docs/reference/libraries). Solution: The gcloud CLI and the client libraries automatically retry (/storage/docs/retry-strategy\#tools) requests when it's useful to do so, and this behavior can effectively increase latency as seen from the end user. Use the Cloud Monitoring metric storage.googleapis.com/api/request_count
 (/monitoring/api/metrics_gcp\#storage/api/request_count) to see if Cloud Storage is consistently serving a retryable response code, such as 429 or 5xx.

## Proxy Servers

Issue: I'm connecting through a proxy server. What do I need to do?

Solution: To access Cloud Storage through a proxy server, you must allow access to these domains:
accounts.google.com for creating OAuth2 authentication tokens oauth2.googleapis.com for performing OAuth2 token exchanges *.googleapis.com for storage requests If your proxy server or security policy doesn't support allowlisting by domain and instead only supports allowlisting by IP network block, we strongly recommend that you configure your proxy server for all Google IP address ranges. You can find the address ranges by querying WHOIS data at ARIN (http://whois.arin.net/rest/org/GOGL?showDetails=true). As a best practice, you should periodically review your proxy settings to ensure they match Google's IP addresses.

We don't recommend configuring your proxy with individual IP addresses you obtain from onetime lookups of oauth2.googleapis.com and storage.googleapis.com. Because Google services are exposed using DNS names that map to a large number of IP addresses that can change over time, configuring your proxy based on a one-time lookup may lead to failures to connect to Cloud Storage. If your requests are being routed through a proxy server, you may need to check with your network administrator to ensure that the Authorization header containing your credentials is not stripped out by the proxy. Without the Authorization header, your requests are rejected and you receive a MissingSecurityHeader error.

## Storage Insights Errors

Issue: My inventory report configuration is generating multiple inventory reports on a daily basis. Solution: If you have more than 1,000,000 objects in your bucket, multiple inventory reports can be generated as *shards*. An inventory report configuration generates one inventory report for every 1,000,000 objects in the bucket. For example, if you have a bucket with 3,500,000 objects, the inventory report configuration on the bucket will generate four inventory report shards per the frequency you specify, along with a manifest file (/storage/docs/insights/inventory-reports\#manifest-file) that contains the number of generated inventory report shards and their file names. Issue: Inventory reports aren't appearing in the destination bucket. Solution: If you've created an inventory report configuration and don't see inventory reports being generated in the destination bucket, check the following:
Make sure the start date specified in the inventory report configuration matches your expectation for when inventory reports should be generated. For instructions on how to specify a start date, see Create an inventory report configuration (/storage/docs/insights/using-inventory-reports\#create-report-config). View your inventory report history to check for failures and their root causes. To see your inventory report history, complete the following steps:
1. In the Google Cloud console, go to the Cloud Storage **Buckets** page.

Go to Buckets (https://console.cloud.google.com/storage/browser)
2. In the list of buckets, click the name of the source bucket that contains the inventory report configuration.

3. On the **Bucket details** page, click the **Inventory reports** tab. 4. In the list of inventory report configurations, click the UUID of the inventory report configuration that generated the reports you want to check.

5. Check for failures in the **Inventory report history** section. You can hold the pointer over **Help** (help) to get details about why a failure occurred.

Make sure the project-level service agent is granted the IAM roles required for reading and writing inventory reports. For instructions, see Grant required roles to the service agent (/storage/docs/insights/using-inventory-reports\#grant-permissions-to-service-account).

Issue: I'm seeing random delays with the generation of inventory reports. Solution: The interval of time between inventory reports being generated can vary. You might see a delay of up to one day.

## What'S Next

Learn about your support options (/support-hub). Find answers to additional questions in the Cloud Storage FAQ (/storage/docs/faq). Explore how Error Reporting (/error-reporting) can help you identify and understand your Cloud Storage errors.

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-05-02 UTC.