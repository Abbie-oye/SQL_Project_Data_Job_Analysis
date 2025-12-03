/*
Question: What are  most in_demand skills for remote data analyst role?
Find the count of the number of remote job posting per skill for Data Analyst role
    - Display the top 5 skills by their demand in remote jobs
    - Include skill_id, anme of skill and count of postings requiring the skill
*/
SELECT 
c.skill_id,
c.skills as skill_name,
count(*) as skill_count from
(SELECT
    a.job_id,
    a.job_title_short,
    a.job_title,
    a.job_location,
    a.job_schedule_type,
    a.job_posted_date,
    a.salary_year_avg,
    b.name as company_name
FROM
    job_postings_fact as a LEFT JOIN company_dim as b
ON
    a.company_id=b.company_id 
WHERE
    job_title_short = 'Data Analyst' and job_location = 'Anywhere'
ORDER BY
    salary_year_avg DESC) as top_paying_jobs

INNER JOIN skills_job_dim
ON
    top_paying_jobs.job_id=skills_job_dim.job_id INNER JOIN skills_dim as c
ON
    skills_job_dim.skill_id=c.skill_id
GROUP BY
    c.skill_id
ORDER BY count(*) DESC
limit 5