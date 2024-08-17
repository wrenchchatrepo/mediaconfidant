# This example use ARIMA as part of BigQeury ML Timeseries Forecasting



# 1. Training data for ARIMA MODEL, generated for the main explore "Ad Basic Stats"
# and will serve as input to the training the forecast model
#
# We're using a full complete year of data minus one day to train de model that could be regenerated
# daily (datagroup_trigger : daily) in order to include changes in the budget or configuration of the block
#
# The forecasted result for the last complete day will be compared with the actual clicks
# to detect anomalies
#
# Training data could include other metrics to be forceast
# https://cloud.google.com/bigquery-ml/docs/reference/standard-sql/bigqueryml-syntax-create-time-series


view: timeseries_training_data {
  derived_table: {
    datagroup_trigger: daily
    explore_source: ad_basic_stats {
      column: date { field: fact.date_date }
      column: total_clicks { field: fact.total_clicks }
      filters: {
        field: fact.date_date
        value: "364 days ago for 363 days"
      }

      filters: {
        field: fact.date_period_latest
        value: "Yes"
      }
    }
  }
  dimension: date {
    label: "Ad Performance Date"
    type: date
  }
  dimension: total_clicks {
    label: "Ad Performance Clicks"
    description: "Total ad clicks."
    type: number
  }
}

# 2. daily clicks data to be used to compare with the forecast data
# This view include last complete day clicks

view: timeseries_data {
  derived_table: {
    datagroup_trigger: daily
    explore_source: ad_basic_stats {
      column: total_clicks { field: fact.total_clicks }
      column: date { field: fact.date_date }
      filters: {
        field: fact.period
        value: "364 day"
      }
    }
  }
  dimension: date {
    label: "Ad Performance Date"
    type: date
  }
  dimension: total_clicks {
    label: "Ad Performance Clicks"
    description: "Total ad clicks."
    type: number
  }
}

# 3. The following view creates the model type ARIMA based on
# This view include last complete day clicks
# time_series_timestamp_col = 'date' refering to the date column from input data
# time_series_data_col = 'total_clicks'refering to total clicks column
#
# https://cloud.google.com/bigquery-ml/docs/reference/standard-sql/bigqueryml-syntax-create-time-series

view: arima_model {
  derived_table: {
    datagroup_trigger: daily
    sql_create:
      CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
      OPTIONS
       (model_type = 'ARIMA',
        time_series_timestamp_col = 'date',
        time_series_data_col = 'total_clicks',
        auto_arima = TRUE,
        data_frequency = 'AUTO_FREQUENCY'
      ) AS

      SELECT
        date as date,
        total_clicks AS total_clicks
      FROM
       ${timeseries_training_data.SQL_TABLE_NAME}
      ;;
  }
}

# 4. This view leverage ML.EVALUATE functions to return the following columns for ARIMA-based time series models:
#
# time_series_id
# non_seasonal_p
# non_seasonal_d
# non_seasonal_q
# has_drift
# log_likelihood
# AIC
# variance
# seasonal_periods

# This view is used evaluate model metrics
# https://cloud.google.com/bigquery-ml/docs/reference/standard-sql/bigqueryml-syntax-evaluate#mlevaluate_function

view: arima_eval  {
  #Inspect the evaluation metrics of all evaluated models
  derived_table: {
    sql: SELECT
      *
      FROM
      ML.EVALUATE(MODEL ${arima_model.SQL_TABLE_NAME}) ;;
  }

  dimension: non_seasonal_p {
    type: number
    sql: ${TABLE}.non_seasonal_p ;;
  }

  dimension: non_seasonal_d {
    type: number
    sql: ${TABLE}.non_seasonal_d ;;
  }

  dimension: non_seasonal_q {
    type: number
    sql: ${TABLE}.non_seasonal_q ;;
  }

  dimension: has_drift {
    type: string
    sql: ${TABLE}.has_drift ;;
  }

  dimension: log_likelihood {
    type: number
    sql: ${TABLE}.log_likelihood ;;
  }

  dimension: aic {
    type: number
    sql: ${TABLE}.AIC ;;
  }

  dimension: variance {
    type: number
    sql: ${TABLE}.variance ;;
  }

  dimension: seasonal_periods {
    type: string
    sql: ${TABLE}.seasonal_periods ;;
  }

}


# 4. This view use :
# The ML.ARIMA_COEFFICIENTS function lets you see the ARIMA model coefficients. This function only applies to the time series model.
#
# https://cloud.google.com/bigquery-ml/docs/reference/standard-sql/bigqueryml-syntax-arima-coefficients


view: arima_coefficients  {

  derived_table: {
    sql: SELECT
         *
        FROM
        ML.ARIMA_COEFFICIENTS(MODEL ${arima.SQL_TABLE_NAME}) ;;
  }

  dimension: ar_coefficients {
    type: number
    sql: ${TABLE}.ar_coefficients ;;
  }

  dimension: ma_coefficients {
    type: number
    sql: ${TABLE}.ma_coefficients ;;
  }

  dimension: intercept_or_drift {
    type: number
    sql: ${TABLE}.intercept_or_drift ;;
  }

}

