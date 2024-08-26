# Making Sense Of Vector Search And Embeddings Across Gcp **Products**

Steve Loh · Follow Published in Google Cloud - Community · 8 min read · Apr 2, *2024*

## Intro

Many of you have already used the Large Language Model (LLM) **from** Generative AI. These models are great in performing certain creative **tasks**
like content generation, text summarization, entity extraction and etc, but that's not sufficient for enterprises that need to:
provide accurate and up-to-date information (reducing **hallucination)**
offer contextual user **experiences**
offer secure and governed access to the **data**
Hence comes the Retrieval-Augmented Generation technique **(RAG)** to fulfill those requirements. It combines the power of LLMs with the **ability** to reference external knowledge sources, by incorporating the **following** 2 systems:
Retrieval: When a user asks a question, RAG first searches **through** a database of documents or text to find relevant **passages.**
Generation: the user then sends the retrieved information along as the context in the LLM prompt, effectively grounding LLM's **language**
  AM   and   GCP  |   - 
understanding with specific knowledge in order to generate a **more**
informed and accurate **answer.**
So how does the RAG retrieval system find the relevant knowledge? **Welcome**
to the world of embeddings and vector **search.**
Vector embeddings are numerical representations of text that **capture**
the semantic meaning and relationships between words and **concepts.** You would use a pre-trained model to help generate embeddings. For example the Google Vertex textembedding-gecko model generates a **768-**
dimensional embedding, while a multimodal embedding model **would**
generate a 128, 256, 512, or 1408 dimensional **embedding.**
Vector search comes into play by comparing the user's query **embedding** to the vectors representing documents or passages in the **knowledge** base. This comparison uses similarity metrics to find the most **relevant**
pieces of information based on their semantic closeness to the **query.**
Now with these concepts explained, you can implement RAG with the following **steps:**

![1_image_0.png](1_image_0.png)

Break down large documents or text corpus using a suitable **chunking**
strategy Generate embeddings for each chunk using a selected embedding **model** Store the chunked data and vector embeddings together in a **vector**
database User posts a prompt **query**
Use the same pre-trained embedding model to generate a **vector** embedding for the user **query**
Use the query embedding to search for most similar **embeddings** in vector database, then retrieve the corresponding data **chunk**
Create a new prompt for the LLM by incorporating the retrieved **chunked** text alongside the original user **query**
Vector embeddings need to be stored in a vector database before you can search for embeddings. But adding a vector database to your software **stack** increases complexity, cost and learning curve. The great news is that **most** of the GCP data products already support vector out of the box, which **means**
users will no longer need to choose between vector query and other **critical** database functionality. For example, all GCP transactional databases **aims** to fully support Vector features in near **future:**
AlloyDB **(GA)**
Cloud SQL for PostgreSQL **(GA)**
Cloud SQL for MySQL **(Preview)**
Spanner **(Preview)**
Memorystore for Redis **(Preview)**
Firestore **(Preview)**
Bigtable **(Preview)**
  AM   and   GCP  |   - 
Here I will showcase vector implementation across 3 main data **product**
families on **GCP:**
AlloyDB - Transactional **database**
BigQuery - Enterprise data **warehouse** Vertex AI Vector Search - Machine learning **platform**
Disclaimer I work as a Data Analytics practice lead in Google Cloud, This article is my own opinion and does not reflect the views of my **employer.** Please take note that by the time you read this article, the information may already be obsolete as GenAI is a fast developing domain and Google **Cloud** is actively releasing new product features in this *space.*
AlloyDB

![3_image_0.png](3_image_0.png)

![3_image_1.png](3_image_1.png)

AlloyDB is a fully Managed, PostgreSQL-compatible cloud native **database** service built to deliver superior performance, scalability, and **high**
availability for most demanding enterprise workloads. It now comes **with** AlloyDB AI feature suite that provides the semantic and predictive **power** of ML models for your data **out-of-the-box.**

## Setup

