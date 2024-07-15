# The name of this view in Looker is "Permissions Analysis Result"
view: permissions_analysis_result {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `customers.permissions_analysis_result` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Analysis ID" in Explore.

  dimension: analysis_id {
    type: number
    sql: ${TABLE}.analysisId ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: analysis_result__access_control_lists {
    hidden: yes
    sql: ${TABLE}.analysisResult.accessControlLists ;;
    group_label: "Analysis Result"
    group_item_label: "Access Control Lists"
  }

  dimension: analysis_result__access_control_lists__accesses {
    hidden: yes
    sql: ${TABLE}.analysisResult.accessControlLists.accesses ;;
    group_label: "Analysis Result Access Control Lists"
    group_item_label: "Accesses"
  }

  dimension: analysis_result__access_control_lists__resource_edges {
    hidden: yes
    sql: ${TABLE}.analysisResult.accessControlLists.resourceEdges ;;
    group_label: "Analysis Result Access Control Lists"
    group_item_label: "Resource Edges"
  }

  dimension: analysis_result__access_control_lists__resources {
    hidden: yes
    sql: ${TABLE}.analysisResult.accessControlLists.resources ;;
    group_label: "Analysis Result Access Control Lists"
    group_item_label: "Resources"
  }

  dimension: analysis_result__attached_resource_full_name {
    type: string
    sql: ${TABLE}.analysisResult.attachedResourceFullName ;;
    group_label: "Analysis Result"
    group_item_label: "Attached Resource Full Name"
  }

  dimension: analysis_result__fully_explored {
    type: yesno
    sql: ${TABLE}.analysisResult.fullyExplored ;;
    group_label: "Analysis Result"
    group_item_label: "Fully Explored"
  }

  dimension: analysis_result__iam_binding__condition__description {
    type: string
    sql: ${TABLE}.analysisResult.iamBinding.condition.description ;;
    group_label: "Analysis Result Iam Binding Condition"
    group_item_label: "Description"
  }

  dimension: analysis_result__iam_binding__condition__expression {
    type: string
    sql: ${TABLE}.analysisResult.iamBinding.condition.expression ;;
    group_label: "Analysis Result Iam Binding Condition"
    group_item_label: "Expression"
  }

  dimension: analysis_result__iam_binding__condition__title {
    type: string
    sql: ${TABLE}.analysisResult.iamBinding.condition.title ;;
    group_label: "Analysis Result Iam Binding Condition"
    group_item_label: "Title"
  }

  dimension: analysis_result__iam_binding__members {
    hidden: yes
    sql: ${TABLE}.analysisResult.iamBinding.members ;;
    group_label: "Analysis Result Iam Binding"
    group_item_label: "Members"
  }

  dimension: analysis_result__iam_binding__role {
    type: string
    sql: ${TABLE}.analysisResult.iamBinding.role ;;
    group_label: "Analysis Result Iam Binding"
    group_item_label: "Role"
  }

  dimension: analysis_result__identity_list__group_edges {
    hidden: yes
    sql: ${TABLE}.analysisResult.identityList.groupEdges ;;
    group_label: "Analysis Result Identity List"
    group_item_label: "Group Edges"
  }

  dimension: analysis_result__identity_list__identities {
    hidden: yes
    sql: ${TABLE}.analysisResult.identityList.identities ;;
    group_label: "Analysis Result Identity List"
    group_item_label: "Identities"
  }

  dimension: op_name {
    type: string
    sql: ${TABLE}.opName ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: request {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.requestTime ;;
  }
  measure: count {
    type: count
    drill_fields: [op_name, analysis_result__attached_resource_full_name]
  }
}

# The name of this view in Looker is "Permissions Analysis Result Analysis Result Iam Binding Members"
view: permissions_analysis_result__analysis_result__iam_binding__members {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Permissions Analysis Result Analysis Result Iam Binding Members" in Explore.

  dimension: permissions_analysis_result__analysis_result__iam_binding__members {
    type: string
    sql: permissions_analysis_result__analysis_result__iam_binding__members ;;
  }
}

# The name of this view in Looker is "Permissions Analysis Result Analysis Result Identity List Identities"
view: permissions_analysis_result__analysis_result__identity_list__identities {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Analysis State Cause" in Explore.

  dimension: analysis_state__cause {
    type: string
    sql: ${TABLE}.analysisState.cause ;;
    group_label: "Analysis State"
    group_item_label: "Cause"
  }

  dimension: analysis_state__code {
    type: string
    sql: ${TABLE}.analysisState.code ;;
    group_label: "Analysis State"
    group_item_label: "Code"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}

# The name of this view in Looker is "Permissions Analysis Result Analysis Result Access Control Lists Accesses"
view: permissions_analysis_result__analysis_result__access_control_lists__accesses {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Analysis State Cause" in Explore.

  dimension: analysis_state__cause {
    type: string
    sql: ${TABLE}.analysisState.cause ;;
    group_label: "Analysis State"
    group_item_label: "Cause"
  }

  dimension: analysis_state__code {
    type: string
    sql: ${TABLE}.analysisState.code ;;
    group_label: "Analysis State"
    group_item_label: "Code"
  }

  dimension: permission {
    type: string
    sql: ${TABLE}.permission ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }
}

# The name of this view in Looker is "Permissions Analysis Result Analysis Result Identity List Group Edges"
view: permissions_analysis_result__analysis_result__identity_list__group_edges {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Source Node" in Explore.

  dimension: source_node {
    type: string
    sql: ${TABLE}.sourceNode ;;
  }

  dimension: target_node {
    type: string
    sql: ${TABLE}.targetNode ;;
  }
}

# The name of this view in Looker is "Permissions Analysis Result Analysis Result Access Control Lists Resource Edges"
view: permissions_analysis_result__analysis_result__access_control_lists__resource_edges {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Source Node" in Explore.

  dimension: source_node {
    type: string
    sql: ${TABLE}.sourceNode ;;
  }

  dimension: target_node {
    type: string
    sql: ${TABLE}.targetNode ;;
  }
}

# The name of this view in Looker is "Permissions Analysis Result Analysis Result Access Control Lists Resources"
view: permissions_analysis_result__analysis_result__access_control_lists__resources {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Analysis State Cause" in Explore.

  dimension: analysis_state__cause {
    type: string
    sql: ${TABLE}.analysisState.cause ;;
    group_label: "Analysis State"
    group_item_label: "Cause"
  }

  dimension: analysis_state__code {
    type: string
    sql: ${TABLE}.analysisState.code ;;
    group_label: "Analysis State"
    group_item_label: "Code"
  }

  dimension: full_resource_name {
    type: string
    sql: ${TABLE}.fullResourceName ;;
  }
}

# The name of this view in Looker is "Permissions Analysis Result Analysis Result Access Control Lists"
view: permissions_analysis_result__analysis_result__access_control_lists {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Condition Evaluation Evaluation Value" in Explore.

  dimension: condition_evaluation__evaluation_value {
    type: string
    sql: ${TABLE}.conditionEvaluation.evaluationValue ;;
    group_label: "Condition Evaluation"
    group_item_label: "Evaluation Value"
  }
}