# 5. ARIMA FORECAST view uses The ML.FORECAST function forecasts a time series based on a trained time series model.
#
# Horizon is the number of time points to forecast
# The percentage of the future values that fall in the prediction interval

view: arima_forecast {
  derived_table: {
    datagroup_trigger: daily
    sql: SELECT
         *
        FROM
        ML.FORECAST(MODEL ${arima_model.SQL_TABLE_NAME},
              STRUCT(30 AS horizon, 0.8 AS confidence_level)) ;;
  }

  dimension_group: forecast_timestamp {
    type: time
    sql: ${TABLE}.forecast_timestamp ;;
  }

  dimension: forecast_value {
    type: number
    sql: ${TABLE}.forecast_value ;;
  }

  dimension: standard_error {
    type: number
    sql: ${TABLE}.standard_error ;;
  }

  dimension: confidence_level {
    type: number
    sql: ${TABLE}.confidence_level ;;
  }

  dimension: prediction_interval_lower_bound {
    type: number
    sql: ${TABLE}.prediction_interval_lower_bound ;;
  }

  dimension: prediction_interval_upper_bound {
    type: number
    sql: ${TABLE}.prediction_interval_upper_bound ;;
  }

  dimension: confidence_interval_lower_bound {
    type: number
    sql: ${TABLE}.confidence_interval_lower_bound ;;
  }

  dimension: confidence_interval_upper_bound {
    type: number
    sql: ${TABLE}.confidence_interval_upper_bound ;;
  }
}


# 6. This view union values from daily click data (timeseries_data) and arima_forecast
# It the results of the forecast with historical data of the clicks.
#
#

view: click_fraud_analysis {
  derived_table: {
    datagroup_trigger: daily
    sql:
        SELECT
         history_timestamp AS timestamp,
         history_value,
         NULL AS forecast_value,
         NULL AS prediction_interval_lower_bound,
         NULL AS prediction_interval_upper_bound
        FROM
         (
           SELECT
             date AS history_timestamp,
             sum(total_clicks) AS history_value
           FROM
             ${timeseries_data.SQL_TABLE_NAME}
           GROUP BY date
           ORDER BY date ASC
         )
        UNION ALL
        SELECT
         forecast_timestamp AS timestamp,
         NULL AS history_value,
         forecast_value,
         prediction_interval_lower_bound,
         prediction_interval_upper_bound
        FROM
         ${arima_forecast.SQL_TABLE_NAME};;
  }


  dimension_group: timestamp {
    label:"Ad Performance"
    type: time
    timeframes: [date, week, quarter, year ]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: history_value {
    label: "History Clicks"
    type: number
    sql: ${TABLE}.history_value ;;
  }

  dimension: forecast_value {
    label: "Forecast Clicks"
    type: number
    sql: ${TABLE}.forecast_value ;;
  }

  dimension: prediction_interval_lower_bound {
    type: number
    sql: ${TABLE}.prediction_interval_lower_bound ;;
  }

  dimension: prediction_interval_upper_bound {
    type: number
    sql: ${TABLE}.prediction_interval_upper_bound ;;
  }

  #dimension: is_in_prediction_interval {
  #  description: "Is the history values included in prediction interval"
  #  type: yesno
  #  sql: ${history_value} >= ${prediction_interval_lower_bound}
  #  AND ${history_value} <= ${prediction_interval_upper_bound} ;;
  #}


  dimension: clicks {
    label: "Clicks"
    sql: ROUND(IFNULL(${history_value},0) + IFNULL(${forecast_value},0));;
    type: number
  }

  ####

  measure: lower_bound {
    label: "Prediction Lower Bound"
    description: "Lowest number allowed within bounds"
    type: max
    sql: nullif(${prediction_interval_lower_bound},0) ;;
    value_format_name: decimal_0
  }

  measure: upper_bound {
    label: "Prediction Upper Bound"
    description: "Highest number allowed within bounds"
    type: max
    sql: nullif(${prediction_interval_upper_bound},0) ;;
    value_format_name: decimal_0
  }


  measure: total_clicks_forecasted {
    description: "Forecasted clicks by ARIMA"
    type: number
    sql: nullif(sum(${forecast_value}),0);;
    value_format_name: decimal_0
  }

  measure: total_clicks_history {
    description: "Actual Clicks"
    type: number
    sql: nullif(sum(${history_value}),0) ;;
    value_format_name: decimal_0

    link: {
      label: "Click Fraud Analysis"
      icon_url: "https://www.google.com/s2/favicons?domain=www.ads.google.com"
      url: "/dashboards/block_google_ads_transfer_v2::click_fraud_analysis?Date={{timestamp_date._value | url_encode}}
      &Comparaisons%20Dates={{timestamp_date._value | url_encode}}%20-%207%20days%2C%20{{timestamp_date._value | url_encode}}%20-%201%20day%2C%20{{timestamp_date._value | url_encode}}"
    }
  }

  measure: is_out_of_bounds {
    description: "The clicks for this day are outside of the ARIMA predicution boundries ( 80% confidence level ) "
    type: yesno
    sql: ${click_fraud_analysis.total_clicks_history} >=
          ${click_fraud_analysis.lower_bound} AND
          ${click_fraud_analysis.total_clicks_history} <= ${click_fraud_analysis.upper_bound} ;;
  }








}
