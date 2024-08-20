connection: "gildedritual"

include: "/ga4/dashboards/*"
include: "/ga4/explores/sessions.explore.lkml"
include: "/manifest.lkml"

label: "Google Analytics 4"


datagroup: ga4_main_datagroup {
  sql_trigger:  SELECT CURRENT_DATE();;
  max_cache_age: "3 hour"
}

datagroup: ga4_default_datagroup {
  sql_trigger: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*1)/(60*60*24));;
  max_cache_age: "3 hour"
}

datagroup: ga4_attribution_channel {
  sql_trigger: SELECT 1 ;;
}


persist_with: ga4_main_datagroup

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# Define the database connection to be used for this model.
connection: "pipeline"

# include all the views
include: "/vendors/views/vendors.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: vendors_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: vendors_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Vendors"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: vendors {}
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

connection: "youfit"

include: "/marketplace_google-ads/dashboards/*.dashboard"
include: "/marketplace_google-ads/explores/*.explore"
include: "/manifest.lkml"
