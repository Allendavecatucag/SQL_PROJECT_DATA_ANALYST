 /* 
Question: What skills are required for the top-paying data analyst jobs?
    - Use the top 10 highest-paying Data Analyst jobs from first query
    - Add the specific skills required for these roles
Why? It provides a detailed look at which high-paying jobs demand certain skills,
     helping job seekers understanding which skills to develop that align with top salaries
     */

WITH top_paying_jobs AS ( --CTE, or Common Table Expression, serves as a temporary table within SQL, providing a concise and efficient way to reference and manipulate data from the original table.
SELECT
    job_id,
    job_title,
    salary_year_avg,
    name AS company_name --bantug nag left join sa company_dim para makita ni

FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id --join all rows from the left table, and the matching rows from the right table. The result is NULL from the right side, if there is no match.


where 
    job_title_short = 'Data Analyst' and
    job_location = 'Anywhere' and
    salary_year_avg is not null

Order by
    salary_year_avg desc
limit 10
)
    SELECT 
        top_paying_jobs.*, --lahat ng nasa luob ng WITH statement
        skills as Required_skills

    FROM top_paying_jobs
    INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id --CONNECT SA SA job_posting_fact si skills_job_dim table
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id -- the connect sa si skills_job_dim table to skills_dim table
  
Order by
    salary_year_avg desc



/* QUESTION ON CHATGPT:these are top 10 data analyst roles i found in job postings in 2023, 
can you analyze the skill column and display insights.(UPLOAD THE CSV FILES)

ANSWER:
   1.SQL is the most frequently required skill, appearing 8 times.
   2. Python is the second most common skill, with 7 mentions.
   3. Tableau is also highly sought after, with 6 occurrences.
   4. Skills like R, Snowflake, and Pandas are moderately common.
    There are also multiple mentions of Excel, Azure, Confluence, and Go.



