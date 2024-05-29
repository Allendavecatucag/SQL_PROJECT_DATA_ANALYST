/* 
Question: What are the most in-demand skills for data analyst?
    - Join job postings to inner join table similar to query 2
    - Identify the top 5 in-demand skills for a data analyst.
    - Focus on all postings.
    - Why? Retrieve the top 5 skills with the highest demand in the job market,
     provide insights into the most valuable skills for job seekrs.
     */


SELECT 
       skills,
       COUNT(skills_job_dim.job_id) AS demand_count

FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id --CONNECT SA SA job_posting_fact si skills_job_dim table
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id -- the connect sa si skills_job_dim table to skills_dim table

WHERE 
    job_title_short = 'Data Analyst' and -- diri nimo ma filter ug sakto sa Where condition
    job_work_from_home = TRUE

group by 
skills 
order by 
demand_count desc

limit 5