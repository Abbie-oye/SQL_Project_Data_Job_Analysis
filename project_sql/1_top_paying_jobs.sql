/*
Question: What are the top paying data analyst jobs?
-- Identify the top 10 highest_paying Data Analyst roles that are avalaible remotely.
-- Focuses on job postings with specified salaries (remove nulls).
-- Why? Highlight the top-paying opportunites for Data Analysts,offering insights into employment company's name
*/
SELECT
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
    job_title_short like '%Data Analyst%' and job_location = 'Anywhere' and salary_year_avg is NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10