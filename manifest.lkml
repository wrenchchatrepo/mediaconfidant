local_dependency: {
  project: "marketplace_google-ads"

  override_constant: GOOGLE_ADS_SCHEMA {
    value: "google_ads"
  }

  override_constant: GOOGLE_ADS_CUSTOMER_ID {
    value: "1962270511"
  }

  # Uncomment if needed
  # override_constant: CONNECTION_NAME {
  #   value: "youfit"
  # }
}

local_dependency: {
  project: "ga4"

  override_constant: GA4_SCHEMA {
    value: "april2test"
  }

  override_constant: GA4_TABLE_VARIABLE {
    value: "events_*"
  }

  override_constant: EVENT_COUNT {
    value: ""
  }

  override_constant: model_step_prediction {
    value: "60"
    # export: override_optional
  }

  override_constant: BQML_PARAMETER {
    value: "Yes"
  }

  override_constant: GA4_BQML_train_months {
    value: "12"
  }

  override_constant: GA4_BQML_test_months {
    value: "3"
  }

  override_constant: GA4_BQML_future_synth_months {
    value: "12"
  }

  # Uncomment if needed
  # override_constant: GA4_CONNECTION_NAME {
  #   value: "gildedritual"
  # }
}

local_dependency: {
  project: "vendors"

  # Add any necessary override constants here
  # override_constant: VENDOR_SCHEMA {
  #   value: "your_value_here"
  # }

  # Uncomment if needed
  # override_constant: VENDOR_CONNECTION_NAME {
  #   value: "your_connection_name_here"
  # }
}
