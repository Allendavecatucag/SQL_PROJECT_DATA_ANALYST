/*
    Question: What are the top skills base on the salary?
    - Look at the average salary associated with each skill for Data Analyst positions
    - Focuses on roles with specified salaries, regardless of location
    - Focus on all postings.
 Why? It reveals how different skills impact salary levels for Data Analysts and
    helps identify the most financially rewarding skills to acquire or improve
     */


SELECT 
       skills,
       round(avg(salary_year_avg), 0) AS AVG_SALARY  -- gi round off ang average salary
       
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id --CONNECT first job_posting_fact to skills_job_dim table
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id -- then connect  skills_job_dim table to skills_dim table

WHERE 
    job_title_short = 'Data Analyst' and -- diri nimo ma filter ug sakto sa Where condition
    salary_year_avg IS NOT NULL
    --job_work_from_home = TRUE
group by 
    skills 
order by 
    AVG_SALARY DESC
limit 20
