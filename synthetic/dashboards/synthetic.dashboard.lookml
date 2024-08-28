- dashboard: impressions_for_t1000_campaign_all_vendors
  title: Impressions for T1000 Campaign all Vendors
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: RMT37l5f8WJt12TYePjPs0
  elements:
  - title: Impressions for T1000 Campaign all Vendors
    name: Impressions for T1000 Campaign all Vendors
    model: synthetic_data
    explore: synthdata
    type: looker_area
    fields: [synthdata.dts_date, sumimpressions_t1000, synthdata.vendors]
    pivots: [synthdata.vendors]
    fill_fields: [synthdata.dts_date]
    sorts: [synthdata.vendors, synthdata.dts_date]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: sum(impressions_t1000)
      value_format:
      value_format_name:
      based_on: synthdata.impressions_t1000
      _kind_hint: measure
      measure: sumimpressions_t1000
      type: sum
      _type_hint: number
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    hidden_points_if_no: []
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_pivots: {}
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
    groupBars: true
    labelSize: 10pt
    showLegend: true
    series_labels: {}
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12
  - title: Click for T800 Campaign all Vendors
    name: Click for T800 Campaign all Vendors
    model: synthetic_data
    explore: synthdata
    type: looker_area
    fields: [synthdata.dts_date, synthdata.vendors, sumclicks_t800]
    pivots: [synthdata.vendors]
    fill_fields: [synthdata.dts_date]
    sorts: [synthdata.vendors, synthdata.dts_date]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: sum(impressions_t1000)
      value_format:
      value_format_name:
      based_on: synthdata.impressions_t1000
      _kind_hint: measure
      measure: sumimpressions_t1000
      type: sum
      _type_hint: number
    - category: measure
      expression:
      label: sum(clicks_t800)
      value_format:
      value_format_name:
      based_on: synthdata.clicks_t800
      _kind_hint: measure
      measure: sumclicks_t800
      type: sum
      _type_hint: number
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    hidden_points_if_no: []
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_pivots: {}
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
    groupBars: true
    labelSize: 10pt
    showLegend: true
    series_labels: {}
    listen: {}
    row: 12
    col: 0
    width: 8
    height: 6
  - title: CTR_T800_Campaign_all_Vendors
    name: CTR_T800_Campaign_all_Vendors
    model: synthetic_data
    explore: synthdata
    type: looker_line
    fields: [synthdata.dts_date, synthdata.vendors, sumclicks_t800, sumimpressions_t800]
    pivots: [synthdata.vendors]
    fill_fields: [synthdata.dts_date]
    sorts: [synthdata.vendors, synthdata.dts_date]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: sum(impressions_t1000)
      value_format:
      value_format_name:
      based_on: synthdata.impressions_t1000
      _kind_hint: measure
      measure: sumimpressions_t1000
      type: sum
      _type_hint: number
    - category: measure
      expression:
      label: sum(clicks_t800)
      value_format:
      value_format_name:
      based_on: synthdata.clicks_t800
      _kind_hint: measure
      measure: sumclicks_t800
      type: sum
      _type_hint: number
    - category: measure
      expression: ''
      label: sum(impressions_t800)
      value_format:
      value_format_name:
      based_on: synthdata.impressions_t800
      _kind_hint: measure
      measure: sumimpressions_t800
      type: sum
      _type_hint: number
    - category: table_calculation
      expression: "${sumclicks_t800}/${sumimpressions_t800}"
      label: CTR_T800
      value_format:
      value_format_name: percent_4
      _kind_hint: measure
      table_calculation: ctr_t800
      _type_hint: number
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_fields: [sumclicks_t800, sumimpressions_t800]
    hidden_points_if_no: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
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
    groupBars: true
    labelSize: 10pt
    showLegend: true
    series_labels: {}
    listen: {}
    row: 12
    col: 8
    width: 8
    height: 6
  - title: CTR by City
    name: CTR by City
    model: synthetic_data
    explore: synthdata
    type: looker_geo_coordinates
    fields: [synthdata.city_postal_code, synthdata.city_state, sumclicks_t800, sumimpressions_t800,
      synthdata.count]
    sorts: [sumclicks_t800 desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${sumclicks_t800}/${sumimpressions_t800}"
      label: CTR_T800
      value_format:
      value_format_name: percent_4
      _kind_hint: measure
      table_calculation: ctr_t800
      _type_hint: number
    - category: measure
      expression:
      label: sum(impressions_t1000)
      value_format:
      value_format_name:
      based_on: synthdata.impressions_t1000
      _kind_hint: measure
      measure: sumimpressions_t1000
      type: sum
      _type_hint: number
    - category: measure
      expression:
      label: sum(clicks_t800)
      value_format:
      value_format_name:
      based_on: synthdata.clicks_t800
      _kind_hint: measure
      measure: sumclicks_t800
      type: sum
      _type_hint: number
    - category: measure
      expression: ''
      label: sum(impressions_t800)
      value_format:
      value_format_name:
      based_on: synthdata.impressions_t800
      _kind_hint: measure
      measure: sumimpressions_t800
      type: sum
      _type_hint: number
    - category: dimension
      expression: '"zipcode"'
      label: zipcode
      value_format:
      value_format_name:
      dimension: zipcode
      _kind_hint: dimension
      _type_hint: string
    map: usa
    map_projection: ''
    show_view_names: true
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_fields: [sumclicks_t800, sumimpressions_t800, synthdata.count]
    hidden_points_if_no: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
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
    groupBars: true
    labelSize: 10pt
    showLegend: true
    series_labels: {}
    quantize_colors: false
    listen: {}
    row: 12
    col: 16
    width: 8
    height: 6
