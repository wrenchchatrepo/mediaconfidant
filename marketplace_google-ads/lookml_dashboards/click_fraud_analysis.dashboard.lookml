- dashboard: click_fraud_analysis
  title: Click Fraud Analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Account
    name: Account
    explore: ad_basic_stats
    type: looker_waterfall
    fields: [budget.account_descriptive_name, fact.total_clicks]
    filters:
      fact.date_period_latest: 'Yes'
    sorts: [fact.total_clicks desc]
    limit: 500
    up_color: "#4285F4"
    down_color: "#EA4335"
    total_color: "#FBBC04"
    show_value_labels: false
    show_x_axis_ticks: true
    show_x_axis_label: true
    x_axis_scale: auto
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_gridlines: true
    x_axis_gridlines: false
    show_view_names: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Date: fact.date_date
    row: 17
    col: 0
    width: 9
    height: 6
  - title: Campaigns
    name: Campaigns

    explore: ad_basic_stats
    type: looker_waterfall
    fields: [fact.total_clicks, campaign.campaign_name]
    filters:
      fact.date_period_latest: 'Yes'
      fact.total_clicks: ">=0"
    sorts: [fact.total_clicks desc]
    limit: 500
    up_color: "#4285F4"
    down_color: "#EA4335"
    total_color: "#FBBC04"
    show_value_labels: false
    show_x_axis_ticks: true
    show_x_axis_label: true
    x_axis_scale: auto
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_gridlines: true
    x_axis_gridlines: false
    show_view_names: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Date: fact.date_date
    row: 23
    col: 12
    width: 12
    height: 7
  - title: Ad Group
    name: Ad Group

    explore: ad_basic_stats
    type: looker_waterfall
    fields: [fact.total_clicks, ad_group.ad_group_name]
    filters:
      fact.date_period_latest: 'Yes'
      fact.total_clicks: ">0"
    sorts: [fact.total_clicks desc]
    limit: 500
    up_color: "#4285F4"
    down_color: "#EA4335"
    total_color: "#FBBC04"
    show_value_labels: false
    show_x_axis_ticks: true
    show_x_axis_label: true
    x_axis_scale: auto
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_gridlines: true
    x_axis_gridlines: false
    show_view_names: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Date: fact.date_date
    row: 17
    col: 9
    width: 15
    height: 6
  - title: Top 10 Keywords
    name: Top 10 Keywords

    explore: ad_basic_stats
    type: looker_waterfall
    fields: [fact.total_clicks, keyword.criteria]
    filters:
      fact.date_period_latest: 'Yes'
      fact.total_clicks: ">0"
    sorts: [fact.total_clicks desc]
    limit: 10
    up_color: "#4285F4"
    down_color: "#EA4335"
    total_color: "#FBBC04"
    show_value_labels: false
    show_x_axis_ticks: true
    show_x_axis_label: true
    x_axis_scale: auto
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_gridlines: true
    x_axis_gridlines: false
    show_view_names: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Date: fact.date_date
    row: 23
    col: 0
    width: 12
    height: 7
  - name: "<strong>Click Fraud Analysis</strong>"
    type: text
    title_text: "<strong>Click Fraud Analysis</strong>"
    subtitle_text: "(Use this dashboard as a drill down from a possible click fraud\
      \ alert)"
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Clicks Comparison
    type: text
    title_text: Clicks Comparison
    subtitle_text: ''
    body_text: "Comparison of Number of Clicks between : \nThe **analysis date**,\n\
      The **day before**,\nand **7 days before (same day last week)** <br>\n\n**Explore\
      \ from here** any of the visualisations to add more metrics"
    row: 10
    col: 0
    width: 9
    height: 5
  - name: Key Influencers
    type: text
    title_text: Key Influencers
    subtitle_text: Account, Ad Group, Top 10 Keywords and Campaign
    row: 15
    col: 0
    width: 24
    height: 2
  - title: Clicks Comparison
    name: Clicks Comparison2

    explore: ad_basic_stats
    type: looker_bar
    fields: [fact.date_date, fact.total_clicks]
    filters:
      fact.date_period_latest: 'Yes'
    sorts: [fact.date_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: fact.total_clicks,
            id: fact.total_clicks, name: Clicks}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 60, type: linear}]
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Comparison Dates: fact.date_date
    row: 10
    col: 9
    width: 15
    height: 5
  - title: Click Predictions
    name: Click Predictions
    explore: click_fraud_analysis
    type: looker_line
    fields: [click_fraud_analysis.timestamp_date, click_fraud_analysis.lower_bound,
      click_fraud_analysis.upper_bound, click_fraud_analysis.total_clicks_forecasted,
      click_fraud_analysis.total_clicks_history]
    fill_fields: [click_fraud_analysis.timestamp_date]
    filters:
      click_fraud_analysis.timestamp_date: 60 days ago for 90 days
    sorts: [click_fraud_analysis.timestamp_date desc]
    limit: 500
    dynamic_fields:
    - table_calculation: is_outside_bounds
      label: is_outside_bounds
      expression: "if(${click_fraud_analysis.total_clicks_history} < ${click_fraud_analysis.lower_bound}\
        \ OR ${click_fraud_analysis.total_clicks_history} > ${click_fraud_analysis.upper_bound}\
        \ \n  OR add_days(-1,trunc_days(now())) = ${click_fraud_analysis.timestamp_date},\
        \ # this bit added for demo\n  1,null)"
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - table_calculation: calculation_2
      label: Calculation 2
      expression: trunc_days(add_days(-1,now()))
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: date
      is_disabled: true
    query_timezone: UTC
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: click_fraud_analysis.lower_bound,
            id: click_fraud_analysis.lower_bound, name: Prediction Lower Bound}, {axisId: click_fraud_analysis.upper_bound,
            id: click_fraud_analysis.upper_bound, name: Prediction Upper Bound}, {axisId: click_fraud_analysis.total_clicks_forecasted,
            id: click_fraud_analysis.total_clicks_forecasted, name: Total Clicks Forecasted},
          {axisId: click_fraud_analysis.total_clicks_history, id: click_fraud_analysis.total_clicks_history,
            name: Total Clicks History}], showLabels: true, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 57, type: linear}]
    size_by_field: ''
    hidden_series: []
    series_types:
      click_fraud_analysis.upper_bound: area
      click_fraud_analysis.lower_bound: area
      is_outside_bounds: column
    series_colors:
      click_fraud_analysis.lower_bound: "#b8bfc7"
      click_fraud_analysis.upper_bound: "#b8bfc7"
      is_outside_bounds: "#EA4335"
    series_point_styles:
      click_fraud_analysis.lower_bound: triangle
      click_fraud_analysis.upper_bound: triangle-down
    reference_lines: []
    trend_lines: []
    swap_axes: false
    discontinuous_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Using ARIMA forecasting model, looking back at 365 days of data to create
      normal lower and upper bounds. If clicks fall outside of this norm, they should
      be investigated
    listen: {}
    row: 2
    col: 0
    width: 24
    height: 8

  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: yesterday
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
  - name: Comparison Dates
    title: Comparison Dates
    type: date_filter
    default_value: yesterday, 2 days ago, 7 days ago
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
