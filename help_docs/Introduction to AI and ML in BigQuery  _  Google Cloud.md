# Introduction To Ai And Ml In Bigquery

Note: This feature may not be available when using reservations that are created with certain BigQuery editions. For more information about which features are enabled in each edition, see Introduction to BigQuery editions (/bigquery/docs/editions-intro).

BigQuery ML lets you create and run machine learning (ML) models (/bigquery/docs/e2e-journey) by using GoogleSQL queries. It also lets you access Vertex AI models BigQuery ML in a minute

![0_image_0.png](0_image_0.png)

 (/bigquery/docs/generative-ai-overview) and Cloud AI APIs (/bigquery/docs/ai-application-overview) to perform artificial intelligence (AI) tasks like text generation or machine translation. Gemini for Google Cloud also provides AI-powered assistance for BigQuery tasks. To see a list of AI-powered features in BigQuery, see Gemini in BigQuery overview (/gemini/docs/bigquery/overview). Usually, performing ML or AI on large datasets requires extensive programming and knowledge of ML frameworks. These requirements restrict solution development to a very small set of people within each company, and they exclude data analysts who understand the data but have limited ML knowledge and programming expertise. However, with BigQuery ML, SQL practitioners can use existing SQL tools and skills to build and evaluate models, and to generate results from LLMs and Cloud AI APIs.

You can work with BigQuery ML capabilities by using the following:
The Google Cloud console The bq command-line tool The BigQuery REST API Integrated Colab Enterprise notebooks in BigQuery (/bigquery/docs/notebooks-introduction) External tools such as a Jupyter notebook or business intelligence platform

# Advantages Of Bigquery Ml

BigQuery ML offers several advantages over other approaches to using ML or AI with a cloudbased data warehouse:
BigQuery ML democratizes the use of ML and AI by empowering data analysts, the primary data warehouse users, to build and run models using existing business intelligence tools and spreadsheets. Predictive analytics can guide business decisionmaking across the organization.

You don't need to program an ML or AI solution using Python or Java. You train models and access AI resources by using SQL—a language that's familiar to data analysts. BigQuery ML increases the speed of model development and innovation by removing the need to move data from the data warehouse. Instead, BigQuery ML brings ML to the data, which offers the following advantages:
Reduced complexity because fewer tools are required. Increased speed to production because moving and formatting large amounts of data for Python-based ML frameworks isn't required to train a model in BigQuery.

