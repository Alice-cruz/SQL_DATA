SELECT
  cast(job_id as varchar) || '-' || cast(company_id as varchar) as job_id_key,
  cast(job_posted_date as date) as job_posted_date,
  cast(job_work_from_home as int) as job_work_from_home,
  cast(salary_year_avg as decimal(10,0)) as salary_year_avg
FROM 
  job_postings_fact
WHERE
    salary_year_avg IS NOT NULL;