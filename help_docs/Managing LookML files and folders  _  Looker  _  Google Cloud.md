Note that you are viewing Looker documentation. For Looker Studio documentation, visit https://support.google.com/looker-studio (https://support.google.com/looker-studio).

## Managing Lookml Files And Folders

LookML project files are organized into folders in the file browser section of the Looker IDE. This page provides instructions for creating and managing folders and files in a LookML project. For information about the structure and purpose of each type of file in a LookML project, see the Types of files in a LookML project (/looker/docs/lookml-project-files) documentation page.

## Before You Begin: Important File And Folder Naming Conventions

When you're creating files and folders, it's best to keep the following naming conventions in mind:
Case sensitivity: LookML is case sensitive
 (/looker/docs/lookml-terms-and-concepts\#case_sensitivity). Be sure to adhere to your project's conventions when naming your folders. For example, if your convention is to use all lowercase letters in your project, you would want to name your folder views instead of Views. This makes a difference especially when you need to specify a file's path, such as when including files (/looker/docs/reference/param-model-include\#using_include_with_ide_folders). Generally, it's a good idea to consistently use lowercase letters when you name LookML objects and folders. Spaces and special characters: Filenames cannot include spaces or any of the following characters: / ? * : | " < > %
File extensions: When creating LookML files with the Looker IDE (\#creating_files), Looker will automatically add the .lkml extension to the end of the filename if you don't include the extension manually. For example, if you enter the file name flights_data_tests, Looker will name the file flights_data_tests.lkml. Changing the displayed name of a LookML object: If you want to change the displayed name of a model or LookML object, consider using the label (/looker/docs/reference/param-model-label) parameter or the alias (/looker/docs/reference/param-field-alias) parameter instead of renaming the file or object. The label and alias parameters change the displayed name while preserving the underlying URL used for emails or other systems. In general, you should take precautions to make model changes as noninvasive as possible. If you do need to rename a model or an object, use the Content Validator (/looker/docs/content-validation) to update all references to the model or object.

## Creating Folders

You can create folders for different file types (such as view files (/looker/docs/lookml-project-files\#view_files) or model files (/looker/docs/lookml-project-files\#model_files)).

You can even create subfolders, which is very useful if you want to include a subset of your views (/looker/docs/reference/param-model-include\#using_include_with_ide_folders).

Note: When you're creating folders, keep in mind that LookML is case sensitive (/looker/docs/lookml-terms-and-concepts\#case_sensitivity). Be sure to adhere to your project's conventions when naming your folders. This is important, especially when you need to specify a file's path, such as when including files (/looker/docs/reference/param-model-include\#using_include_with_ide_folders). Generally, it's a good idea to consistently use lowercase letters when you name LookML objects and folders. See the important notes for creating files and folders (\#important_notes_for_creating_files_and_folders) for limitations and guidelines for naming your files and folders.

To create a folder:

![1_image_0.png](1_image_0.png)

1. Select the **Create Folder** option from the appropriate menu:
To create a new folder at the top level of your directory structure, use the Add file or folder menu, which you can access by selecting the + (plus) icon at the top of the **File** Browser panel.

To create a new subfolder under an existing folder, use the three-dot **Folder Options**
menu for the existing folder.

2. Enter a name for the new folder.

3. Select **Create**.

The new folder is added to the navigation pane.

## Creating Files

You can automatically generate a model file and view files based on your database when you create a new project (/looker/docs/create-projects\#automatically_generating_a_model_from_your_database). For existing projects, you can create new files manually.

Note: It is recommended that you use the Looker IDE to add files to your LookML project, either by creating them in the Looker IDE as described later in this section or by uploading them in the Looker IDE (\#uploading_files). If you instead create files outside of the Looker IDE and then use the Looker IDE to **Pull from (production branch)**
 (/looker/docs/git-command-reference\#pull_prod), be sure to use the correct naming conventions
 (\#file_and_folder_naming_conventions) and include the .lkml extension in the filename (or explore.lkml for Explore files). If a filename includes unsupported characters, the Looker IDE file browser will show the filename in red, and you will not be able to see the contents of the file until you rename the file with supported characters. In addition, the Looker IDE will not display the file at all if the file does not have the .lkml extension.

To create a new file in your LookML project:
1. Select the appropriate menu:
To create a new file at the top level of your directory structure, use the **Add file or folder** menu, which you can access by selecting the + (plus) icon at the top of the **File Browser** panel. To create a new file under an existing folder, use the three-dot **Folder Options** menu for the existing folder.

2. Select the type of LookML file you want to create. Select the links in the following list for a more detailed description of each type of file. You can create the following types of files:
Model files (/looker/docs/lookml-project-files\#model_files) with the file extension
.model.lkml View files (/looker/docs/lookml-project-files\#view_files) with the file extension .view.lkml
*

Project manifest files (/looker/docs/lookml-project-files\#project_manifest_files) that are always
**

named manifest.lkml Dashboard files (/looker/docs/lookml-project-files\#dashboard_files) with the file extension
.dashboard.lookml Document files (/looker/docs/lookml-project-files\#document_files) with the file extension .md Locale strings files (/looker/docs/lookml-project-files\#locale_strings_files) with the file
***

extension .strings.json Generic LookML files, which are used for the following types of files:
Explore files (/looker/docs/lookml-project-files\#explore_files) with the file extension
****

.explore.lkml Data test files (/looker/docs/lookml-project-files\#data_test_files) with the file extension
.lkml Refinements files (/looker/docs/lookml-project-files\#refinements_files) with the file extension .lkml Any other files you're using to house LookML elements

## Star Note:

*

 See the Considerations for creating view files (\#considerations_for_creating_view_files) section on this page for instructions on alternative methods for creating view files, including instructions for adding view files based on database tables (\#adding_a_new_view_from_an_existing_database_table).

**

Project manifest files (/looker/docs/lookml-project-files\#project_manifest_files) can be created only by selecting the + (plus) icon to open the **Add file or folder** menu at the top of the file browser in the Looker IDE,
and only if the project doesn't have a manifest file already. This is because a project can have only one manifest file, and the manifest file must be located at the root level of the project's directory structure.

***

The **Create Locale Strings File** (/looker/docs/lookml-project-files\#locale_strings_files) option is available only from the **Add file or folder** + (plus) icon at the top of the file browser in the Looker IDE, but once a locale strings file is created (or uploaded (\#uploading_files)), you can move the file to a folder (\#moving_items_in_a_foldered_project). If you are creating locale strings files to localize your model and would also like to take advantage of Looker's native UI localization, you must name your strings files using specific locale codes that can be found in the Locale section of the Users (/looker/docs/admin-panel-users-users\#locale_(beta)) documentation page.

****

 When you create an Explore file, the file must have the .explore.lkml extension at the end of its filename. If you are uploading the file (\#uploading_files), you must use the full .explore.lkml extension. If you are using the Looker IDE to create the file (\#creating_files) with the **Generic LookML files** option, Looker will add .lkml to the end of the filename if the extension isn't there, but you still must manually add the .explore part of the extension to the filename. For example, to create an Explore file called flights using the Looker IDE, you can enter either flights.explore or flights.explore.lkml, and the file will be named flights.explore.lkml.

3. In the **Create File** pop-up, enter a name for the new file. See the important notes for creating files and folders (\#important_notes_for_creating_files_and_folders) for limitations and guidelines for naming your files.

4. Select **Create**. The new file will be displayed where you created it. If needed, you can easily move it to another folder (\#moving_items_in_a_foldered_project).

Important: Once you create the file, be sure to use the include parameter if you want to reference elements from the file in other LookML files of your project. See the include (/looker/docs/reference/param-model-include) parameter documentation page for more information. Note: If your Looker admin has enabled the **Improved LookML Generation** (/looker/docs/admin-panel-general-labs\#improved_lookml_generation) Labs feature, the **Add file or folder** + (plus) menu at the top of the **File Browser** panel will show an option to **Generate LookML from Database** in addition to the options listed here.

## Considerations For Creating View Files

Most LookML developers start with one or more view files (/looker/docs/lookml-project-files\#view_files)
that are created automatically when the LookML project is generated from a set of tables in a database (/looker/docs/generating-a-model). However, in addition to the methods described on this page for creating blank view files (\#creating_files) and for uploading files (\#uploading_files), there are many ways a Looker developer in Development Mode (/looker/docs/dev-mode-prod-mode) can add view files to a LookML project:
Creating view files based on tables in a database:
Generating view files from database tables when you first connect to your database, as described on the Generating a model
 (/looker/docs/generating-a-model\#automatically_generating_a_model_from_your_database)
documentation page Generating view files from database tables for a project that is already connected to a database, as described in the Adding a new view from an existing database table
 (\#adding_a_new_view_from_an_existing_database_table) section on this page Creating a view file for a derived table (/looker/docs/derived-tables):
Starting with a blank view file using one of the options described on this page and then manually defining your derived table, as described in the Defining a native derived table in LookML (/looker/docs/creating-ndts\#defining_a_native_derived_table_in_lookml) section of the Creating native derived tables (/looker/docs/creating-ndts) documentation page Having Looker create the derived table LookML from an Explore
 (/looker/docs/creating-and-editing-explores), as described in the Using an Explore to begin defining your native derived tables
 (/looker/docs/creating-ndts\#using_an_explore_to_begin_defining_your_native_derived_tables)
section of the Creating native derived tables (/looker/docs/creating-ndts) documentation page Having Looker create the derived table LookML from a SQL Runner (/looker/docs/sql-runner-basics) query, as described on the Using SQL Runner to create derived tables
 (/looker/docs/sql-runner-create-derived-tables\#creating_a_derived_table_from_a_query)
documentation page To use a new view, add it to your model file using the explore
 (/looker/docs/reference/param-explore-explore) parameter, or use the join (/looker/docs/reference/param-explore-join) parameter to join it to an existing Explore in your model file.

## Adding A New View From An Existing Database Table

You can create a view file from an existing database table while in Development Mode (/looker/docs/dev-mode-prod-mode).

1. Within a project, select the **Add file or folder** menu by selecting the + (plus) at the top of the project file list in the Looker IDE, or you can select a folder's menu to create the file inside the folder (\#creating_files).

2. Select **Create View From Table**.

3. Looker displays a list of tables associated with one of your connections. To change the connection, use the **Connection** drop-down in the upper left.

4. Select any tables that you would like to create views from by checking the box to the left of the table name. You can collapse and expand databases or schemas in this list to access all available tables.

5. Scroll to the bottom of the page and select **Create Views**.

6. Looker generates views containing LookML for all the table columns.

## Uploading Files

You can also upload files to your project from your computer. This is helpful if you have created JSON data files (/looker/docs/lookml-project-files\#data_files) or LookML files locally on your computer.

Note: See the important notes for creating files and folders (\#important_notes_for_creating_files_and_folders) for limitations and guidelines for naming your files.

To upload a file to your project, use the drag-and-drop function in the Looker IDE:
1. Navigate to your project files (/looker/docs/accessing-project-files). 2. Drag the file from your computer into the Looker IDE. The file will be displayed at the root of your directory structure.

3. Once the file is uploaded, move the item to another folder (\#moving_items_in_a_foldered_project).

Important: Once you upload the file, be sure to use the include parameter if you want to reference the file or elements from the file in other LookML files of your project. See the include (/looker/docs/reference/param-model-include) parameter documentation page for more information.

## Deleting Files And Folders

Delete a folder or a file by selecting **Delete** from the item's three-dot **File Options** menu in the left panel of the IDE.

Note: Deleting a folder also deletes its contents, so be careful when deleting folders. Before deleting a folder, do the following:
Verify that you want to delete the files in the folder, or move the files to a different location before deleting the folder.

Verify that the folder does not contain any files that are referred to in include statements in your project. See the Using include with IDE folders (/looker/docs/reference/param-model-include\#using_include_with_ide_folders) section of the include parameter documentation page for information on using include with IDE folders.

When you delete a folder, the IDE shows a confirmation pop-up. The pop-up specifies how many items are included in the deletion, which includes the folder and any files inside the folder.

Note: If you delete a model file (/looker/docs/lookml-project-files\#model_files), the model is not removed from any model sets (/looker/docs/admin-panel-users-roles\#model_sets) to which the model belonged. If a new model file is created with the same name as a deleted model, the new model is included in any model sets that included the deleted model. This can result in giving unwanted access to the new model file. Looker admins can edit model sets (/looker/docs/admin-panel-users-roles\#editing_a_model_set) and remove a deleted model to prevent this issue.

## Deleting Files And Folders In Bulk

To delete folders and files in bulk:
Note: Deleting a folder will delete all its contents. Before deleting a folder, verify that you want to delete the files in the folder. If you want to keep them, move the files to a different location (\#moving_bulk_files) before deleting the folder.

1. Select the **Bulk Edit** icon at the top of the **File Browser** panel.

![7_image_0.png](7_image_0.png)

2. Select the items to delete. The number of files selected is displayed next to the **Select Files**
header.

![8_image_0.png](8_image_0.png)

To select or deselect individual files, expand their folders and select the checkbox next to the filenames. To select or deselect entire folders and their contents, select the checkbox next to the folder name. To select an entire section of the directory list, use Shift-click. Select the checkbox for the top item in the range, and then hold down the Shift key and select the checkbox for the last item in the list. Both items and all items in between will be selected. You can also just Shift-click on an item to select the item and everything above it in the directory list.

3. Select the **Delete Items** trash icon. The IDE will then display a pop-up menu listing the items selected.

![8_image_1.png](8_image_1.png)

4. Confirm the items to be deleted by selecting **Yes, Delete**, or return to item selection by selecting **Cancel**.

5. Select the X in the **Select Files** header to exit bulk edit mode.

## Moving Items In A Foldered Project

To move files, drag and drop a file or a folder into another folder.

The destination folder does not need to be expanded to receive other folders or files. A folder automatically expands when you hover over it.

Note: When you change a file's path, be sure to update any include statements in your project to match the new file path. See the Using include with IDE folders (/looker/docs/reference/param-model-include\#using_include_with_ide_folders) section of the include parameter documentation page for information on using include with IDE folders.

Also, be aware that when you change a file's path, Git effectively deletes the file and creates a new file with the new file path. This means that the Git history for the file will be empty, because Git considers it a new file. To see the file's Git history before it was moved, use your Git interface to navigate to the file in its original location and view the Git history from there. (The same logic applies for a renamed file, since Git effectively deletes the file and creates a new file with a different name.)
Moving files and folders in bulk To move folders and files in bulk:
1. Select the **Bulk Edit** icon at the top of the **File Browser** panel.

![9_image_0.png](9_image_0.png) 2. Select the items to move. The number of files selected is displayed next to the **Select Files**
header.

![10_image_0.png](10_image_0.png)

To select or deselect individual files, expand their folders and select the checkbox next to the filenames. To select or deselect entire folders and their contents, select the checkbox next to the folder name. To select an entire section of the directory list, use Shift-click. Select the checkbox for the top item in the range, and then hold down the Shift key and select the checkbox for the last item in the list. Both items and all items in between will be selected. You can also just Shift-click on an item to select the item and everything above it in the directory list.

3. Select the **Move Items** folder icon to select option. The IDE will then display a folder selection pop-up menu.

![10_image_1.png](10_image_1.png)

4. In the **Move to** pop-up menu, choose a folder for the selected items, or select **New Folder** to create a new folder. The project name will display the file path of the folder you have selected at the top of the next menu page. To move items to the root directory of your project, select Move without a folder selected.

5. Confirm the selected destination by selecting **Move**, create a new folder within the selected folder by selecting **New Folder**, or return to the main folder options menu by selecting the project name link in the file path.

6. Select the X in the **Select Files** header to exit bulk edit mode.

Note: After you change a file's path, be sure to update any include statements in your project to match the new file path. See the Using include with IDE folders (/looker/docs/reference/param-model-include\#using_include_with_ide_folders) section of the include parameter documentation page for information on using include with IDE folders.

Also, be aware that when you change a file's path, Git effectively deletes the file and creates a new file with the new file path. This means that the Git history for the file will be empty, because Git considers it a new file. To see the file's Git history before it was moved, use your Git interface to navigate to the file in its original location and view the Git history from there. (The same logic applies for a renamed file, since Git effectively deletes the file and creates a new file with a different name.)
Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License
 (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies
 (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-07-01 UTC.