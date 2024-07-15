connection: "pipeline"

include: "/views/shared/shared_data.view.lkml"

datagroup: core_hub_default_datagroup {
  max_cache_age: "1 hour"
}

persist_with: core_hub_default_datagroup

explore: shared_data {}
