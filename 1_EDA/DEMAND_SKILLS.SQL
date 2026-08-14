/*
Question: What are the most in-demand skills for data engineers?
- Join job postings to inner join table similar to query 2
- Identify the top 10 in-demand skills for data engineers
- Focus on remote job postings
- Why? 
Retrieves the top 10 skills with the highest demand in the remote job market,
    providing insights into the most valuable skills for data engineers seeking remote work
*/

SELECT
  SD.skills,
  COUNT(jf.*) AS DEMAND_COUNT
FROM 
  job_postings_fact AS JF
INNER JOIN
  skills_job_dim AS SKD
  ON SKD.job_id = JF.job_id
INNER JOIN
  skills_dim AS SD
  ON SD.skill_id = SKD.skill_id
WHERE
  lower(JF.job_title_short) = 'data engineer'
  and jf.job_work_from_home is true
group by sd.skills
order by
  DEMAND_COUNT DESC
limit 15

