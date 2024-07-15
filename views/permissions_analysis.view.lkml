# The name of this view in Looker is "Permissions Analysis"
view: permissions_analysis {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `customers.permissions_analysis` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: analysis__analysis_query__access_selector__permissions {
    hidden: yes
    sql: ${TABLE}.analysis.analysisQuery.accessSelector.permissions ;;
    group_label: "Analysis Analysis Query Access Selector"
    group_item_label: "Permissions"
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Analysis Analysis Query Access Selector Roles" in Explore.

  dimension: analysis__analysis_query__access_selector__roles {
    hidden: yes
    sql: ${TABLE}.analysis.analysisQuery.accessSelector.roles ;;
    group_label: "Analysis Analysis Query Access Selector"
    group_item_label: "Roles"
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: analysis__analysis_query__condition_context__access {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.analysis.analysisQuery.conditionContext.accessTime ;;
  }

  dimension: analysis__analysis_query__identity_selector__identity {
    type: string
    sql: ${TABLE}.analysis.analysisQuery.identitySelector.identity ;;
    group_label: "Analysis Analysis Query Identity Selector"
    group_item_label: "Identity"
  }

  dimension: analysis__analysis_query__options__analyze_service_account_impersonation {
    type: yesno
    sql: ${TABLE}.analysis.analysisQuery.options.analyzeServiceAccountImpersonation ;;
    group_label: "Analysis Analysis Query Options"
    group_item_label: "Analyze Service Account Impersonation"
  }

  dimension: analysis__analysis_query__options__expand_groups {
    type: yesno
    sql: ${TABLE}.analysis.analysisQuery.options.expandGroups ;;
    group_label: "Analysis Analysis Query Options"
    group_item_label: "Expand Groups"
  }

  dimension: analysis__analysis_query__options__expand_resources {
    type: yesno
    sql: ${TABLE}.analysis.analysisQuery.options.expandResources ;;
    group_label: "Analysis Analysis Query Options"
    group_item_label: "Expand Resources"
  }

  dimension: analysis__analysis_query__options__expand_roles {
    type: yesno
    sql: ${TABLE}.analysis.analysisQuery.options.expandRoles ;;
    group_label: "Analysis Analysis Query Options"
    group_item_label: "Expand Roles"
  }

  dimension: analysis__analysis_query__options__output_group_edges {
    type: yesno
    sql: ${TABLE}.analysis.analysisQuery.options.outputGroupEdges ;;
    group_label: "Analysis Analysis Query Options"
    group_item_label: "Output Group Edges"
  }

  dimension: analysis__analysis_query__options__output_resource_edges {
    type: yesno
    sql: ${TABLE}.analysis.analysisQuery.options.outputResourceEdges ;;
    group_label: "Analysis Analysis Query Options"
    group_item_label: "Output Resource Edges"
  }

  dimension: analysis__analysis_query__resource_selector__full_resource_name {
    type: string
    sql: ${TABLE}.analysis.analysisQuery.resourceSelector.fullResourceName ;;
    group_label: "Analysis Analysis Query Resource Selector"
    group_item_label: "Full Resource Name"
  }

  dimension: analysis__analysis_query__scope {
    type: string
    sql: ${TABLE}.analysis.analysisQuery.scope ;;
    group_label: "Analysis Analysis Query"
    group_item_label: "Scope"
  }

  dimension: analysis__fully_explored {
    type: yesno
    sql: ${TABLE}.analysis.fullyExplored ;;
    group_label: "Analysis"
    group_item_label: "Fully Explored"
  }

  dimension: analysis__non_critical_errors {
    hidden: yes
    sql: ${TABLE}.analysis.nonCriticalErrors ;;
    group_label: "Analysis"
    group_item_label: "Non Critical Errors"
  }

  dimension: analysis_id {
    type: number
    sql: ${TABLE}.analysisId ;;
  }

  dimension: op_name {
    type: string
    sql: ${TABLE}.opName ;;
  }

  dimension_group: request {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.requestTime ;;
  }
  measure: count {
    type: count
    drill_fields: [op_name, analysis__analysis_query__resource_selector__full_resource_name]
  }
}

# The name of this view in Looker is "Permissions Analysis Analysis Non Critical Errors"
view: permissions_analysis__analysis__non_critical_errors {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cause" in Explore.

  dimension: cause {
    type: string
    sql: ${TABLE}.cause ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }
}

# The name of this view in Looker is "Permissions Analysis Analysis Analysis Query Access Selector Roles"
view: permissions_analysis__analysis__analysis_query__access_selector__roles {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Permissions Analysis Analysis Analysis Query Access Selector Roles" in Explore.

  dimension: permissions_analysis__analysis__analysis_query__access_selector__roles {
    type: string
    sql: permissions_analysis__analysis__analysis_query__access_selector__roles ;;
  }
}

# The name of this view in Looker is "Permissions Analysis Analysis Analysis Query Access Selector Permissions"
view: permissions_analysis__analysis__analysis_query__access_selector__permissions {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Permissions Analysis Analysis Analysis Query Access Selector Permissions" in Explore.

  dimension: permissions_analysis__analysis__analysis_query__access_selector__permissions {
    type: string
    sql: permissions_analysis__analysis__analysis_query__access_selector__permissions ;;
  }
}