Make sure you already have an AlloyDB cluster and instance **setup.**
  AM   and   GCP  |   - 
Enable Vertex AI integration and the pgvector extensions in **your**
AlloyDB **instance:**
psql "host=$INSTANCE_IP user=alloydb_user dbname=vector_db" -c "CREATE **EXTENSION**
psql "host=$INSTANCE_IP user=alloydb_user dbname=vector_db" -c "CREATE **EXTENSION**

## Embeddings **Generation**

Create a new column with the type vector to store the **embeddings:**
- The vector dimension should match the model that you use. For example textembedding-gecko model has 768 **dimensions.** - AlloyDB implements embeddings as arrays of real values, but it can automatically cast from real array to a vector **value.**
ALTER TABLE my_products ADD COLUMN embedding_column **VECTOR(768);**
To generate embedding, use the embedding() **function:**
- To use textembedding-gecko model, the AlloyDB cluster must **reside** in region us-central1 to match the region of the **model.**
- You can invoke predictions to get around the region **restriction.**
- 003 is the latest version of textembedding-gecko model. Note that **it's** always advisable to specify the version tag to avoid mistakes, as a new published model may return different **embeddings.**
SELECT embedding('textembedding-gecko@003', 'Google Pixel 8 Pro redefines **smartp**
To generate embedding value based on another **column:**
UPDATE my_products SET embedding_column = embedding(( **'textembedding-gecko@003',**
Alternatively, you can also create an embedding column with **default**
value generated from another **column:**
ALTER TABLE my_products ADD COLUMN embedding_column vector GENERATED **ALWAYS** AS (

## Vector **Index**

By default pgvector performs exact nearest neighbor search **which**
provides perfect recall. It can support approximate **nearest-neighbor** searching through indexing of HNSW or IVFFlat. AlloyDB provides builtin optimizations for pgvector by adding a scalar quantization **feature** (SQ8) to IVF index creation that can significantly speed up **queries.**
- SQ8 supports vectors with up to 8000 **dimensions.**
- You can choose among 3 distance functions: vector_l2_ops (L2 **distance),** vector_ip_ops (Inner product) or vector_cosine_ops (Cosine **distance).**
CREATE INDEX embedding_column_idx ON **my_products**
USING ivf (embedding_column **vector_l2_ops)**
WITH (lists = 20, quantizer = **'SQ8');**

## Vector **Search**

Perform vector search using the pgvector nearest-neighbor operator <-> in order to find the database rows with the most semantically **similar**
embeddings:
SELECT product_name FROM **my_products**
ORDER BY **embedding_column**
  AM   and   GCP  |   - 
<-> embedding(('textembedding-gecko@003', 'I need a phone that provides the LIMIT 10; Check the following links for more **information:**
Work with vector embeddings on **AlloyDB**
pgvector **indexing**
BigQuery

![6_image_0.png](6_image_0.png)

![6_image_1.png](6_image_1.png)

## Setup

BigQuery is a serverless service and no resource setup is needed for it.

Create a remote connection to Vertex AI remote **models:**
bq mk --connection --location=US --project_id={PROJECT_ID} **--connection_type=CL**
Grant 'Vertex AI User' role to the service account of the **created** connection:
gcloud projects add-iam-policy-binding **{PROJECT_ID}** \
--member='serviceAccount:{CONNECTION_SERVICE_ACCOUNT}' \
--role='roles/aiplatform.user'

## Embeddings **Generation**

Create a remote embedding model to represented the **hosted** textembedding-gecko **model:**
CREATE OR REPLACE MODEL **test_embeddings.llm_embedding_model**
REMOTE WITH CONNECTION **`us.vertex_embeddings`**
OPTIONS(ENDPOINT='textembedding-gecko@003');
You can now generate text embeddings using the ML.GENERATE_EMBEDDING **function:**
- We use data from a public dataset table called imdb.reviews in **this** example. - The text_embedding column is of type ARRAY<FLOAT> with **768-** dimensions.

![7_image_0.png](7_image_0.png)

![7_image_1.png](7_image_1.png)

## Vector **Index**

Create vector index on the embeddings column. Vector index **enables**
Approximate Nearest Neighbor search to help improve vector **search** performance.

  AM   and   GCP  |   - 
- Currently supported distance types are EUCLIDEAN (L2) and **COSINE.**
- Currently only IVF is supported for index **type.** - The created index is fully managed by BigQuery, the refresh **happens** automatically as data **changes.**
- The metadata information of the vector index is available via INFORMATION_SCHEMA.VECTOR_INDEXES **view.**
CREATE VECTOR INDEX embedded_reviews_idx ON **test_embeddings.embedded_reviews(tex**

## Vector **Search**

Use VECTOR_SEARCH function to perform text similarity **search:**
- It first generates embeddings from the text query, then compares **them**
to the column **`embeddings.embedded_reviews.text_embedding`.**

![8_image_0.png](8_image_0.png)

Check the following links for more **information:**
Search embeddings with vector **search**
A notebook that I created to showcase embedding and vector **search** in BigQuery.

## Vertex Ai Vector **Search**

Vertex AI is a unified machine learning platform that simplifies and accelerates the end-to-end process of building, deploying, and **managing** ML
models at scale. Vector Search (previously known as Matching **Engine)**
provides highly scalable and performant vector similarity **search.**

![9_image_0.png](9_image_0.png)

![9_image_1.png](9_image_1.png)

Following code snippets are based on **Python.**

## Setup

Import aiplatform **package:**
from google.cloud import **aiplatform**
aiplatform.init(project=PROJECT_ID, **location=LOCATION)**
Vector Search does not provide services to generate embeddings. You can for example generate embeddings via BigQuery, then export the embeddings to a file in a storage bucket, before importing them **into** Vector **Search.**

## Vector **Index**

Create a vector index endpoint, which is a server instance that **accepts** query requests for your **index.**
my_index_endpoint = **aiplatform.MatchingEngineIndexEndpoint.create(**
display_name = **f"index-endpoint-{PROJECT_ID}",**
Create a vector search **index:**
- EMBEDDING_BUCKET_URI is where you store the files **with**
embeddings, read here about the required input data format and structure - Approximate_neighbors_count specifies the number of **neighbors** to find through approximate search before exact reordering is **performed.** - See here for available distance measure **type.**

my_index = **aiplatform.MatchingEngineIndex.create_tree_ah_index(**

![10_image_0.png](10_image_0.png)

![10_image_1.png](10_image_1.png)

![10_image_2.png](10_image_2.png)

display_name={DISPLAY_NAME},
contents_delta_uri={EMBEDDING_BUCKET_URI},

![10_image_3.png](10_image_3.png) approximate_neighbors_count=10, distance_measure_type="DOT_PRODUCT_DISTANCE",

![10_image_4.png](10_image_4.png)

Deploy the index to the index **endpoint:**
my_index_endpoint = **my_index_endpoint.deploy_index(**
index=my_index, deployed_index_id = **DEPLOYED_INDEX_ID**
)

## Vector **Search**

Now you can search the vector index using a query **embedding:**
\# get the query **embedding**
model = **TextEmbeddingModel.from_pretrained("textembedding-gecko@003")**
query = "Our family enjoyed this movie, especially the kids were so **fascinated** b query_embeddings = **model.get_embeddings([query])[0]**
\# query the index endpoint to find 3 nearest **neighbors.**
  AM   and   GCP  |   - 
response = **my_index_endpoint.find_neighbors(**
deployed_index_id=my_index_endpoint.deployed_indexes[0].id, queries=[query_embeddings.values],
num_neighbors=3,
)
I have created a notebook to demonstrate how to do vector search in **Vertex** AI.

## Summary

2023 was the booming year of GenAI foundation models, while this **year**
organizations will focus on building applications harnessing values **from** these models. This may include accelerating organization's **access** to insights, improving productivity, streamlining operations and **business**
processes and building innovative product services. Vector storage and vector search are the backbone for storing and organizing the rich **semantic** information to ground generative AI models. Their ability to handle **various** structures of data, power meaningful search, scale efficiently, and **support**
rapid development makes them the ideal engine for the next **generation** of AI **innovation.**
Google Cloud Platform Machine Learning Generative Ai Vector *Search* Embeddings

![11_image_0.png](11_image_0.png)

# Written By Steve Loh

![12_image_0.png](12_image_0.png)

44 Followers · Writer for Google Cloud *- Community* I lead the data analytics customer engineering team of Google Cloud in Benelux region. I
enjoy learning and helping customers through my 22 years of *experience.*
More from Steve Loh and Google Cloud - *Community*

![12_image_2.png](12_image_2.png)

Steve Loh Google Cloud *- Community* in Unleashing the **Power** of Generative AI in *BigQuery* Generative AI is rapidly gaining popularity among enterprises today with the potential t…
10 min read · Oct 14, 2023 Sushil Kumar Google Cloud *- Community*

![12_image_1.png](12_image_1.png)

in Auto Scaling *Kafka Consumers* with Kubernetes and *KEDA*
Apache Kafka is one of the most popular *open* source, distributed event streaming platfor…
9 min read · Jun 2, *2023*

![13_image_1.png](13_image_1.png)

Beranger Natanelic Google Cloud - Community in Deploy a Python flask server **using** Google Cloud Run From a basic skeleton to *a ready-to-deploy* server.

9 min read · Mar 27, *2023* 312 2 Mark Betz Google Cloud *- Community*

![13_image_0.png](13_image_0.png)

in Understanding **kubernetes** networking: *ingress* In the first post of this series I described the network that enables pods to connect to eac…
13 min read · Dec 17, *2017* 6K 34 See all from Steve Loh See all from Google Cloud *- Community* Recommended from *Medium*

![13_image_3.png](13_image_3.png)

Best Embedding *Model* —
OpenAI / Cohere / *Google* / E5 /…
An In-depth Comparison of Multilingual Embedding *Models*
· 13 min read · Apr 7, *2024* Lars Wiik *AlexPodles* To Cosine or Not to Cosine, *That* Is

![13_image_2.png](13_image_2.png)

the Question: *Understanding…*
Introduction 10 min read · Apr 1, 2024 14/16 Lists

![14_image_0.png](14_image_0.png)

Predictive **Modeling** w/ Python 20 stories · 1322 *saves* Natural Language *Processing*

![14_image_1.png](14_image_1.png)

Practical Guides to *Machine* Learning 10 stories · 1587 *saves*

```
1539 stories · 1074 saves
                                                   The New Chatbots: ChatGPT,
                                                   Bard, and Beyond
                                                   12 stories · 415 saves

```

Yann-Aël Le Borgne Towards Data Science in OpenAI vs *Open-Source* Multilingual Embedding *Models* Choosing the model that works best for *your* data 12 min read · Feb 24, *2024* luca *bindi*

![14_image_2.png](14_image_2.png)

Oracle23ai simplifies RAG
implementation for Enterprise LL…
"I've already discussed in previous *articles* , the power of Oracle Converged Database,…
22 min read · May 7, *2024* 27 3

![14_image_4.png](14_image_4.png)

Plaban Nayak The AI Forum Dr. Walid Soula *Kinomoto.Mag* AI
in in

![14_image_3.png](14_image_3.png)

  AM   and   GCP  |   - 
RAG on Complex PDF **using**
LlamaParse, Langchain and *Groq* Retrieval-Augmented Generation (RAG) is a new approach that leverages Large Languag…
13 min read · Apr 7, *2024* 735 11 58 Convert Images to embeddings for

## Rag

Learn how to convert images to embeddings for RAG systems using Nomic-ai's *open-…*
· 3 min read · Jun 8, *2024* See more *recommendations*