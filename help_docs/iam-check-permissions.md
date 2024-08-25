<p><a target="_blank" href="https://app.eraser.io/workspace/rtEtNb3IPLi3LqrrMx0H" id="edit-in-eraser-github-link"><img alt="Edit in Eraser" src="https://firebasestorage.googleapis.com/v0/b/second-petal-295822.appspot.com/o/images%2Fgithub%2FOpen%20in%20Eraser.svg?alt=media&amp;token=968381c8-a7e7-472a-8ed6-4a6626da5501"></a></p>

# README

## Overview

This script retrieves all roles and permissions in a Google Cloud project, checks for permissions that are non-applicable at the project level, and outputs the results to a results.csv file.

## Dependencies

To run this script, you need the following dependencies:

--- Python 3 --- google-api-python-client --- oauth2client ---

You can install these dependencies using pip:

`pip install google-api-python-client oauth2client`

## Script Functionality

1. Retrieve all roles. The script retrieves all roles defined in the Google Cloud project. `def get_all_roles()`
2. Get role details. For each role, the script fetches detailed information including the permissions included in each role. `def get_role_details(role_name)`
3. Retrieve all permissions. The script retrieves all testable permissions available in the Google Cloud project. `def get_permissions_for_roles(roles)`
4. Check non-applicable permissions. The script compares the permissions of each role against the list of testable permissions to identify non-applicable permissions. `def get_all_permissions(project_id, test_permissions)`  `def check_non_applicable_permissions(project_id)`
5. Output results. The script outputs the roles and their non-applicable permissions to a results.csv file. `def write_results_to_csv(results)`
   =======
6. Retrieve all roles. The script retrieves all roles defined in the Google Cloud project.

   `def get_all_roles()`

7. Get role details. For each role, the script fetches detailed information including the permissions included in each role.

   `def get_role_details(role_name)`

8. Retrieve all permissions. The script retrieves all testable permissions available in the Google Cloud project.

   `def get_permissions_for_roles(roles)`

9. Check non-applicable permissions. The script compares the permissions of each role against the list of testable permissions to identify non-applicable permissions.

   `def get_all_permissions(project_id, test_permissions)`

   `def check_non_applicable_permissions(project_id)`

10. Output results. The script outputs the roles and their non-applicable permissions to a results.csv file.

   `def write_results_to_csv(results)`

## Instructions

1. Set Up Google Cloud SDK. Ensure you have the Google Cloud SDK installed. If not, download and install it from [﻿Google Cloud SDK](https://cloud.google.com/sdk/docs/install) .
2. Authenticate with Google Cloud. Authenticate your Google Cloud account using the following command: `gcloud auth application-default login`
3. Set the Project ID. Set the environment variable PROJECT_ID to your Google Cloud project ID: `export PROJECT_ID="your-project-id"`
4. Install Dependencies. Ensure you have the required Python packages installed. `pip install google-api-python-client oauth2client`
5. Run the Script. Execute the script using Python: `check_all_non_applicable_permissions.py`

---

## Proposal: Streamlining IAM Permission Analysis with Batch Processing and Configuration

**Problem:** Analyzing IAM roles and permissions in a Google Cloud project can be slow due to numerous API calls for individual permissions.

**Solution:**

1. **Batch Processing:** Group permissions into batches and retrieve them in a single API call (using `queryTestablePermissions`  with `pageSize` ).
2. **Configuration Management:** Store project ID and batch size in a YAML file (`config.yaml` ) for easy modification.
   **Main Concepts:**

- **Batch Processing:** Reduce the number of API calls by retrieving multiple permissions at once.
- **Configuration Management:** Separate configuration values (e.g., project ID, batch size) from the code for easier maintainability.
- **YAML:** Use YAML to store configuration for simple readability and flexibility.
   **Key Benefits:**
- **Improved Performance:** Significantly faster execution due to fewer API calls.
- **Enhanced Maintainability:** Configuration changes are isolated in the YAML file, simplifying code modifications.
   **Code Snippet:**

```python {"id":"01HZS0F1F2QCCVTTJW7BVKYHXG"}
# ... (Other functions: get_all_roles, get_role_details, get_permissions_for_roles, check_non_applicable_permissions, write_results_to_csv remain the same)

def get_all_permissions(project_id, test_permissions):
    credentials = GoogleCredentials.get_application_default()
    service = discovery.build('iam', 'v1', credentials=credentials)

    permissions = []
    total_permissions_count = 0

    with open('config.yaml', 'r') as config_file:
        config = yaml.safe_load(config_file)
        batch_size = config['batch_size']

    # Loop through all testable permissions in batches
    for i in range(0, len(test_permissions), batch_size):
        batch = test_permissions[i:i+batch_size]
        request = service.permissions().queryTestablePermissions(
            body={'fullResourceName': f'//cloudresourcemanager.googleapis.com/projects/{project_id}', 'pageSize': batch_size})
        response = request.execute()
        permissions.extend(response.get('permissions', []))
        total_permissions_count += len(response.get('permissions', []))
        print_with_timestamp(f"Cumulative permissions count: {total_permissions_count}")

    print_with_timestamp(f"Retrieved {total_permissions_count} total permissions")
    return permissions

def main():
    start_time = datetime.datetime.now()
    print_with_timestamp("Script started")

    with open('config.yaml', 'r') as config_file:
        config = yaml.safe_load(config_file)
        project_id = config['project_id']

    results = check_non_applicable_permissions(project_id)
    write_results_to_csv(results)

    end_time = datetime.datetime.now()
    print_with_timestamp("Script finished")
    print(f"Total run time: {end_time - start_time}")

if __name__ == "__main__":
    main()
```

**config.yaml:**

```yaml {"id":"01HZS0F1F2QCCVTTJW7C9VJP8E"}
project_id: your-project-id
batch_size: 500
```

## Diagrams

1. Set Up Google Cloud SDK. Ensure you have the Google Cloud SDK installed. If not, download and install it from [Google Cloud SDK](https://cloud.google.com/sdk/docs/install).
2. Authenticate with Google Cloud. Authenticate your Google Cloud account using the following command:

   `gcloud auth application-default login`

3. Set the Project ID. Set the environment variable PROJECT_ID to your Google Cloud project ID:

   `export PROJECT_ID="your-project-id"`

4. Install Dependencies. Ensure you have the required Python packages installed.

   `pip install google-api-python-client oauth2client`

5. Run the Script. Execute the script using Python:

   `check_all_non_applicable_permissions.py`

> > > > > > > 02fbbcf (scripts)
