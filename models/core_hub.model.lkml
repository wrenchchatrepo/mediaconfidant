# Define the database connection to be used for this model.
connection: "pipeline"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: core_hub_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: core_hub_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Core Hub"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: cyberdyne_google {}

explore: cyberdyne_ga4 {}

explore: cyberdyne_bing {}

explore: permissions_analysis {
    join: permissions_analysis__analysis__non_critical_errors {
      view_label: "Permissions Analysis: Analysis Noncriticalerrors"
      sql: LEFT JOIN UNNEST(${permissions_analysis.analysis__non_critical_errors}) as permissions_analysis__analysis__non_critical_errors ;;
      relationship: one_to_many
    }
    join: permissions_analysis__analysis__analysis_query__access_selector__roles {
      view_label: "Permissions Analysis: Analysis Analysisquery Accessselector Roles"
      sql: LEFT JOIN UNNEST(${permissions_analysis.analysis__analysis_query__access_selector__roles}) as permissions_analysis__analysis__analysis_query__access_selector__roles ;;
      relationship: one_to_many
    }
    join: permissions_analysis__analysis__analysis_query__access_selector__permissions {
      view_label: "Permissions Analysis: Analysis Analysisquery Accessselector Permissions"
      sql: LEFT JOIN UNNEST(${permissions_analysis.analysis__analysis_query__access_selector__permissions}) as permissions_analysis__analysis__analysis_query__access_selector__permissions ;;
      relationship: one_to_many
    }
}

explore: cyberdyne_tiktok {}

explore: cyberdyne_facebook {}

explore: permissions_analysis_result {
    join: permissions_analysis_result__analysis_result__iam_binding__members {
      view_label: "Permissions Analysis Result: Analysisresult Iambinding Members"
      sql: LEFT JOIN UNNEST(${permissions_analysis_result.analysis_result__iam_binding__members}) as permissions_analysis_result__analysis_result__iam_binding__members ;;
      relationship: one_to_many
    }
    join: permissions_analysis_result__analysis_result__identity_list__identities {
      view_label: "Permissions Analysis Result: Analysisresult Identitylist Identities"
      sql: LEFT JOIN UNNEST(${permissions_analysis_result.analysis_result__identity_list__identities}) as permissions_analysis_result__analysis_result__identity_list__identities ;;
      relationship: one_to_many
    }
    join: permissions_analysis_result__analysis_result__access_control_lists__accesses {
      view_label: "Permissions Analysis Result: Analysisresult Accesscontrollists Accesses"
      sql: LEFT JOIN UNNEST(${permissions_analysis_result.analysis_result__access_control_lists__accesses}) as permissions_analysis_result__analysis_result__access_control_lists__accesses ;;
      relationship: one_to_many
    }
    join: permissions_analysis_result__analysis_result__identity_list__group_edges {
      view_label: "Permissions Analysis Result: Analysisresult Identitylist Groupedges"
      sql: LEFT JOIN UNNEST(${permissions_analysis_result.analysis_result__identity_list__group_edges}) as permissions_analysis_result__analysis_result__identity_list__group_edges ;;
      relationship: one_to_many
    }
    join: permissions_analysis_result__analysis_result__access_control_lists__resource_edges {
      view_label: "Permissions Analysis Result: Analysisresult Accesscontrollists Resourceedges"
      sql: LEFT JOIN UNNEST(${permissions_analysis_result.analysis_result__access_control_lists__resource_edges}) as permissions_analysis_result__analysis_result__access_control_lists__resource_edges ;;
      relationship: one_to_many
    }
    join: permissions_analysis_result__analysis_result__access_control_lists__resources {
      view_label: "Permissions Analysis Result: Analysisresult Accesscontrollists Resources"
      sql: LEFT JOIN UNNEST(${permissions_analysis_result.analysis_result__access_control_lists__resources}) as permissions_analysis_result__analysis_result__access_control_lists__resources ;;
      relationship: one_to_many
    }
    join: permissions_analysis_result__analysis_result__access_control_lists {
      view_label: "Permissions Analysis Result: Analysisresult Accesscontrollists"
      sql: LEFT JOIN UNNEST(${permissions_analysis_result.analysis_result__access_control_lists}) as permissions_analysis_result__analysis_result__access_control_lists ;;
      relationship: one_to_many
    }
}

