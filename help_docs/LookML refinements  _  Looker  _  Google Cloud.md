Note that you are viewing Looker documentation. For Looker Studio documentation, visit https://support.google.com/looker-studio (https://support.google.com/looker-studio).

## Lookml Renements

Note: This is an advanced topic that assumes that the reader has a solid knowledge of LookML.

## Overview

With LookML refinements, you can adapt an existing view (/looker/docs/reference/param-view-view) or Explore
 (/looker/docs/reference/param-explore-explore) without editing the LookML file that contains it. This is ideal for:
Projects with Looker Blocks (/looker/docs/blocks), which use prebuilt pieces of LookML
Projects that import files from other projects (/looker/docs/importing-projects)
Projects where you often need to generate your files from tables in your database (/looker/docs/generating-a-model)
Situations where you want to share LookML between models or projects while making customizations in each place (hub-andspoke configurations)
For example, if you have the following view file in your project:
view: flights {
sql_table_name: flightstats.accidents ;; dimension: id {
label: "id" primary_key: yes type: number sql: ${TABLE}.id ;;
}
}
You can refine the flights view as shown in the following example: Use the view parameter with the same view name, but add a plus sign (+) in front of the name to indicate that it's a refinement of an existing view.

This refinement adds an air_carrier dimension to the existing flights view:
view: +flights {
dimension: air_carrier {
type: string sql: ${TABLE}.air_carrier ;;
}
}
This refinement can go in any LookML file in the project, such as a model file, view file, or in its own dedicated LookML file. See the Using refinements in your LookML project (\#using_refinements_in_your_lookml_project) section for how it works.

The refinement combined with the original LookML has the end result as if this were the original LookML for the view:
view: flights {
sql_table_name: flightstats.accidents ;;
dimension: id {
label: "id" primary_key: yes type: number sql: ${TABLE}.id ;;
}
dimension: air_carrier {
type: string sql: ${TABLE}.air_carrier ;;
}
}
In the Looker UI, users will see the **Air Carrier** dimension, just as if you had added the dimension to the original view file itself. See the example below (\#example) for more detailed implementation information.

Refinements compared to extends Looker also supports extending (/looker/docs/reusing-code-with-extends) LookML objects. Extending is useful when you want to create a new copy of an existing view or Explore so that you can add new objects to it. For example, you can create a base view that defines all your fields and then create multiple new views that extend the base view. These new views can then be modified to hide certain fields in the base view, or to change definitions or labels for the fields from the base view.

Refinements are useful when you want to modify an existing view or Explore with some tweaks or adjustments to certain objects, but you don't want to create copies of the view or Explore. Refinements are ideal for situations where you cannot or do not want to modify the base view or Explore, and for situations where creating a new view or Explore would require extensive changes to other LookML references. See the Example (\#example) section on this page for an example of this use case.

For most use cases, refinements are a simpler and cleaner alternative to extends. Advanced LookML developers may want to use the extends (/looker/docs/reusing-code-with-extends) parameter inside a LookML
refinement. See the Refinements can contain extends (\#refinements_can_contain_extends) section on this page for more information.

Refinements override most parameters It is important to note that in most cases a refinement will override the original settings of an object. In the following example, the original view has a hidden dimension (hidden: yes):
view: faa_flights {
dimension: carrier {
hidden: yes
}
}
And in another file there is a refinement to that dimension with hidden: no:
include: "/views/faa_flights.view.lkml" view: +faa_flights {
dimension: carrier {
hidden: no
}
}
The last refinement takes precedence, so hidden: no is applied and the dimension will be displayed in the final view.

There are some cases where refinements are *additive* instead of overriding; see the Some parameters are additive
 (\#some_parameters_are_additive) section of this page for more information.

Some parameters are additive In many cases, if the refinement contains the same parameter as the object being refined, the refinement will override the parameter values of the refined object (\#refinements_override_parameters). But refinements can be *additive* for some parameters, meaning that the values from the base object are used in conjunction with the values from the refined object.

The following parameters are *additive*:
For dimensions and measures:
action (/looker/docs/reference/param-field-action) filters (/looker/docs/reference/param-field-filters) link (/looker/docs/reference/param-field-link)
For parameters:
allowed_value (/looker/docs/reference/param-field-parameter\#specifying_allowed_values)
For derived tables:
bind_filters (/looker/docs/reference/param-view-explore-source\#bind_filters_example)
dev_filters (/looker/docs/reference/param-view-explore-source\#dev_filters) filters (/looker/docs/reference/param-view-explore-source\#filters) sorts (/looker/docs/reference/param-view-explore-source\#sorts)
For views:
extends (/looker/docs/reference/param-view-extends) (See the Refinement extends are additive (\#additive) section on this page for more information.)
For Explores:
access_filter (/looker/docs/reference/param-explore-access-filter)
aggregate_table (/looker/docs/reference/param-explore-aggregate-table)
extends (/looker/docs/reference/param-explore-extends) (See the Refinement extends are additive (\#additive) section on this page for more information.)
join (/looker/docs/reference/param-explore-join)
query (/looker/docs/reference/param-explore-query)
For example, here is a view that has a name dimension with a link parameter:
view: carriers {
sql_table_name: flightstats.carriers ;;
dimension: name {
sql: ${TABLE}.name ;;
type: string link: {
label: "Google {{ value }}"
url: "http://www.google.com/search?q={{ value }}"
icon_url: "http://google.com/favicon.ico"
}
}
}
And here is a refinement to the carriers view, with a name dimension that has different values for the link parameter:
include: "/views/carriers.view.lkml" view: +carriers {
label: "Refined carriers" dimension: name {
sql: ${TABLE}.name ;; type: string link: {
label: "Dashboard for {{ value }}"
url: "https://docsexamples.dev.looker.com/dashboards/307?Carrier={{ value }}"
icon_url: "https://www.looker.com/favicon.ico"
}
}
}
In the refined carriers view, the two link parameters are additive, so the name dimension will display both links.

![3_image_0.png](3_image_0.png)

Refinements are applied in order An object can be refined multiple times and in multiple places, which lets Looker developers use refinements in a lot of creative ways. But this also means that developers have to be very mindful of the order in which refinements are applied:
Within a project, refinements are applied in the order in which their files are included. Refinements from files included last will override refinements from files included earlier.

Within a single file, refinements are applied line by line going downwards. Refinements with the highest line number are applied last and will override any earlier refinements, if there are conflicts.

Note: You can use the final: yes flag to verify that your refinements are being applied in the order you expect. See the Using final: yes to prevent further refinements (\#final) section for details.

For example, in the following view file there are two refinements of the faa_flights view. The first refinement hides a dimension
(hidden: yes), and the second refinement displays the dimension (hidden: no). When there are conflicts like this, the refinement furthest down in the file takes precedence:
include: "//e_faa_original/views/faa_flights.view.lkml" view: +faa_flights {
dimension: carrier {
hidden: yes
}
} view: +faa_flights {
dimension: carrier {
hidden: no
}
}
The logic is similar for including multiple files in a project: Refinements in the last file listed in the includes will take precedence. For example, if a model file includes these files:
include: "/refinements/distance_analysis.lkml" include: "/refinements/finishing_touches.lkml" Any refinements in the distance_analysis.lkml will be applied first, and then any refinements in the finishing_touches.lkml file will be applied. If there are any conflicts, the refinements in the last file, finishing_touches.lkml, will take precedence.

Note: Because refinements leverage the order of includes, you should not use wildcards in your includes if you want to use refinements. As a general practice, it's best to avoid using wildcards with views anyway, especially if your project has a large number of view files
 (/looker/docs/reference/param-model-include\#including_all_view_files_can_affect_performance_of_lookml_validation) or if your project uses persistent derived tables (PDTs) (/looker/docs/reference/param-model-include\#including_all_view_files_can_clutter_your_database_schema). But with refinements in particular, using wildcards in your includes is not recommended.

Using final: yes to prevent further refinements As previously described, the same object can be refined multiple times in multiple places, and the last refinement (\#order) will override (\#overrides) all previous refinements.

If you have a refinement that you want to be considered the final refinement for the view or Explore, you can add the final: yes flag to the refinement. The Looker IDE will return a LookML error if there are existing refinements that would be applied after this final refinement, or if a developer tries to add a new refinement that would be applied after this final refinement. For example, the second refinement in this view file would create a LookML error because the previous refinement has the final: yes flag:
include: "//e_faa_original/views/faa_flights.view.lkml" view: +faa_flights {
final: yes dimension: carrier {
hidden: yes
}
}
view: +faa_flights {
dimension: carrier {
hidden: no
}
}
Adding the final: yes flag to a refinement is a good way to verify that your refinements are being applied in the order you intend.

Refinements can contain extends Advanced LookML developers may want to use an extends parameter inside a LookML refinement, which adds the extended object to the object being refined. To summarize the behavior of extends and refinements:
Extending an object creates a new copy of the object and then builds upon it. For example, you can create a base view that defines all your fields and then create multiple new views that extend the base view. Each of these new views will incorporate a copy of the base view, and from there a developer can add different fields, filters, or other properties to modify what is in the base view. The idea is that you start with a base object and then use it in different ways in multiple other objects. (You can see the Reusing code with extends (/looker/docs/reusing-code-with-extends) documentation page for a full discussion of working with extends.)
Refining an object adds a layer of modifications to the object, but, unlike extending, refining doesn't make multiple copies of the object. The idea is to build upon a base object without modifying its original LookML.

As an example of the standard usage of refinements, here is an Explore called orders and the +orders Explore that refines it:
explore: orders {
view_name: orders \# other Explore parameters
}
explore: +orders {
label: "Orders Information"
\# other Explore parameters to build on the original Explore
}
On top of this, you can add a refinement that includes an extends. Building on the example, here is the same orders Explore. But in addition, there's a base Explore called users_base, and now the +orders refinement has an extends parameter that brings in the users_base:
explore: users_base {
view_name: users extension: required \# other Explore parameters
}
explore: orders {
view_name: orders
\# other Explore parameters
}
explore: +orders {
label: "Orders Information" extends: [users_base]
\# other Explore parameters to build on the original Explore
}
What's special here is that the +orders refinement has an extends within it. The result is that +orders view will now extend the users_base Explore.

How Looker implements extends **inside refinements**
Extending an object inside a refinement is an advanced LookML concept. Before using extends in a refinement, you should have a deep understanding of the following:
How Looker implements extends: If a LookML element is defined in both the extended object and the extending object, the version in the extending object is used, unless the parameter is additive
 (/looker/docs/reusing-code-with-extends\#some_parameters_are_additive). See the Reusing code with extends (/looker/docs/reusing-code-with-extends\#implementation_details_for_extends) documentation page for details.

How Looker implements refinements: If a LookML element is defined in multiple refinements, the last refinement overrides previous refinements. See the Refinements are applied in order (\#order) section on this page for details.

Lastly, you should understand how Looker combines these principles to implement extends used in refinements. Here is the order that Looker implements, with each step overriding the previous in the case of conflicts:
1. Values from the extends specified in the object 2. Values from the extends specified in refinements of the object 3. Values from the object 4. Values from the refinements of the object To illustrate, here is an example that follows the value of the label parameter through each step of the implementation:
explore: orders_base {
label: "Orders Base" view_name: orders extension: required
}
explore: users_base {
label: "Users Base" view_name: users extension: required
}
explore: orders {
label: "Orders" extends: [orders_base]
}
explore: +orders {
label: "Orders Refined" extends: [users_base]
}
Here is how Looker implements the value of label for the orders Explore in this example:
1. **Values from the** extends **specified in the object.** Since the orders Explore has an extends parameter, Looker starts with the LookML elements from the object that is being extended, which in this case is the orders_base Explore. At this point, the label value is "Orders Base".

2. **Values from the** extends **specified in refinements of the object.** Since orders has a refinement, and the refinement has an extends parameter, Looker then applies LookML elements from the refinement's extension, which in this case is the users_base Explore. At this point, the label value is "Users Base".

3. **Values from the object.** Now that all extensions have been addressed, Looker applies elements from the extending object, which in this case is the orders Explore. If there are any conflicts, the extending object wins. So now, the label value is
"Orders".

4. **Values from the refinements of the object.** Finally, Looker applies elements from any refinements of the orders Explore. If there are any conflicts, the refinement object wins. So now, the label value is "Orders Refined".

Refinement extends **are additive**
As described in the Refinements override parameters (\#refinements_override_parameters) section on this page, refinements generally override the original settings of an object. This is not the case for the extends parameter. When extends is used in a refinement, the value in the extends parameter is appended to the list of items extended in the original object or in previous refinements, if any.

Then, if there are any conflicts, priority is given to the last item in the chain of extends.

For example, here is a base Explore called orders_base and an orders Explore that extends the base. In addition, there's a users_base Explore and the +orders refinement that extends users_base:
explore: orders_base {
view_name: orders extension: required
\# other Explore parameters
} explore: users_base {
view_name: users extension: required
\# other Explore parameters
} explore: orders {
extends: [orders_base]
\# other Explore parameters to build on the base Explore
}
explore: +orders {
extends: [users_base]
\# other Explore parameters to build on the base Explores
}
The orders Explore extends the orders_base, then the +orders refinements adds the users_base to the extends list. The result is that +orders Explore will now extend both orders_base and users_base, as if this were the original LookML for the Explore:
explore: orders {
extends: [orders_base, users_base]
}
Then, if there are any conflicts, priority is given to the last item in the chain of extends. In this example, the elements in users_base would override any conflicting elements in orders_base. The concept of extending more than one object at a time is discussed on the Reusing code with extends
 (/looker/docs/reusing-code-with-extends\#extending_more_than_one_object_at_the_same_time) documentation page. One last thing to note: in this example, the order of the explore parameters doesn't matter. But in cases with multiple refinements of the same object, the order of the refinements does matter. As described in the Refinements are applied in order (\#order) section on this page, the last refinement in a file overrides previous refinements.

## Using Refinements In Your Lookml Project

Here are the broad steps for refining views and Explores in your project:
1. Identify the view or Explore you want to refine.

2. Decide where you want to house your refinements. You can add refinements in any existing LookML file, or you can create separate LookML files for your refinements. (See the procedure for creating a data test file
 (/looker/docs/other-project-files\#creating_data_test_files) on the **Understanding other project files** documentation page for an example of creating generic LookML files.)
3. Use the include (/looker/docs/reference/param-model-include) parameter to incorporate your refinements into your model:
In the file where you write your refinements, you must include the files of the LookML that you're refining. The Looker IDE
will give you warnings if you try to refine an object that is not included.

In your model file, include the files where your refinements are defined. You can combine files and use includes in very creative ways; see the Using refinements to add layers to your model (\#layers) section on this page for details.

## Example

Refining LookML objects is an easy way to adapt views and Explores without having to edit the original LookML. This is especially handy when your views and Explores are read-only in your project, such as with files imported from other projects
 (/looker/docs/importing-projects). Here is an example of refining an Explore. Here is the LookML for the aircraft Explore:
explore: aircraft {
join: aircraft_types {
type: left_outer sql_on: ${aircraft.id} = ${aircraft_types.id} ;;
relationship: many_to_one
}
join: aircraft_engine_types {
type: left_outer sql_on: ${aircraft.id} = ${aircraft_engine_types.id} ;;
relationship: many_to_one
}
}
This Explore contains several views, each of which has many dimensions.

Now, another LookML project called e_faa_refined imports the aircraft Explore file. In the e_faa_refined project you can use a refinement to dramatically simplify the aircraft Explore.

Because the aircraft Explore is an imported file, you can't edit it directly. Instead, you can add a refinement to it. Here is an example of a separate file called refinements.lkml that contains this LookML:
include: "//e_faa_original/Explores/aircraft.explore.lkml" explore: +aircraft {
label: "Aircraft Simplified" fields: [aircraft.aircraft_serial, aircraft.name, aircraft.count]
}
The refinements.lkml file contains the following:
The include parameter to bring in the original aircraft.explore.lkml file from the imported project (see the Importing files from other projects (/looker/docs/importing-projects\#referencing_files_from_an_imported_project) documentation page for details on how to refer to imported project files).

Refinements to the aircraft Explore:
The + sign in front of the Explore name indicates a refinement to an existing Explore. The label (/looker/docs/reference/param-explore-label) parameter changes the Explore's label to "Aircraft Simplified". The fields (/looker/docs/reference/param-explore-fields) parameter specifies that only three fields will be displayed in the Explore.

The end result is as if this were the original aircraft Explore and aircraft view:
explore: aircraft {
label: "Aircraft Simplified" }
view: aircraft {
sql_table_name: flightstats.aircraft ;; dimension: aircraft_serial {
type: string sql: ${TABLE}.aircraft_serial ;;
} dimension: name {
type: string sql: ${TABLE}.name ;;
}
measure: count {
type: count
}
}
For an example of using refinements to customize a single view for multiple use cases, see the Maximizing code reusability with DRY LookML: Customizing a single base view for multiple use cases (/looker/docs/best-practices/dry-cookbook-5) cookbook recipe.

## Other Use Cases For Refinements

As previously mentioned, refinements are ideal for adapting LookML objects that are read-only, such as Looker Blocks
 (/looker/docs/blocks) or imported files (/looker/docs/importing-projects). But once you get a feel for adding refinements and including them in your models, you can do very cool things with your projects, as described in the following examples.

Using refinements to add analyses You can use refinements to add analyses to your model without touching the original LookML files. For example, if there is a project where the views and Explores are generated from tables in your database (/looker/docs/generating-a-model) and stored in a LookML file called faa_basic.lkml, you can create an faa_analysis.lkml file where you use refinements to add analyses. Here is an example of a new derived table called distance_stats that has a distance analysis. This example shows a refinements of the existing flights Explore from the faa_basic.lkml file that joins the distance_stats derived table into the flights Explore. Also, at the bottom of the example, the existing flights view is refined to add new fields from the analysis:
include: "faa_basic.lkml" explore: +flights {
join: distance_stats {
relationship: one_to_one type: cross
}
} view: distance_stats {
derived_table: {
explore_source: flights {
bind_all_filters: yes column: distance_avg {field:flights.distance_avg} column: distance_stddev {field:flights.distance_stddev}
}
} dimension: avg {
type:number sql: CAST(${TABLE}.distance_avg as INT64) ;;
}
dimension: stddev {
type:number sql: CAST(${TABLE}.distance_stddev as INT64) ;;
}
}
view: +flights {
measure: distance_avg {
type: average sql: ${distance} ;;
}
measure: distance_stddev {
type: number sql: STDDEV(${distance}) ;;
} dimension: distance_tiered2 {
type: tier sql: ${distance} ;; tiers: [500,1300]
}
}
Using refinements to add layers to your model Another interesting use case for refinements is to add layers to your project. You can create multiple refinement files and then include them strategically to add layers.

For example, in the FAA project there is a faa_raw.lkml file that contains all the views and Explores that were generated from tables in your database (/looker/docs/generating-a-model). This file has a view for every table in the database, each with a dimensions for each database column. In addition to the raw file, you can create an faa_basic.lkml file to add a new layer with basic refinements, such as adding joins to your Explores, or adding measures to your views, like this:
include: "faa_raw.lkml" explore: +flights {
join: carriers {
sql_on: ${flights.carrier} = ${carriers.name} ;;
}
} view: +flights {
measure: total_seats {
type: sum sql: ${aircraft_models.seats} ;;
}
}
You can then add an faa_analysis.layer.lkml file to add a new layer with analyses (see the Using refinements to add analyses
 (\#analysis) subsection for an example of an analysis file).

From there, you just need to include all the refinement files into the model file. You can also use the model file to add refinements to point your views at the database tables you want to reference:
connection: "publicdata_standard_sql" include: "faa_raw.lkml" include: "faa_basic.lkml" include: "faa_analysis.lkml" view: +flights {
sql_table_name: lookerdata.faa.flights;;
} view: +airports {
sql_table_name: lookerdata.faa.airports;;
}
view: +aircraft {
sql_table_name: lookerdata.faa.aircraft;;
} view: +aircraft_models{
sql_table_name: lookerdata.faa.aircraft_models;;
} view: +carriers {
sql_table_name: lookerdata.faa.carriers;;
}
You can duplicate this model file and point to different database tables, or you can include different refinement files that you've created to define other layers you want in your model.

Using refinements for PDTs As described in the Refinements compared to extends (\#vs_extends) section on this page, an extension creates a new copy of the object that is being extended. In the case of persistent derived tables (PDTs) (/looker/docs/derived-tables\#persistent_derived_table), you shouldn't use extensions, since each extension of a PDT will create a new copy of the table in your database. However, you can add refinements to the PDT's view, since refinements don't create a new copy of the object being refined.

Using metadata to see refinements for an object You can click on an explore or a view parameter in the Looker IDE and use the metadata panel to see any refinements on the object. See the Metadata for LookML objects (/looker/docs/lookml-metadata\#metadata_for_refinements) documentation page for information.

Things to consider Projects with localization When you're refining an object, be aware that localization rules apply to your refinements as well. If you are refining an object and then defining new labels or descriptions, you should provide localization definitions in your project's locale strings files. See the Localizing your LookML model (/looker/docs/model-localization\#understanding_how_localization_rules_apply_to_extended_objects)
documentation page for more information.

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates. Last updated 2024-06-21 UTC.