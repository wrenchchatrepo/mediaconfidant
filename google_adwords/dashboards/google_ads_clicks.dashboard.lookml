- dashboard: google_ads__clicks
  title: Google Ads - Clicks
  layout: newspaper
  description: ''
  embed_style:
    background_color: "#ffffff"
    title_color: "#3a4245"
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Clicks By Country
    name: Clicks By Country
    model: block_google_ads
    explore: ad_impressions_geo
    type: looker_map
    fields: [fact.total_clicks, geo_country.country_code]
    sorts: [fact.total_clicks desc]
    limit: 500
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 39.842286020743394
    map_longitude: -96.45996093750001
    map_zoom: 4
    map_value_colors: []
    map: usa
    map_projection: ''
    quantize_colors: false
    series_types: {}
    colors: ["#F36254", "#FCF758", "#4FBC89"]
    defaults_version: 1
    listen:
      Account: customer.account_descriptive_name
      Campaign: campaign.name
      Ad Group: ad_group.ad_group_name
      Period: fact.period
      Period Latest: fact.date_period_latest
    row: 10
    col: 0
    width: 24
    height: 14
  - title: Ad Group Clicks Change
    name: Ad Group Clicks Change
    model: block_google_ads
    explore: period_fact
    type: looker_column
    fields: [ad_group.ad_group_name, campaign.name, fact.total_cost, last_fact.total_cost,
      last_fact.total_clicks, fact.total_clicks, fact.total_clicks_period_delta]
    filters:
      fact.total_clicks_period_delta_abs: ">0"
    sorts: [fact.total_clicks_period_delta_abs desc]
    limit: 500
    column_limit: 50
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: bottom,
        showLabels: true, showValues: false, tickDensity: default, tickDensityCustom: !!null '',
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: fact.average_cost_per_click,
            name: Period Fact, axisId: fact.average_cost_per_click}, {id: last_fact.average_cost_per_click,
            name: Last Period Fact, axisId: last_fact.average_cost_per_click}]}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    colors: ["#a6b7ff", "#7869df", "#ea9895", "#d06180", "#6e98f9", "#8ac8ca", "#dc9d4f",
      "#4bb86a", "#a4a6a9", "#a6b7ff", "#afe8fd", "#ea989"]
    series_types: {}
    series_colors:
      last_fact.total_clicks: "#afe8fd"
      fact.total_clicks: "#2c556b"
    hidden_fields: [campaign.name, fact.total_cost, last_fact.total_cost, fact.total_clicks_period_delta]
    defaults_version: 1
    listen:
      Account: customer.account_descriptive_name
      Campaign: campaign.name
      Ad Group: ad_group.ad_group_name
      Period: fact.period
      Period Latest: fact.date_period_latest
    row: 24
    col: 0
    width: 12
    height: 12
  - title: AdType Clicks Change
    name: AdType Clicks Change
    model: block_google_ads
    explore: period_fact
    type: looker_column
    fields: [fact.total_cost, last_fact.total_cost, last_fact.total_clicks, fact.total_clicks,
      fact.total_clicks_period_delta, ad.ad_type]
    filters:
      fact.total_clicks_period_delta_abs: ">0"
    sorts: [fact.total_clicks_period_delta desc]
    limit: 50
    column_limit: 50
    query_timezone: America/Los_Angeles
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
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: bottom,
        showLabels: true, showValues: false, tickDensity: default, tickDensityCustom: !!null '',
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: fact.average_cost_per_click,
            name: Period Fact, axisId: fact.average_cost_per_click}, {id: last_fact.average_cost_per_click,
            name: Last Period Fact, axisId: last_fact.average_cost_per_click}]}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    colors: ["#a6b7ff", "#7869df", "#ea9895", "#d06180", "#6e98f9", "#8ac8ca", "#dc9d4f",
      "#4bb86a", "#a4a6a9", "#a6b7ff", "#afe8fd", "#ea989"]
    series_types: {}
    series_colors:
      fact.total_clicks: "#2c556b"
      last_fact.total_clicks: "#afe8fd"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [fact.total_cost, last_fact.total_cost, fact.total_clicks_period_delta]
    defaults_version: 1
    listen:
      Account: customer.account_descriptive_name
      Campaign: campaign.name
      Ad Group: ad_group.ad_group_name
      Period: fact.period
      Period Latest: fact.date_period_latest
    row: 24
    col: 12
    width: 12
    height: 12
  - title: Clicks by Day of Week
    name: Clicks by Day of Week
    model: block_google_ads
    explore: period_fact
    type: looker_column
    fields: [fact.date_day_of_week, fact.total_clicks]
    fill_fields: [fact.date_day_of_week]
    sorts: [fact.date_day_of_week]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: bottom,
        showLabels: false, showValues: false, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: fact.average_cost_per_click,
            name: Ad Stats Cost, axisId: fact.average_cost_per_click}]}]
    x_axis_label: ''
    colors: ["#8ac8ca", "#7869df", "#6e98f9", "#d06180", "#dc9d4f", "#4bb86a", "#a4a6a9",
      "#a6b7ff", "#afe8fd", "#ea9895", "#f1e582"]
    series_types: {}
    series_colors:
      fact.total_clicks: "#2c556b"
    label_color: []
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors: [red, blue]
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    conditional_formatting: [{type: high to low, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    defaults_version: 1
    listen:
      Account: customer.account_descriptive_name
      Campaign: campaign.name
      Ad Group: ad_group.ad_group_name
      Period: fact.period
      Period Latest: fact.date_period_latest
    row: 36
    col: 0
    width: 24
    height: 12
  - title: Clicks To Date
    name: Clicks To Date
    model: block_google_ads
    explore: period_fact
    type: looker_column
    fields: [fact.date_period_dynamic_grain, fact.total_conversions, fact.average_cost_per_conversion,
      fact.average_conversion_rate, fact.average_cost_per_click, fact.average_click_rate,
      fact.total_clicks]
    sorts: [fact.date_period_dynamic_grain]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    label_density: 1
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: left, series: [{id: fact.average_cost_per_conversion,
            name: Cost Per Conversion, axisId: fact.average_cost_per_conversion}],
        showLabels: true, showValues: true, maxValue: !!null '', minValue: !!null '',
        valueFormat: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: !!null '',
        type: linear}, {label: '', orientation: left, series: [{id: fact.total_conversions,
            name: Conversions, axisId: fact.total_conversions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: left, series: [{id: fact.average_conversion_rate,
            name: Conversion Rate, axisId: fact.average_conversion_rate}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: left, series: [{id: fact.average_click_rate, name: Click
              Through Rate, axisId: fact.average_click_rate}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}, {label: !!null '',
        orientation: right, series: [{id: fact.average_cost_per_click, name: Cost
              per Click, axisId: fact.average_cost_per_click}, {id: fact.total_clicks,
            name: Clicks, axisId: fact.total_clicks}], showLabels: true, showValues: true,
        maxValue: !!null '', minValue: !!null '', valueFormat: !!null '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: !!null '', type: linear}]
    hidden_series: [fact.total_conversions, fact.average_cost_per_conversion, fact.average_conversion_rate,
      fact.average_cost_per_click]
    colors: ["#7869df", "#6e98f9", "#8ac8ca", "#d06180", "#dc9d4f", "#4bb86a", "#a4a6a9",
      "#a6b7ff", "#afe8fd", "#ea9895", "#f1e582"]
    series_types:
      fact.total_conversions: line
      fact.average_cost_per_conversion: line
      fact.average_conversion_rate: line
      fact.average_click_rate: line
      fact.average_cost_per_click: line
      fact.total_clicks: line
    series_colors:
      fact.total_clicks: "#87888a"
    series_labels:
      fact.total_conversions: Conversions
      fact.total_clicks: Clicks
      fact.average_conversion_rate: Conversion Rate
      fact.average_cost_per_conversion: Cost Per Conversion
    reference_lines: []
    column_spacing_ratio: 0
    column_group_spacing_ratio: 0
    show_dropoff: false
    show_null_points: false
    interpolation: linear
    label: Average Cost per Conversion
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors: [red, blue]
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    discontinuous_nulls: false
    focus_on_hover: false
    hidden_fields: []
    defaults_version: 1
    listen:
      Account: customer.account_descriptive_name
      Campaign: campaign.name
      Ad Group: ad_group.ad_group_name
      Period: fact.period
      Period Latest: fact.date_period_latest
    row: 0
    col: 0
    width: 24
    height: 10
  filters:
  - name: Account
    title: Account
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: block_google_ads
    explore: period_fact
    listens_to_filters: [Period, Period Latest]
    field: customer.account_descriptive_name
  - name: Campaign
    title: Campaign
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: block_google_ads
    explore: period_fact
    listens_to_filters: [Period, Period Latest, Account]
    field: campaign.name
  - name: Ad Group
    title: Ad Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: block_google_ads
    explore: period_fact
    listens_to_filters: [Period, Period Latest, Campaign, Account]
    field: ad_group.ad_group_name
  - name: Period
    title: Period
    type: field_filter
    default_value: 28 day
    allow_multiple_values: false
    required: true
    ui_config:
      type: advanced
      display: popover
    model: block_google_ads
    explore: period_fact
    listens_to_filters: []
    field: fact.period
  - name: Period Latest
    title: Period Latest
    type: field_filter
    default_value: 'Yes'
    allow_multiple_values: false
    required: true
    ui_config:
      type: advanced
      display: popover
    model: block_google_ads
    explore: period_fact
    listens_to_filters: []
    field: fact.date_period_latest
