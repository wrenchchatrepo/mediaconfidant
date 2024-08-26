
# README

[![Mutable.ai Auto Wiki](https://img.shields.io/badge/Auto_Wiki-Mutable.ai-blue)](https://wiki.mutable.ai/wrenchchatrepo/mediaconfidant) **&larr;&larr;&larr;CLICK HERE TO SEE OUR AI POWERED WIKI!**

[![Mutable.ai Auto Wiki](https://img.shields.io/badge/Auto_Wiki-Mutable.ai-blue)](https://wiki.mutable.ai/wrenchchatrepo/mediaconfidant)


## LookML Project Structure and Conceptual Overview

This project follows a hub-and-spoke architecture to manage LookML models efficiently. The core hub model contains shared views and configurations, while each customer has its own model and views extending the shared views.

The Data Product is a result of the Analytics Pipeline: the data model includes a semantic layer and data transformations both with version control, sophisticated analytics, practical ML, and data integrity. This solution is intended to be a blueprint for the customer MediaConfidant to build on Google Cloud. Infrastructure and Analytics as Code means instructions are provided for provisioning the infrastructure, code snippets as examples, and thorough documentation for every step.

The modern data stack is a collection of tools that work together to help businesses collect, clean, analyze, and visualize data. Dataform, Looker, and BigQuery create a powerful analytical stack but are only part of the solution. This document outlines the necessary supporting infrastructure with the following objectives:

![Mediaconfidant](https://github.com/user-attachments/assets/17234773-6e64-43b5-be80-f6ebf41e2103)

**Improved data insights:** BigQuery's analytics engine can be used with Looker to produce more than just data.

**Improved data quality:** Dataform can be used to clean and validate data before it is loaded into BigQuery.

**Increased data accessibility:** Looker provides a user-friendly interface for users to access and explore data.

**Data integration:** Dataform will be used to integrate data from multiple sources into BigQuery.

## Key Components

**Dataform:** Dataform is responsible for cleaning, validating, and integrating data from various sources into BigQuery. The SQLX and LookML transformations are version-controlled and managed via GitHub Actions.

**Looker:** Looker serves as the semantic layer, enabling sophisticated data exploration and visualization. Looker Blocks and Actions streamline data workflows and provide reusable data models.

**BigQuery:** BigQuery handles the data storage and querying, with QML used for integrated machine learning tasks.

## 1. Data Ingestion:

+ Sources: Various data sources like GA4, Google Ads, Facebook Ads, TikTok Ads, and Bing Ads feed data into the pipeline.
+ Data Transfer Service: This service handles the movement of data between sources and storage.
+ Cloud Storage: Acts as a storage layer for the ingested data.
+ GitHub & Cloud Logging: GitHub is used for version control, and Cloud Logging likely tracks all processes and data flows. Vertex AI is also included, likely for advanced machine learning tasks.

## 2. Analytics & ML:

+ BigQuery & QML: BigQuery is used for data storage and querying, with QML likely referring to the integration of machine learning (ML) capabilities within BigQuery.
+ Cloud Storage: Continues to play a central role in storing processed data.
+ Looker Blocks & Looker Actions: Looker is used for data modeling and analytics. Looker Blocks are reusable data models, and Looker Actions might represent automated workflows within Looker.
+ SQLX, LookML, GitHub Actions: SQLX and LookML are used for data modeling and transformation. GitHub Actions automate CI/CD pipelines related to these processes.

## 3. Exceptional CX:

+ DataForm: DataForm is used for managing SQLX and LookML transformations.
+ Looker & Spectacles: Looker continues to be central for analytics and data exploration, while Spectacles provides testing for LookML.
+ Looker API & Extensions: Extend Looker’s functionality for custom solutions.
+ Looker Visualizations: This area connects directly with end users (MC Customers and BYOV - Bring Your Own Visualization), delivering insights and visualizations.

## 4. Project Structure
- **agentic_system/**  *Readmes for AI system*
- **bigquery/**   *BQML files*
  - **ml/**  *ML SQL statements*
  - **sql/**  *Useful SQL*
- **containers/**  *Infrastructure As Code*
  - **dockerfiles/**  *Docker for Pulumi*
  - **pulumi/**  *Deploy programs*
    - **programs/**  *Pulumi deploy files*
- **dataform/**  *SQLX transformations*
- **ga4/**  *Undeployed Looker model*
- **google-adwords/**  *Undeployed Looker model*
- **instructions/**  *on how to do most stuff*
- **looker-explore-assistant/**  *Gemini for Looker*
- **marketplace_google-ads/**  *Undeployed Looker model*
- **spectacles/**  *Recommendation to use Spectacles*
- **vendors/**  *Deployed Looker model*

## Project Structure

```
bigquery/
-ml/ # Machine Learning SQL statements
-sql/ # Useful SQL
containers/
-dockerfiles/
-pulumi/ # Infrastructure As Code
--programs/
definitions/ # Dataform SQLX transformations
looker/
-demo/ # Vendor model for demos
--views/
-marketplace_ga4/ # GA4 model
-marketplace_google-ads-transfer-v2/ # Google Ads model
--views/
spectacles/ # Recommendation to use Spectacles
Agentic_System.md # A proposal for a Gemini Agentic Sytem
README.md
```

## LookML is a data modeling language for describing dimensions, fields, aggregates and relationships based on SQL.

LookML is powerful because it:

**Is all about reusability**: Most data analysis requires the same work to be done over and over again. You extract
raw data, prepare it, deliver an analysis... and then are never able touse any of that work again. This is hugely
inefficient, since the next analysis often involves many of the same steps. With LookML, once you define a
dimension or a measure, you continue to build on it, rather than having to rewrite it again and again.

**Empowers end users**:  The data model that data analysts and developers create in LookML condenses and
encapsulates the complexity of SQL, it and lets analysts get the knowledge about what their data means out of
their heads so others can use it. This enables non-technical users to do their jobs &mdash; building dashboards,
drilling to row-level detail, and accessing complex metrics &mdash; without having to worry about what’s behind the curtain.

**Allows for data governance**: By defining business metrics in LookML, you can ensure that Looker is always a
credible single source of truth.

The Looker application uses a model written in LookML to construct SQL queries against a particular database that business analysts can [Explore](https://cloud.google.com/looker/docs/r/exploring-data) on. For an overview on the basics of LookML, see [What is LookML?](https://cloud.google.com/looker/docs/r/what-is-lookml)

<h2><span style="color:#2d7eea">Learn to Speak Looker</span></h2>

A LookML project is a collection of LookML files that describes a set of related [views](https://cloud.google.com/looker/docs/r/terms/view-file), [models](https://cloud.google.com/looker/docs/r/terms/model-file), and [Explores](https://cloud.google.com/looker/docs/r/terms/explore).

+ A [view](https://cloud.google.com/looker/docs/r/terms/view-file) (.view files) contains information about how to access or calculate information from each table (or
across multiple joined tables). Here you’ll typically define the view, its dimensions and measures, and its field sets.

+ A [model](https://cloud.google.com/looker/docs/r/terms/model-file) (.model file) contains information about which tables to use and how they should be joined together.
Here you’ll typically define the model, its Explores, and its joins.

+ An [Explore](https://cloud.google.com/looker/docs/r/terms/explore) is the starting point for business users to query data, and it is the end result of the LookML you are
writing. To see the Explores in this project, select an Explore from the Explore menu.

<h2><span style="color:#2d7eea">Exploring Data</span></h2>

Ad-hoc data discovery is one of Looker’s most powerful and unique features. As you evaluate use cases for your
trial, consider what business areas you would like to explore. Open the Explore menu in the main navigation to see
the Explores you are building.

<h2><span style="color:#2d7eea">The Development Workflow</span></h2>

To support a multi-developer environment, Looker is integrated with Git for version control. Follow [these directions](https://cloud.google.com/looker/docs/r/develop/git-setup)
to set up Git for your project. To edit LookML, expand the Develop drop-down and toggle on [Development Mode](https://cloud.google.com/looker/docs/r/terms/dev-mode). In
Development Mode, changes you make to the LookML model exist only in your account until you commit the
changes and push them to your production model.

<h2><span style="color:#2d7eea">Additional Resources</span></h2>

To learn more about LookML and how to develop visit:
+ [Looker User Guide](https://looker.com/guide)
+ [Looker Help Center](https://help.looker.com)
+ [Looker University](https://training.looker.com/)
