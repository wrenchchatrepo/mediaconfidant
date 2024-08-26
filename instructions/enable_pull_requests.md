# Objective: Enable Pull Requests (PRs) so they are required for new developers but optional for existing developers, allowing them to deploy without a PR.

## Steps:

### 1. Project Setup:
In Development Mode, go to Develop > Projects.
Select your project.
On the left navigation, choose Settings.
### 2. Under GitHub Integration, select Pull Requests Recommended. This makes PRs the default, but allows bypassing them with specific permissions.
Save the project settings.
User Creation (if needed):
Go to Admin > Users.
If the new developer user doesn't exist, create it.
### 3. Group Creation:
Go to Admin > Groups.
Create a new group named "new_devs".
### 4. Model Set Creation (Optional):
Go to Admin > Roles.
If you need to restrict model access for new developers, create a new Model Set and select the relevant models.
### 5. Crucial Permission Set:
On the Admin > Roles page, click New Permission Set.
Give it a descriptive name (e.g., "New Developer").
Important: In the permissions, find the develop permission.
Uncheck the deploy child permission under develop. This prevents users with this permission set from deploying directly. (You can uncheck the parent develop entirely if no development access is needed).
Select the Model Set (if created) and the "new_devs" Group to apply this Permission Set. This means the "new_devs" group will have access to the specified Model Set and operate under the "New Developer" Permission Set.
Add the new developer User to the "new_devs" group. The user, as a member of the group, inherits these permissions.
### 6. PR Approvals:
Existing developers with "Develop" permission (and the deploy permission enabled) will be able to approve PRs from the new developers.
Alternatively, you can create a separate role with develop and deploy permissions specifically for PR approvers and assign it to the relevant users.