/*
Answer: What are the most optimal skills to learn(aka it's in high demand and high-paying skills)?
    - Identify skills in high demand and associated with high avarage salaries for Data Analyst roles
    - Concentrates on remote position with specified salaries
Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights for career development in data analysis
*/   -- COMBINING TWO TABLES TO HAVE THEIR BOTH RESULTS

with skills_demand AS(  --USING IS CTE
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count   --count on the skills 

    FROM job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id --CONNECT SA SA job_posting_fact si skills_job_dim table
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id -- the connect sa si skills_job_dim table to skills_dim table

    WHERE 
        job_title_short = 'Data Analyst' and -- diri nimo ma filter ug sakto sa Where condition
        salary_year_avg IS NOT NULL      and
        job_work_from_home = TRUE

    group by 
         skills_dim.skill_id


), average_salary AS(
    SELECT 
        skills_job_dim.skill_id,
        round(avg(salary_year_avg), 0) AS AVG_SALARY  -- gi round off ang average salary
        
    FROM job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id --CONNECT SA SA job_posting_fact si skills_job_dim table
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id -- the connect sa si skills_job_dim table to skills_dim table

    WHERE 
        job_title_short = 'Data Analyst' and -- diri nimo ma filter ug sakto sa Where condition
        salary_year_avg IS NOT NULL and
        job_work_from_home = TRUE
    group by 
        skills_job_dim.skill_id

)
    SELECT  --SELECT TO DISPLAY RESULTS
        skills_demand.skill_id,
        skills_demand.skills,
        demand_count,
        avg_salary
    FROM
        skills_demand

    INNER JOIN  average_salary on skills_demand.skill_id = average_salary.skill_id

--REWRITE CODE IN SHORT TERM

SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) as demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary

FROM 
    job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id --CONNECT SA, SA job_posting_fact si skills_job_dim table
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id -- then connect sa si skills_job_dim table to skills_dim table

Where
    job_title_short = 'Data Analyst' AND 
    salary_year_avg IS NOT NULL AND 
    job_work_from_home = TRUE
GROUP by   
        skills_dim.skill_id
HAVING 
        COUNT(skills_job_dim.job_id) >10
ORDER BY 
        avg_salary DESC,
        demand_count DESC
limit 30