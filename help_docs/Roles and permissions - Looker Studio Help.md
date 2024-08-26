
## Roles And Permissions

Learn who can do what with reports and data sources.

Access to Looker Studio assets (reports and data sources) is based on the Google Cloud Identity and Access Management (IAM) system. With IAM, you manage access to Looker Studio assets by assigning users to a predefined role. A role is a collection of permissions that allows users to perform certain actions while preventing them from performing other actions. Learn more about IAM.

Tip: Roles and permissions don't govern who can actually see the data provided by a data source. This is governed by data credentials.

## Basic Roles

The following basic roles are available to all Looker Studio users. Basic roles apply to individual assets. For example, you can grant a user the **Editor** role on a particular report and the **Viewer** role on the data source that is added to that report.

| Role                                | General capabilities                                                                                                                                                              |
|-------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Viewer                              | Can view the report and interact with controls                                                                                                                                    |
| - • Can view the data source schema |                                                                                                                                                                                   |
| Editor                              | All the capabilities of the Viewer role, plus the following capabilities: - Can modify the report - Can modify the data source - Can share the report - Can share the data source |
| Owner                               | All the capabilities of the Editor role, plus the following capabilities: - Can delete the report or data source - Can make someone else the owner of the report or data source   |

See Role details for more granular capabilities.

## Team Workspace Roles

The following roles are available to users of Looker Studio Pro whose organization has a Google Cloud project linked through the Admin console. Team workspace roles are applied at the workspace level and govern access to the assets that are contained in that workspace.

| Role                                                 | General capabilities                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |               |
|------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------|
| Viewer                                               | Can view existing assets in the team                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | workspace     |
| - • Can view folders in the team                     | workspace                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |               |
| - Can view the team                                  | workspace Trash                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |               |
| Contributor                                          | All the capabilities of the Viewer role, plus the following capabilities: - Can edit existing assets in the team workspace - Can create new assets in the team workspace - Can create new folders in the team workspace - Can move assets to team workspaces and folders in team workspaces - Can view workspace members and roles - Can add editors and viewers directly to an asset inside a workspace - Can restore assets from the Trash - Can move assets from Sandbox/Owned by me to a team workspace |               |
| Content                                              | All the capabilities of the Contributor role, plus the following capabilities:                                                                                                                                                                                                                                                                                                                                                                                                                              |               |
| manager                                              | - Can add/remove contributors to/from                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | the workspace |
| - Can move assets in a team                          | workspace between folders that are located in the same                                                                                                                                                                                                                                                                                                                                                                                                                                                      |               |
| team                                                 | workspace                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |               |
| Can rename folders in the team                       | workspace                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |               |
| Can remove assets to the Trash                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |               |
| - •                                                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |               |
| Manager                                              | All the capabilities of the Content manager role, plus the following capabilities: - Can add/remove Contributors and Content managers to/from the workspace (Note: A workspace must have at least one Manager.) - Can change member access levels for a team workspace - Can move an asset from one folder in a team workspace to a folder in a different team                                                                                                                                              |               |
| workspace Can move assets out of a team              | workspace to Sandbox/Owned by me                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |               |
| Can permanently delete a folder in a team            | workspace                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |               |
| Can permanently delete an asset, a folder, or a team | workspace                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |               |
| - • -                                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |               |

## Role Details

The following tables show the granular capabilities of each role according to feature area.

Tip: To see individual IAM permissions, visit IAM permissions reference and search for **datastudio**.

Note that Looker Studio does not support custom roles.

