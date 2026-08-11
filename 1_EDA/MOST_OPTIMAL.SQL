/*
Question: What are the most optimal skills for data engineers—balancing both demand and 
salary?
- Create a ranking column that combines demand count and median salary to identify the 
most valuable skills.
- Focus only on remote Data Engineer positions with specified annual salaries.
- This approach highlights skills that balance market demand and financial reward. 
It weights core skills appropriately instead of letting rare, outlier skills distort 
the results.
The natural log transformation ensures that both high-salary and widely in-demand 
skills surface as the most practical and valuable to learn for data engineering careers.
*/
SELECT
  SD.skills,
  ROUND(MEDIAN(JF.salary_year_avg),0) AS MEDIA_SALARIO,
  ROUND(MEDIAN(JF.salary_year_avg) * LN(COUNT(JF.*))/1_000_000,2) AS RANKING,
  ROUND(LN(COUNT(JF.salary_year_avg)),1) AS LN_DEMAND
FROM 
  job_postings_fact AS JF
INNER JOIN
  skills_job_dim AS SJD
  ON JF.job_id = SJD.job_id
INNER JOIN
  skills_dim AS SD
  ON SJD.skill_id = SD.skill_id
WHERE 
  lower(JF.job_title_short) IN ('data engineer')
  AND JF.job_work_from_home IS TRUE
  AND JF.salary_year_avg IS NOT NULL
GROUP BY
  skills
HAVING
  COUNT(SD.*) >= 100
ORDER BY
  RANKING DESC
LIMIT 25
