# BATCH-PROCESSING-GCP-PROJECT-2025
End-to-end data pipeline on Google Cloud Platform for collecting, processing, and visualizing daily weather data using Airflow, Spark, DBT, BigQuery, and Looker Studio.
## Table of contents
- [Overview](#overview)
- [The Goal](#the-goal)
- [The dataset](#the-dataset)
- [Data modeling](#data-modeling)
- [Tools](#tools)
- [Running the project](#running-the-project)
  * [1. Requirements](#1-requirements)
  * [2. Clone the repository](#2-clone-the-repository)
  * [3. Run Terraform](#3-run-terraform)
  * [4. Create the Data Warehouse](#4-create-the-data-warehouse)
  * [5. Run Airflow](#5-run-airflow)
  * [6. Run the Airflow DAGs](#6-run-the-airflow-dags)
  * [7. Visualise data on Looker Studio](#7-visualise-data-on-metabase)
  * [Manual DAGs triggering](#manual-dags-triggering)

  ## Overview
The diagram below outlines the high-level architecture of the pipeline, illustrating the data flow from Data source to the visualization layer.

![The ELT](/images/infra_gcp.png "edited from draw.io")

  ## The Goal
  The end goal of the current project is to preprocess the data on gcp platform and get useful insights from it.

  ## The dataset
This project uses free and reliable weather 🌍 data from the [Open-Meteo APIs](https://open-meteo.com/):

- **ENSEMBLE Weather API** – Aggregated short-term forecasts from multiple global models.
- **Historical Weather API** – Daily historical data (temperature, rainfall, etc.) from global reanalysis datasets (e.g., ERA5, MERRA-2).
- **Climate Change API** – Long-term projections based on IPCC climate scenarios.

These APIs are RESTful, require no authentication, and are ideal for large-scale data collection and analysis.

### 🔗 Example Request

```bash
# Historical weather data for Antananarivo, Madagascar (2023)
curl "https://archive-api.open-meteo.com/v1/archive?latitude=-18.91&longitude=47.54&start_date=2023-01-01&end_date=2023-12-31&daily=temperature_2m_max,precipitation_sum&timezone=Africa/Nairobi"

            +---------------------+
            |  Open-Meteo APIs    |
            +---------------------+
                      |
                      v
        +-----------------------------+
        | Python ETL Script (API → CSV)|
        +-----------------------------+
                      |
                      v
        +-----------------------------+
        |  Google Cloud Storage (CSV) |
        +-----------------------------+
                      |
                      v
        +----------------------+
        |     Spark + DBT      |
        | (Preprocess & Model) |
        +----------------------+
                      |
                      v
        +----------------------+
        |     BigQuery DB      |
        +----------------------+
                      |
                      v
        +----------------------+
        |   Looker Studio Dash |
        +----------------------+

  ## Data modeling
  ## Tools
  ## Running the project