| Capability                                              | Basic roles   | Team   | workspace roles   |             |         |         |    |    |    |    |    |    |    |    |
|---------------------------------------------------------|---------------|--------|-------------------|-------------|---------|---------|----|----|----|----|----|----|----|----|
| Viewer                                                  | Editor        | Owner  | Viewer            | Contributor | Content | Manager |    |    |    |    |    |    |    |    |
| manager                                                 |               |        |                   |             |         |         |    |    |    |    |    |    |    |    |
| Create the report                                       | ✔             |        | ✔                 |             | ✔       |         | ✔  |    |    |    |    |    |    |    |
| Remove the report                                       | ✔             |        | ✔                 |             | ✔       |         | ✔  |    | ✔  |    |    |    |    |    |
| (move to Trash) Restore from Trash                      | ✔             |        | ✔                 |             | ✔       |         | ✔  |    | ✔  |    |    |    |    |    |
| Delete the report                                       | ✔             |        | ✔                 |             |         |         |    |    |    |    |    |    |    |    |
| View the report                                         | ✔             |        | ✔                 |             | ✔       |         | ✔  |    | ✔  |    | ✔  |    | ✔  |    |
| Copy the report                                         | ✔             |        | ✔                 |             | ✔       |         | ✔  |    | ✔  |    | ✔  |    | ✔  |    |
| Download data from                                      | the           | ✔      |                   | ✔           |         | ✔       |    | ✔  |    | ✔  |    | ✔  |    |    |
| report Modify the report                                | ✔             |        | ✔                 |             | ✔       |         | ✔  |    | ✔  |    |    |    |    |    |
| Use data from                                           | added         | ✔      |                   | ✔           |         | ✔       |    | ✔  |    | ✔  |    | ✔  |    | ✔  |
| data sources Modify data from                           | added         | ✔      |                   | ✔           |         | ✔       |    | ✔  |    | ✔  |    |    |    |    |
| data sources                                            | ✔             |        | ✔                 |             | ✔       |         | ✔  |    | ✔  |    |    |    |    |    |
| sources Add and remove data                             | ✔             |        | ✔                 |             | ✔       |         | ✔  |    |    |    |    |    |    |    |
| Prevent report copying for viewers                      | ✔             |        | ✔                 |             | ✔       |         | ✔  |    |    |    |    |    |    |    |
| for viewers Prevent report sharing                      | ✔             |        | ✔                 |             | ✔       |         | ✔  |    |    |    |    |    |    |    |
| Prevent downloading data for viewers Transfer ownership | ✔             |        | n/a               | n/a         | n/a     | n/a     |    |    |    |    |    |    |    |    |

Note: The role capabilities listed previously refer specifically to reusable data sources. For embedded data sources, people with the Editor role on the report can view and modify the data source.

| Capability                                         | Basic roles   | Team   | workspace roles   |             |         |         |    |    |    |    |    |    |    |
|----------------------------------------------------|---------------|--------|-------------------|-------------|---------|---------|----|----|----|----|----|----|----|
| Viewer                                             | Editor        | Owner  | Viewer            | Contributor | Content | Manager |    |    |    |    |    |    |    |
| manager                                            |               |        |                   |             |         |         |    |    |    |    |    |    |    |
| ✔                                                  |               | ✔      |                   | ✔           |         | ✔       |    | ✔  |    | ✔  |    | ✔  |    |
| Add the data source to reports                     | ✔             |        | ✔                 |             | ✔       |         | ✔  |    | ✔  |    | ✔  |    | ✔  |
| schema View the data source Modify the data source | ✔             |        | ✔                 |             | ✔       |         | ✔  |    | ✔  |    |    |    |    |
| Copy the data source                               | ✔             |        | ✔                 |             | ✔       |         | ✔  |    | ✔  |    | ✔  |    | ✔  |
| Remove the data                                    | ✔             |        | ✔                 |             | ✔       |         | ✔  |    |    |    |    |    |    |
| source (move to Trash) Restore from Trash          | ✔             |        | ✔                 |             | ✔       |         | ✔  |    | ✔  |    |    |    |    |
| Permanently delete                                 | ✔             |        | ✔                 |             |         |         |    |    |    |    |    |    |    |
| the data source Change data source                 | ✔             |        | ✔                 |             | ✔       |         | ✔  |    | ✔  |    |    |    |    |
| credentials Prevent data source                    | ✔             |        | ✔                 |             | ✔       |         | ✔  |    | ✔  |    |    |    |    |
| copying Transfer ownership                         | ✔             |        | n/a               | n/a         | n/a     | n/a     |    |    |    |    |    |    |    |

