--Date

CONVER DATE and EXTRACT DATE


SELECT 
        job_title_short as title,
        job_location as location,
        job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST', -- CONVERT TIME ZONE,
        EXTRACT (MONTH FROM job_posted_date) AS date_month,   -- Extract date month
        EXTRACT(YEAR FROM job_posted_date) AS date_year
    
 FROM job_postings_fact
        limit 5;
-------
SELECT 
        COUNT(job_id) AS job_posted_count,
        EXTRACT(MONTH FROM job_posted_date) AS date_month 
        
FROM job_postings_fact
 
      WHERE job_title_short  ='Data Analyst'

             GROUP BY 
                date_month
             ORDER BY        
                job_posted_count desc;
------------------------------------------------------------------------------------------
--CASE ON SQL

SELECT 
        COUNT(job_id) AS number_of_jobs,

        CASE
            WHEN job_location = 'Anywhere' THEN 'Remote'
            WHEN job_location = 'New York, NY' THEN 'Local'
            ELSE 'Onsite'
        END as Location_category
	
  FROM job_postings_fact

  WHERE
     job_title_short = 'Data Analyst'
  GROUP BY
        Location_category;

-------------------------------------------------------------------------------------------------
-- SUB QUERIES IN SQL (CTE) 

SELECt *
    FROM(
        SELECT *
        FROM job_postings_fact
        WHERE EXTRACT(MONTH from job_posted_date) = 1  -- this will filter only January 1 is the result

)as january_jobs;

SELECT * 
from january_jobs;
               
--------- 
WITH company_job_count AS(
    SELECT  
            company_id,
            COUNT(*) AS total_jobs

    FROM job_postings_fact

    GROUP BY
        company_id

)
SELECT  
        company_dim.name AS company_name,
        company_job_count.total_jobs

FROM company_dim
    LEFT JOIN company_job_count on company_job_count.company_id = company_dim.company_id

    ORDER BY total_jobs DESC
-----
/*Find the count of the number of remote job postings per skill 
     -Display the top 5 skills by their demand in remote job
     -Include skill ID, name, and count of postings requiring the skill*/

WITH remote_job_skills AS(
SELECT  
      skill_id,
      count(*) AS skill_count
     
FROM 
    skills_job_dim as skills_to_job

INNER JOIN job_postings_fact as job_postings  
                             ON job_postings.job_id = skills_to_job.job_id  

WHERE 
      job_work_from_home = TRUE AND
      job_postings.job_title_short = 'Data Analyst'

GROUP BY skill_id
)
SELECT 
        skills.skill_id,
        skills as skill_name,
        skill_count
    
FROM remote_job_skills
INNER JOIN skills_dim as skills on skills.skill_id = remote_job_skills.skill_id

ORDER BY skill_count DESC
limit 5
--------------------------------------------------------------------------------------
--SUB QUERIES AND UNION ALL (COMBINING 2 OR MORE TABLE)


/* Find job postings from the first quarter that have a salary greater than 70k
    - Combine job posting table from the first quarter of 2023(jan-mar)
    - Gets job posting with an average yearly salary > 70,000
    */

SELECT
        quarter_job_postings.job_title_short,
        quarter_job_postings.job_location,
        quarter_job_postings.job_via,
        quarter_job_postings.job_posted_date::DATE,
        salary_year_avg
FROM(
    SELECT *
    FROM january_jobs

    UNION ALL   

    SELECT *
    FROM february_jobs

    UNION ALL

    SELECT *
    FROM march_jobs
) AS quarter_job_postings

WHERE 
    quarter_job_postings.salary_year_avg > 70000 AND
    quarter_job_postings.job_title_short = 'Data Analyst'

    ORDER BY salary_y ear_avg DESC
-----------------------------------------------------new--