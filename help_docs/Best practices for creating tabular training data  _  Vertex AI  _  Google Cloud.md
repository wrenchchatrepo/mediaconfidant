Try Gemini 1.5 Pro
 (https://console.cloud.google.com/vertex-ai/generative/multimodal/create/text?model=gemini-1.5-pro-preview0409&authuser=6)
, our most advanced multimodal model in Vertex AI, and see what you can build with a 1M token context window.

## Best Practices For Creating Tabular Training Data

Well-designed data increases the quality of the resulting machine learning model. You can use the guidelines on this page to increase the quality of your training data and model. The following topics are covered:
Best practices for all tabular data models (\#general) Best practices for tabular AutoML models (\#automl) Best practices for tabular forecasting models (\#forecasting) Best practices for data format (\#data-format)

## Best Practices For All Tabular Data Models

The following best practices apply whether you are creating an AutoML model or a custom-trained model that uses tabular data.

## Avoid Data Leakage

Data leakage happens when your training data includes predictive information that is not available when you ask for a prediction. Data leakage can cause your model to show excellent evaluation metrics, but perform poorly on real data.

For example, suppose you want to know how much ice cream your store will sell tomorrow. You cannot include the target day's temperature in your training data, because you will not know the temperature (it hasn't happened yet). However, you could use the *predicted* temperature from the previous day, which could be included in the prediction request.

Data leakage can also occur when you use the same data in multiple data splits. If you are using time series data, ensure that data from the same date is only used in one of the three data splits.

## Avoid Training-Serving Skew

Training-serving skew happens when you generate your training data differently than you generate the data you use to request predictions.

For example, if you use an average value, and for training purposes you average over 10 days, but when you request prediction, you average over the last month. In general, any difference between how you generate your training data and your serving data (the data you use to generate predictions) should be reviewed to prevent training-serving skew.

## Training-Serving Skew And Data Distribution

Training-serving skew can also occur based on your data distribution in your training, validation, and testing data splits. There is frequently a difference between the data distribution that a model will see when it is deployed in production versus the data distribution of the dataset that a model is trained on. For example, in production, a model may be applied on an entirely different population of users than those seen during training, or the model may be used to make predictions 30 days after the final training data was recorded.

For best results, ensure that the distribution of the data splits used to create your model accurately reflects the difference between the training data, and the data that you will be making predictions on in your production environment. Vertex AI could produce non-monotonic predictions, and if the production data is sampled from a very different distribution than the training data, non-monotonic predictions are not very reliable.

Furthermore, the difference in production data versus training data must be reflected in the difference between the validation data split and the training data split, and between the testing data split and the validation data split.

For example, if you are planning on making predictions about user lifetime value (LTV) over the next 30 days, then make sure that the data in your validation data split is from 30 days after the data in your training data split, and that the data in your testing data split is from 30 days after your validation data split. Similarly, if you want your model to be tuned to make generalized predictions about new users, then ensure that data from a specific user is only contained in a single split of your training data. For example, all of the rows that pertain to user1 are in the training data split, all of the rows that pertain to user2 are in the validation data split, and all of the rows that pertain to user3 are in the testing data split.

## Provide A Time Signal

For classification and regression models, if the underlying pattern in your data is likely to shift over time (it is not randomly distributed in time), make sure you provide that information to Vertex AI. You can provide a time signal in several ways:
If each row of data has a timestamp, make sure that column is included, has a transformation type of Timestamp, and is set as the **Time** column when you train your model. This ordering is used to split the data, with the most recent data as the test data, and the earliest data as the training data. Learn more
 (https://cloud.google.com/vertex-ai/docs/tabular-data/classification-regression/prepare-data? authuser=6\#time)
. If your time column does not have many distinct values, you should use a manual split instead of using the Time column to split your data. Otherwise, you might not get enough rows in each dataset, which can cause training to fail. If the time information is not contained in a single column, you can use a manual data split (https://cloud.google.com/vertex-ai/docs/tabular-data/data-splits?authuser=6) to use the most recent data as the test data, and the earliest data as the training data.

## Make Information Explicit Where Needed

For some data primitives, you can improve model quality by engineering features.

For example, if your data includes longitude and latitude, these columns are treated as numeric, with no special calculations. If location or distance provides signal for your problem, you must engineer a feature that provides that information explicitly.

Some data types that might require feature engineering:
Longitude/Latitude URLs IP addresses Email addresses Phone numbers Include calculated or aggregated data in a row Vertex AI uses only the input data in a single row to predict the target value for that row. If you have calculated or aggregated data from other rows or sources that would be valuable in determining the predicted value for a row, include that data with the source row. Be careful that your new column does not cause data leakage (\#data-leakage) or training-serving skew (\#training-serving-skew).

For example, if you want to predict next week's demand for a product, you can improve the quality of the prediction by including columns with the following values:
The total number of items in stock from the same category as the product.

The average price of items in stock from the same category as the product. The number of days before a known holiday when the prediction is requested. And so on...

In another example, if you want to predict whether a specific user will buy a product, you can improve the quality of the prediction by including columns with the following values:
The average historic conversion rate or click-through rate for the specific user. How many products are currently in the user's shopping cart.

## Avoid Bias

Make sure that your training data is representative of the entire universe of potential data that you will be making predictions for. For example, if you have customers that live all over the world, you should not use training data from only one country.

## Best Practices For Tabular Automl Models

The following best practices are for creating tabular training data for AutoML tabular models.

Represent null values appropriately If you are importing from CSV, use empty strings to represent null values. From BigQuery, use the NULL value.

If your data uses special characters or numbers to represent null values, including zero, these values are misinterpreted, reducing model quality.

## Avoid Missing Values Where Possible

Check your data for missing values, and correct them if possible. Otherwise, you can leave the value blank, and it is treated as a null value
 (https://cloud.google.com/vertex-ai/docs/datasets/data-types-tabular?authuser=6\#null-values).

## Use Spaces To Separate Text

Vertex AI tokenizes text strings and can derive training signal from individual words. It uses spaces to separate words; words separated by other characters are treated as a single entity.

For example, if you provide the text "red/green/blue", it is not tokenized into "red", "green", and "blue". If those individual words might be important for training the model, you should transform the text to "red green blue" before including it in your training data.

Make sure your categorical features are accurate and clean Data inconsistencies can cause categories to be incorrectly split. For example, if your data includes "Brown" and "brown", Vertex AI uses those values as separate categories, when you might have intended them to be the same. Misspellings can have a similar effect. Make sure you remove these kinds of inconsistencies from your categorical data before creating your training data.

## Use Extra Care With Imbalanced Classes For Classification Models

If you have imbalanced classes (a classification problem with one or more outcomes that is seen rarely), review the following tips.

Provide sufficient training data for the minority class Having too few rows of data for one class degrades model quality. If possible, you should provide at least 100 rows of data for every class.

Consider using a manual split Vertex AI selects the rows for the test dataset randomly (but deterministically). For imbalanced classes, you could end up with a small number of the minority class in your test dataset, or even none, which causes training to fail.

If you have imbalanced classes, you might want to assign a manual split (https://cloud.google.com/vertex-ai/docs/tabular-data/data-splits?authuser=6) to make sure enough rows with the minority outcomes are included in every split.

## Provide Enough Training Data

If you don't provide enough training data, the resulting model might perform poorly. The more columns you use to train your model, the more data you need to provide.

Your dataset must always include at least 1,000 rows. The following table provides some heuristics for how much training data to provide, depending on your objective.

| Objective      | Suggested minimum amount of training data                         |
|----------------|-------------------------------------------------------------------|
| Classification | At least 10 times as many rows as you have columns.               |
| Forecasting    | At least 10 time series for every column used to train the model. |
| Regression     | At least 50 times as many rows as the number of columns.          |

Leave all other preprocessing and transformations to Vertex AI

Unless otherwise noted above, let Vertex AI do the feature engineering for you when you train an AutoML model. AutoML does best when it has access to your underlying data. For a list of all the transformations AutoML performs by transformation type, see Vertex AI transformations (https://cloud.google.com/vertex-ai/docs/datasets/data-types-tabular?authuser=6\#transformations).

## Best Practices For Tabular Forecasting Models

Training data for forecasting models has some special considerations.

How to build forecasting mo…

![5_image_0.png](5_image_0.png)

Considerations for choosing the data granularity When you train a forecasting model, you specify the data *granularity*, or the time interval between the training data rows. It can be hourly, daily, weekly, monthly, or yearly. In addition, it can be every 1, 5, 10, 15, or 30 minutes.

The data granularity must be consistent throughout the training data, and all batch prediction data. If you specify a daily granularity, and there are 2 days between two training data rows, Vertex AI treats the interim day as missing data
 (https://cloud.google.com/vertex-ai/docs/datasets/data-types-tabular?authuser=6\#null-values), which can degrade model performance. Multiple rows in the same time series with the same timestamp (as determined by the granularity) are considered a validation error at training time. Generally, your data collection practices determine your data granularity.

## How To Find A Good Value For The Context Window

If you expect to have a lot of prediction data that does not extend into the past (cold starts), begin by setting the context window to 0. Otherwise, a context window between the size of the forecast horizon and 10 times the size of the forecast horizon should work well. You can try the following steps to find a good value for your data:
1. For the first training iteration, set the context window and the forecast horizon to the same value, and set your training budget to at least 6 hours.

2. Train the model again, with the same training budget, but double the size of the context window to 2 times the size of the forecast horizon.

3. If the evaluation metrics for the second model show substantial improvement, train the model again, increasing the context window to 5 times the size of the forecast horizon. Consider making a proportional increase to the training budget (if you trained for 10 hours in the first step, increase the training budget to 50 hours).

4. Continue increasing the context window until you are no longer seeing improved evaluation metrics or until you are satisfied with the results. Revert back to the lowest value of the context window that produced acceptable results.

Increasing the context window has the following effects:
Increases the training time With a larger context window, the model uses more data points in training, causing the training time to increase.

Increases the required amount of history for prediction data Your prediction data should provide as many historical datapoints as the value of the context window.

## Best Practices For Data Format

You can create your training data in either wide or narrow format (https://en.wikipedia.org/wiki/Wide_and_narrow_data). For regression and classification models, wide format is widely used and can be easier to assemble and review. For forecasting models using narrow format can help you avoid setting up unintentional connections between your data and your target (data leakage (\#data-leakage)).

When you create training data to train a forecasting model, each row should represent a **single** observation on a single time series. You must have a column that represents your time series identifier
 (https://cloud.google.com/vertex-ai/docs/tabular-data/forecasting/prepare-data?authuser=6\#data-structure)
(how the time series are distinguished from each other), and a column that represents the value that you will be predicting (your target). Then every other value in the row that is used to train the model must be present at the time you request a prediction for your target.

| Date       | Widget_1_Demand   | Widget_2_Demand   | Widget_3_Demand   | Promo   | Region   |
|------------|-------------------|-------------------|-------------------|---------|----------|
| 01/01/2019 | 112               | 241               | 0                 | 0       | CA       |
| 01/02/2019 | 141               | 219               | 0                 | 1       | CA       |
| 01/03/2019 | 149               | 244               | 0                 | 0       | CA       |
| 01/01/2019 | 52                | 0                 | 43                | 0       | IL       |
| 01/02/2019 | 81                | 0                 | 26                | 1       | IL       |
| 01/03/2019 | 89                | 0                 | 86                | 0       | IL       |

This table, in wide format, shows business data by date, but it would not be usable for a forecasting model in its current form. There is no single target column, no time series ID column, and for any given date, you will not know the demand for the other widgets at the time of prediction.

You could convert this table into this format:

| Date       | Product   | Region_CA_Demand   | Region_IL_Demand   | Promo   |
|------------|-----------|--------------------|--------------------|---------|
| 01/01/2019 | Widget_1  | 112                | 52                 | 0       |
| 01/02/2019 | Widget_1  | 141                | 81                 | 1       |
| 01/03/2019 | Widget_1  | 149                | 89                 | 0       |
| 01/01/2019 | Widget_2  | 241                | 0                  | 0       |
| 01/02/2019 | Widget_2  | 219                | 0                  | 1       |
| 01/03/2019 | Widget_2  | 244                | 0                  | 0       |
| 01/01/2019 | Widget_3  | 0                  | 43                 | 0       |
| 01/02/2019 | Widget_3  | 0                  | 26                 | 1       |
| 01/03/2019 | Widget_3  | 0                  | 86                 | 0       |

We now have a potential time series ID column, Product. However, this format could be used only to predict one of the regions, and the data for the other region would need to be known at the time of prediction. The solution is to convert to narrow format, so that each row represents a single observation. Any data that is independent of the time series is repeated for each row:

| Date       | Demand   | ID          | Promo   |
|------------|----------|-------------|---------|
| 01/01/2019 | 112      | Widget_1_CA | 0       |
| 01/02/2019 | 141      | Widget_1_CA | 1       |
| 01/03/2019 | 149      | Widget_1_CA | 0       |
| 01/01/2019 | 52       | Widget_1_IL | 0       |
| 01/02/2019 | 81       | Widget_1_IL | 1       |
| 01/03/2019 | 89       | Widget_1_IL | 0       |
| 01/01/2019 | 241      | Widget_2_CA | 0       |
| 01/02/2019 | 219      | Widget_2_CA | 1       |
| 01/03/2019 | 244      | Widget_2_CA | 0       |
| 01/01/2019 | 0        | Widget_2_IL | 0       |

| Date       | Demand   | ID          | Promo   |
|------------|----------|-------------|---------|
| 01/02/2019 | 0        | Widget_2_IL | 1       |
| 01/03/2019 | 0        | Widget_2_IL | 0       |
| 01/01/2019 | 0        | Widget_3_CA | 0       |
| 01/02/2019 | 0        | Widget_3_CA | 1       |
| 01/03/2019 | 0        | Widget_3_CA | 0       |
| 01/01/2019 | 43       | Widget_3_IL | 0       |
| 01/02/2019 | 26       | Widget_3_IL | 1       |
| 01/03/2019 | 86       | Widget_3_IL | 0       |

Now we have a time series identifier (ID), a target column (Demand), and a Time column (Date). In addition, each row is based on a single observation, which can be used to predict the target value.

The Promo column is used as a feature to train the model.

In reality, you will have many more rows and many more columns than these examples. But you must follow the guidelines here to structure your data to avoid data leakage (\#data-leakage).

## What'S Next

Is My Data Any Good? A Pre-ML Checklist
 (http://services.google.com/fh/files/blogs/data-prep-checklist-ml-bd-wp-v2.pdf?authuser=6)
Preparing and curating your data for machine learning
 (https://cloud.google.com/blog/products/gcp/preparing-and-curating-your-data-for-machine-learning? authuser=6)
Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies?authuser=6). Java is a registered trademark of Oracle and/or its affiliates. Last updated 2024-05-10 UTC.