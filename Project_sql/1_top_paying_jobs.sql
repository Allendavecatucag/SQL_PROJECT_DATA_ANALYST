/* 
Question: What are the top_paying data analyst jobs?
    - Identify the top 10 highest-paying Data Analyst roles that are available remotely.
    - Focuses on job postings with Salaries ( remove nulss).
 Why? Highest the top-paying opportunities for Data Analyst, offering insight into employement
    */

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