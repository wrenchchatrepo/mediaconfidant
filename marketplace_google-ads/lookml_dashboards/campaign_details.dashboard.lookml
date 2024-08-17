- dashboard: campaign_details_lookup
  title: Campaign Details Lookup
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Start Date
    name: Start Date
    explore: ad_basic_stats
    type: single_value
    fields: [campaign.start_date]
    fill_fields: [campaign.start_date]
    filters:
      fact.date_period_latest: 'yes'
    sorts: [campaign.start_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: The date the campaign was initially started. Name Changes of the campaign
      are not taken into account.
    listen:
      CampaignName: campaign.campaign_name
      Period: fact.period
    row: 0
    col: 9
    width: 5
    height: 2
  - title: Campaign
    name: Campaign
    explore: ad_basic_stats
    type: single_value
    fields: [campaign.campaign_name]
    filters:
      fact.date_period_latest: 'yes'
    sorts: [campaign.campaign_name]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: The current name of the campaign.
    listen:
      CampaignName: campaign.campaign_name
      Period: fact.period
    row: 0
    col: 0
    width: 9
    height: 2
  - title: Status
    name: Status
    model: block_google_ads_transfer_new_v2
    explore: ad_basic_stats
    type: single_value
    fields: [campaign.campaign_status]
    filters:
      fact.date_period_latest: 'yes'
    sorts: [campaign.campaign_status]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: |-
      Current status of your campaign.
      Active, Enabled, Removed, Deleted
    listen:
      CampaignName: campaign.campaign_name
      Period: fact.period
    row: 0
    col: 14
    width: 5
    height: 2
  - title: " End Date"
    name: " End Date"
    model: block_google_ads_transfer_new_v2
    explore: ad_basic_stats
    type: single_value
    fields: [campaign.end_date]
    fill_fields: [campaign.end_date]
    filters:
      fact.date_period_latest: 'yes'
    sorts: [campaign.end_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: End Date in case an end date for the campaign was set.
    listen:
      CampaignName: campaign.campaign_name
      Period: fact.period
    row: 0
    col: 19
    width: 5
    height: 2
  - title: Cost vs Budget
    name: Cost vs Budget
    model: block_google_ads_transfer_new_v2
    explore: ad_basic_stats
    type: looker_line
    fields: [budget.bu_amount, budget._data_date, fact.total_cost]
    fill_fields: [budget._data_date]
    filters:
      fact.date_period_latest: 'yes'
    sorts: [budget._data_date desc]
    limit: 500
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
    y_axes: [{label: '', orientation: left, series: [{axisId: budget.bu_amount, id: budget.bu_amount,
            name: Bu Amount}, {axisId: fact.total_cost, id: fact.total_cost, name: Cost}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
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
    note_display: hover
    note_text: You see how much your Budget is (blue) vs. how much you actually spend
      (red)
    listen:
      CampaignName: campaign.campaign_name
      Period: fact.period
    row: 5
    col: 8
    width: 16
    height: 8
  - title: Current Budget
    name: Current Budget
    model: block_google_ads_transfer_new_v2
    explore: ad_basic_stats
    type: single_value
    fields: [budget.Current_Budget]
    filters:
      fact.date_period_latest: 'yes'
    sorts: [budget.Current_Budget desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: 'Current daily budget you have set for your campaign. '
    listen:
      CampaignName: campaign.campaign_name
      Period: fact.period
    row: 5
    col: 0
    width: 4
    height: 3
  - title: Clicks
    name: Clicks
    model: block_google_ads_transfer_new_v2
    explore: ad_basic_stats
    type: single_value
    fields: [fact.total_clicks, last_fact.total_clicks]
    filters:
      fact.date_period_latest: 'yes'
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: "% Change", expression: "(${fact.total_clicks}\
          \ - ${last_fact.total_clicks}) /  ${last_fact.total_clicks}", value_format: !!null '',
        value_format_name: percent_1, _kind_hint: measure, _type_hint: number}]
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
    show_view_names: false
    defaults_version: 1
    series_types: {}
    hidden_fields: [last_fact.total_clicks]
    note_state: collapsed
    note_display: hover
    note_text: Number of clicks your Ads of the current Campaign received and how
      this compares to the previous period.
    listen:
      CampaignName: campaign.campaign_name
      Period: fact.period
    row: 16
    col: 6
    width: 6
    height: 4
  - title: Conversion Rate
    name: Conversion Rate
    model: block_google_ads_transfer_new_v2
    explore: ad_basic_stats
    type: single_value
    fields: [fact.average_conversion_rate, last_fact.average_conversion_rate]
    filters:
      fact.date_period_latest: 'yes'
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: "% change", expression: "(${fact.average_conversion_rate}\
          \ - ${last_fact.average_conversion_rate}) /  ${last_fact.average_conversion_rate}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
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
    show_view_names: false
    defaults_version: 1
    series_types: {}
    hidden_fields: [last_fact.average_conversion_rate]
    note_state: collapsed
    note_display: hover
    note_text: |-
      Conversion Rate tells you how many of your Clicks resulted in a action that you defined as valuable to your business, such as an online purchase or a call to your business from a mobile phone.

      Additionally, the % Change to the previous period is given.
    listen:
      CampaignName: campaign.campaign_name
      Period: fact.period
    row: 16
    col: 12
    width: 6
    height: 4
  - title: Impressions
    name: Impressions
    model: block_google_ads_transfer_new_v2
    explore: ad_basic_stats
    type: single_value
    fields: [fact.total_impressions, last_fact.total_impressions]
    filters:
      fact.date_period_latest: 'yes'
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: "% change", expression: "(${fact.total_impressions}\
          \ - ${last_fact.total_impressions}) /  ${last_fact.total_impressions}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: calculation_2, label: Calculation
          2, expression: "(${fact.total_impressions} - ${last_fact.total_impressions})\
          \ /  ${last_fact.total_impressions}", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, is_disabled: true}]
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
    show_view_names: false
    defaults_version: 1
    series_types: {}
    hidden_fields: [last_fact.total_impressions]
    note_state: collapsed
    note_display: hover
    note_text: Current Impressions (how many times your ads were shown) for your campaign
      and % Change to previous period.
    listen:
      CampaignName: campaign.campaign_name
      Period: fact.period
    row: 16
    col: 0
    width: 6
    height: 4
  - title: ROAS
    name: ROAS
    model: block_google_ads_transfer_new_v2
    explore: ad_basic_stats
    type: single_value
    fields: [fact.average_value_per_cost, last_fact.average_value_per_cost]
    filters:
      fact.date_period_latest: 'yes'
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: "$ change", expression: "(${fact.average_value_per_cost}\
          \ - ${last_fact.average_value_per_cost}) /  ${last_fact.average_value_per_cost}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
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
    show_view_names: false
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: |-
      ROAS (return on ad spend) is a marketing metric that measures how much your business earns in revenue for every dollar spent on marketing or advertising.

      You are given ROAS and the % Change to the previous period.
    listen:
      CampaignName: campaign.campaign_name
      Period: fact.period
    row: 16
    col: 18
    width: 6
    height: 4
  - title: Cost to Date
    name: Cost to Date
    model: block_google_ads_transfer_new_v2
    explore: ad_basic_stats
    type: single_value
    fields: [fact.total_cost]
    filters:
      fact.date_period_latest: 'yes'
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: Overall cost spent on the campaign so far.
    listen:
      CampaignName: campaign.campaign_name
    row: 5
    col: 4
    width: 4
    height: 3
  - name: Monetary KPI
    type: text
    title_text: <font color="#34A853" size="45" weight="bold"><i class="fa fa-money" aria-hidden="true"></i><strong>Monetary KPIs </strong>
    subtitle_text: ''
    body_text: <center>Cost vs. Budget information in regards to your current campaign as well as information for all campaigns</center>
    row: 2
    col: 0
    width: 24
    height: 3
  - name: <h1 style="font-size:30px"><center>Campaign Measurements</center></h1>
    type: text
    title_text: <h1 style="font-size:30px"><center>Campaign Measurements</center></h1>
    subtitle_text: ''
    body_text: <h1 style="color:rgb(66,133,244); font-size:20px"><center>Campaign
      measure include Impressions, Clicks, Conversion Rate, ROAS</center></h1>
    row: 13
    col: 0
    width: 24
    height: 3
  - title: Current Campaign Budget vs Others
    name: Current Campaign Budget vs Others
    model: block_google_ads_transfer_new_v2
    explore: ad_basic_stats
    type: looker_column
    fields: [campaign.campaign_comparitor, budget.Current_Budget]
    pivots: [campaign.campaign_comparitor]
    filters:
      fact.period: 28 day
      fact.date_period_latest: 'Yes'
    sorts: [campaign.campaign_comparitor]
    limit: 500
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
    limit_displayed_rows: false
    legend_position: right
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
    y_axes: [{label: '', orientation: left, series: [{axisId: budget.Current_Budget,
            id: budget.Current_Budget, name: Current Budget}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hide_legend: false
    series_types: {}
    series_colors:
      Rest of Campaigns - budget.Current_Budget: "#999"
    column_spacing_ratio: 0.6
    show_dropoff: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Your Current Campaign Budget vs. the average of all other campaigns
      will tell you whether this is a high priority Campaign or not. '
    listen:
      CampaignName: campaign.campaign_selector
    row: 8
    col: 0
    width: 8
    height: 5
  - title: Ad Group Details
    name: Ad Group Details
    model: block_google_ads_transfer_new_v2
    explore: ad_basic_stats
    type: looker_grid
    fields: [fact.total_impressions, fact.total_clicks, ad_group.ad_group_name, fact.average_click_rate]
    filters:
      fact.date_period_latest: 'Yes'
    sorts: [fact.total_impressions desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: click_rate, label: Click Rate, expression: "${fact.total_clicks}/${fact.total_impressions}",
        value_format: !!null '', value_format_name: percent_2, is_disabled: true,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: gooooooooogle
      palette_id: gooooooooogle-categorical-0
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      fact.total_impressions:
        is_active: true
        palette:
          palette_id: 780cfc51-82fd-7f39-bdcd-668e9c963947
          collection_id: gooooooooogle
          custom_colors:
          - "#BBB"
          - "#0000ff"
      diff:
        is_active: true
        palette:
          palette_id: 696dfb4a-98f4-577d-c3b8-f264cc18b52e
          collection_id: gooooooooogle
          custom_colors:
          - "#bbb"
          - "#0000ff"
      click_rate:
        is_active: true
        palette:
          palette_id: dfcac008-1220-8217-52a4-113e7c5c0279
          collection_id: gooooooooogle
          custom_colors:
          - "#bbb"
          - "#0000ff"
      fact.average_click_rate:
        is_active: true
        palette:
          palette_id: 47058a94-7550-4c2c-a705-a72a4a46ef30
          collection_id: gooooooooogle
          custom_colors:
          - "#bbb"
          - "#0000ff"
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: gooooooooogle, palette_id: gooooooooogle-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: fact.total_impressions,
            id: fact.total_impressions, name: Impressions}, {axisId: fact.total_clicks,
            id: fact.total_clicks, name: Clicks}, {axisId: fact.average_conversion_rate,
            id: fact.average_conversion_rate, name: Conversion Rate}, {axisId: fact.average_value_per_cost,
            id: fact.average_value_per_cost, name: ROAS}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: diff, id: diff, name: Diff}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
    legend_position: center
    series_types: {}
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    defaults_version: 1
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: KPIs by your Ad Groups to see which Ad Groups are performing better
      and which ones may need optimisation.
    listen:
      CampaignName: campaign.campaign_name
      Period: fact.period
    row: 32
    col: 0
    width: 12
    height: 11
  - title: Top 20 Keyword Criteria
    name: Top 20 Keyword Criteria
    model: block_google_ads_transfer_new_v2
    explore: ad_basic_stats
    type: looker_grid
    fields: [fact.total_impressions, fact.total_clicks, keyword.criteria, fact.average_click_rate]
    filters:
      fact.date_period_latest: 'Yes'
    sorts: [fact.total_impressions desc]
    limit: 20
    column_limit: 50
    dynamic_fields: [{table_calculation: click_rate, label: Click Rate, expression: "${fact.total_clicks}/${fact.total_impressions}",
        value_format: !!null '', value_format_name: percent_2, is_disabled: true,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: gooooooooogle
      palette_id: gooooooooogle-categorical-0
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      fact.total_impressions:
        is_active: true
        palette:
          palette_id: 780cfc51-82fd-7f39-bdcd-668e9c963947
          collection_id: gooooooooogle
          custom_colors:
          - "#BBB"
          - "#0000ff"
      diff:
        is_active: true
        palette:
          palette_id: 4909cb8b-37ad-d474-9620-bfd1cdda0ad8
          collection_id: gooooooooogle
          custom_colors:
          - "#bbb"
          - "#0000ff"
      click_rate:
        is_active: true
        palette:
          palette_id: 6ca1fb1f-5b4f-eece-993f-555dc7cabc0b
          collection_id: gooooooooogle
          custom_colors:
          - "#bbb"
          - "#0000ff"
      fact.average_click_rate:
        is_active: true
        palette:
          palette_id: 2c1ea8d3-12bc-a4f1-fcb7-4184a7bfdc93
          collection_id: gooooooooogle
          custom_colors:
          - "#bbb"
          - "#0000ff"
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: gooooooooogle, palette_id: gooooooooogle-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: fact.total_impressions,
            id: fact.total_impressions, name: Impressions}, {axisId: fact.total_clicks,
            id: fact.total_clicks, name: Clicks}, {axisId: fact.average_conversion_rate,
            id: fact.average_conversion_rate, name: Conversion Rate}, {axisId: fact.average_value_per_cost,
            id: fact.average_value_per_cost, name: ROAS}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: diff, id: diff, name: Diff}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
    legend_position: center
    series_types: {}
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    defaults_version: 1
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: Which Keyword Criteria are successful and result in Clicks. We recommend
      sorting only on Clicks and Impressions since single search terms that generate
      a Click will result in 100% Click Through Rate but are not relevant due to the
      low number of searches.
    listen:
      CampaignName: campaign.campaign_name
      Period: fact.period
    row: 32
    col: 12
    width: 12
    height: 11
  - name: '<h1 style="font-size:30px"><center>Ad Group and Keyword Measurements</center></h1> '
    type: text
    title_text: '<h1 style="font-size:30px"><center>Ad Group and Keyword Measurements</center></h1> '
    subtitle_text: ''
    body_text: <h1 style="color:rgb(66,133,244); font-size:20px"><center>Ad Group
      and Keyword Criteria measures shown are Impressions, Clicks and CTR (Click Through
      Rate) so you understand which Ad Groups and/or Keyword Criteria to optimise.</center></h1>
    row: 29
    col: 0
    width: 24
    height: 3
  - title: Campaign Measures Trending
    name: Campaign Measures Trending
    model: block_google_ads_transfer_new_v2
    explore: ad_basic_stats
    type: looker_line
    fields: [fact.total_impressions, fact.date_date, fact.total_clicks, fact.average_conversion_rate,
      fact.average_value_per_cost]
    fill_fields: [fact.date_date]
    filters:
      fact.date_period_latest: 'yes'
    sorts: [fact.date_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: "% change", expression: "(${fact.total_impressions}\
          \ - ${last_fact.total_impressions}) /  ${last_fact.total_impressions}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
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
            id: fact.total_impressions, name: Impressions}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: left, series: [{axisId: fact.total_clicks, id: fact.total_clicks,
            name: Clicks}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: fact.average_conversion_rate, id: fact.average_conversion_rate,
            name: Conversion Rate}, {axisId: fact.average_value_per_cost, id: fact.average_value_per_cost,
            name: ROAS}], showLabels: false, showValues: false, maxValue: 100, minValue: 0,
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
    defaults_version: 1
    hidden_fields: []
    note_state: collapsed
    note_display: above
    note_text: You can click on any measure in the "Legend" to hide it from view.
    listen:
      CampaignName: campaign.campaign_name
      Period: fact.period
    row: 20
    col: 0
    width: 24
    height: 9
  filters:
  - name: CampaignName
    title: CampaignName
    type: field_filter
    default_value: NA - Brand | 141863126
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: block_google_ads_transfer_new_v2
    explore: ad_basic_stats
    listens_to_filters: []
    field: campaign.campaign_name
  - name: Period
    title: Period
    type: field_filter
    default_value: 28 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: popover
    model: block_google_ads_transfer_new_v2
    explore: ad_basic_stats
    listens_to_filters: []
    field: fact.period