## Feature Area: Sharing

These capabilities apply to both reports and data sources, unless otherwise specified.

| Capability               | Basic roles   | Team   | workspace roles   |             |         |         |    |    |
|--------------------------|---------------|--------|-------------------|-------------|---------|---------|----|----|
| Viewer                   | Editor        | Owner  | Viewer            | Contributor | Content | Manager |    |    |
| manager                  |               |        |                   |             |         |         |    |    |
| Share the asset directly | ✔             |        | ✔                 |             | ✔       |         | ✔  | ✔  |
| Stop sharing the asset   | ✔             |        | ✔                 |             | ✔       |         | ✔  | ✔  |
| directly Create and edit | ✔             |        | ✔                 |             | ✔       |         | ✔  | ✔  |
| schedules on reports     |               |        |                   |             |         |         |    |    |

Note: Viewers can also create and edit schedules if they are granted scheduling permissions by an Editor or Owner.

## Feature Area: Team Workspaces

These capabilities apply only to Looker Studio Pro team workspace roles. Basic roles are not

| applicable. Capability                                                                                                            | Team                          | workspace roles           |                      |    |    |    |    |
|-----------------------------------------------------------------------------------------------------------------------------------|-------------------------------|---------------------------|----------------------|----|----|----|----|
| Viewer                                                                                                                            | Contributor                   | Content                   | Manager              |    |    |    |    |
| manager                                                                                                                           |                               |                           |                      |    |    |    |    |
| View workspace membership                                                                                                         | ✔                             |                           | ✔                    |    | ✔  |    |    |
| View workspace assets                                                                                                             | ✔                             |                           | ✔                    |    | ✔  |    | ✔  |
| View workspace folders                                                                                                            | ✔                             |                           | ✔                    |    | ✔  |    | ✔  |
| Edit workspace and folder assets                                                                                                  | ✔                             |                           | ✔                    |    | ✔  |    |    |
| Create new workspace assets                                                                                                       | ✔                             |                           | ✔                    |    | ✔  |    |    |
| Create new workspace folders                                                                                                      | ✔                             |                           | ✔                    |    | ✔  |    |    |
| View the workspace Trash                                                                                                          | ✔                             |                           | ✔                    |    | ✔  |    | ✔  |
| Restore workspace and workspace folder assets from                                                                                | the                           | ✔                         |                      | ✔  |    | ✔  |    |
| Trash Move assets from                                                                                                            | Sandbox/Owned by me to a team |                           | ✔                    |    | ✔  |    | ✔  |
| workspace or workspace folder Move assets out of a team workspace or workspace folder to Sandbox/Owned by me, to a different team |                               |                           |                      |    |    |    |    |
| workspace, or to a folder in a different workspace                                                                                | ✔*                            |                           |                      |    |    |    |    |
| Move assets between a team                                                                                                        | workspace and its             | ✔                         |                      | ✔  |    |    |    |
| child folders Add members to / remove members from                                                                                | the team                      |                           | ✔**                  | ✔  |    |    |    |
| workspace Change member roles for the team                                                                                        | workspace                     | ✔                         |                      |    |    |    |    |
| Permanently delete a workspace folder                                                                                             | ✔                             |                           |                      |    |    |    |    |
| Permanently delete the workspace                                                                                                  | ✔                             |                           |                      |    |    |    |    |
| * If a Manager is moving an asset from                                                                                            | one team                      | workspace to another team | workspace, they must |    |    |    |    |

have one of the three roles in the target team workspace. ** Content managers can add or remove Contributors.

## Related Resources

•
About team workspaces
•
Organize assets with folders in team workspaces Need more help?

Try these next steps:
Post to the help community

![5_image_0.png](5_image_0.png)

Get answers from community members