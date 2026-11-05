# 🎬 Movie Intelligence Analysis Dashboard

An end-to-end data analytics and business intelligence project built using **Snowflake, dbt Core, SQL, and Microsoft Power BI**. This project transforms MovieLens data into structured analytical datasets and interactive dashboards to explore movie ratings, genre performance, user activity, and movie-related insights.

The solution demonstrates a modern analytics workflow, from raw data ingestion and transformation to dimensional modelling, data quality validation, and business intelligence reporting.

---

## 📌 Project Overview

The Movie Intelligence Analysis Dashboard is designed to analyze movie-related data and generate meaningful insights through a cloud data warehouse and interactive Power BI reports.

The project uses the MovieLens dataset and follows an analytics engineering approach:

1. Organize raw MovieLens data for analytical processing.
2. Connect Snowflake as the cloud data warehouse.
3. Use dbt to transform raw data into staging, dimension, fact, and mart models.
4. Implement snapshots to maintain historical changes in movie tag information.
5. Apply dbt tests to validate data quality.
6. Connect transformed Snowflake tables to Power BI.
7. Build interactive dashboards for analytical reporting.

**Project objective:** Convert raw movie data into reliable, structured, and business-friendly analytical information.

## 🎯 Business Objectives

- Analyze movie ratings and user engagement patterns.
- Understand movie performance across different genres.
- Explore rating distributions and rating trends.
- Analyze movie genome tags and relevance scores.
- Examine movie release information and metadata coverage.
- Build interactive reports to support data-driven exploration.
- Demonstrate an end-to-end analytics engineering workflow.

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| Python | Supporting data and analytics workflows |
| SQL | Data transformation and querying |
| Snowflake | Cloud data warehouse |
| dbt Core | Data transformation and modelling |
| dbt Snapshots | Historical data tracking |
| dbt Tests | Data quality validation |
| Microsoft Power BI | Interactive dashboards and reporting |
| Power Query | Data preparation and transformation |
| DAX | Measures and analytical calculations |
| Git | Version control |
| GitHub | Source code management |
| Git LFS | Power BI `.pbix` file storage |

## 🏗️ Data Architecture

The project follows a layered analytics architecture.

```text
          MovieLens Dataset
                  |
                  v
          Raw Data in Snowflake
                  |
                  v
          dbt Source Definitions
                  |
                  v
          +-------------------+
          |   Staging Layer   |
          |  Source Models    |
          +-------------------+
                  |
                  v
          +-------------------+
          | Transformation    |
          | SQL / dbt Models  |
          +-------------------+
                  |
                  v
          +-------------------+
          | Dimension Models  |
          | Fact Models       |
          +-------------------+
                  |
                  v
          +-------------------+
          | Analytical Mart   |
          | Movie Releases    |
          +-------------------+
                  |
                  v
          Snowflake Analytics Tables
                  |
                  v
          Microsoft Power BI
                  |
                  v
          Interactive Dashboard
```

### Architecture Layers

**1. Source Layer**

Raw MovieLens data is stored in Snowflake and referenced through dbt source definitions.

**2. Staging Layer**

The staging models standardize and prepare source data for downstream transformations.

**3. Dimension Layer**

Creates descriptive analytical entities, including:

- `DIM_MOVIES`
- `DIM_USERS`
- `DIM_GENOME_TAGS`

**4. Fact Layer**

Contains measurable analytical events and relationships:

- `FCT_RATINGS`
- `FCT_GENOME_SCORES`

**5. Mart Layer**

Creates business-oriented analytical datasets:

- `MART_MOVIE_RELEASES`

**6. Reporting Layer**

Snowflake analytical tables are connected to Power BI for interactive reporting.

## 📂 Project Structure

```text
movie-intelligence-analysis-dashboard/
│
├── analyses/
│
├── macros/
│
├── models/
│   ├── staging/
│   │   ├── sources.yml
│   │   ├── schema.yml
│   │   ├── src_movies.sql
│   │   ├── src_ratings.sql
│   │   ├── src_tags.sql
│   │   ├── src_links.sql
│   │   ├── src_genome_tags.sql
│   │   └── src_genome_score.sql
│   │
│   ├── dim/
│   │   ├── dim_movies.sql
│   │   ├── dim_users.sql
│   │   ├── dim_genome_tags.sql
│   │   └── dim_movies_with_tags.sql
│   │
│   ├── fct/
│   │   ├── fct_ratings.sql
│   │   └── fct_genome_scores.sql
│   │
│   └── marts/
│       └── mart_movie_releases.sql
│
├── seeds/
│   └── seed_movie_release_dates.csv
│
├── snapshots/
│   ├── snap_tags.sql
│   └── snapshot_tag_history.sql
│
├── tests/
│   ├── package.yml
│   └── relevence_score_test.sql
│
├── powerbi/
│   └── Netflix_Analytics_Dashboard.pbix
│
├── .gitattributes
├── .gitignore
├── dbt_project.yml
└── README.md
```

*Note: Generated directories such as `target/`, `dbt_packages/`, and `logs/` are excluded from version control.*

## 🗄️ Data Models

The project contains staging, dimension, fact, and mart models.

### Staging Models

| Model | Description |
|---|---|
| `src_movies` | Prepares movie source data |
| `src_ratings` | Prepares movie rating records |
| `src_tags` | Prepares user-generated movie tags |
| `src_links` | Prepares movie identifier mappings |
| `src_genome_tags` | Prepares genome tag information |
| `src_genome_score` | Prepares genome relevance scores |

### Dimension Models

| Model | Description |
|---|---|
| `DIM_MOVIES` | Movie-level descriptive information |
| `DIM_USERS` | User-level analytical information |
| `DIM_GENOME_TAGS` | Movie genome tag descriptions |
| `DIM_MOVIES_WITH_TAGS` | Movie information enriched with tag data |

### Fact Models

| Model | Description |
|---|---|
| `FCT_RATINGS` | Movie rating records and related measures |
| `FCT_GENOME_SCORES` | Movie genome relevance score records |

### Mart Model

| Model | Description |
|---|---|
| `MART_MOVIE_RELEASES` | Analytical dataset containing movie release information |

## 📊 Power BI Dashboard

The Power BI report contains three analytical pages.

### Page 1: Executive Overview

Provides a high-level overview of the movie analytics dataset.

Key analytical areas:
- Summary KPI cards
- Movie rating distribution
- Rating trends
- Overall dataset overview

### Page 2: Movie and Genre Performance

Focuses on movie-level and genre-level analysis.

Key analytical areas:
- Genre performance
- Movie ratings
- Rating comparisons
- Genre-based analytical insights

### Page 3: Intelligence and Analysis

Provides deeper analysis using movie genome and metadata information.

Key analytical areas:
- Genome relevance analysis
- Tag-based insights
- Release metadata coverage
- Additional analytical comparisons

**Dashboard file:** `powerbi/Netflix_Analytics_Dashboard.pbix`

Open the PBIX file using Microsoft Power BI Desktop.

## 🔄 dbt Transformations

dbt is used to build and manage the analytical data models in Snowflake.

The project uses:
- SQL-based transformations
- Source definitions
- Staging models
- Dimension and fact models
- Analytical marts
- Snapshots
- Data quality tests

### Important dbt Commands

Install project dependencies:

```bash
dbt deps
```

Validate the Snowflake connection:

```bash
dbt debug
```

Load seed
