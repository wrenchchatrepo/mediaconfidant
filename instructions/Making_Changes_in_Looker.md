# Instructions for Michael to Make Changes Through the Looker IDE

## Use Case: Modifying LookML in the /foo_project/models/foo.model File

### 1. Make Changes in Looker IDE:

+ Open the Looker IDE: Navigate to your Looker instance and access the IDE.
+ Find the File: In the Looker IDE, navigate to /foo_project/models/ and open the foo.model file.
+ Edit the File: Make the necessary changes to the LookML code within the foo.model file.

### 2. Save and Commit the Changes in Looker IDE:

+ Save Your Changes: After editing the file, click the “Save” button to store your changes in the Looker IDE.
+ Commit Your Changes: Looker will prompt you to commit your changes. Provide a meaningful commit message (e.g., “Updated LookML in foo.model”).
+ Push Changes to GitHub: After committing, push the changes. This will update your GitHub branch dev-michael-strachan-hzjw with the changes from the Looker IDE.

### 3. GitHub Action - Validate and Deploy:

+ Automatic Validation: Once you push your changes, a GitHub Action will automatically validate the LookML syntax and check for errors.
+ Deployment: If the validation passes, the GitHub Action will deploy the changes to the master branch of the repository (according to the rules you’ve set for the Looker environment).

### 4. Master vs. Main Branches - Organization and Backup Strategy:

+ Master Branch: The master branch is dedicated to Looker, Dataform, and BigQuery-related changes. Any changes you make in Looker will be pushed to master, ensuring that the core data-related processes are well-maintained and organized.
+ Main Branch: The main branch is used for everything else. It serves as the default branch for the overall project, but changes related to Looker, Dataform, and BigQuery should only go to master. This separation keeps the repository organized and prevents conflicts between data-related processes and other project components.

**Daily Backups:**

+ A GitHub Action runs daily at 0400 UTC to back up both master and main branches. This action pulls changes from master and main into master_backup, ensuring that your critical data processes are securely backed up. This automated process reduces the risk of data loss and keeps your project safe.

### 5. Review and Merge:

+ Create a Pull Request (PR): If necessary, create a pull request from dev-michael-strachan-hzjw to master to review and merge your changes. This can be done directly in GitHub without needing to use VSCode.
+ Merge the PR: Once the PR is approved and all checks pass, merge it into master.

GitHub Action: After merging, a GitHub Action will automatically sync your changes with the main branch and ensure that everything is up-to-date.

### 6. Confirmation:

+ Check for Success: Confirm that the changes are deployed successfully in Looker by testing the functionality in the Looker platform. You don’t need to interact with VSCode or other tools, as the GitHub Actions handle everything automatically.

By following these steps, you’ll keep the LookML, Dataform, and BigQuery-related changes in the master branch while maintaining a clean and organized workflow. The daily backups ensure your work is protected, and the separation of concerns between master and main helps prevent conflicts and makes it easier to manage the project over time.