For more information, watch the video How to accelerate machine learning development with BigQuery ML  (https://www.youtube.com/watch?v=EUPBVv9tp38).

## Generative Ai And Pretrained Models

You can use remote models (/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-remote-model) to access Vertex AI models and Cloud AI APIs from BigQuery ML in order to perform the following tasks:
Generative AI (/bigquery/docs/generative-ai-overview\#generative_ai) by using Vertex AI text or multimodal models (/vertex-ai/docs/generative-ai/learn/models\#foundation_models). Text or multimodal embedding (/bigquery/docs/generative-ai-overview\#text_embedding) by using Vertex AI embedding models. Natural language processing (/bigquery/docs/ai-application-overview\#natural_language_processing) by using the Cloud Natural Language API (/natural-language).

Machine translation (/bigquery/docs/ai-application-overview\#machine_translation) by using the Cloud Translation API (/translate). Document processing (/bigquery/docs/ai-application-overview\#document_processing) by using the Document AI API (/document-ai).

Audio transcription (/bigquery/docs/ai-application-overview\#audio_transcription) by using the Speech-to-Text API (/speech-to-text). Computer vision (/bigquery/docs/ai-application-overview\#computer_vision) by using the Cloud Vision API (/vision).

## Supported Models

A model (https://developers.google.com/machine-learning/glossary/\#model) in BigQuery ML represents what an ML system has learned from training data. The following sections describe the types of models that BigQuery ML supports.

## Internally Trained Models

The following models are built in to BigQuery ML:
Linear regression (/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-glm) is for forecasting. For example, this model forecasts the sales of an item on a given day. Labels are real-valued, meaning they cannot be positive infinity or negative infinity or a NaN (Not a Number).

Logistic regression (/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-glm) is for the classification of two or more possible values such as whether an input is low-value, medium-value, or high-value. Labels can have up to 50 unique values. K-means clustering (/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-kmeans) is for data segmentation. For example, this model identifies customer segments. K-means is an unsupervised learning technique, so model training doesn't require labels or split data for training or evaluation.

## Matrix Factorization

 (/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-matrix-factorization) is for creating product recommendation systems. You can create product recommendations using historical customer behavior, transactions, and product ratings, and then use those recommendations for personalized customer experiences.

## Principal Component Analysis (Pca)

 (/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-pca) is the process of computing the principal components and using them to perform a change of basis on the data. It's commonly used for dimensionality reduction by projecting each data point onto only the first few principal components to obtain lower-dimensional data while preserving as much of the data's variation as possible. Time series (/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-time-series) is for performing time series forecasts. You can use this feature to create millions of time series models and use them for forecasting. The model automatically handles anomalies, seasonality, and holidays.

You can perform a dry run (/bigquery/docs/running-queries\#dry-run) on the CREATE MODEL statements for internally trained models to get an estimate of how much data they will process if you run them.

## Externally Trained Models

The following models are external to BigQuery ML and trained in Vertex AI:
Deep neural network (DNN) (/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-dnn-models) is for creating TensorFlow-based deep neural networks for classification and regression models.

Wide & Deep (/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-wnd-models) is useful for generic large-scale regression and classification problems with sparse inputs (categorical features  (https://en.wikipedia.org/wiki/Categorical_variable) with a large number of possible feature values), such as recommender systems, search, and ranking problems. Autoencoder (/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-autoencoder) is for creating TensorFlow-based models with the support of sparse data representations. You can use the models in BigQuery ML for tasks such as unsupervised anomaly detection and non-linear dimensionality reduction. Boosted Tree (/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-boosted-tree) is for creating classification and regression models that are based on XGBoost
 (https://xgboost.readthedocs.io/en/latest/).

Random forest (/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-random-forest) is for constructing multiple learning method decision trees for classification, regression, and other tasks at training time.

AutoML (/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-automl) is a supervised ML service that builds and deploys classification and regression models on tabular data at high speed and scale.

You can't perform a dry run (/bigquery/docs/running-queries\#dry-run) on the CREATE MODEL statements for externally trained models to get an estimate of how much data they will process if you run them.

## Remote Models

You can create remote models (/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-remote-model\#endpoint) in BigQuery that use models deployed to Vertex AI (/vertex-ai/docs). You reference the deployed model by specifying the model's HTTPS endpoint (/vertex-ai/docs/general/deployment\#what_happens_when_you_deploy_a_model) in the remote model's CREATE MODEL statement. The CREATE MODEL statements for remote models don't process any bytes and don't incur BigQuery charges.

## Imported Models

BigQuery ML lets you import custom models that are trained outside of BigQuery and then perform prediction within BigQuery. You can import the following models into BigQuery from Cloud Storage (/storage):

## Open Neural Network Exchange (Onnx)

 (/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-onnx) is an open standard format for representing ML models. Using ONNX, you can make models that are trained with popular ML frameworks like PyTorch and scikit-learn available in BigQuery ML. TensorFlow (/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-tensorflow) is a free, open source software library for ML and artificial intelligence. You can use TensorFlow across a range of tasks, but it has a particular focus on training and inference of deep neural networks. You can load previously trained TensorFlow models into BigQuery as BigQuery ML models and then perform prediction in BigQuery ML. TensorFlow Lite (/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-tflite) is a light version of TensorFlow for deployment on mobile devices, microcontrollers, and other edge devices. TensorFlow optimizes existing TensorFlow models for reduced model size and faster inference. XGBoost (/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-xgboost) is an optimized distributed gradient boosting library designed to be highly efficient, flexible, and portable. It implements ML algorithms under the gradient boosting
 (https://en.wikipedia.org/wiki/Gradient_boosting) framework.

The CREATE MODEL statements for imported models don't process any bytes and don't incur BigQuery charges. In BigQuery ML, you can use a model with data from multiple BigQuery Datasets for training and for prediction.

Model selection guide

![6_image_0.png](6_image_0.png)

## Bigquery Ml And Vertex Al

BigQuery ML integrates with Vertex AI, which is the end-to-end platform for AI and ML in Google Cloud. You can register your BigQuery ML models to Model Registry in order to deploy these models to endpoints for online prediction. For more information, see the following:
- To learn more about using your BigQuery ML models with Vertex AI, see Manage BigQuery ML models with Vertex Al (/bigquery/docs/managing-models-vertex).

If you aren't familiar with Vertex AI and want to learn more about how it integrates with BigQuery ML, see Vertex AI for BigQuery users (/vertex-ai/docs/beginner/bqml). Watch the video How to simplify AI models with Vertex AI and BigQuery ML
 (https://www.youtube.com/watch?v=AVwwkqLOito).

## Bigquery Ml And Colab Enterprise

You can now use Colab Enterprise notebooks to perform ML workflows in BigQuery. Notebooks let you use SQL, Python, and other popular libraries and languages to accomplish your ML tasks. For more information, see Create notebooks (/bigquery/docs/create-notebooks).

## Supported Regions

BigQuery ML is supported in the same regions as BigQuery. For more information, see BigQuery ML locations (/bigquery/docs/locations\#bqml-loc).

## Pricing

BigQuery ML models are stored in BigQuery datasets like tables and views. For information about BigQuery ML pricing, see BigQuery ML pricing (/bigquery/pricing\#bqml).

For BigQuery storage pricing, see Storage pricing (/bigquery/pricing\#storage).

For BigQuery ML query pricing, see Query pricing (/bigquery/pricing\#analysis_pricing_models).

## Quotas

In addition to BigQuery ML-specific limits (/bigquery/quotas\#bqml-quotas), queries that use BigQuery ML functions and CREATE MODEL statements are subject to the quotas and limits on BigQuery query jobs (/bigquery/quotas\#query_jobs).

## Limitations

BigQuery ML isn't available in the Standard edition (/bigquery/docs/editions-intro).

BigQuery ML doesn't trigger autoscaling slots (/bigquery/docs/slots-autoscaling-intro). You must set a baseline
 (/bigquery/docs/slots-autoscaling-intro\#using_reservations_with_baseline_and_autoscaling_slots)
amount of slots to use BigQuery ML with a BigQuery edition (/bigquery/docs/editions-intro). This limitation only applies to externally trained models, not internally trained models. For more information about the types of models, see Supported models (\#supported_models).

## What'S Next

To get started using BigQuery ML, see Create machine learning models in BigQuery ML (/bigquery/docs/create-machine-learning-model). To learn more about machine learning and BigQuery ML, see the following resources:
Applying Machine Learning to your data with Google Cloud (https://www.coursera.org/learn/data-insights-gcp-apply-ml) course at Coursera Smart analytics and data management (/learn/training/data-engineering-and-analytics) training program Machine learning crash course
 (https://developers.google.com/machine-learning/crash-course/)
Machine learning glossary (https://developers.google.com/machine-learning/glossary/)
To learn about MLOps with Model Registry, see Manage BigQuery ML models in Vertex AI (/bigquery/docs/managing-models-vertex).

Except as otherwise noted, the content of this page is licensed under the Creative Commons Attribution 4.0 License
 (https://creativecommons.org/licenses/by/4.0/), and code samples are licensed under the Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0). For details, see the Google Developers Site Policies (https://developers.google.com/site-policies). Java is a registered trademark of Oracle and/or its affiliates.

Last updated 2024-08-21 UTC.