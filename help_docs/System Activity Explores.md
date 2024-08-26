Note that you are viewing Looker documentation. For Looker Studio documentation, visit https://support.google.com/looker-studio (https://support.google.com/looker-studio).

# Creating Looker Usage Reports With System Activity Explores

Before enabling System Activity on a customer-hosted Looker deployment with a MySQL backend (/looker/docs/migrating-looker-backend-db-to-mysql), verify that you have properly set up the user for the backend database. Specifically, you must perform the step to grant all on looker_tmp.* to '<DB_username>'@'%'; before you enable the **System Activity** feature. See the procedure on the Migrating the Looker backend database to MySQL (/looker/docs/migrating-looker-backend-db-to-mysql\#mysql_create_db) documentation page.

Looker admins and users who have been granted the see_system_activity (/looker/docs/admin-panel-users-roles\#see_system_activity) permission have access to Looker's System Activity Explores in the **Explore** menu (/looker/docs/creating-and-editing-explores\#explores_are_the_starting_point_for_exploration).

The System Activity Explores connect to Looker's underlying application database. They show information about your Looker instance, including Looks and dashboards saved on your instance, user information, historical query information, and instance performance statistics. Both the granularity and retention of System Activity data are subject to system constraints. System Activity is designed for collecting high-volume data, and aggregating it can be used to supplement your business logs.

This data can be useful for supplementing monitoring and auditing activities, but is not intended to replace your current compliance strategy.

By default, System Activity data is stored in Looker's internal database. Most tables are truncated on a regular schedule to comply with storage limits. For example, the History table (/looker/docs/usage-reports-with-system-activity-explores\#history) is truncated to the past 90 days of data. Some tables have more stringent data retention policies. To increase data retention, consider using Elite System Activity (/looker/docs/elite-system-activity). It is not possible to query System Activity data using SQL Runner as permissions for Looker's internal database are limited.

The text in filters run by users is accessible in System Activity and can be viewed by any user who has permission to view the System Activity model.

Take action: Modify who has view access to the System Activity model. Looker admins have access to this model by default. Non-admin users can be granted access to the System Activity model if they are given the see_system_activity permission.

System Activity dashboards and Explores are restricted in the number of concurrent queries that can be run. This restriction may increase loading times for System Activity Explores.

Chat Team Tip: Time-based data in System Activity is stored in the Looker System time zone. See the Using time zone settings (/looker/docs/using-time-zone-settings\#system_time_zone) documentation page for more information.

## System Activity Explores

These are the System Activity Explores:

| Explore Name                                                                   | Description                                                                                                                                                                                                         | Cache duration   |
|--------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------|
| Content Usage                                                                  | Data about Look and dashboard usage, including frequency of views, favoriting, scheduling, embedding, and access through the API. Also includes details about individual Looks and dashboards.                      | 12 hours         |
| DB Connection                                                                  | Details about database connections. Includes information about users who have                                                                                                                                       | 1 hour           |
| access to the database connections.                                            |                                                                                                                                                                                                                     |                  |
| Dashboard                                                                      | Details about all dashboards and dashboard elements. Includes information about                                                                                                                                     | 12 hours         |
| Looks, queries, roles, users, and folders that are associated with dashboards. |                                                                                                                                                                                                                     |                  |
| Dashboard                                                                      | Performance and historical data about dashboards.                                                                                                                                                                   | 1 hour           |
| Performance Event                                                              | Information about historical events (/looker/docs/events) within Looker, including the name, type, and frequency of each event. Includes information about groups and users who are connected to the events. 1 hour |                  |
| Event Attribute                                                                | Information about the attributes that make up events (/looker/docs/events). Includes                                                                                                                                | 12 hours         |
| the data in the Event Explore and adds attribute information.                  |                                                                                                                                                                                                                     |                  |
| Field Usage                                                                    | LookML fields and the number of times used.                                                                                                                                                                         | 1 hour           |
| Folder                                                                         | Information about all folders, the content stored in each folder, and the creator of each 1 hour                                                                                                                    |                  |

| Explore Name                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Description                                                                                                                                                                                                                                                                                        | Cache duration   |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------|
| folder.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |                                                                                                                                                                                                                                                                                                    |                  |
| Group                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | Listing of groups and details about those groups, including parent and child groups,                                                                                                                                                                                                               | 1 hour           |
| and users and roles that belong to each group.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                    |                  |
| History                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Details about all queries run in the previous 90 days.                                                                                                                                                                                                                                             | 12 hours         |
| Look                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | Details about all Looks. Includes information about dashboards, queries, users, and                                                                                                                                                                                                                | 12 hours         |
| folders that are associated with Looks.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |                                                                                                                                                                                                                                                                                                    |                  |
| Merge Query                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Information about merged queries (/looker/docs/merged-results), including fields and 1 hour other elements of both the source and the merged queries.                                                                                                                                              |                  |
| PDT Builds                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Details about PDT builds, including time taken to finish builds, and the connection and 1 hour model the PDTs are part of.                                                                                                                                                                         |                  |
| PDT Event Log                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Information about historical events related to PDTs, including PDT rebuilds and errors. 12 hours See the Understanding PDT log actions (/looker/docs/pdt-log-actions) documentation page for more information about viewing and understanding PDT log actions and their corresponding action data. |                  |
| Query Performance Metrics                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | Detailed breakdowns of queries that are run from your Looker instance.                                                                                                                                                                                                                             | 1 hour           |
| Role                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | Looker roles and the model and permissions sets that make up the roles.                                                                                                                                                                                                                            | 1 hour           |
| SQL Query                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | SQL queries that have been run, including how recently and frequently, and details                                                                                                                                                                                                                 | 1 hour           |
| about users who have run them.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                    |                  |
| Scheduled Plan Information about all scheduled data deliveries, including both previously scheduled jobs and currently scheduled jobs. Includes data about the dashboards, Looks, queries, folders, and users that are associated with scheduled data deliveries. 12 hours User Details about each user, including historical queries run, and the content and folders to 12 hours which they have access. See the Using the System Activity Explores (#using_the_system_activity_explores) section on this page for some examples of common uses for the Content Usage (#content_usage), Dashboard (#dashboard), Event (#event), Event Attribute (#event_attribute), History (#history), Look (#look), Merge Query  (#merge_query), PDT Builds (#pdt_builds), SQL Query (#sql_query), Scheduled Plan (#scheduled_plan), and User (#user) Explores. |                                                                                                                                                                                                                                                                                                    |                  |

## Using The System Activity Explores

Following are some examples of how you can use some of the Explores in System Activity, along with the answers to some common questions. You can access the example Explores in this section by replacing <instance_name.looker.com> in the example URLs with the address of your Looker instance.

## Api Usage

The **API Usage** Explore provides a summary of the volume of API calls made to your Looker instance. You can use the **API Usage** Explore to answer questions like the following:
How can I get a daily audit of API calls? (\#how_can_i_get_a_daily_audit_of_api_calls?) How many total API calls have been made on my instance this year? (\#how_many_api_calls?)
How can I get a daily audit of API calls? You can use the **API Usage** Explore to retrieve a list of all API calls made on your instance for any given time period. To see which calls were made on a given day:
1. Select **Endpoint** from **API Usage**. 2. Select **Total Usage** from **API Usage**. 3. Filter on **Created Date** from **API Usage** with the desired date.

https://<instance_name.looker.com>/explore/system__activity/api_usage?fields=api_usag Check the Looker API Reference (/looker/docs/reference/looker-api/latest) or Looker API Explorer (/looker/docs/api-explorer) for more information about what each API call does. How many API calls have been made on my instance this year?

You can use the **API Usage** Explore to aggregate the volume of API calls over any timeframe. For example, you can create a yearly report that shows how many API calls were made each month:
1. Select **Created Month** from **API Usage**.

2. Select **Total Usage** from **API Usage**.

3. Filter on **Created Year** from **API Usage** with the desired year.

https://<instance_name.looker.com>/explore/system__activity/api_usage?fields=api_usag Content Usage The **Content Usage** Explore in System Activity provides information about Look and dashboard usage, including frequency of views, favoriting, scheduling, and access via the API. It also includes details about individual Looks and dashboards. Quick Start analyses The **Content Usage** Explore includes Quick Start

![4_image_0.png](4_image_0.png)

 (/looker/docs/creating-and-editing-explores\#quick_start_analyses) analyses, which you can use to quickly answer questions or as starting points for other queries. Select a Quick Start analysis tile in a blank Explore, or from the lightning bolt **Quick Start** menu (/looker/docs/creating-and-editing-explores\#choosing_a_quick_start_option_once_an_explore_has_run) in an Explore that has run, and Looker will show a query with fields that are preselected and sorted to answer one of the following questions:
Which content has been favorited the most times?

Which content has been accessed in the previous 3 days? Which content has not been accessed in the past 60 days?

Which content has been accessed most frequently using the Looker API
 (/looker/docs/api-getting-started)?

Which dashboards created in the past 7 days are used the most?

Which Looks created in the past 7 days are used the most? Which boards have been favorited the most times? Which content has been viewed the most times?

What filters are used by popular Looks and dashboards? You can use the **Content Usage** Explore to find the most popular Looks or dashboards on your instance. You can then use the **History** Explore (\#history) to identify the filters used by popular Looks or dashboards. To find the most popular Looks or dashboards:
1. In the **Content Usage** Explore, select Content ID, **Content Title**, and **Content Type** from the Content Usage view.

2. Add a filter on **Content Type** from the **Content Usage** view, and set the filter value to dashboard OR look.

3. Select **View Total** from **Content Usage**. You can also select fields like Favorites Total, **Schedule**
Total, **API Total**, and **Embed Total** from the **Content Usage** view.

4. Sort the results in descending order on **View Total** to list the most popular content first.

5. You can also add a filter on the **Days Since Last Accessed** field from the **Content Usage** view to limit the data to a specific length of time. For example, you can limit the data you view to the last 30 days by setting the filter value to is less than 30.

Then, you can use the **History** Explore (\#history) to find the filters used in a specific Look or dashboard:
1. In the **History** Explore, filter on the ID field from either the **Dashboard** view or the **Look** view, and enter the IDs for the dashboards or Looks you identified using the **Content Usage** Explore.

2. Select **Filters** from the **Query** view to return a list of filters used by the dashboards or Looks you are filtering on.

## Dashboard

The **Dashboard** Explore includes details about dashboards and dashboard elements, including Looks, queries, roles, users, and folders that are associated with dashboards.

Quick Start analyses The **Dashboard** Explore includes Quick Start

![6_image_0.png](6_image_0.png) (/looker/docs/creating-and-editing-explores\#quick_start_analyses) analyses, which you can use to quickly answer questions or as starting points for other queries.

Select a Quick Start analysis tile in a blank Explore, or from the lightning bolt **Quick Start** menu
 (/looker/docs/creating-and-editing-explores\#choosing_a_quick_start_option_once_an_explore_has_run) in an Explore that has run, and Looker will show a query with fields that are preselected and sorted to answer one of the following questions:
Which dashboards use multiple Explores? Which dashboards have short auto-refresh (/looker/docs/editing-user-defined-dashboards\#autorefresh) intervals? How many dashboards are set to run on load (/looker/docs/editing-user-defined-dashboards\#run_on_load)?

Which dashboards have more than 25 tiles?

Which dashboards use the most merge queries (/looker/docs/merged-results)? Which dashboards use a particular view or field? Which folders contain which dashboards? What tiles make up an individual dashboard?

Event The **Event** Explore includes information about historical events within Looker, including the name, type, and frequency of each event. This Explore also includes information about groups and users who are connected to the events.

Following are some common uses of the **Event** Explore:
How can I find and categorize API requests? (\#how_can_i_find_and_categorize_api_requests?) Is there a way to investigate content updates? (\#is_there_a_way_to_investigate_content_updates?)
How do I view login events? (\#how_do_i_view_login_events?)
See the Looker events (/looker/docs/events) documentation page for more information about viewing events and common event attributes, and for a list of event types.

How can I find and categorize API requests? You can find all the API requests that have been made and categorize them using the **Event** Explore:
1. Select the **Name** and **Category** fields from the **Event** view. 2. Add a filter on **Is API Call (Yes / No)**, and set the filter value to Yes. 3. You can also select fields like **Created Date** from **Event**, and **Name** from **User**, for information about specific API requests.

https://<instance_name.looker.com>/explore/system__activity/event?fields=event.create Is there a way to investigate content updates? You can use the **Event** Explore to investigate content updates by filtering on events that include the word update:
1. Select the **Name** from the **Event** view. 2. Add a filter on the **Name** field from the **Event** view, and set the filter value to contains update. 3. You can also select other fields to provide more information about each content update, such as **Created Time** from **Event**, and ID from **User**.

https://<instance_name.looker.com>/explore/system__activity/event?fields=event.name,u How do I view login events?

You can use the **Event** Explore to determine who has logged in to the system with login events. For example:
1. Add a filter on the **Name** field from the **Event** view, and set the filter value to login.

2. Select the ID and **Name** from the **User** view.

3. Select **Created Time** from the **Event** view.

Event Attribute The **Event Attribute** Explore contains the data in the **Event** Explore (\#event) and provides additional information about the attributes that make up events (/looker/docs/events).

Following are some common uses of the **Event Attribute** Explore:
How do I view permission changes? (\#how_do_i_view_permission_changes?) How do I track when Labs features are turned on?

 (\#how_do_i_track_when_labs_features_are_turned_on?)
When was a project name changed? (\#when_was_a_project_name_changed?)
For more information about viewing events, common event attributes, and a list of event types, see the Looker events (/looker/docs/events) documentation page.

How do I view permission changes?

You can use the **Event Attribute** Explore to view permission changes. For example, you can find out when a permission was changed and who changed it:
1. Select **Created Time** and **Name** from the **Event** view for the time the change was made and the type of event.

2. Select **Name** and **Value** from **Event Attribute** to return information about the type of change made and either the users whose permissions were changed or the specific permissions that were changed.

3. Select ID and any other desired fields from **User** for information about the user who made the change.

4. Filter on **Name** in the **Event** view, setting the value to user_permission_elevation.

https://<instance_name.looker.com>/explore/system__activity/event_attribute?fields=ev How do I track when Labs features are turned on?

You can use the **Event Attribute** Explore to track when Labs features (/looker/docs/admin-panel-general-labs) are turned on. For example, select the following fields:
1. Select **Created Time** from the **Event** field. 2. Select **Name** and **Value** from the **Event Attribute** field. 3. Add a filter on **Name** from **Event**, and set the filter value to update_labs_feature.

4. You can also add fields like ID or **Name** from **User** to view information about the user who turned on a Labs feature.

In this example, the name of the Labs feature that has been turned on or off is shown in the **Value** field of **Event Attribute** when **Name** from **Event Attribute** has the value labs_feature_id. When Name from **Event Attribute** has the value labs_feature_value, the values true and false indicate whether the Labs feature was turned on or off.

https://<instance_name.looker.com>/explore/system__activity/event_attribute?fields=ev When was a project name changed?

You can use the **Event Attribute** Explore to see when the name of a project was changed:
1. Select **Created Time** and **Name** from the **Event** view. 2. Select **Name** and **Value** from **Event Attribute**.

3. Add a filter on **Name** from the **Event** view, and set the filter value to rename_project_file.

https://<instance_name.looker.com>/explore/system__activity/event_attribute?fields=ev History The **History** Explore provides a record of individual queries. It can be useful for troubleshooting, as it provides details about all the queries run on your instance in the past 90 days.

Following are some common questions about using the **History** Explore:
What are all the models used by a dashboard? (\#what_are_all_the_models_used_by_a_dashboard?) How can I identify long-running queries? (\#how_can_i_identify_long-running_queries?) When was the last time someone used SQL Runner?

 (\#when_was_the_last_time_someone_used_sql_runner?)
How can I find queries that were killed by the database?

 (\#how_can_i_find_queries_that_were_killed_by_the_database?)
What is the most popular dashboard by query count?

 (\#what_is_the_most_popular_dashboard_by_query_count?)
Which Explores are most popular with different roles?

 (\#which_explores_are_most_popular_with_different_roles?)
Has anyone queried a specific Explore in the last 90 days?

 (\#has_anyone_queried_a_specific_explore_in_the_last_90_days?)
Has anyone used a field from a specific view in the last 90 days?

 (\#has_anyone_used_a_field_from_a_specific_view_in_the_last_90_days?)
Which queries were initiated from within Google Sheets?

 (\#which_queries_were_initiated_from_within_google_sheets?)

## Truncation Of The History Table

Because the size of the **History** table can increase rapidly, Looker automatically deletes records that meet any of the following criteria:
The history.created_time is more than 90 days in the past.

The history.created_time is more than 7 days in the past, and the history.source is scheduled_task.

Clarification of select fields Each field in the **History** Explore has a description to help you understand its purpose. The following table contains more detailed descriptions of certain fields that customers often ask about:

Field

name

Description **Possible values**

Source The source of a query, such as a Look, an Explore, a scheduled task, an alert, a dashboard, etc.

alerts: The query was initiated from an alert (/looker/docs/alerts-overview). api: The query was initiated using the Looker API
 (/looker/docs/api-getting-started).

api3: The query was initiated using the Looker API
 (/looker/docs/api-getting-started).

authenticated_download: The query was initiated using the Looker Action Hub (/looker/docs/action-hub) with a [streaming action] (/looker/docs/downloading\#streaming_query_results) on a schedule.

dashboard: The query was initiated from a dashboard
 (/looker/docs/building-dashboards). (The query may have been initiated from the UI, from the API, or from a scheduled task.)
dashboard_prefetch: The query was initiated from a dashboard prefetch
 (https://community.looker.com/looker-api-77/prefetching-3-36-1826). data-download-api: This query was initiated from a dashboard download in CSV format (/looker/docs/downloading\#downloading_a_dashboard_as_csvs).

drill_modal: The query was initiated when a user drilled into the data
 (/looker/docs/viewing-and-interacting-withexplores\#drilling_down_into_the_data)
.

explore: The query was initiated from an Explore
 (/looker/docs/creating-and-editing-explores). (The query may have been initiated from the UI or from the API)
guided_analysis: The query was created with the Guided analyses in System Activity
 (/looker/docs/usage-reports-with-system-activityexplores\#guided_analyses_in_system_activity_labs_feature)
Labs feature.

internal: The query was run by Looker to retrieve metadata for internal purposes. look: The query was initiated from a Look (/looker/docs/viewing-looks).

(The query may have been initiated from the UI, from the API, or from a scheduled task.)
merge_query: The query was initiated from a merge query
 (/looker/docs/merged-results).

| private_embed: The query was initiated from a private embed  (/looker/docs/private-embedding). public_url: The query was initiated from a Look with public access  (/looker/docs/publishing-looks-with-public-urls) enabled. regenerator: The query was initiated by the PDT regenerator  (/looker/docs/derived-tables#the_looker_regenerator). render_manager_cache: The query was initiated by a download in PDF or PNG format. This could be a Look or a dashboard. scheduled_task: The query was run on a schedule  (/looker/docs/scheduling-and-sending-dashboards) which generated a PDF. (This source does not include scheduled deliveries of non-PDF formats, such as CSV.) sql_interface: The query was initiated by a third-party application using the Open SQL Interface (/looker/docs/sql-interface). sqlrunner: The query was initiated from SQL Runner  (/looker/docs/sql-runner-basics). suggest: The query was created as a filter suggestions  (/looker/docs/changing-filter-suggestions) query.   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Issuer The source of a query,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Action Hub: The query was initiated using the Looker Action Hub                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| Source bucketed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | (/looker/docs/action-hub). This includes the Source value authenticated_download. API: The query was initiated using the Looker API  (/looker/docs/api-getting-started). This includes the Source value api3. System: The query was initiated by Looker without direct user intervention. This includes the Source values alerts, data-download-api, and scheduled_task. User: The query was initiated by a Looker user. This includes the Source values dashboard, drill_modal, explore, look, merge_query, private_embed, render_manager, sqlrunner, and suggest. Other: The query does not fit into any of the other buckets. This includes the Source value internal. |
| Status The current status of the                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | cache_only_miss: The query was run with the cache_only=TRUE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| history event.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | option, and the cache entry was not present. complete: The query successfully completed. error: The query failed with an error. Include the Message field to see error details. killed: The query was cancelled by a user, by the database, or by Looker.                                                                                                                                                                                                                                                                                                                                                                                                                 |

Query Run Count This field counts the number of query runs by filtering out History entries where the **Status** field value is cache_only_ miss. In other words, this field only includes History entries where the **Status** field value is either complete, error, or killed.

A positive integer.

## Quick Start Analyses

The **History** Explore includes Quick Start

![13_image_0.png](13_image_0.png)

 (/looker/docs/creating-and-editing-explores\#choosing_a_quick_start_option_once_an_explore_has_run)
analyses, which you can use to quickly answer questions or as starting points for other queries.

Select a Quick Start analysis tile in a blank Explore, or from the lightning bolt **Quick Start** menu (/looker/docs/creating-and-editing-explores\#choosing_a_quick_start_option_once_an_explore_has_run) in an Explore that has run, and Looker will show a query with fields that are preselected and sorted to answer one of the following questions:
What query sources have been the most active over the past day? Which users have been the most active over the past week?

Which user's dashboards are the most popular?

How many times has a particular dashboard been used over the past 30 days?

What are the most recently run queries?

How many times has a particular Look been used over the past 30 days? What are the average query runtimes of individual models? What is the recent query activity for a particular user?

What are all the models used by a dashboard? You can use the **History** Explore to find all the models used by a dashboard. As an example, this could help identify the models for which a user needs permissions when that user is unable to see the data on a dashboard.

1. Select **ID (Inclusive)** from the **Dashboard** view.

2. Select **Model** and **Count** from the **Query** view. 3. Filter on **ID (Inclusive)**, entering the dashboard ID for the dashboard you want to filter on.

In the following URL example, you can replace the dashboard ID 123 in the filter element f[history.real_dash_id]=123 with the ID for the dashboard you want to filter on:
https://<instance_name.looker.com>/explore/system__activity/history?fields=history.re How can I identify long-running queries?

Suppose you want to create alerts (/looker/docs/user-alerts) for long-running queries. You can use the History Explore to, for example, find the queries that take the longest to run:
1. Select ID and **Link** from **Query**.

2. Select **Average Runtime in Seconds** and **Query Run Count** from **History** to view the average length of time each query ran and how many times the query has been run.

3. You can add a filter on **Completed Date** from **History**, and set the filter value to a timeframe like is in the past 7 days to limit the results that are displayed.

4. Add a filter on **Is Single Query (Yes / No)** and set its value to is Yes to exclude merge queries from the results.

5. You can display only queries with a runtime that is above a certain threshold, such as 5 minutes; to do this, you can filter on **Average Runtime in Seconds** and set the filter value to is greater than 300.

6. Sort in descending order on **Average Runtime in Seconds** from **History** to list queries with the longest average runtimes first.

You can then save the query as a Look and create an alert (/looker/docs/alerts-overview\#creating_an_alert) to notify you if there are queries with runtimes that exceed the threshold you specify.

In the following URL example, you change the timeframe for which results are displayed by replacing 7+days in the filter element f[history.created_date]=7+days with the desired filter value. You can also change the value of the filter on **Average Runtime in Seconds** by replacing is greater than 300 with the desired number of seconds in the filter element f[history.average_runtime]=%3E300.

https://<instance_name.looker.com>/explore/system__activity/history?fields=query.id,h When was the last time someone used SQL Runner?

To determine the last time a specific user ran a SQL Runner query using the **History** Explore:
1. Select **Last Run Time** and **User ID** from the **SQL Runner Query** view.

2. Add a filter on **User ID** from the **SQL Runner Query** view, and set the filter value to the ID of the user.

https://<instance_name.looker.com>/explore/system__activity/history?fields=sql_query.

How can I find queries that were killed by the database? To find queries that were killed by your database with the **History** Explore:
1. Add a filter on **Message** from **History**, and set the filter value to contains query killed.

2. Select **Created Date**, ID, and **Message** from **History**.

3. Select ID from **Query**.

https://<instance_name.looker.com>/explore/system__activity/history?fields=history.id What is the most popular dashboard by query count?

The **Dashboard** Explore lists the titles of every dashboard accessed in the last 90 days and includes a count of the number of times each of those dashboards was accessed:
1. Select **Title** from **Dashboard**.

2. Select **Query Run Count** from **History**.

3. Add a filter on **Title** from **Dashboard**, and set the filter value to is not null.

https://<instance_name.looker.com>/explore/system__activity/history?fields=dashboard.

Which Explores are most popular with different roles?

This Explore shows how many times an Explore was run by each role on your instance in the previous 90 days:
1. Select **Explore** from **Query**. 2. Select and pivot on **Name** from **User Role**.

3. Select **Query Run Count** from **History**. 4. Add a filter on **Name** from **User Role**, and set the filter value to is not null.

https://<instance_name.looker.com>/explore/system__activity/history?fields=history.qu Has anyone queried a specific Explore in the last 90 days?

You can use the **History** Explore to determine if a specific Explore was used in the last 90 days:
1. Select **Created Date** from **History**.

2. Select **Explore** and **Link** from **Query**. 3. Add a filter on **Explore** from **Query**, and enter the name of the Explore.

Has anyone used a field from a specific view in the last 90 days?

You can use the **History** Explore to determine if any fields from a specific view were used in the last 90 days:
1. Select **Created Date** from **History**. 2. Select **Explore** and **Link** from **Query**. 3. Filter on **Fields Used** from **Query**, enter the name of the view followed by a period - for example, orders. - and select **contains** for the filter condition. The period in your filter will ensure that your results return fields from only that view and not fields from similarly named views.

In the following URL example, you can replace order%5E_items. in the filter element f[query.formatted_fields]=%25order%5E_items. with the name of the view you want to filter on, followed by a period:
https://<instance_name.looker.com>/explore/system__activity/history?fields=history.cr Which queries were initiated from within Google Sheets? You can use the **History** Explore to view a list of queries that were generated from within Google Sheets using the Connected Sheets for Looker (/looker/docs/connected-sheets) feature:
1. Select **Date** and **Time of Day** from the **Created Date** group in **History**. 2. Select API Client Name, **Connected Sheets Spreadsheet ID**, and **Connected Sheets Trigger**
from the **Query API Client Properties** group in **History**.

3. Select **Name** from **User**.

4. Filter on **Connected Sheets Spreadsheet ID** in the **Query API Client Properties** group in History, and set the value to is not null.

https://<instance_name.looker.com>/explore/system__activity/history?fields=query_api_
Look The **Look** Explore includes details about all Looks, including information about dashboards, queries, users, and folders that are associated with Looks. Following are some common questions about using the **Look** Explore:
Which Looks are shared publicly? (\#which_looks_are_shared_publicly?)
Who is the author of a specific Look? (\#who_is_the_author_of_a_specific_look?) Which Looks have been deleted? (\#which_looks_have_been_deleted?)
Which Looks are shared publicly? You can use the **Look** Explore to see which Looks are being shared publicly or have a public URL enabled.

Filter on **Public (Yes / No)** from **Look**, and set the filter value to Yes.

Select ID, **Name**, and **Link** from **Look**.

https://<instance_name.looker.com>/explore/system__activity/look?fields=look.id,look.

Who is the author of a specific Look?

To find the author of a specific Look:
1. Filter on the ID from **Look**, setting the value to the Look's ID. 2. Select ID and **Name** from **User**.

3. You can also select fields like **Created Date** and **Title** from **Look**.

Which Looks have been deleted?

To view a list of all deleted Looks:
1. Select ID, Title, **Link**, and **Deleted Date** from **Look**.

2. Add a filter on **Deleted Date** from **Look**, and set the filter value to is not null.

https://<instance_name.looker.com>/explore/system__activity/look?fields=look.id,look.

Merge Query The **Merge Query** Explore includes information about merged queries, including fields and other elements of both the source and the merged queries.

You can use the **Merge Query** Explore to answer questions like the following:
Which Explores are merged most frequently? (\#which_explores_are_merged_most_frequently?)
Which Explores are merged most frequently?

You can use the **Merge Query** Explore to find out which Explores are merged the most often and consider joining the tables for better performance and more features.

1. Select **Explore** from **Query**. 2. Select **Count** from **Merge Query Source Query**.

https://<instance_name.looker.com>/explore/system__activity/merge_query?fields=query.

PDT Builds The **PDT Builds** Explore includes information about PDT builds, including time taken to finish builds and the connection and model the PDTs are part of.

Following are some common uses of the **PDT Builds** Explore:
How can I see PDT build times? (\#how_can_i_see_pdt_build_times?)
How can I identify long-running PDTs to alert on?

 (\#how_can_i_identify_long-running_pdts_to_alert_on?)
These queries may take longer to run on instances with many PDTs running concurrently.

How can I see PDT build times?

You can use the **PDT Builds** Explore to view build times for PDTs. For example, to see PDT build times in the past 2 days:
1. Add a filter on **Start Time** from the **PDT Builds** view and set its value to is in the past 2 days.

2. Select Start Time, View Name, Connection, Model Name, **Elapsed Minutes**, and Elapsed Seconds from the **PDT Builds** view.

https://<instance_name.looker.com>/explore/system__activity/pdt_builds?fields=pdt_bui How can I identify long-running PDTs to alert on?

You can use the **PDT Builds** Explore to identify long-running PDTs. Then, you can save the query as a Look and create an alert (/looker/docs/alerts-overview\#creating_an_alert) to notify you if there are PDTs with build times that exceed the threshold you specify.

For example, to see PDTs with an average build time of more than 30 minutes:
1. Add a filter on **Average Build Time Minutes** from the **PDT Builds** view and set its value to is greater than 30.

2. Select View Name, **Connection**, and **Average Build Time Minutes** from the **PDT Builds** view.

To change the value of the filter on **Average Build Time Minutes** from **PDT Builds**, replace 30 in the filter element f[pdt_builds.average_build_time_minutes]=%3E20 with the desired number of minutes:
https://<instance_name.looker.com>/explore/system__activity/pdt_builds?fields=pdt_bui

## Query Performance Metrics

The **Query Performance Metrics** Explore provides detailed breakdowns of each query that is run from your Looker instance.

For example, you can use this Explore to investigate which components of a query took longest to load. You can also use this Explore to identify query performance trends and anomalies. For a more detailed breakdown of the query lifecycle and the fields tracked in this Explore, see the Understanding query performance metrics (/looker/docs/query-performance-metrics) documentation page. Quick Start analyses The **Query Performance** Explore includes Quick Start
 (/looker/docs/creating-and-editing-explores\#quick_start_analyses) analyses, which you can use to quickly answer questions or as starting points for other queries. Select a Quick Start analysis tile in a blank Explore, or from the lightning bolt **Quick Start** menu (/looker/docs/creating-and-editing-explores\#choosing_a_quick_start_option_once_an_explore_has_run) in an Explore that has run, and Looker will show a query with fields that are preselected and sorted to answer one of the following questions:
How much time did each query stage take? Which Explores have the highest average main query execution time? Which users have the highest average main query execution time? Which times of day have the longest asynchronous worker timings?

Which times of day have the longest query initialization timings?

Which times of day have the longest connection handling timings? Which times of day have the longest main query timings? Which times of day have the longest post-query timings?

## Sql Query

The **SQL Query** Explore includes information about the SQL queries that have run, including how recently and frequently, and details about users who have run them. You can use the **SQL Query** Explore to answer questions like the following:
Which users run the most SQL queries? (\#which_users_run_the_most_sql_queries?)
Which users run the most SQL queries?

You can use the **SQL Query** Explore to identify the users who run the most SQL Runner queries:
1. Select ID and **Name** from **User**.

2. Select **Count** from **SQL Runner Query**. 3. Sort in descending order on **Count** from **SQL Runner Query** to list users who run the most queries first.

https://<instance_name.looker.com>/explore/system__activity/sql_query?fields=sql_quer Scheduled Plan The **Scheduled Plan** Explore includes information about all scheduled data deliveries, including both previously scheduled jobs and currently scheduled jobs. Following are some common questions about using the **Scheduled Plan** Explore:
How do I view scheduled plans in a consistent time zone?

 (\#how_do_i_view_scheduled_plans_in_a_consistent_time_zone?)
At which stage do schedules get stuck? (\#at_which_stage_do_schedules_get_stuck?)
How do I find schedule owners? (\#how_do_i_find_schedule_owners?) Which scheduled plans run at the same time? (\#which_scheduled_plans_run_at_the_same_time?) Which schedules are unlimited? (\#which_schedules_are_unlimited?) Is it possible to view history for more than 50 schedules?

 (\#is_it_possible_to_view_history_for_more_than_50_schedules?)
How do I filter results down to a specific set of schedules?

 (\#how_do_i_filter_results_down_to_a_specific_set_of_schedules?)
Can error trends be identified across schedules?

 (\#can_error_trends_be_identified_across_schedules?)
How do I view runtime metrics for schedules? (\#how_do_i_view_runtime_metrics_for_schedules?)
How do I view scheduled plans in a consistent time zone?

You can use the **Scheduled Plan** to view all scheduled plans in a consistent time zone, since System Activity stores time-based data in the System time zone
 (/looker/docs/using-time-zone-settings\#system_time_zone):
1. Select ID, **Name**, and **Next Runtime** from **Scheduled Plan** to view the next runtime for each scheduled plan in the System time zone.

2. Select ID and **Name** from **User** to see the user who created the schedule. 3. Filter on **Run Once (Yes/No)**, and set the filter value to No to exclude deliveries that were sent once (for example, for a delivery of a Look
 (/looker/docs/delivering-looks-explores\#creating_a_delivery)) or sent as a one-time test (for example, for the test delivery of a Look (/looker/docs/delivering-looks-explores\#testing_your_schedule)).

4. You can also add fields like **Cron Schedule** and **Timezone** from the **Scheduled Plan** view.

https://<instance_name.looker.com>/explore/system__activity/scheduled_plan?fields=sch At which stage do schedules get stuck?

You can use the **Scheduled Plan** Explore to identify the stage at which schedules get stuck. For example:
1. To view the stage at which a specific scheduled job got stuck, filter on ID from **Scheduled Job**,
and set the filter value to the scheduled job's ID. Select Stage, **Scheduled Job ID**, and Runtime in Seconds from **Scheduled Job Stage**.

2. You can also select **Started Time** and **Completed Time** from **Scheduled Job Stage**.

You can then use the ID and **Runtime in Seconds** fields to troubleshoot the failed job, based on whether the scheduled job was stuck in, for example, the execute stage or the enqueued for delivery stage.

In the following URL example, you can replace the scheduled job ID 12913 in the filter element &f[scheduled_job.id]=12913 with the ID for the scheduled job you want to filter on:
https://<instance_name.looker.com>/explore/system__activity/scheduled_plan?fields=sch How do I find schedule owners?

You can use the **Scheduled Plan** Explore to find schedule owners:
1. Select ID and **Name** from **Scheduled Plan**. 2. Select ID and **Name** from **User**. 3. Filter on **Run Once (Yes/No)**, and set the filter value to No to exclude deliveries that were sent once (for example, for a delivery of a Look
 (/looker/docs/delivering-looks-explores\#creating_a_delivery)) or sent as a one-time test (for example, for the test delivery of a Look (/looker/docs/delivering-looks-explores\#testing_your_schedule)).

4. To find the owner of a specific schedule, filter on ID from **Scheduled Plan**, and set the filter value to the ID of that schedule.

https://<instance_name.looker.com>/explore/system__activity/scheduled_plan?fields=sch Which scheduled plans run at the same time?

You can use the **Scheduled Plan** Explore to identify plans that are scheduled to run at the same time:
1. Select ID, Name, **Cron Schedule**, and **Next Run Time** from **Scheduled Plan**. 2. Filter on **Run Once (Yes/No)**, and set the filter value to No to exclude deliveries that were sent once (for example, for a delivery of a Look (/looker/docs/delivering-looks-explores\#creating_a_delivery)) or sent as a one-time test (for example, for the test delivery of a Look (/looker/docs/delivering-looks-explores\#testing_your_schedule)).

3. You can also add a filter on **Next Run Time**, and set the filter value to is not null to include only existing scheduled deliveries in the results.

You can then change the timing of schedules (for example, for the delivery of a Look (/looker/docs/delivering-looks-explores\#triggering_delivery)) so that multiple schedules will not run at the same time.

https://<instance_name.looker.com>/explore/system__activity/scheduled_plan?fields=sch Which schedules are unlimited?

You can use the **Scheduled Plan** Explore to find unlimited schedules, or schedules with a row limit of -1:
1. Filter on **Send All Results**, and set the value to Yes. 2. Select ID, Created Time, **Finalized Time**, and **Count** from **Scheduled Job**.

https://<instance_name.looker.com>/explore/system__activity/scheduled_plan?fields=sch Is it possible to view history for more than 50 schedules? Using the **Scheduled Plan** Explore, you can view the histories of more than just the 50 schedules that are available to view on the **Schedule History** (/looker/docs/admin-panel-alerts-and-schedules-schedule-history) admin page. For example:
1. Select ID from **Scheduled Plan**. 2. Select **Name** from **User** to see who created each schedule. 3. Select **Cron Schedule** from **Scheduled Job** to see the scheduled delivery time for each scheduled job as a cron string.

4. Select **Type** from **Scheduled Plan Destination** to see the destination type (for example, for the delivery of a Look (/looker/docs/delivering-looks-explores\#choosing_the_delivery_destination)).

5. Select ID, **Status**, and **Status Detail** from **Scheduled Job** to view the status and any error messages for each scheduled job.

6. Select **Created Time** and **Finalized Time** from **Scheduled Job**. 7. Select **Runtime in Seconds** from **Scheduled Job Stage**.

8. You can also select **Link** from either the **Look** view or the **Dashboard** view for a link to the Look or dashboard for a schedule.

9. To limit results to only a specific timeframe, add a filter on **Created Date** from **Scheduled Job**,
and set the filter value to the desired length of time, such as is in the past 7 days.

10. Filter on **Run Once (Yes/No)**, and set the filter value to No to exclude deliveries that were sent once (for example, for a delivery of a Look
 (/looker/docs/delivering-looks-explores\#creating_a_delivery)) or sent as a one-time test (for example, for the test delivery of a Look (/looker/docs/delivering-looks-explores\#testing_your_schedule)).

https://<instance_name.looker.com>/explore/system__activity/scheduled_plan?fields=sch How do I filter results down to a specific set of schedules? You can use the **Scheduled Plan** Explore to view only a specific set of schedules by filtering, for example, on specific dashboards, owners, or models. For example, to view a list of schedules based on a specific model, such as thelook:
1. Add a filter on **Model** from the **Query** view, and set the filter value to the name of the model. 2. Select ID and **Name** from **Scheduled Plan**. 3. Select **Name** from **User** to see who created each schedule. 4. Select **Cron Schedule** from **Scheduled Plan** to see the scheduled delivery time for each schedule as a cron string.

5. You can also select **Link** from either the **Look** view or the **Dashboard** view for a link to the Look or dashboard for a schedule.

6. Filter on **Run Once (Yes/No)**, and set the filter value to No to exclude deliveries that were sent once (for example, for a delivery of a Look
 (/looker/docs/delivering-looks-explores\#creating_a_delivery)) or sent as a one-time test (for example, for the test delivery of a Look (/looker/docs/delivering-looks-explores\#testing_your_schedule)).

In the following URL example, you can replace the model name thelook in the filter element f[query.model]=thelook with the name of the model you want to filter on:
https://<instance_name.looker.com>/explore/system__activity/scheduled_plan?fields=sch Can error trends be identified across schedules?

Another use case for the **Scheduled Plan** Explore can be to identify error trends across schedules, such as, for example, finding that SFTP schedules are failing with a specific error message:
1. Select Created Time, Finalized Time, ID, **Status**, and **Status Detail** from **Scheduled Job** to see a list of scheduled jobs and their statuses and error messages.

2. Select **Stage** from **Scheduled Job Stage**. 3. Select **Type** and **Format** from **Scheduled Plan Destination** to see the destination type (for example, for the delivery of a Look (/looker/docs/delivering-looks-explores\#choosing_the_delivery_destination)) and data format (for example, for the delivery of a Look (/looker/docs/delivering-looks-explores\#choosing_the_data_format) ).

4. Filter on **Status** from **Scheduled Job**, and set the filter value to failure to include only scheduled jobs that have failed.

5. To include results for only a specific destination, filter on the **Type** field from Scheduled Plan Destination, and set the filter value to the desired destination, such as sftp or email.

https://<instance_name.looker.com>/explore/system__activity/scheduled_plan?fields=sch How do I view runtime metrics for schedules?

You can use the **Scheduled Plan** Explore to investigate runtime metrics for schedules. For example, to view the average runtimes for schedules:
1. Select ID and **Name** from **Scheduled Plan**.

2. Select **Name** from **User**.

3. Select **Cron Schedule** from **Scheduled Plan**. 4. Select **Average Runtime in Seconds** from **Scheduled Job Stage**. 5. Filter on **Run Once (Yes/No)**, and set the filter value to No to exclude deliveries that were sent once (for example, for a delivery of a Look (/looker/docs/delivering-looks-explores\#creating_a_delivery)) or sent as a one-time test (for example, for the test delivery of a Look (/looker/docs/delivering-looks-explores\#testing_your_schedule)).

https://<instance_name.looker.com>/explore/system__activity/scheduled_plan?fields=sch To see runtimes for scheduled jobs:
1. To view runtimes for all the jobs for a specific plan, add a filter on ID from **Scheduled Plan**, and set the filter value to the desired scheduled plan ID.

2. Select ID from **Scheduled Plan**.

3. Select **Name** from **User**. 4. Select **Cron Schedule** from **Scheduled Plan**. 5. Select ID, Status, **Created Time**, and **Finalized Time** from **Scheduled Job**.

6. Select **Runtime in Seconds** from **Scheduled Job Stage**.

7. Filter on **Run Once (Yes/No)**, and set the filter value to No to exclude deliveries that were sent once (for example, for a delivery of a Look (/looker/docs/delivering-looks-explores\#creating_a_delivery)) or sent as a one-time test (for example, for the test delivery of a Look (/looker/docs/delivering-looks-explores\#testing_your_schedule)).

To change the filter on ID from **Scheduled Plan** in the following URL example, replace 145 in the filter element f[scheduled_plan.id]=145 with the ID of the scheduled plan you want to filter on:
https://<instance_name.looker.com>/explore/system__activity/scheduled_plan?fields=sch User The **User** Explore includes details about each user, including historical queries run, and the content and folders to which they have access.

Quick Start analyses The **User** Explore includes Quick Start (/looker/docs/creating-and-editing-explores\#quick_start_analyses) analyses, which you can use to quickly answer questions or as starting points for other queries.

![29_image_0.png](29_image_0.png)

Select a Quick Start analysis tile in a blank Explore, or from the lightning bolt **Quick Start** menu

![29_image_1.png](29_image_1.png)

 (/looker/docs/creating-and-editing-explores\#choosing_a_quick_start_option_once_an_explore_has_run) in an Explore that has run, and Looker will show a query with fields that are preselected and sorted to answer one of the following questions:
How many enabled users have the viewer permission (access_data (/looker/docs/admin-panel-users-roles\#access_data))? Which users had greater than 3 scheduled jobs fail over the past 7 days? When was the last time a particular user logged in?

Which users are the most active?

Which users haven't logged in for over 90 days? Which users have had access disabled? Which users have the developer permission (develop (/looker/docs/admin-panel-users-roles\#develop))?

How many users are in each role?

How do I view which Google personnel have accessed my instance?

In addition to the **Recent Access** panel in the **Support Access** page (/looker/docs/admin-panel-general-support-access\#support_access_audit), you can view information about which Google personnel have accessed your instance. For example, to view which Google personnel accessed your instance, how many minutes they accessed your instance, and how many queries they ran:
1. Select **Name** from **User**. 2. Select **Approximate Web Usage in Minutes** and **Query Counts > Query Run Count** from History.

3. Filter on Created Date > Date in **History**, and set the value to the time period for which you want to view access by Google personnel.

4. Filter on Source > Source in **History** and set the value to is not equal to scheduled_task to eliminate any scheduled tasks.

5. Filter on User Permissions > Is Looker Employee (Yes / No) in **User Facts** and set the value to is Yes to view only Google personnel.

https://<instance_name>/explore/system__activity/user?fields=user.name,history.approx

## Guided Analyses In System Activity Labs Feature

Guided analyses let Looker admins and users who have been granted the see_system_activity (/looker/docs/admin-panel-users-roles\#see_system_activity) permission quickly answer key questions about instance usage in the **History** (\#history) Explore with a question-and-answer format. For users to be able to access guided analyses, an admin must enable the **Guided analyses in System Activity** Labs feature (/looker/docs/admin-panel-general-labs\#guided_analyses_in_system_activity). A guided analysis includes pre-populated fields, values, and options to select from, as well as a visualization displaying the selected metrics.

The visualization type is chosen by Looker to best display the data selected, and it cannot be changed.

Users can currently access several guided analysis options from the **History** (\#history) Explore:
Which users are most active in your instance? - Understand who's getting the most value out of your instance What content is taxing your instance? - Identify heavily used content User audit - Understand user activity by type and role Instance usage over time - Compare different activity metrics over time Choosing a guided analysis from a blank Explore To run a guided analysis, select the analysis option that you want to use. Analysis options are displayed in the **Guided Analysis** section above the **Quick Start** analysis options.

![31_image_0.png](31_image_0.png) Once the guided analysis has run, you can customize the data values (\#customizing_a_guided_analysis) to answer key questions, explore further (\#exploring_further_into_an_analysis) into the analysis, or save the analysis (\#saving_an_analysis) to share with other users who have access. To close the analysis, simply close its browser tab.

Choosing a guided analysis once an Explore has run If you have already run a System Activity **History** Explore, you can select a guided analysis by selecting the **Quick Start** button next to the Explore name.

•

![32_image_0.png](32_image_0.png)

![32_image_1.png](32_image_1.png)

-
•
+
-

## This Action Launches The Quick Start Menu. Guided Analysis

 A new experimental approach to analyzing your data

![32_image_3.png](32_image_3.png)

M
What content is taxing rs User Audit your instance?

Identify heavily used content Understand user activity by type and role

![32_image_2.png](32_image_2.png)

## Quick Start

Explore from a prebuilt analysis in History

![32_image_5.png](32_image_5.png)

![32_image_4.png](32_image_4.png)

Select a guided analysis from the **Quick Start** menu to open and run the guided analysis in a new browser tab.

Once the guided analysis has run, you can customize the data values (\#customizing_a_guided_analysis)
to answer key questions, explore further (\#exploring_further_into_an_analysis) into the analysis, or save the analysis (\#saving_an_analysis) to share with other users who have access. To close the analysis, simply close its browser tab.

## Customizing A Guided Analysis

Once you have selected a guided analysis from a blank Explore
 (\#choosing_a_guided_analysis_from_a_blank_explore) or an Explore's **Quick Start** menu
 (\#choosing_a_guided_analysis_once_an_explore_has_run), the analysis will automatically open and run in a new browser tab.

When the guided analysis has finished running, you can change and create combinations of prepopulated values by selecting values and conditions from drop-down menus, date menus, or radio button options, depending upon the analysis. For example, you can select the **What content is taxing your instance?** analysis to identify heavily used content on your Looker instance. After the guided analysis has loaded, you can change the default timeframe value in Over what timeframe? to **Last 30 days**.

![33_image_0.png](33_image_0.png)

The guided analysis will automatically update with the selected timeframe value.

At this stage, you can choose whether to make additional insights into the analysis by exploring (\#exploring_further_into_an_analysis) the data further. You can save the analysis (\#saving_an_analysis) as a Look or to a dashboard to share with other users who have access, or you can close the analysis by closing its browser window.

Guided Analysis three-dot Options menu The three-dot **Options** menu in a guided analysis lets users:
Explore further into a guided analysis (\#exploring_further_into_an_analysis) Save a guided analysis (\#saving_an_analysis)
Reload a guided analysis (\#reloading_an_analysis)

![34_image_0.png](34_image_0.png)

![34_image_1.png](34_image_1.png)

![34_image_2.png](34_image_2.png)

## Exploring Further Into A Guided Analysis

![34_Image_3.Png](34_Image_3.Png)

Once you have the initial data from a guided analysis, you may choose to further explore the data. To do so, you can select the three-dot **Options** menu, and then select **Explore from Here**.

![35_image_0.png](35_image_0.png)

A new browser tab will open with an Explore that is pre-loaded with the fields and visualization from the guided analysis.

![35_image_1.png](35_image_1.png)

You can make further data insights by adding or removing fields, pivots, or filters, among other customizations. See the Creating and editing Explores (/looker/docs/creating-and-editing-explores)
documentation page for more Explore best practices and tips.

Saving a guided analysis After customizing a guided analysis, you may want to save the analysis to share with others that have access. You can save a guided analysis in two ways:
Add the guided analysis visualization to a dashboard
 (\#adding_a_guided_analysis_visualization_to_a_dashboard)
Save the guided analysis as a Look (\#saving_a_guided_analysis_as_a_look)
Adding a guided analysis visualization to a dashboard To add a guided analysis visualization to a dashboard, open the Save Guided Analysis to a Dashboard menu by selecting **+ Add to Dashboard** from the three-dot **Options** menu.

![36_image_0.png](36_image_0.png) Once the **Save Guided Analysis to a Dashboard** menu opens, follow these steps:

Save Guided Analysis to a Dashboard

![37_image_0.png](37_image_0.png)

![37_image_1.png](37_image_1.png)

![37_image_4.png](37_image_4.png)

![37_image_6.png](37_image_6.png)

![37_image_3.png](37_image_3.png)

![37_image_2.png](37_image_2.png)

![37_image_5.png](37_image_5.png)

![37_image_7.png](37_image_7.png)

![37_image_8.png](37_image_8.png)

1. Input a title for the guided analysis dashboard tile.

2. Select a folder where the dashboard to which you would like to add the guided analysis is sved.

3. Select the desired dashboard.

4. Select Save.

A dialog box will pop up to notify you that the guided analysis has been added to the selected dashboard.

5. Select the link to navigate to the dashboard to view or make edits

![38_image_0.png](38_image_0.png)

 (/looker/docs/editing-user-defined-dashboards) to the dashboard.

6. Alternatively, select **Done** to exit the pop-up.

Saving a guided analysis as a Look To save a guided analysis as a Look, select the **Explore from Here** option from the three-dot **Options** menu:

![38_image_1.png](38_image_1.png)

A new browser tab will open with an Explore that is pre-loaded with the fields and visualization from the guided analysis:
Explore 2 rows · 1s · just now · America · Los Angeles Run i

![39_image_1.png](39_image_1.png)

![39_image_2.png](39_image_2.png)

![39_image_3.png](39_image_3.png)

![39_image_0.png](39_image_0.png)

Follow these steps to save the Explore as a Look:
ol

![40_image_0.png](40_image_0.png)

![40_image_2.png](40_image_2.png)

SOL
Add calculation

![40_image_1.png](40_image_1.png)

![40_image_3.png](40_image_3.png)

CTRL + K

| Remove fields and filters   |                           |    |                         |
|-----------------------------|---------------------------|----|-------------------------|
| User Facts Is Explore       | User Facts Is Viewer (Yes |    |                         |
| (Yes / No)                  | / No)                     |    |                         |
| Yes                         | Yes                       | f  | Clear cache and refresh |
| Yes                         | Yes                       |    |                         |

↑ + CTRL + →
1. In the upper right of the Explore, select the gear menu. 2. Choose Save. 3. Select As a Look to open the Save Look menu.

![41_image_0.png](41_image_0.png)

4. In the **Title** field, enter a new title. If you will be saving over an existing Look, leave this field blank.

5. In the **Description** field, you can enter a description of the Look. If you will be saving over an existing Look, leave this field blank.

6. In the **Folder** field, check whether the current folder is the desired destination. The **Folder** field shows the name and location of the selected folder, and the right side displays the contents of the selected folder. If you choose a folder in which you are not allowed to save the Look, a warning will be displayed at the bottom of the menu, and the **Save & View Look** button will be deactivated.

7. If you want to save to a different folder, navigate to the folder where you want to save your Look. You can navigate to the folder in any of the following ways:
In the **Folder** field, select any parent folders to navigate there. On the left side, select the name of a top-level folder to navigate to it.

On the right side, select the name of a subfolder you would like to use or navigate to one of its subfolders.

If there are many subfolders, you can enter the subfolder name into the **Filter by title** field to have the list filtered to just that subfolder.

8. If you want to save over an existing Look, scroll down or use the **Filter by title** field to find and select the desired Look. The Look's title and description (if any) appear in the **Title** and Description fields.

9. Save your Look.

To save your Look and return to the Explore page, select **Save**.

To save and view your Look, select **Save & View Look**.

You can also select other options from the Explore to save or share the **Guided Analysis** Explore, such as:
Download (/looker/docs/downloading\#downloading_data_from_a_look_or_an_explore) - To download the **Guided Analysis** Explore Send (/looker/docs/send-once) - To send the **Guided Analysis** Explore as a one-off delivery Save and Schedule (/looker/docs/scheduling\#delivery_options) - To save the **Guided Analysis** Explore as a Look or dashboard and set a recurring delivery Merge Results (/looker/docs/merged-results) - To merge the **Guided Analysis** Explore results with other Explore results Reloading a guided analysis To reload the data in a guided analysis, select the **Reload** option from the three-dot **Options** menu.

![42_image_0.png](42_image_0.png)

The guided analysis will refresh and display the latest data.

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License
 (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies
 (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-04-16 UTC.