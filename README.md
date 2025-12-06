# Data-Science-Jobs-Trend-Analytics-Pipeline-Python-ETL-SQL-Power-BI

## Welcome to the Data Science Job Trend Analytics Pipeline! 


## 1. Project Title: Data Science Job Trend Analytics Pipeline

An end-to-end data processing and analytics solution built to transform 12K+ job postings into clean, structured insights. This project integrates Python-SQL ETL workflows with a multi-page Power BI dashboard to explore job market trends, in-demand skills, hiring patterns, and workforce dynamics—all in an interactive, business-ready format.

## 2. Purpose:

The Data Science Job Trend Analytics Pipeline is designed to help users analyze and understand the evolving Data Science job market. By processing and standardizing 12K+ job postings, the solution enables interactive exploration of hiring trends, in-demand skills, experience requirements, and workforce patterns. This tool supports job seekers, career advisors in making data-driven decisions about career planning and market strategy.

## 3. Technical Stack:

- **Python-** Main programming language.

- **NumPy and Pandas-** Packages used for ETL Process. 

- **SQL (PostgreSQL)-** Feature Extraction and for Query the data. 

- **Power BI Desktop-** Data Visualization Platform used for report creation

- **Power Query-** Data transformation and cleaning layer for reshaping and preparing the data.

- **DAX (Data Analysis Expressions) –** Used for calculated measures, dynamic visuals, and conditional logic.

- **Data Modeling–** Relationships established among tables,views and materialized Views to enable cross-filtering and aggregation.

- **File Format–** .pbix for development and .png for dashboard previews.


## 4.Data Source: 

- **Data Source:** Kaggle – Data Science Job Postings & Skills (2024)

Raw job posting data scraped from LinkedIn, containing detailed information on job titles, companies, locations, skills, and search parameters. The dataset offers a comprehensive view of the Data Science job market while providing rich, uncleaned records ideal for hands-on data cleaning, preprocessing, and analytical exploration.


## 5.Features:

### • *Business Problem-*

The Data Science job market is rapidly evolving, but job seekers struggle to understand hiring trends, skill demand, and workforce expectations due to unstructured job posting data. Extracting insights manually from thousands of listings is time-consuming and inaccurate.

### • *Goal of the Report-*

To deliver an interactive, data-driven Report that:

1. Provides a clear view of job demand, hiring patterns, and skill requirements.

2. Highlights key workforce insights such as experience levels, education needs, and work modes.

3. Empowers users to explore trends across countries, cities, companies, and job categories.


### • *Walkthrough of Key Features-*

1. Job Market Overview

      - *KPI's-* Total Jobs, Total Companies, Total Cities & Total Countries
      
      - Jobs by Category: Demand for Data Scientists/Analysts, Data Engineers, Database Administrator, etc.
      
      - Jobs % by Country: Distribution of job opportunities across regions.
      
      - Jobs by Days: Posting activity trend over time.
      
      - Top Hiring Companies: Organizations with the highest job openings.
      
      - *Filters:* Country, City, Job Category, Job Mode, Job Level.



2. Skills Insights
   
      - *KPI's-* Avg Tech Skills, Avg Soft Skillls Per Job, & Skill Gap Score
        
      - Top 10 Technical Skills: Most requested tools & technologies (Python, SQL, Data Analysis, Machine Learning, etc.).
      
      - Top 10 Soft Skills: Communication, attention to details, Collaboration,etc.
      
      - Avg Tech Skills by Job Category: Databse Administration, Data Engineering, Data analytics, etc.
      
      - Top 10 Cities by Avg Skills: Top cities requiring the most skills.
      
      - *Filters:* Avg Tech skills, AVg soft skills, Skill Gap Score.



3. Workforce Insights
   
      - *KPI's-* Total Job Category, Required Education Level, & Avg Job level Score
        
      - Jobs by Experience:  Share of entry-level, mid-level, and senior roles.
      
      - Jobs by Work Mode: Distribution across Onsite, Remote, and Hybrid roles.

      - Job by Levels: Associate, & Mid-senior.
        
      - Jobs by Qualification: Bachelor's, Master's, & specialized certifications.
      
      - *Filters:* Country, Experience, Qualification, Job Mode, Job Category.



### • *Business Impact & Insights-*

- Helps **job seekers** to identify high-demand skills and target locations.

- **Data Scientist/Analyst and Data Engineer** Job roles dominate the market, accounting for the majority of all job openings.

- **The United States** leads with **84.34%** of total job postings, indicating the strongest hiring demand.

- **Python, SQL, Data Analysis,& Machine Learning** are the **top required technical skills** across all job categories.

- **Communication, Attention to details, Collaboration,etc,** appear as the most frequently requested **soft skills.**

- **Mid-level experience (3–5 years)** is the most in-demand, capturing **more than 90%** of listed roles.

- **Onsite jobs heavily outweigh remote and hybrid opportunities,** showing a limited remote market.

- **Master’s and Bachelor’s degrees are equally preferred,** making them the standard qualifications for data roles.

- A few companies, such as top recruiting firms, contribute a major portion of job postings, indicating concentrated hiring sources.

- **Technical skill requirements vary by role,** with Database Administrators and Data Engineers requiring the broadest skill sets.





## 📥 Installation:

Prerequisites

Ensure the following are installed:

- Python 3.12+

- Required Python packages via requirements.txt
  
- SQL Database Setup (PostgreSQL)

- Power BI Desktop 




## Steps to Install:

### 1️⃣ Clone the Repository:

git clone https://github.com/Shivam-Shere/Data-Science-Jobs-Trend-Analysis-ETL-SQL-Power-BI.git

### 2️⃣ Install Dependencies:

pip install -r requirements.txt

## 6. Screenshots:

- The Report Pages looks like-

### Page-1. Job Market Overview:

   ![Snapshot of Job Market Overview](https://github.com/user-attachments/assets/1a97bba3-7b54-4fd2-8139-ca46be3203ea)

### Page-2. Skills Insights:

   ![Snapshot of Skills Insights](https://github.com/user-attachments/assets/41bbb757-2c76-4b0d-ab9f-a5267cceafc1)

### Page-3. Workforce Insights:

   ![Snapshot of Workforce Insights](https://github.com/user-attachments/assets/3e4a3523-3b46-4a3f-84d6-9d7954417379)
