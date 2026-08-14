-- .read LESSONS/DDM_AND_DML.SQL
use data_jobs;
-- CRIO O DATABASE jobs_mart SE NAO EXISTIR;
drop database if exists jobs_mart;

create database if not exists jobs_mart;


show databases;
-- VERIFICO AS INFORMAÇÕES DO DATABASE jobs_mart;
SELECT *
FROM information_schema.schemata;

USE jobs_mart;

-- CRIO O SHEMA staging SE NAO EXISTIR;
CREATE SCHEMA if not exists staging;
-- DENTRO DO SCHEMA staging CRIO A TABELA preffered_roles SE NAO EXISTIR;
CREATE TABLE IF NOT EXISTS staging.preffered_roles (
    role_id INT PRIMARY KEY,
    role_name VARCHAR
);
-- VERIFICO AS INFORMACOES DA TABELA preffered_roles;
select *
from information_schema.tables
where table_schema = 'staging';

----------- INSERT TO ---------------------

INSERT INTO staging.preffered_roles (role_id, role_name)
VALUES
    (1, 'Data Analyst'),
    (2, 'Data Scientist'),
    (3, 'Data Engineer'),
    (4, 'Senior Data Engineer'),
    (5, 'Business Analyst');

---------- ALTER TABLE -------------------
ALTER TABLE staging.preffered_roles
ADD COLUMN preferred_role BOOLEAN;

----------- UPDATE ---------------------    
UPDATE staging.preffered_roles
SET preferred_role = TRUE
WHERE role_name like '%Data Engineer%';

UPDATE staging.preffered_roles
SET preferred_role = FALSE
WHERE role_name not like '%Data Engineer%';

ALTER TABLE staging.preffered_roles
RENAME TO priority_roles;

alter table staging.priority_roles
rename column preferred_role to priority_lvl;

ALTER TABLE staging.priority_roles
ALTER COLUMN priority_lvl TYPE INT;


UPDATE staging.priority_roles
SET priority_lvl = 2
WHERE role_name like '%Data Analyst%' or role_name like '%Scientist%';

UPDATE staging.priority_roles
SET priority_lvl = 3
WHERE role_name like '%Business Analyst%';



SELECT * FROM staging.priority_roles;
