==================================================
          SSD Lab SQL & NoSQL Assignment
==================================================

DESCRIPTION:
----------------------------------
This project contains SQL queries and MongoDB aggregation pipelines for analyzing student performance data and weather/temperature data.

Github Private Repo Link: <>

DATABASE DETAILS:
----------------------------------
- SQL Database: Contains student performance data
  - Tables: time_travel (student exam data)
  
- NoSQL Database: Contains weather and temperature data
  - Collections: temperature, weather

REQUIREMENTS:
----------------------------------
- MySQL Server (for SQL queries)
- MongoDB (for NoSQL aggregations)
- MongoDB Compass or mongo shell (for running NoSQL queries)

SETUP INSTRUCTIONS:
----------------------------------
1. For SQL Queries (Q1):
   - Import the provided database schema and data
   - Run the SQL files in MySQL Workbench or command line:
     - Q1_a.sql: Student performance analysis
     - Q1_b.sql: Pass rate analysis by dimensions
     - Q1_c.sql: Stored procedure for individual student performance

2. For NoSQL Queries (Q2):
   - Import the provided JSON datasets into MongoDB
     - weather_India_100cities_2025_S1.json to 'weather' collection
     - temperatures_India_100cities_2025_S1.json to 'temperature' collection
   - Run the MongoDB aggregation pipelines from Q2_a.txt and Q2_b.txt

QUERY DESCRIPTIONS:
----------------------------------
SQL Queries (Q1):
   a. Student Performance Analysis:
      - Analyzes pass/fail rates and turnaround times across exam stages
      
   b. Dimensional Analysis:
      - Examines pass rates by gender, age band, and city
      - Provides peer comparison metrics
      
   c. Student Performance Procedure:
      - getStudentPerformance(StudentID)
      - Returns detailed performance metrics for a specific student
      - Includes peer comparison by gender, city, and age

NoSQL Queries (Q2):
   a. Weather Analysis:
      - Calculates daily and monthly average temperatures
      - Provides city-wise statistics
      
   b. Advanced Weather Analytics:
      - Identifies hottest/coldest days nationwide
      - Checks for rainy conditions (query limits output to 20 because of memory issues in MongoDB 100MB only supported on local machine)
      - Calculates 7-day moving averages for temperature trends (computes for only one city (e.g.- Mumbai) as given in the question)

USAGE EXAMPLES:
----------------------------------
-- SQL Examples
-- Get overall performance metrics
SOURCE Q1_a.sql;

-- Analyze pass rates by dimensions
SOURCE Q1_b.sql;

-- Get individual student report
CALL getStudentPerformance('S202500001');

-- NoSQL Examples (run in MongoDB)
-- Load and run the aggregation pipeline from Q2_a.txt
-- Load and run the aggregation pipeline from Q2_b.txt

NOTES:
----------------------------------
- All SQL queries are compatible with MySQL 8.0+
- MongoDB queries use the aggregation framework and require MongoDB 4.2+
- Date ranges in the queries are set for the first half of 2025
- The 'Mumbai' filter in Q2_b can be modified to analyze other cities

AUTHOR:
----------------------------------
Astitva Shrestha
