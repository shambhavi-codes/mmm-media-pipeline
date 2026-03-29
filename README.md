# MMM Media Data Pipeline — CPG Digital Media

## Project Overview
Built a SQL data wrangling pipeline to extract, standardize, and combine
digital media data from 3 platform sources into a single modeling-ready
dataset for a CPG client's Marketing Mix Modeling (MMM) team.

## Important Note
This pipeline was adapted for portfolio purposes. All CSV files, column
names, campaign names, and data values used in this project were modified
and anonymized since actual client data cannot be publicly shared due to
confidentiality agreements. The logic, structure, and workflow reflected
here are based on real analytical work performed in a professional setting.

## Business Context
In this exercise, we clean and consolidate media data files received
from multiple digital platforms. Each platform exports data in its own
format with different column names and metrics. The goal is to
standardize and combine them into one unified dataset ready for analysis.

## Data Sources
| Platform | Channel Type | Key Metrics | Weekly Rows |
|---|---|---|---|
| Facebook | Paid Social | Impressions, Spend | 104 |
| Instagram | Paid Social | Impressions, Spend | 104 |
| YouTube | Digital Video | Reach, Frequency, Spend | 104 |
| Google Search | Paid Search | Clicks, Spend | 104 |

**Total: 416 rows across 104 weeks (2 years: 2022–2023)**

## What This Pipeline Does
1. Accepts raw CSV exports from 3 separate platform sources
2. Standardizes inconsistent column structures across all sources
3. Adds NULL placeholders for metrics a platform does not report
4. Labels each row with a channel type for downstream modeling use
5. Combines all sources into one unified view using UNION ALL
6. Delivers a clean 416-row dataset to the modeling team

## SQL Concepts Used
- CREATE DATABASE / CREATE TABLE
- Data import from CSV files
- UNION ALL across multiple sources
- NULL handling for missing platform metrics
- CREATE VIEW for reusable pipeline output
- Aggregate functions: SUM, AVG, COUNT
- DATE_FORMAT for monthly trend analysis
- WHERE, GROUP BY, ORDER BY

## Business Insight Queries
The project includes 4 analytical queries that answer real MMM questions:
- Total spend and average weekly spend by channel type
- Monthly spend trend across 24 months
- CPM comparison between Facebook and Instagram
- YouTube reach and frequency delivery over time

## Important Note on Data
All data in this project is fictional and created for testing purposes only.
The 3 CSV files (facebook_instagram_raw.csv, youtube_raw.csv,
google_search_raw.csv) were manually created to simulate real platform
exports. No actual client data was used. Column names, campaign names,
and spend figures do not reflect any real client engagement.

## How to Run
1. Open MySQL Workbench
2. Create a new database: CREATE DATABASE mmm_project;
3. Run mmm_media_pipeline.sql top to bottom
4. Import the 3 CSV files using Table Data Import Wizard
   - facebook_instagram_raw.csv → raw_facebook_instagram
   - youtube_raw.csv → raw_youtube
   - google_search_raw.csv → raw_google_search
5. Query unified_media_data for the final combined output

## File Structure
mmm-media-pipeline/
│
├── mmm_media_pipeline.sql        # Full pipeline script
├── facebook_instagram_raw.csv    # Simulated Meta platform export
├── youtube_raw.csv               # Simulated YouTube export
└── google_search_raw.csv         # Simulated Google Search export
