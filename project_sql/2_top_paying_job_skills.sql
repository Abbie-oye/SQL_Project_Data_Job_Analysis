/*
Question: What skills are required for the the top_paying data analyst jobs?
- Use the Top 10 highest_paying Data Analyst job from first query
- Add the specific skills required fo these roles
-Why? It provides a detailed look at which high_paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/

SELECT 
top_paying_jobs.*,c.skills from
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
    job_title_short = 'Data Analyst' and job_location = 'Anywhere' and salary_year_avg is NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10) as top_paying_jobs
INNER JOIN skills_job_dim
ON
    top_jobs.job_id=skills_job_dim.job_id INNER JOIN skills_dim as c
ON
    skills_job_dim.skill_id=c.skill_id