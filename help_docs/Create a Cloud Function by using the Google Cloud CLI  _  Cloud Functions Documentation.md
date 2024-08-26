To simplify searches and improve your documentation experience, we're splitting the 1st gen and 2nd gen documentation into separate sets.

# Create A Cloud Function By Using The Google Cloud Cli

This page shows you how to create and deploy a 2nd gen Cloud Function using the Google Cloud CLI (/sdk/gcloud/reference/functions).

## Before You Begin

1. In the Google Cloud console, on the project selector page, select or create a Google Cloud project
 (/resource-manager/docs/creating-managing-projects).

star Note: If you don't plan to keep the resources that you create in this procedure, create a project instead of selecting an existing project. After you finish these steps, you can delete the project, removing all resources associated with the project.

Go to project selector (https://console.cloud.google.com/projectselector2/home/dashboard)
2. Make sure that billing is enabled for your Google Cloud project (/billing/docs/how-to/verify-billing-enabled\#console). 3. Enable the Cloud Functions, Cloud Build, Artifact Registry, Cloud Run, and Logging APIs.

Enable the APIs (https://console.cloud.google.com/flows/enableapi?apiid=cloudfunctions,cloudbuild.googleapis.com,artifactregistry.googleapis.com,run.go 4. Install (/sdk/docs/install) the Google Cloud CLI. 5. To initialize (/sdk/docs/initializing) the gcloud CLI, run the following command:
gcloud init star Need a command prompt? You can use the Google Cloud Shell (https://console.cloud.google.com/?cloudshell=true). The Google Cloud Shell is a command line environment that already includes the Google Cloud CLI, so you don't need to install it. The Google Cloud CLI also comes preinstalled on Google Compute Engine Virtual Machines.

6. Prepare your development environment.

Node.js  (\#node.js)Python  (\#python)Go
 (\#go)
Java  (\#java)C\#  (\#c)Ruby  (\#ruby)PHP  (\#php)
Go to the Go setup guide  (/go/docs/setup)

## Get The Sample Code

1. Clone the sample repository to your local machine:
Node.js  (\#node.js)Python  (\#python)Go
 (\#go)
Java C\# Ruby PHP 
git clone https://github.com/GoogleCloudPlatform/golang-samples.git Alternatively, you can download the sample  (https://github.com/GoogleCloudPlatform/golang-samples/archive/main.zip) as a zip file and extract it.

2. Change to the directory that contains the Cloud Functions sample code:
Node.js  (\#node.js)Python  (\#python)Go
 (\#go)
Java  (\#java)C\#  (\#c)Ruby  (\#ruby)PHP  (\#php)
cd golang-samples/functions/functionsv2/helloworld/
3. Take a look at the sample code:
Node.js  (\#node.js)Python  (\#python)Go
 (\#go)
Java  (\#java)C\#  (\#c)Ruby  (\#ruby)PHP  (\#php)
// Package helloworld provides a set of Cloud Functions samples. package helloworld import (
"fmt" "net/http" "github.com/GoogleCloudPlatform/functions-framework-go/functions"
) func init() {
functions.HTTP("HelloGet", helloGet)
} // helloGet is an HTTP Cloud Function. func helloGet(w http.ResponseWriter, r *http.Request) {
fmt.Fprint(w, "Hello, World!")
}

## Deploying The Function

To deploy the function with an HTTP trigger, run the following command in the directory that contains the sample code (or in the case of Java, the pom.xml file):
Node.js  (\#node.js)Python  (\#python)Go
 (\#go)
Java  (\#java)C\#  (\#c)Ruby  (\#ruby)PHP  (\#php)
gcloud functions deploy go-http-function \ --gen2 \ --runtime=go121 \ --region= \ --source=. \ --entry-point=HelloGet \ --trigger-http edit Use the --runtime (/sdk/gcloud/reference/functions/deploy\#--runtime) flag to specify the runtime ID of a supported Go version (/functions/docs/runtime-support\#go) to run your function.

You can optionally use the --allow-unauthenticated flag to reach the function without authentication (/functions/docs/securing/managing-access-iam\#allowing_unauthenticated_http_function_invocation). This is useful for testing, but we don't recommend using this setting in production unless you are creating a public API or website. Further, it might not work for you, depending on your corporate policy settings. See Authenticating for invocation (/functions/docs/securing/authenticating) for details on how to invoke a function that requires authentication.

Regions You must supply a region when you deploy a 2nd gen function (\#deploying_the_function). See Locations (/functions/docs/locations) for a list of available regions. Your gcloud CLI configuration has a default region associated with it, but you can use any supported region you like in the deploy command. To see the default region associated with your gcloud CLI configuration (/sdk/gcloud\#configurations), run:
gcloud config list You can change your default region as follows:
gcloud config set functions/region REGION
Note that even if you are deploying your function to your default region, you still must include the region in your deploy command line.

Triggering the function 1. When the function finishes deploying, take note of the uri property or find it using the following command:
Node.js  (\#node.js)Python  (\#python)Go
 (\#go)
Java  (\#java)C\#  (\#c)Ruby  (\#ruby)PHP  (\#php)
gcloud functions describe go-http-function --gen2 --region REGION edit --format="value(serviceConfig.uri)"
2. After editing the following command to use your own URI, run it to see a Hello World! message:
curl -m 70 -X POST \
-H "Authorization: Bearer $(gcloud auth print-identity-token)" \ -H "Content-Type: application/json" \ -d '{}'
URI edit

## Deleting The Cloud Function

To delete the Cloud Function you created in this tutorial, run the following command:
Node.js  (\#node.js)Python  (\#python)Go
 (\#go)
Java C\# Ruby PHP 
gcloud functions delete go-http-function --gen2 --region  edit You can also delete Cloud Functions from the Google Cloud console (https://console.cloud.google.com/functions/list).