
Cloud Blog Contact sales Get started for free

Data Analytics

![0_image_0.png](0_image_0.png)

# Exploring Synthetic **Data** Generation With **Bigquery** Dataframes And **Llms**

June 11, 2024 In the realm of big data analytics, a common

| Shobhit Singh                            |               |
|------------------------------------------|---------------|
| Software Engineer BigQuery               | Firat Tekiner |
| Senior Staff Product Manager Data and AI |               |

challenge has been the separation between data processing and machine learning workflows. Traditionally, data engineers would use tools like Apache Spark for large-scale data processing in data warehouses like BigQuery, while data scientists would leverage libraries like pandas and scikit-learn for machine learning tasks. This disjointed approach led to inefficiencies, data duplication, and delays in deriving insights from data. At the same time AI's success hinges on vast amounts of data. Therefore, generation and management of synthetic data - fabricated data that mimics real-world data - has become a critical operation for any business. Synthetic data is generated either algorithmically to model datasets

used in production or through ML algorithms

![1_image_0.png](1_image_0.png) training such as generative AI. This synthetic data
Cloud Blog Contact sales Get started for free can emulate operational or production data, facilitating the training of machine learning (ML)
models or the evaluation of mathematical models.

## Bigquery Dataframes As A Solution

BigQuery DataFrames bridges the gap between data processing and machine learning by providing a unified, scalable, and cost-efficient platform for both tasks. This empowers organizations to accelerate their data-driven initiatives, improve collaboration between teams, and unlock the full potential of their data. BigQuery DataFrames is an open-source python package providing pandas-like DataFrame and scikit-learn-like ML library for big data. It utilizes BigQuery and the rest of Google Cloud as the storage and compute platform under the hood. It provides easy compute extensibility by integrating with Google Cloud Functions, and generative AI capabilities, including the state-ofthe-art generative AI models, by integrating with Vertex AI. This versatile set of capabilities allow BigQuey DataFrames to be used for developing scalable AI applications. BigQuery DataFrames allows you to generate artificial data at scale and mitigates a number of issues around moving the data outside of your ecosystem or using third-party solutions. When dealing with sensitive personal data, synthetic data

offers a privacy-preserving alternative. It allows you

![2_image_0.png](2_image_0.png) to share and collaborate on datasets without
Cloud Blog Contact sales Get started for free exposing individuals' private information. In addition, this allows deploying analytical models into production. Synthetic data also provides a safe environment for testing and validation. You can simulate edge cases, outliers, and rare events that might not be present in your real dataset. In addition, before making changes to your data warehouse schema or ETL processes, synthetic data allows you to simulate the impact of those changes, preventing costly errors and downtime.

## Bigquery Dataframes And Synthetic Data Generation In Action

Synthetic data generation is a need that arises in many applications where:
Real data generation is slow and expensive Sharing original data has a high governance bar compared with synthetic data, i.e., there are stringent rules, regulations, and oversight Larger scale data is needed for simulations Let's see the integration of BigQuery DataFrames together with LLMs to generate synthetic data right inside BigQuery using BigQuery DataFrames. This process has two main stages and number of substages as below: Code **generation**

Cloud Blog Contact sales Get started for free
1. Set the Schema and provide instructions to the LLM
1.1 The user knows the schema of the data they

![3_image_0.png](3_image_0.png)

![3_image_1.png](3_image_1.png) need 1.2 They have a high level sense of the code that could generate such data 1.3 They express the intent to generate code to generate such data on a small scale in a natural language (NL) prompt 1.4 Enrich the prompt with hints to guide the LLM to generate correct code 2. Send the prompt to the LLM and get generated code Code **execution** 3. Review and execute the code, loop back to step 1.1 if needed (human-in-the-loop) 4. Deploy the code as a *remote_function* and execute it at the desired scale 5. Post process to produce the data in the desired shape Cloud Blog Contact sales Get started for free

![4_image_0.png](4_image_0.png)

