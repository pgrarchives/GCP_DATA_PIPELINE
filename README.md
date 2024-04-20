# NYC 311 Noise Complaint Analysis

## Overview
This project analyzes the NYC 311 noise complaint data to derive actionable insights. Using Google Cloud Platform (GCP) services, the pipeline ingests, processes, stores, and visualizes the data, providing a comprehensive overview of noise pollution patterns in New York City.

## Problem Statement
The project aims to understand the distribution and frequency of noise complaints across NYC's boroughs, identifying hotspots for noise pollution and characterizing the nature of complaints.

- **Improve Data Quality**: Enhance the accuracy and consistency of the data.
- **Efficient Data Storage and Retrieval**: Implement scalable data storage solutions and optimize data access.
- **Insightful Data Analysis**: Provide analytical capabilities to uncover trends and patterns in noise complaints across different times and regions.

## Data Description
The dataset contains millions of 311 service request records from 2010 to the present. It includes detailed information like request IDs, timestamps, agency details, and complaint types. This analysis focuses on noise complaints, which are a major component of the dataset.

# Data Fields Description
Each record in the NYC 311 Noise Complaint dataset is composed of various fields that document the specifics of each complaint. The following are the detailed description of these fields used for analysis in this project: 

- **Unique Key**: A large integer value serving as a unique identifier for every noise complaint record. This ensures each complaint is individually traceable.

- **Created Date**: The date on which the noise complaint was reported. This field is formatted as a date (YYYY-MM-DD) and does not include time information.

- **Closed Date**:The date when the complaint was officially closed or resolved. Similar to the Created Date, it is stored in a date format.

- **Agency Name**: A text field containing the name of the agency that handled or was responsible for addressing the complaint.

- **Complaint Type**: The category of the noise complaint. This is a text field that describes the general nature of the noise, such as 'Noise - Residential' or 'Noise - Commercial'.

- **Descriptor**: This field provides more detailed information about the complaint, elaborating on the Complaint Type with a descriptive string, such as 'Loud Music/Party' or 'Banging/Pounding'.

- **Location Type**: Describes the type of location where the incident occurred, such as 'Residential Building/House' or 'Street/Sidewalk', in a text format.

- **Incident Zip**: An integer representing the ZIP code where the noise incident took place.

- **Incident Address**: The street address where the incident was reported. This is a string that may include numbers and text, like '123 Main St'.

- **Street Name**: The specific name of the street associated with the incident address, without the house number.

- **City**: The city in which the incident occurred, provided as a text string.

- **Landmark**: If the noise complaint is associated with a landmark, this string field will contain its name.

- **Status**: The current status of the complaint, such as 'Open', 'Closed', or 'In Progress', represented as a text string.

- **Resolution Description**: A text description of the steps taken to resolve the complaint or the final status once the issue has been addressed.

- **Resolution Action Updated Date**: The last date when the resolution action was updated. This could be the same as the Closed Date but may also reflect updates in ongoing cases.

- **Borough**: The borough of New York City in which the incident occurred, such as 'Manhattan' or 'Brooklyn'.

- **Open Data Channel Type**: The method through which the complaint was reported, such as 'Phone', 'Online', or 'Mobile'.

- **Vehicle Type**:In cases where the complaint is related to a vehicle, this field indicates the type of vehicle involved.

- **Latitude**: A double-precision floating-point number that represents the latitude coordinate of the incident location.

- **Longitude**: A double-precision floating-point number that represents the longitude coordinate of the incident location.

- **Zip Codes**: An integer value representing additional ZIP code information for the incident location, which may be used in data analysis for geographical mapping.

**Dataset Source**: https://data.cityofnewyork.us/Social-Services/311-Service-Requests-from-2010-to-Present/erm2-nwe9/data_preview

## Data Processing Workflow Overview

### 3.1 GCP Services Used Individually

#### Cloud Functions
- **Description**: Triggers on new data availability and handles initial data retrieval from the NYC dataset API.
![CloudFunction](https://github.com/pgrarchives/GCP_DATA_PIPELINE/assets/112724112/db16b9e3-3499-45cf-ad80-14380fc41fa2)

#### Pub/Sub
- **Description**: Provides messaging services between Cloud Functions and Cloud Storage for asynchronous data processing.
![PubSub](https://github.com/pgrarchives/GCP_DATA_PIPELINE/assets/112724112/13e0389a-63ab-42f9-9043-8690ba98eb1e)

#### Cloud Storage
- **Description**: Stores raw and processed data in a durable and highly available manner.
![image](https://github.com/pgrarchives/GCP_DATA_PIPELINE/assets/112724112/2433b068-f6c3-4eaa-af08-2e9e9457d253)

#### Dataproc (PySpark)
- **Description**: Processes and transforms large-scale data using Spark clusters.
![image](https://github.com/pgrarchives/GCP_DATA_PIPELINE/assets/112724112/f71ca0d9-5ead-46fe-888b-e1d83f5d1c33)

#### BigQuery
- **Description**: Hosts structured data for querying and analysis.
![Bigquery](https://github.com/pgrarchives/GCP_DATA_PIPELINE/assets/112724112/e5e7de70-5b0d-4852-bfcb-9dc08269d224)

#### Looker Studio
- **Description**: Visualizes data through interactive dashboards for analytical insights.
![LookerStudio](https://github.com/pgrarchives/GCP_DATA_PIPELINE/assets/112724112/d37e437e-0cc8-4c2f-8f3b-060bce6eb083)

#### Cloud Scheduler
- **Description**: Schedules regular data ingestion and processing jobs.
![CloudScheduler](https://github.com/pgrarchives/GCP_DATA_PIPELINE/assets/112724112/c3e89869-b14b-476f-8457-a033a2249897)


### 3.2 Data Flow Explanation

1. **Data Ingestion**: Utilizes Cloud Functions to ingest data from the NYC dataset API to Pub/Sub.
2. **Data Storage**: Temporarily holds data in Pub/Sub before moving to Cloud Storage.
3. **Data Transformation**: Applies transformation logic using PySpark on Dataproc and stores the result in BigQuery.
4. **Data Visualization**: Creates dashboards in Looker Studio, leveraging BigQuery datasets.

![nyc_pipeline_flow](https://github.com/pgrarchives/GCP_DATA_PIPELINE/assets/112724112/e34a760f-a79b-4058-ab81-0157f1dd6c60)


## Insights

Analysis of the noise complaint data reveals that:

- Residential noise is the leading type of complaint.
- Brooklyn has the highest number of complaints.
- Loud music and parties are the most common complaint reasons.

![image](https://github.com/pgrarchives/GCP_DATA_PIPELINE/assets/112724112/60e534d4-9319-45cc-9e9a-8ffc8a0e8109)

## Project Setup

Instructions for setting up and running the project:

