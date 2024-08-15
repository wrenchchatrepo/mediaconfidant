<h1><span style="color:#2d7eea">README - Your LookML Project</span></h1>

[![Mutable.ai Auto Wiki](https://img.shields.io/badge/Auto_Wiki-Mutable.ai-blue)](https://wiki.mutable.ai/wrenchchatrepo/mediaconfidant)

## LookML Project Structure and Conceptual Overview

This project follows a hub-and-spoke architecture to manage LookML models efficiently. The core hub model contains shared views and configurations, while each customer has its own model and views extending the shared views.

### Project Structure

```
Dashboards:
  - standard_reports.dashboard.lookml
ML:
  - CREATE_OR_REPLACE_MODEL_Churn.sql
  - CREATE_OR_REPLACE_MODEL_forecasting.sql
  - evaluate.sql
  - kmeans_model.sql
  - linear_regression_model.sql
  - logistic_regression_model.sql
  - lookerCREATE_OR_REPLACE_MODEL_CLV.sql
  - predict.sql
  - time_series_model.sql
agent_support:
  - README.md
definitions:
  customer_tables.sqlx
  - first_view.sqlx
  - second_view.sqlx
  vendor_tables.sqlx
models:
  - demo.model.lkml
repo:
  - Git-Large-File-Storage.md
  - workflow_settings.yaml
views:
  demo:
    generated:
      - demo_bing.view.lkml
      - demo_facebook.view.lkml
      - demo_ga4.view.lkml
      - demo_google.view.lkml
      - demo_tiktok.view.lkml
    refined:
      - demo_bing_refined.view.lkml
      - demo_facebook_refined.view.lkml
      - demo_ga4_refined.view.lkml
      - demo_google_refined.view.lkml
      - demo_tiktok_refined.view.lkml
    shared:
      - shared_data.view.lkml
  - manifest.lkml
  - data_tests.lkml
- LICENSE
- MERGE_MSG
- README.md
- package-lock.json
- package.json
```

## Demo Model

The core hub model (core_hub.model.lkml) includes shared views and configurations. It serves as the base for all customer-specific models.

**Shared View**

The shared view (shared_data.view.lkml) contains common dimensions and measures that are used across multiple customer-specific datasets.

**Customer-Specific Models**

Each customer has its own model file that includes the core hub model and customer-specific views. The models define explores that join the shared data with customer-specific tables using fuzzy logic on timestamps.

## LookML is a data modeling language for describing dimensions, fields, aggregates and relationships based on SQL.

<h2><span style="color:#2d7eea">LookML Overview</span></h2>

LookML is a data modeling language for describing dimensions, fields, aggregates and relationships based on SQL.

LookML is powerful because it:

- **Is all about reusability**: Most data analysis requires the same work to be done over and over again. You extract
raw data, prepare it, deliver an analysis... and then are never able touse any of that work again. This is hugely
inefficient, since the next analysis often involves many of the same steps. With LookML, once you define a
dimension or a measure, you continue to build on it, rather than having to rewrite it again and again.
- **Empowers end users**:  The data model that data analysts and developers create in LookML condenses and
encapsulates the complexity of SQL, it and lets analysts get the knowledge about what their data means out of
their heads so others can use it. This enables non-technical users to do their jobs &mdash; building dashboards,
drilling to row-level detail, and accessing complex metrics &mdash; without having to worry about what’s behind the curtain.
- **Allows for data governance**: By defining business metrics in LookML, you can ensure that Looker is always a
credible single source of truth.

The Looker application uses a model written in LookML to construct SQL queries against a particular database that
business analysts can [Explore](https://cloud.google.com/looker/docs/r/exploring-data) on. For an overview on the basics of LookML, see [What is LookML?](https://cloud.google.com/looker/docs/r/what-is-lookml)

<h2><span style="color:#2d7eea">Learn to Speak Looker</span></h2>

A LookML project is a collection of LookML files that describes a set of related [views](https://cloud.google.com/looker/docs/r/terms/view-file), [models](https://cloud.google.com/looker/docs/r/terms/model-file), and [Explores](https://cloud.google.com/looker/docs/r/terms/explore).
- A [view](https://cloud.google.com/looker/docs/r/terms/view-file) (.view files) contains information about how to access or calculate information from each table (or
across multiple joined tables). Here you’ll typically define the view, its dimensions and measures, and its field sets.
- A [model](https://cloud.google.com/looker/docs/r/terms/model-file) (.model file) contains information about which tables to use and how they should be joined together.
Here you’ll typically define the model, its Explores, and its joins.
- An [Explore](https://cloud.google.com/looker/docs/r/terms/explore) is the starting point for business users to query data, and it is the end result of the LookML you are
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
- [Looker User Guide](https://looker.com/guide)
- [Looker Help Center](https://help.looker.com)
- [Looker University](https://training.looker.com/)