# Setting Up And Initializing The **Library**

To begin, let's install, import and initialize the BigQuery DataFrames library.

pip install **bigframes** import bigframes.pandas as bpd bpd.options.bigquery.project =
YOUR_GOOGLE_CLOUD_PROJECT
Then, let's use the GeminiTextExtractor to generate code that can generate the intended data, using the 5/18 Cloud Blog Contact sales Get started for free from bigframes.ml.llm **import** GeminiTextGenerator model = **GeminiTextGenerator()**
Step 1 - Generate synthetic data from user-specified schema Step 1.1 - Specify high-level schema **information** Let's say you want to generate demographic data with name, age and gender, and you want Latin American names that are gender inclusive. We express this intent in the prompt. We also include additional information to guide the LLM to generate the right code:
Use Faker, a popular Python library for generating fake data, as a building block. Use Pandas DataFrame to hold smaller-scale data prompt = **"""\** Write python code to generate a **pandas** dataframe based on the **requirements:**
Column name: Name, type: **string,**

![5_image_0.png](5_image_0.png)

Description: Latin American **Names**

Column name: Age, type: int

![6_image_0.png](6_image_0.png) Column name: Gender, type: **string,**

![6_image_1.png](6_image_1.png)

Cloud Blog Contact sales Get started for free Description: **Inclusive**
Note:
- Return the code **only,** no additional texts or **comments**
- Use faker **library** - Generate 100 **rows** - The final dataframe **should** be named **'result_df'.** """ df_prompt = **bpd.DataFrame({"prompt"** : [prompt]})
Step 1.2 - Call the LLM to generate the **code** Notice that we intend to generate code to create 100 rows of the intended data before scaling it later. Since we already defined the schema, now let's call into the LLM to generate the code:
df_result = **model.predict(df_prompt)**

![6_image_2.png](6_image_2.png) llm_result = df_result["ml_generate_text_llm_result "].iloc[0] \# Python code comes back as a **markdown** code **block,** \# remove the prefix "```python" and suffix **"```"**

# Code = **Llm_Result[9:-3]**

![7_Image_0.Png](7_Image_0.Png) Print(Code)

![7_Image_1.Png](7_Image_1.Png)

Cloud Blog Contact sales Get started for free The generated code looks like this:
import **pandas** as pd from faker import **Faker** faker = **Faker('es_ES')** \# Create a list of fake Latin **American** names names = [faker.name() for _ in range(100)] \# Create a list of fake ages **between** 18 and 65 ages = [faker.random_int(18, 65) for _ in **range(100)]** \# Create a list of fake **inclusive** genders genders = ['Male', 'Female', 'Nonbinary', **'Genderqueer']** \# Create a DataFrame with the **given** columns result_df = **pd.DataFrame({**
'Name': **names,** 'Age': **ages,** 'Gender':
[faker.random_element(genders) for _ in **range(100)]**

![8_image_0.png](8_image_0.png)

Cloud Blog Contact sales Get started for free

# Step 2 - Execute Code

In the previous step we provided all the guidance needed to the LLMs together with the description of the schema of the dataset we wish to generate.

In this step, we verify and execute the code. This process is important because it brings the human in the loop and adds another step to validate the output to be generated. Step 2.1 - Local verification of the **generated** code with a small **sample** The code that was generated in the previous stage looks alright. But first let's verify that it executes correctly:
execution_context = {}

![8_image_1.png](8_image_1.png) exec(code, **execution_context)** execution_context.get("result_df")

| Name        | Age                       | Gender   |
|-------------|---------------------------|----------|
| 0           | Bautista Mínguez Cánovas  | 65       |
| Male        |                           |          |
| 1           | Maite Belmonte Torrecilla | 29       |
| Genderqueer |                           |          |

...

![9_image_0.png](9_image_0.png)

.. ... ...

