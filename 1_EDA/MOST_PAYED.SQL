/*
Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer positions
- Focus on remote positions with specified salaries
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while also showing 
    how common those skills are, providing a more complete picture for skill development priorities
*/
/*
Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer positions
- Focus on remote positions with specified salaries
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while also showing 
    how common those skills are, providing a more complete picture for skill development priorities
*/
SELECT
  SD.skills,
  ROUND(MEDIAN(JF.salary_year_avg),0) AS MEDIA_SALARIO,
  COUNT(SD.*) AS FREQUENCIA
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
GROUP BY
  skills
HAVING
  COUNT(SD.*) >= 100
ORDER BY
  MEDIA_SALARIO DESC

LIMIT 25
