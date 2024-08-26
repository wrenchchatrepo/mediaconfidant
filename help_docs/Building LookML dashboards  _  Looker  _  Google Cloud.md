Note that you are viewing Looker documentation. For Looker Studio documentation, visit https://support.google.com/looker-studio (https://support.google.com/looker-studio).

## Building Lookml Dashboards

LookML dashboards are created by LookML developers and stored as version-controlled files. By default, they appear in the **LookML dashboards** folder (\#lookml_dashboards_folder) of your Looker instance.

To compare and contrast LookML dashboards and user-defined dashboards, see the Comparing user-defined and LookML dashboards (/looker/docs/types-of-dashboards) documentation page.

To create a LookML dashboard, you must have the following Looker permissions:
see_lookml_dashboards (/looker/docs/admin-panel-users-roles\#see_lookml_dashboards) develop (/looker/docs/admin-panel-users-roles\#develop)
Additionally, you must have access to the LookML models (/looker/docs/admin-panel-users-roles\#model_sets) for any data you want to use in the dashboard.

## Creating A Lookml Dashboard File

To build a LookML dashboard, begin by creating a dashboard file, which has the extension
.dashboard.lookml (/looker/docs/lookml-project-files\#project_file_types) (although the .lookml portion of the extension is silent within the IDE). The steps to do so are as follows:
1. Turn on Development Mode
 (/looker/docs/dev-mode-prod-mode\#switching_in_and_out_of_development_mode).

2. In the **Develop** menu, navigate to your project. 3. Select the **Add file or folder** plus icon at the top of the file browser panel in the Looker IDE to create a LookML dashboard file outside of existing project folders. Or, click a folder's three-dot Folder Options menu to create the file inside the folder (/looker/docs/ide-folders\#creating_items_within_a_folder). Click **Create Dashboard** to create the dashboard file.

![1_image_0.png](1_image_0.png)

1. A **Create File** window will appear. Within the window, name the dashboard file in the write-in field and select the **Create** button.

## Editing Lookml Dashboard Files

When you create a LookML dashboard file, Looker pre-populates the file with several basic dashboard parameters (/looker/docs/reference/param-lookml-dashboard), which implement settings for the entire dashboard. It also pre-populates the file with several sample dashboard element parameters (/looker/docs/reference/param-lookml-dashboard-element), which are grouped under the elements (/looker/docs/reference/param-lookml-dashboard\#elements_2) dashboard parameter, and which define the function and appearance of dashboard tiles, text, and buttons. A newly created .dashboard.lookml file contains dashboard LookML similar to this:
- dashboard: order_analysis title: Order Analysis layout: newspaper preferred_viewer: dashboards-next tile_size: 100 filters:
elements:
- name: hello_world type: looker_column You can edit the dashboard file within the IDE as long as you are in Development Mode.

You have several options for building your dashboard:
Manual creation: You can manually build a dashboard by using dashboard parameters and dashboard element parameters. Copy a user-defined dashboard: You can create a copy of a user-defined dashboard by deleting the pre-populated dashboard LookML from the file, copying the dashboard LookML from a user-defined dashboard (/looker/docs/viewing-dashboards\#getting_the_lookml_from_a_dashboard), and pasting it into your dashboard file.

Copy dashboard LookML of elements: You can copy the dashboard LookML from an Explore (\#adding_a_visualization_to_an_existing_lookml_dashboard) or a Look (/looker/docs/viewing-looks\#the_look_gear_menu) and paste it into your dashboard file.

When you're creating a dashboard, keep in mind best practices for dashboard construction. Find information and recommendations about building performant dashboards in the Considerations when building performant Looker dashboards (/looker/docs/best-practices/considerations-when-building-performant-dashboards) Best Practices page.

## Adding A Visualization To An Existing Lookml Dashboard

The easiest way to add a visualization to an existing LookML dashboard is to use the Explore page (/looker/docs/viewing-and-interacting-with-explores\#the_explore_page) to build a query that you want to turn into a dashboard element:
1. Once you have created the query and visualization that you want to add to a dashboard, click the Explore's **Explore actions** gear menu.

2. Select **Get LookML** to expose the LookML.

![3_image_0.png](3_image_0.png)

![3_image_1.png](3_image_1.png)

3. A Get LookML window appears. With Dashboard selected in the window, select all the LookML
and copy it.

![4_image_0.png](4_image_0.png)

From here, paste the LookML (\#editing_lookml_dashboard_files) into your dashboard LookML file. When editing the dashboard LookML file, be sure to:
Verify that you are in Development Mode (/looker/docs/dev-mode-prod-mode) so that you can edit the dashboard file.

Paste the LookML under the dashboard's elements parameter. Use the correct indentation when pasting LookML into the dashboard file. If possible, match the indentation to existing elements already in the dashboard file.

You can adjust the LookML parameters if desired, using the parameters described on the documentation pages for each individual element type
 (/looker/docs/reference/param-lookml-dashboard-element).

Adding filters Once you have dashboard elements saved in your dashboard file, you may want to add filters, which let dashboard viewers filter some or all elements on a dashboard. Filters can be useful for many possible reasons, for example:
Adjusting the time period shown Adjusting the specific product category, customer type, etc being shown Providing a "lookup" type capability for a client or customer Be sure to build the type of filter you want. The two types are:
Filters that you hard-code into the dashboard elements, which dashboard viewers cannot change Dashboard filters, which dashboard viewers can change

## Filters Hard-Coded Into Dashboard Elements

Filters that you hard-code into the dashboard elements, which users cannot change, usually get created automatically in the copy LookML step for a visualization (\#adding_a_visualization_to_an_existing_lookml_dashboard) or for a dashboard (\#creating_a_lookml_copy_of_a_user-defined_dashboard). In a LookML dashboard, those filters use the filters (/looker/docs/reference/param-lookml-dashboard-table-chart\#filters) dashboard element parameter and look like this:
- name: element_name
\# lots of other element parameters here filters:
dimension_or_measure_name: 'looker filter expression'

## Dashboard Filters

Dashboard filters let viewers interactively refine the data that is shown in dashboard elements. To create a dashboard filter, follow these steps:
1. Create the dashboard filter by using the filters
 (/looker/docs/reference/param-lookml-dashboard\#filters) parameter within your LookML dashboard file.

2. Apply the filter to individual dashboard elements by using the listen
 (/looker/docs/reference/param-lookml-dashboard-table-chart\#listen) parameter.

## Creating A Dashboard Filter

The filters parameter lets you create various types of interactive filters (/looker/docs/reference/param-lookml-dashboard\#type) for your dashboard.

To create a dashboard filter that users can interact with, add a filters parameter to your dashboard file. For example, the following sample code creates a LookML dashboard that has the filters date and category_name:
- dashboard: dashboard_name title: Dashboard Title layout: newspaper filters:
- name: date title: 'Date Range' type: date_filter default_value: 30 days
- name: category_name type: field_filter model: ecommerce explore: product field: category.name The code in the previous example creates the following filters:
date: A date filter (/looker/docs/reference/param-lookml-dashboard\#date_filter) that lets users select a date range. The default value is set to the last 30 days.

category_name: A field filter (/looker/docs/reference/param-lookml-dashboard\#field_filter) that lets users filter by product category. This filter dynamically generates options that are based on the category.name field within the specified LookML model (ecommerce) and Explore (product).

Note: Only filters with type: field_filter use the explore and field parameters. If you include the explore and field parameters with any other filter type, you'll get LookML validation errors.

Applying a dashboard filter to dashboard elements Once you've created a dashboard filter, you can apply that filter to individual dashboard elements by using the listen parameter. Using the listen parameter in this way allows the linked elements to be dynamically updated based on the user's selection in the filter.

Note: The listen parameter is supported by all element types (/looker/docs/reference/param-lookml-dashboard-element) except type: text (/looker/docs/reference/param-lookml-dashboard-text-tile) and type: button (/looker/docs/reference/param-lookml-dashboard-button).

For example, consider the following sample LookML code for an area chart element:
- name: approved_orders_by_day type: looker_area model: ecommerce explore: orders dimensions: [orders.created_date]
measures: [orders.count] filters:
orders.status: 'approved' The approved_orders_by_day chart displays the count of approved orders by day, as the query is based on the orders_created_date dimension and the orders.count measure and has a filter applied, orders.status: 'approved'. This filter is fixed within the element and cannot be modified by dashboard viewers. To let users filter the approved_orders_by_day chart by using the date filter and the category_name filter from the previous example (\#creating_a_dashboard_filter), add the listen parameter to the dashboard element.

- name: approved_orders_by_day type: looker_area model: ecommerce explore: orders dimensions: [orders.created_date]
measures: [orders.count] filters:
orders.status: 'approved' listen:
category_name: category.name date: orders.created_date When a dashboard viewer interacts with the category_name filter or the date filter, the approved_orders_by_day chart will be automatically updated to reflect the filtered results.

The listen parameter uses the syntax filter_name: field_name. In the previous example, the category_name and date are the names of filters, and category.name and orders.created_date are the fields that will be used to let dashboard viewers provide input to the filter.

A dashboard filter can be applied to any field (of the same data type) in any given element. For example, one element can apply a user's input to the order *created* date (date: orders.created_date), while another applies it to the order *ship* date (date: orders.ship_date):
- name: element_one
\# lots of other element parameters here listen:
date: orders.created_date
- name: element_two
\# lots of other element parameters here listen:
date: orders.ship_date Note: For dashboard elements that use the merged_queries parameter (/looker/docs/reference/param-lookml-dashboard-column-chart\#merged_queries), each source query can listen to one or more dashboard filters. You can define filter logic for each source query independently, regardless of the number of source queries in your merged results element. If a query does not have a listen parameter, then it won't be affected by any dashboard filters.

## Including The Dashboard File In A Model

For your dashboard to be visible to preview in Development Mode or visible in production, it must be included in the model file on which the dashboard is based by using an include (/looker/docs/reference/param-model-include) statement.

A common practice is to include all LookML dashboards in a model by using a wildcard:
include: "*.dashboard.lookml" or, if your LookML dashboards appear within a folder in the IDE, use the path to their location include: "/path/*.dashboard.lookml" You can also include a specific dashboard by specifying its filename:
include: "my_dashboard.dashboard.lookml" Saving, previewing, and publishing the LookML dashboard To preview the dashboard:
1. Save the .dashboard.lookml file, by clicking the **Save Changes** button at the top right corner of the file.

2. Include the dashboard in the relevant model file (\#including_the_dashboard_file_in_a_model) and save the changes to that file.

3. In the .dashboard.lookml file you wish to preview, click the downward arrow **See file actions**
icon and select **View Dashboard**.

![10_image_0.png](10_image_0.png)

You can make further changes to your .dashboard.lookml file, save them, and preview the dashboard again.

Once you are happy with your dashboard, you can publish it to production, which allows other users with the correct permissions to see it. The method for publishing the dashboard is the same as publishing other changes to LookML on your instance, and depends on the version control settings (/looker/docs/version-control-and-deploying-changes\#getting_your_changes_to_production) for your Looker instance.

## Lookml Dashboards Folder

Once published, LookML dashboards are saved in the **LookML dashboards** folder by default. The LookML dashboards folder is located in the **Folders** (/looker/docs/finding-content\#navigating_to_content_in_folders) folder in the left navigation. The **LookML** dashboards folder is unique from other folders in a few ways:
You must include a LookML dashboard in at least one model file (/looker/docs/building-lookml-dashboards\#including_the_file_in_a_model) for it to appear in the LookML dashboards folder. To see the **LookML dashboards** folder, users must have the see_lookml_dashboards
 (/looker/docs/admin-panel-users-roles\#see_lookml_dashboards) permission.

To see dashboards within the **LookML dashboards** folder, users must have access to the LookML model (/looker/docs/admin-panel-users-roles\#model_sets) that includes the dashboard.

To see any given tile within a LookML dashboard, dashboard viewers must have access to the LookML model (/looker/docs/admin-panel-users-roles\#model_sets) that the tile is based on.

To edit a dashboard in the **LookML dashboards** folder, you must have the develop (/looker/docs/admin-panel-users-roles\#develop) permission on the model that includes the LookML dashboard. To **Explore from Here** on any given tile within a dashboard, dashboard viewers must have the explore (/looker/docs/admin-panel-users-roles\#explore) permission for the model that tile is based on.

You cannot create a folder inside the **LookML dashboards** folder.

Moving LookML dashboards outside of the LookML dashboards folder If you have the see_lookml_dashboards and develop Looker permissions (/looker/docs/admin-panel-users-roles\#permissions_list) as well as access to the LookML model a LookML dashboard is included in, you can move a LookML dashboard into any folder for which you have the **Manage Access, Edit** (/looker/docs/organizing-spaces\#folder_access_levels) folder access level. There are two ways to move the dashboard:
From the **LookML dashboards** folder, select the dashboard to move, click the **Move** button at the top of the dashboards section, and select the folder into which you wish to move the dashboard. See the Organizing and managing content (/looker/docs/organizing-spaces\#copying_or_moving_looks_and_dashboards) documentation page for more information.

From the **LookML dashboards** folder, click the three-dot menu for the dashboard, select **Move**
from the menu, and select the folder into which you wish to move the dashboard.

If you're in Development Mode, you can't move LookML dashboards outside of the **LookML**
dashboards folder. You can instead use the **Import** option to copy the LookML dashboard as a userdefined dashboard (/looker/docs/converting-lookml-to-user-defined-dashboard) to another folder.

A folder that contains both user-defined dashboards and LookML dashboards displays the LookML dashboards in a **LookML Dashboard** section. From the **LookML Dashboard** section, you can move a LookML dashboard to another folder or pin a LookML dashboard to a board. However, unlike userdefined dashboards, LookML dashboards cannot be renamed or moved to the trash from a folder.

If the value of a LookML dashboard's dashboard
 (/looker/docs/reference/param-lookml-dashboard\#dashboard) parameter is changed, the LookML
dashboard will automatically move back into the **LookML dashboards** folder.

## Viewing The Lookml For An Existing Lookml Dashboard

If you have the see_lookml (/looker/docs/admin-panel-users-roles\#see_lookml) permission, you can navigate to the dashboard LookML for an existing LookML dashboard by selecting **Go to LookML** from a dashboard's three-dot **Dashboard actions** menu:

![12_image_0.png](12_image_0.png)

When you select **Go to LookML**, Looker navigates to the dashboard file in which the LookML dashboard is defined.

Extending a LookML dashboard Once you've created a LookML dashboard, you can extend the dashboard. This lets you create a second dashboard based on the original one, possibly adding or overriding some settings. Then if you change the first dashboard, the second one inherits those changes automatically (unless overridden in the second dashboard). See the Reusing code with extends
 (/looker/docs/reusing-code-with-extends\#extending_a_lookml_dashboard) documentation page for more information.

## Improving Dashboard Performance Using Aggregate Awareness

LookML developers may be able to improve LookML dashboard performance by using aggregate awareness (/looker/docs/aggregate_awareness). With aggregate awareness, developers can create aggregate tables (/looker/docs/aggregate_awareness) under LookML explore parameters, which can optimize queries for one or more tiles in a dashboard.

Once you have created and are viewing a LookML dashboard, you can use the **Get aggregate table** LookML option in the three-dot **Dashboard actions** menu, which is visible if you have the see_lookml (/looker/docs/admin-panel-users-roles\#see_lookml) permission.

![14_image_0.png](14_image_0.png)

For more information, see the aggregate_table
 (/looker/docs/reference/param-explore-aggregate-table\#getting_aggregate_table_lookml_from_a_dashboard)
parameter documentation page.

Note: Find other information and recommendations about building performant dashboards on the Considerations when building performant Looker dashboards
 (/looker/docs/best-practices/considerations-when-building-performant-dashboards) Best Practices page.

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License
 (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-07-09 UTC.