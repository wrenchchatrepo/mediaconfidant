- dashboard: google_ads_pulse
  title: Google Ads Pulse
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Spend
    name: Spend
    explore: ad_basic_stats
    type: single_value
    fields: [fact.total_cost, last_fact.total_cost]
    filters:
      fact.date_period_latest: 'Yes'
    limit: 500
    dynamic_fields: [{table_calculation: diff, label: Diff, expression: "(${fact.total_cost}\
          \ - ${last_fact.total_cost}) / ${last_fact.total_cost}", value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [last_fact.total_cost]
    listen:
      Period: fact.period
      Drill By: fact.drill_by
      Ad Group Name: ad_group.ad_group_name
    row: 17
    col: 0
    width: 6
    height: 4
  - title: Conversions
    name: Conversions
    explore: ad_basic_stats
    type: single_value
    fields: [fact.total_conversions, last_fact.total_conversions]
    filters:
      fact.date_period_latest: 'Yes'
    sorts: [fact.total_conversions desc]
    limit: 500
    dynamic_fields: [{table_calculation: diff, label: Diff, expression: "(${fact.total_conversions}\
          \ - ${last_fact.total_conversions}) /   ${last_fact.total_conversions}",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: gooooooooogle, palette_id: gooooooooogle-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [last_fact.total_conversions]
    listen:
      Period: fact.period
      Drill By: fact.drill_by
      Ad Group Name: ad_group.ad_group_name
    row: 17
    col: 6
    width: 6
    height: 4
  - name: <font color="#34A853" size="45" weight="bold"><i class="fa fa-home" aria-hidden="true"></i><strong>
      Measurements </strong> <font color= "#4285F4"size="45">Impressions, Clicks,
      CTR and CPC</font>
    type: text
    title_text: <font color="#34A853" size="4.5" weight="bold"><i class="fa fa-home"
      aria-hidden="true"></i><strong> Measurements </strong> <font color= "#4285F4"size="4.5">Impressions,
      Clicks, CTR and CPC</font>
    subtitle_text: ''
    body_text: |-
      <center> <b>Recommended Action</b> Drill into CTR to gauge which ads and keywords are successful and which need to be improved. The more your keywords and ads relate to each other and to your business, the more likely a user is to click on your ads.
      <center>
    row: 0
    col: 0
    width: 24
    height: 3
  - name: <font color="#34A853" size="45" weight="bold"><i class="fa fa-check" aria-hidden="true"></i><strong>
      Results </strong><font color= "#4285F4"size="45">Conversions and ROAS</font>
    type: text
    title_text: <font color="#34A853" size="4.5" weight="bold"><i class="fa fa-check"
      aria-hidden="true"></i><strong> Results </strong><font color= "#4285F4"size="4.5">Conversions
      and ROAS</font>
    body_text: |-
      <center> <b>Recommended Action</b> See which keywords, ads, ad groups, and campaigns are best at driving valuable customer activity.
      <center>
    row: 13
    col: 0
    width: 24
    height: 4
  - title: Impressions
    name: Impressions
    explore: ad_basic_stats
    type: single_value
    fields: [fact.total_impressions, last_fact.total_impressions]
    filters:
      fact.date_period_latest: 'Yes'
    limit: 500
    dynamic_fields: [{table_calculation: diff, label: Diff, expression: "(${fact.total_impressions}\
          \ - ${last_fact.total_impressions}) /  ${last_fact.total_impressions}",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: gooooooooogle, palette_id: gooooooooogle-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [last_fact.total_impressions]
    note_state: collapsed
    note_display: hover
    note_text: Each time your ad appears on Google or the Google Network, it's counted
      as one impression.
    listen:
      Period: fact.period
      Drill By: fact.drill_by
      Ad Group Name: ad_group.ad_group_name
    row: 3
    col: 0
    width: 6
    height: 4
  - title: Clicks
    name: Clicks
    explore: ad_basic_stats
    type: single_value
    fields: [fact.total_clicks, last_fact.total_clicks]
    filters:
      fact.date_period_latest: 'Yes'
    limit: 500
    dynamic_fields: [{table_calculation: diff, label: Diff, expression: "(${fact.total_clicks}\
          \ - ${last_fact.total_clicks}) /  ${last_fact.total_clicks}", value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: gooooooooogle, palette_id: gooooooooogle-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [last_fact.total_clicks]
    note_state: collapsed
    note_display: hover
    note_text: "When someone clicks your ad, like on the blue headline of a text ad,\
      \ Google Ads counts that as a click.\n\n"
    listen:
      Period: fact.period
      Drill By: fact.drill_by
      Ad Group Name: ad_group.ad_group_name
    row: 3
    col: 6
    width: 6
    height: 4
  - title: Click Through Rate (CTR)
    name: Click Through Rate (CTR)
    explore: ad_basic_stats
    type: single_value
    fields: [fact.average_click_rate, last_fact.average_click_rate]
    filters:
      fact.date_period_latest: 'Yes'
    limit: 500
    dynamic_fields: [{table_calculation: diff, label: Diff, expression: "(${fact.average_click_rate}\
          \ - ${last_fact.average_click_rate}) /  ${last_fact.average_click_rate}",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: gooooooooogle, palette_id: gooooooooogle-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [last_fact.average_click_rate]
    note_state: collapsed
    note_display: hover
    note_text: You can use CTR to gauge which ads and keywords are successful for
      you and which need to be improved. The more your keywords and ads relate to
      each other and to your business, the more likely a user is to click on your
      ad after searching on your keyword phrase.
    listen:
      Period: fact.period
      Drill By: fact.drill_by
      Ad Group Name: ad_group.ad_group_name
    row: 3
    col: 12
    width: 6
    height: 4
  - title: Cost per Click (CPC)
    name: Cost per Click (CPC)
    explore: ad_basic_stats
    type: single_value
    fields: [fact.average_cost_per_click, last_fact.average_cost_per_click]
    filters:
      fact.date_period_latest: 'Yes'
    limit: 500
    dynamic_fields: [{table_calculation: diff, label: Diff, expression: "(${fact.average_cost_per_click}\
          \ - ${last_fact.average_cost_per_click}) /  ${last_fact.average_cost_per_click}",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: gooooooooogle, palette_id: gooooooooogle-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [last_fact.average_cost_per_click]
    note_state: collapsed
    note_display: hover
    note_text: 'Cost-per-click (CPC) bidding means that you pay for each click on
      your ads. '
    listen:
      Period: fact.period
      Drill By: fact.drill_by
      Ad Group Name: ad_group.ad_group_name
    row: 3
    col: 18
    width: 6
    height: 4
  - title: Impressions (copy)
    name: Impressions (copy)
    explore: ad_basic_stats
    type: looker_line
    fields: [fact.total_impressions, fact.date_date, fact.total_clicks]
    fill_fields: [fact.date_date]
    filters:
      fact.date_period_latest: 'Yes'
    sorts: [fact.date_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: diff, label: Diff, expression: "(${fact.total_impressions}\
          \ - ${last_fact.total_impressions}) /  ${last_fact.total_impressions}",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: fact.total_impressions,
            id: fact.total_impressions, name: Impressions}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: fact.total_clicks,
            id: fact.total_clicks, name: Clicks}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: gooooooooogle, palette_id: gooooooooogle-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    title_hidden: true
    listen:
      Period: fact.period
      Drill By: fact.drill_by
      Ad Group Name: ad_group.ad_group_name
    row: 7
    col: 0
    width: 12
    height: 6
  - title: Impressions (copy 2)
    name: Impressions (copy 2)
    explore: ad_basic_stats
    type: looker_line
    fields: [fact.date_date, fact.average_click_rate, fact.average_cost_per_click]
    fill_fields: [fact.date_date]
    filters:
      fact.date_period_latest: 'Yes'
    sorts: [fact.date_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: diff, label: Diff, expression: "(${fact.total_impressions}\
          \ - ${last_fact.total_impressions}) /  ${last_fact.total_impressions}",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: fact.average_click_rate,
            id: fact.average_click_rate, name: Click Through Rate}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: right, series: [{axisId: fact.average_cost_per_click,
            id: fact.average_cost_per_click, name: Cost per Click}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    series_types: {}
    swap_axes: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: gooooooooogle, palette_id: gooooooooogle-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    title_hidden: true
    listen:
      Period: fact.period
      Drill By: fact.drill_by
      Ad Group Name: ad_group.ad_group_name
    row: 7
    col: 12
    width: 12
    height: 6
  - title: ROAS
    name: ROAS
    explore: ad_basic_stats
    type: single_value
    fields: [fact.average_value_per_cost, last_fact.average_value_per_cost]
    filters:
      fact.date_period_latest: 'Yes'
    limit: 500
    dynamic_fields: [{table_calculation: diff, label: Diff, expression: "(${fact.average_value_per_cost}\
          \ - ${last_fact.average_value_per_cost}) /   ${last_fact.average_value_per_cost}",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: gooooooooogle, palette_id: gooooooooogle-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    listen:
      Period: fact.period
      Drill By: fact.drill_by
      Ad Group Name: ad_group.ad_group_name
    row: 17
    col: 18
    width: 6
    height: 4
  - title: Conversion Value
    name: Conversion Value
    explore: ad_basic_stats
    type: single_value
    fields: [fact.total_conversionvalue, last_fact.total_conversionvalue]
    filters:
      fact.date_period_latest: 'Yes'
    limit: 500
    dynamic_fields: [{table_calculation: diff, label: Diff, expression: "(${fact.total_conversionvalue}\
          \ - ${last_fact.total_conversionvalue}) / ${last_fact.total_conversionvalue}",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    listen:
      Period: fact.period
      Drill By: fact.drill_by
      Ad Group Name: ad_group.ad_group_name
    row: 17
    col: 12
    width: 6
    height: 4
  filters:
  - name: Period
    title: Period
    type: field_filter
    default_value: 28 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: popover
    explore: ad_basic_stats
    listens_to_filters: []
    field: fact.period
  - name: Drill By
    title: Drill By
    type: field_filter
    default_value: campaign
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: inline
    explore: ad_basic_stats
    listens_to_filters: []
    field: fact.drill_by
  - name: Ad Group Name
    title: Ad Group Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    explore: ad_basic_stats
    listens_to_filters: []
    field: ad_group.ad_group_name
