Note that you are viewing Looker documentation. For Looker Studio documentation, visit https://support.google.com/looker-studio (https://support.google.com/looker-studio).

local_dependency Usage local_dependency: {
project: "other_project" override_constant: constant_name {
value:"string"
}
}
Hierarchy Manifest file
 (/looker/docs/reference/param-project-manifest)
local_dependency Default value None Accepts A project subparameter, which accepts a string specifying the name of one other project that has files that you want to include An override_constant subparameter, which is used to override the value of a constant imported from another project

## Definition

To use this parameter, you must have the experimental Labs feature **Local Project Import**
 (/looker/docs/admin-panel-general-labs\#local_project_import) enabled. Experimental features are not fully developed and may be significantly changed or completely removed.

local_dependency specifies the name of another LookML project that has files that you want to use in this project. When importing files from another project (/looker/docs/importing-projects), you must create a manifest file (/looker/docs/importing-projects\#creating_a_project_manifest_file) and use the local_dependency parameter to specify a project from which to import files.

You can use the project subparameter of local_dependency to specify the name of a single project to import files from. To import files from multiple projects, you can include multiple local_dependency statements in the manifest file.

Constants (/looker/docs/reference/param-manifest-constant) can also be passed between projects (/looker/docs/importing-projects\#passing_constants_between_projects) using project import, and the override_constant (\#overriding_imported_constants_with_override_constant) parameter can be used to override the constant's value in the importing project. After you have added local_dependency parameters to specify other projects, use the include (/looker/docs/reference/param-model-include\#using_include_to_reference_files_in_another_project) parameter to add individual files.

The Looker IDE automatically creates an imported_projects folder when you import a project. Files from both local projects and remote projects (/looker/docs/importing-projects\#specifying_remote_projects) are listed in the imported_projects folder. See the Working with folders in the IDE (/looker/docs/ide-folders\#imported_projects_folder) documentation page for more information.

## Example

In a manifest file, add the projects "IMPORTED_PROJECT_1" and "IMPORTED_PROJECT_2" as sources to import files from:
project_name: "thelook" local_dependency: {
project: "IMPORTED_PROJECT_1"
} local_dependency: {
project: "IMPORTED_PROJECT_2"
}

# Things To Know

Overriding imported constants with override_constant The override_constant parameter can also be used with the remote_dependency (/looker/docs/reference/param-manifest-remote-dependency) parameter for remote project import.

When importing files from one project into another (/looker/docs/importing-projects), you can override the values of constants defined in the imported project's manifest file. When you override a constant's value, imported files that reference that constant will use the new value provided in the importing project.

When the export parameter is set to override_required or override_optional for a constant defined in the imported project, the override_constant subparameter of local_dependency can be used to provide a new value for that constant. For example, suppose you have a constant schema defined in the imported project's manifest file:
constant: schema {
value: "imported_project_schema" export: override_required
}
In this example, because the export parameter is set to override_required, its value must be overridden in the importing project's manifest file:
project_name: "importing_project" local_dependency: {
project: "imported_project" override_constant: schema {
value: "importing_project_schema"
}
}
See the Importing files from other projects
 (/looker/docs/importing-projects\#passing_constants_between_projects) documentation for more information and another example of overriding constants in importing projects.

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License
 (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies
 (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2023-09-21 UTC.