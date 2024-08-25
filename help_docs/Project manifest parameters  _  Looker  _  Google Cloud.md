Note that you are viewing Looker documentation. For Looker Studio documentation, visit https://support.google.com/looker-studio (https://support.google.com/looker-studio).

## Project Manifest Parameters

Your project may contain a project manifest file (/looker/docs/other-project-files\#project_manifest_files), which is used for project-level settings such as those for specifying other projects to import into the current project (/looker/docs/importing-projects), defining LookML constants
 (/looker/docs/sql-and-referring-to-lookml\#lookml_constants), specifying model localization settings
 (/looker/docs/model-localization), and adding extensions (/looker/docs/intro-to-extension-framework\#adding_an_extension_to_looker) and custom visualizations (/looker/docs/reference/param-manifest-visualization) to your project.

Model localization (/looker/docs/model-localization) is not currently compatible with project import
 (/looker/docs/importing-projects).

Each project can have only one manifest file. The file must be named manifest.lkml and be located at the root level of your project's directory structure (/looker/docs/ide-folders). This page links to the project manifest-level LookML parameters.

## Example Usage

Hover over a parameter name to see a quick description. Click a parameter to visit its reference page.

When a parameter can be set to one of several specific options, the default value is listed first.

\#\# STRUCTURAL PARAMETERS
project_name (/looker/docs/reference/param-manifest-project-name): "Current Project Name" new_lookml_runtime (/looker/docs/reference/param-manifest-new-lookml-runtime): yes local_dependency (/looker/docs/reference/param-manifest-local-dependency): {
project (/looker/docs/reference/param-manifest-local-dependency): "project_name" override_constant (/looker/docs/reference/param-manifest-local-dependency): constant_name {
value (/looker/docs/reference/param-manifest-local-dependency): "string value"
}
}
\#\# Possibly more local_dependency statements remote_dependency (/looker/docs/reference/param-manifest-remote-dependency): remote_project_name url (/looker/docs/reference/param-manifest-remote-dependency): "remote_project_url" ref (/looker/docs/reference/param-manifest-remote-dependency): "remote_project_ref" override_constant (/looker/docs/reference/param-manifest-remote-dependency): constant_name {
value (/looker/docs/reference/param-manifest-remote-dependency): "string value"
}
}
\# Possibly more remote_dependency statements constant (/looker/docs/reference/param-manifest-constant): constant_name {
value (/looker/docs/reference/param-manifest-constant): "string value" export (/looker/docs/reference/param-manifest-constant): none | override_optional | override_r
}
\# Possibly more constant statements \#\# LOCALIZATION PARAMETERS
localization_settings (/looker/docs/reference/param-manifest-localization-settings): {
localization_level (/looker/docs/reference/param-manifest-localization-settings): strict | permiss default_locale (/looker/docs/reference/param-manifest-localization-settings): locale_name
}
\#\# EXTENSION FRAMEWORK PARAMETERS
application (/looker/docs/reference/param-manifest-application): application_name {
label (/looker/docs/reference/param-manifest-application\#label): "Application Label" url (/looker/docs/reference/param-manifest-application\#url): "application_url" file (/looker/docs/reference/param-manifest-application\#file): "application_file_path" mount_points (/looker/docs/reference/param-manifest-application\#mount_points): {
\# Desired mount points (described on application (/looker/docs/reference/param-manifest-ap
}
entitlements (/looker/docs/reference/param-manifest-application\#entitlements): {
\# Desired entitlements (described on application (/looker/docs/reference/param-manifest-ap
}
} \#\# Possibly more application statements \#\# CUSTOM VISUALIZATION PARAMETERS
visualization (/looker/docs/reference/param-manifest-visualization):{
id (/looker/docs/reference/param-manifest-visualization\#id): "unique-id" label (/looker/docs/reference/param-manifest-visualization\#label): "Visualization Label" url (/looker/docs/reference/param-manifest-visualization\#url): "visualization_url" sri_hash (/looker/docs/reference/param-manifest-visualization\#sri_hash): "SRI hash" dependencies (/looker/docs/reference/param-manifest-visualization\#dependencies): ["dependency_url_ file (/looker/docs/reference/param-manifest-visualization\#file): "visualization_file_path"

## Parameter Definitions

Parameter Name **Description** Structural Parameters project_name
 (/looker/docs/reference/param-manifestproject-name)
Specifies the name of the current project.

new_lookml_runtime
 (/looker/docs/reference/param-manifestnew-lookml-runtime)
Enables or disables New LookML Runtime for a LookML project.

local_dependency
 (/looker/docs/reference/param-manifestlocal-dependency)
Specifies that this project depends on another project. This parameter has the project and override_constantsubparameters.

project
 (/looker/docs/reference/param-manifestlocal-dependency)
Specifies a project that contains files that you want to include.

remote_dependency
 (/looker/docs/reference/param-manifestremote-dependency)
Specifies one or more remote projects that contain files that you want to include. This parameter has url and ref subparameters, as well as the subparameter override_constant.

constant
 (/looker/docs/reference/param-manifestconstant)
Defines a LookML constant that can be used throughout your project.

This parameter has the subparameters value and export.

Localization Parameters localization_settings
 (/looker/docs/reference/param-manifestlocalization-settings)
Specifies the localization information for your model. This parameter has default_locale and localization_level subparameters.

localization_level
 (/looker/docs/reference/param-manifestlocalization-settings)
Specifies whether strings with no translation are allowed in your model.

default_locale
 (/looker/docs/reference/param-manifestlocalization-settings)
Specifies the locale that will be used as your model's default for translating strings.

Extension Framework Parameters application
 (/looker/docs/reference/param-manifestapplication)
Defines an application for Looker's extension framework (/looker/docs/intro-to-extension-framework).

label
 (/looker/docs/reference/param-manifestapplication\#label)
Specifies the name of the application that is displayed to the user.

url
 (/looker/docs/reference/param-manifestapplication\#url)
Provides the URL of the application.

file
 (/looker/docs/reference/param-manifestapplication\#file)
Provides the path to a JavaScript file (with a .js extension) that defines the application. The path is relative to the project root.

entitlements
 (/looker/docs/reference/param-manifestapplication\#entitlements)
Specifies the entitlements to control access to the extension features of the application. This parameter has many subparameters listed on the application
 (/looker/docs/reference/param-manifest-application\#entitlements)
parameter page.

Custom Visualization Parameters visualization
 (/looker/docs/reference/param-manifestvisualization)
Defines a custom visualization for your Looker project.

id
 (/looker/docs/reference/param-manifestvisualization\#id)
Specifies a unique identifier for the visualization.

label
 (/looker/docs/reference/param-manifestvisualization\#label)
Specifies the name of the visualization that is displayed to the user.

url
 (/looker/docs/reference/param-manifestvisualization\#url)
Provides the URL to the visualization's JavaScript file.

sri_hash
 (/looker/docs/reference/param-manifestvisualization\#sri_hash)
Specifies the subresource integrity hash for the visualization.

dependencies
 (/looker/docs/reference/param-manifestvisualization\#dependencies)
Provides a comma-separated list of dependency URLs required to load the visualization.

file
 (/looker/docs/reference/param-manifestvisualization\#file)
Specifies the path to a JavaScript file that defines the visualization.

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License
 (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies
 (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-01-11 UTC.