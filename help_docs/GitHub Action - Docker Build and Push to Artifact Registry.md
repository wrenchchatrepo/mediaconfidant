joeyslalom / github-docker-artifact-registry.yaml Created 2 years ago - Report abuse Code Revisions 1 Stars 14 Forks 2 GitHub Action - docker build and push to Artifact Registry github-docker-artifact-registry.yaml 1 **\# 1. Create service account** 2 **\#. * Service Account Token Creator** 3 **\#. * Artifact Registry Writer**
4 **\# 2. Generate service account key**
8 **\# 3. Create repo in artifact repository** 9 **\#. * Name: $env.REPOSITORY below**
10 **\#. * Region: $env.GAR_LOCATION below** 11 12 **name: Docker build and push to Artifact Registry** 13 14 on: 15 push: 16 branches: 17 - main 18 - github-action 19 20 **env:** 25 21 PROJECT_ID: slalom-2020-293920 22 GAR_LOCATION: us-west1 23 REPOSITORY: reimagined-couscous 24 IMAGE: main 26 **jobs:** 27 login-build-push: 28 name: Docker login, build, and push 29 runs-on: ubuntu-latest 30 31 steps: 34 36 run: |37 docker build \ 35 - name: 'Docker build' 5 **\#. * In GitHub project -> Settings -> Secrets -> Actions -> New Repository Secret** 6 **\#. Name: GCP_CREDENTIALS** 7 **\#. Value: key.json contents**
33 uses: actions/checkout@v3 32 - name: Checkout 46 53 54 - name: 'Docker push' 55 run: |56 docker push "$GAR_LOCATION-docker.pkg.dev/$PROJECT_ID/$REPOSITORY/$IMAGE:$GITHUB_S
joeyslalom commented on Jun 30, 2022 Author corresponding tf:
resource "google_service_account" **"github"** {
account_id = **"github-docker-push"**
} resource "google_project_iam_member" **"github_token_creator"** {
project = **google_project.project.project_id** role = **"roles/iam.serviceAccountTokenCreator"**
member = **"serviceAccount:${google_service_account.github.email}"**
}
resource "google_project_iam_member" **"github_act_as"** {
project = **google_project.project.project_id**
role = **"roles/artifactregistry.writer"**
member = **"serviceAccount:${google_service_account.github.email}"**
} resource "google_artifact_registry_repository" **"resdna"** {
provider = **google-beta**
location = **var.default_region**
repository_id = **"resdna"**
format = **"DOCKER"** project = **google_project.project.project_id**
}
5/28/24, 10:08 PM GitHub Action - docker build and push to Artifact Registry 38 --tag "$GAR_LOCATION-docker.pkg.dev/$PROJECT_ID/$REPOSITORY/$IMAGE:$GITHUB_SHA" 39 app/
40 - id: 'auth' 41 name: 'Authenticate to Google Cloud' 42 uses: 'google-github-actions/auth@v0.6.0' 43 with: 44 credentials_json: '${{ secrets.GCP_CREDENTIALS }}' 45 token_format: 'access_token' 47 - uses: 'docker/login-action@v1' 48 name: 'Docker login' 49 with: 50 registry: '${{ env.GAR_LOCATION }}-docker.pkg.dev' 51 username: 'oauth2accesstoken' 52 password: '${{ steps.auth.outputs.access_token }}'