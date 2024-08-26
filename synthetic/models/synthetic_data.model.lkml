# Define the database connection to be used for this model.
connection: "pipeline_synthetic"

# include all the views
include: "/synthetic/views/synthdata.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: synthetic_data_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: synthetic_data_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Synthetic Data"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: synthdata {}

# Custom map layer definition using the GeoJSON file hosted on GitHub
map_layer: postal_codes_layer {
  url: "https://raw.githubusercontent.com/wrenchchatrepo/mediaconfidant/looker/maps/postal_codes.geojson"
  feature_key: "postal_code"  # The key in your GeoJSON file that identifies each feature
  property_key: "name"  # The property to use for labeling the regions
  # format: geojson
}
