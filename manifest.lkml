# GA4 Project Constants
# constant: GA4_CONNECTION {
#   value: "empyrean-backup-411421"
#   export: override_required
# }

constant: GA4_SCHEMA {
  value: "analytics_321061426"
  export: override_required
}

constant: GA4_TABLE_VARIABLE {
  value: "events_*"
  export: override_required
}

constant: EVENT_COUNT {
  value: ""
  export: override_required
}

constant: model_step_prediction {
  value: "60"
  # export: override_required
}

constant: GA4_BQML_train_months {
  value: "12"
  # export: override_required
}

constant: GA4_BQML_test_months {
  value: "3"
  # export: override_required
}

constant: GA4_BQML_future_synth_months {
  value: "12"
  # export: override_required
}

# Local Dependencies
# local_dependency: {
#   project: "synthetic"
#   override_constant: VENDOR_CONNECTION_NAME {
#     value: "pipeline_synthetic"
#   }
#   override_constant: VENDOR_SCHEMA {
#     value: "synthetic"
#   }
# }

# local_dependency: {
#   project: "vendors"
#   override_constant: VENDOR_CONNECTION_NAME {
#     value: "pipeline"
#   }
#   override_constant: VENDOR_SCHEMA {
#     value: "customers"
#   }
#   override_constant: GA4_CONNECTION {
#     value: "empyrean-backup-411421"
#   }
# }