Cloud Blog Contact sales Get started for free 98 Ezequiel Hoz 59
Non-binary Female 99 Reyna Morera **Pino** 52
[100 rows x 3 **columns]**
At this point, if the generated code hadn't run or we wanted to fine-tune the data distribution, we would go back to the prompt and try updating it and follow the steps again. We could include the generated code and the issue we want to fix as additional information in the LLM prompt. Step 2.2 - Deploy the code as a remote **function** The data looks like a good fit based on what we wanted it to do, therefore, we can move forward and deploy the code as a remote function. Remote functions support scalar transformation, so we can use an indicator (in this case we pick integer) input, and produce a string output, which is the dataframe produced by the code serialized as json. We also need to specify any external package dependency, which in our case are *faker* and pandas.

@bpd.remote_function([int], **str,** packages=["faker", **"pandas"])** def **data_generator(id):**
context = {}

![10_image_0.png](10_image_0.png) exec(code, **context)**
Cloud Blog Contact sales Get started for free result_df = **context.get("result_df")** return result_df.to_json(orient="records")
Step 2.2.1 - Scale the data **generation**
Let's say we want to generate one million rows of synthetic data. Since our generated code produces 100 rows in one run, we can initialize an indicator dataframe with 1M/100 = 10K indicator rows. Then we can apply the remote function to produce 100 synthetic data rows for each indicator row.

desired_num_rows = **1_000_000** \# 1

![10_image_1.png](10_image_1.png) million **rows** batch_size = 100 \# used in the **prompt** num_batches = int(desired_num_rows/batch_size) df = **bpd.DataFrame({"row_id":** range(num_batches)}) df["json_data"] = df["row_id"].apply(data_generator)
Step 2.2.1 - Flatten the **JSON** At this point each item in *df["json_data"]* is a json serialized array of 100 records. Let's flatten that into one record per row using direct SQL.

# Sql = **F"""**

