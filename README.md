# Introduction
Dive into the data job market! Focusing on Data Analyst roles, this project explores 
  - top_paying jobs
  - in_demand skills
  - Where high demand meets high salary in Data Analytics.
     
SQL queries? Check them out here: [project_sql folder](/project_sql/)

# Background
This project was born from desire to pinpoint top-paid and in-demand skills, streaming others work to find optimal jobs.

I learned alot on sql by the help of [SQL Course](https://lukearouse.com/sql) It's pack with insights on job titles,salaries,location and essentials skills. Thanks to nerd!
## The question I Wanted to answer through my SQL queries were:
  1. What are the top_paying data analyst jobs?
  2. What skills are required for these top_paying jobs?
  3. What skills are most in demand for data analyst?
  4. Which skills are associated with higher salaries?
  5. What are the most optimal skills to learn?

# Tools I Used
For my deep dive into the Data Analyst job market, I hardnessed the power of several key tools:

  **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
  
  **PostgresSQL:** The chosen database management system, ideal for handling the job posting data.

  **Visual Studio Code:** My go-to for database management and executing SQL queries.

  **Git-Github:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.


# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market.
Here's how I approached each question:

### 1. Top Paying Data Analyst Jobs

Question: What are the top_paying data analyst jobs?
    - Identify the top 10 highest-paying Data Analyst roles that are available remotely.
    - Focuses on job postings with Salaries ( remove nulss).
 Why? Highest the top-paying opportunities for Data Analyst, offering insight into employement
    
```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name --bantug nag left join sa company_dim para makita ni
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
where 
    job_title_short = 'Data Analyst' and
    job_location = 'Anywhere' and
    salary_year_avg is not null
Order by
    salary_year_avg desc
limit 10
```
Here's the breakdown of the top Data Analyst jobs in 2023
- **Wide Salary Range:** Top 10 paying Data Analyst roles span from $184,000 to $650,000 indicaing significant salary potential in the field.
- **Diverse Employers:** Companies like SmartAsset, Meta, and AT&T are among those offering high salaries, showing a broad interest acrross different industries.
- **Job Title Variety:** There's a high diversity in job titles, from Data Analyst to Director of Analytics, reflecting varied roles and specialization within data analytics.

! [Top Paying Roles](assets/assets/Top Paying Data Analyst Jobs.png)
*This is the Bar Graph visualizing the salary for the top 10
salaries for data analysts; Google spreedsheet generated this graph from my SQL query results*
  
# What I Learned
Throughout this course adventure, I've turbocharge my SQL toolkit with some serious firepower:
- **Complex Query Crafting:** Mastered the art of advanced SQL.
- **Data Aggregation:** Like Group By and turned aggregate functions like COUNT() and AVG() in my data_summarizing sidekicks.
- **Analytical thinking:** Leveld up my real-world puzzle-solving skills, turning question into actionable,insightful SQL queries.
  
# Conclusion

This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspriring Data Analysts can better position themeselves in a competitive job market. This exploration highlights the importances of continous learning and adaptation to emerging trends in the field of Data Analytics.