Cloud Blog Contact sales Get started for free WITH T0 AS **({df.sql}),** T1 AS (
SELECT **PARSE_JSON(json_row)** AS
json_row FROM T0, UNNEST(JSON_EXTRACT_ARRAY(json_data)) AS **json_row** ) SELECT STRING(json_row.Name) AS **Name,**
INT64(json_row.Age) AS **Age,** STRING(json_row.Gender) AS
Gender FROM T1 """ df_result = **bpd.read_gbq(sql)** df_result Name Age **Gender** 0 Duilio Marco **Asensio** 47 Female 1 Encarna **Durán-Simó** 59 Genderqueer 2 Benjamín Pazos Tejera 44 Nonbinary 3 Octavia Ramis **Hierro** 60 Male ... [1000000 rows x 3 **columns]**

There you have it, one million synthetic data rows in

![12_image_0.png](12_image_0.png) the *result_df* DataFrame that are ready to use, or to
Cloud Blog Contact sales Get started for free save in a BigQuery table for future use (using the to_gbq method). The costs involved in this exercise are that of the BigQuery, Vertex AI, Cloud Functions, Cloud Run, Cloud Build and Artifact Registry services. See BigQuery DataFrames pricing for more details. BigQuery jobs processed ~62MB bytes and used ~276K slot milliseconds in total.

## Generating **Synthetic** Data From An **Existing** Table **Schema**

In the previous step we demonstrated how synthetic data can be generated through a supplied schema. We could also generate synthetic data for an existing table. For example, you might be creating a copy of the production dataset for development purposes. While doing that you are looking to maintain similar data distribution together with the schema. In order to achieve this you would have to craft the LLM prompt from the column names, types, and any column descriptions in the existing table. In addition, data profiling metrics could be derived from the existing data in the table and added to the prompt, some examples being:
1. Any data distribution for the numeric columns.

You could use DataFrame.describe to get the column statistics.

2. Any hints for the data format for the string or date/time columns. You could use

![13_image_0.png](13_image_0.png)

![13_image_1.png](13_image_1.png)

Cloud Blog Contact sales Get started for free DataFrame.sample or Series.sample.

3. Any hints about the unique values in a categorical column. You could use Series.unique.

## Generating A Fact **Table** For An **Existing** Dimension **Table**

We could generate a synthetic fact table for an existing dimension table, which then could then be joined back to the dimension table. For example, if you have a table *usersTable* with schema **(userId,** userName, age, *gender)*, you could generate a transactionsTable with schema *(userId,* transactionDate, *transactionAmount)* where the userId is the key relationship. The steps to achieve this would be as follows:
1. Create LLM prompt to generate data for schema
(transactionDate, *transactionAmount)*
2. (Optional) To give a more natural distribution to the fact data, indicate in the prompt that the code should generate a random number of rows, say between 0 and 100 instead of fixed 100. You would have to compensate *batch_size* for that, which in this case should be set to 50 (assuming symmetrical distribution). Expect that

the final data generated may be a bit off from

![14_image_0.png](14_image_0.png) the *desired_num_rows* due to randomness.
Cloud Blog Contact sales Get started for free 3. Initialize the indicator dataframe with *userId* from the *usersTable* instead of the *range* used in the case of supplied schema.

4. Run the remote function of the LLM-generated code on the indicator dataframe as we did in the case of the supplied schema.

5. Select *userId* in addition to **(transactionDate,**
transactionAmount) in the final result.

## Conclusions And Resources

In this demonstration, we explored the use of BigQuery DataFrames for generating synthetic data, a crucial element in today's AI landscape. Due to data privacy concerns and the need for large datasets, synthetic data offers a valuable alternative for training machine learning models and testing systems. BigQuery DataFrames provides a powerful platform for this task, integrating seamlessly with your data warehouse and Vertex AI, including the advanced Gemini model. This allows you to generate data directly within your data warehouse, eliminating the need for third-party solutions or data movement. We showed a step-by-step process for generating synthetic data using BigQuery DataFrames and LLMs. This involves:

Code generation: Defining the desired data

![15_image_0.png](15_image_0.png) schema and using natural language prompts to
Cloud Blog Contact sales Get started for free instruct the LLM to generate the corresponding code.

Code execution: Deploying the code as a remote function and executing it at scale to generate large volumes of synthetic data.

You can find the complete Colab Enterprise notebook source code here. In addition, we highlighted the versatility of our approach, by also providing three options on how it can be used to:
1. Generate data from a user-specified schema:
Ideal when the real data is expensive to produce or has high governance restrictions.

2. Generate data based on an existing table schema: Useful for creating development datasets that mimic production data.

3. Generate a fact table for an existing dimension table: Enables the creation of synthetic transactional data linked to existing entities.

By leveraging BigQuery DataFrames and LLMs, organizations can efficiently generate synthetic data, addressing data privacy concerns and accelerating AI development. To learn more about these new features, check out the documentation.

 6:26 PM   data with   and LLMs |   Blog Many Googlers contributed to make these features a *reality.*
Cloud Blog Contact sales Get started for free Posted in Data Analytics—AI & Machine Learning Related articles

![16_image_0.png](16_image_0.png)

Data Analytics

```
Get your BigQuery production
                        
  sample, all self-serving
                     

```

Data Analytics

![16_image_1.png](16_image_1.png)

```
Share your streaming data with
                           
Pub/Sub topics in Analytics Hub
                            

```

![16_image_2.png](16_image_2.png)

By Prateek Duble - 4-minute read

![16_image_3.png](16_image_3.png)

Data Analytics

```
  Deployment patterns for
                      
Dataproc Metastore on Google
                         
          Cloud
               

```

By Rajashekar Pantangi - 7-minute read Data Analytics

```
Understanding BigQuery data
                           
canvas: how to easily transform
                            
   data into insights with AI
                        

```

By Layolin Jesudhass - 8-minute read 6:26 PM   data with   and LLMs |   Blog Cloud Blog Contact sales Get started for free Google Cloud Google Cloud Products Privacy Terms

![17_image_0.png](17_image_0.png)

Help English
