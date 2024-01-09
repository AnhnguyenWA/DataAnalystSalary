-- We would start with several general question 
-- I caterogize into QUESTIONS and the result from SQL code can be accessed through CSV file 

-- QUESTION 1: FIND THE AVERAGE SALARY OF EVERY DATA ANALYTIC JOBS IN THE US
SELECT job_title, AVG(salary) as average_salary
FROM ds_salaries
WHERE employee_residence = 'US'
GROUP BY job_title
ORDER BY average_salary DESC;

-- QUESTION 2: FIND THE AVERAGE SALARY OF EVERY DATA ANALYTIC JOBS IN THE US FROM 2020 TO 2023
SELECT 
job_title,
AVG(
	CASE
		WHEN work_year = 2023 AND employee_residence = 'US' THEN salary END) AS average_salary_2023,
AVG(
	CASE
		WHEN work_year = 2022 AND employee_residence = 'US' THEN salary END) AS average_salary_2022,
AVG(
	CASE
		WHEN work_year = 2021 AND employee_residence = 'US' THEN salary END) AS average_salary_2021,
AVG(
	CASE
		WHEN work_year = 2020 AND employee_residence = 'US' THEN salary END) AS average_salary_2020
FROM ds_salaries
GROUP BY job_title;

-- QUESTION 3:FIND THE AVERAGE SALARY OF EVERY DATA ANALYTIC JOBS IN THE US BASED ON THE SIZE OF THE FIRM
SELECT job_title,
AVG(
	CASE 
		WHEN employee_residence = 'US' AND company_size = 'L' THEN salary END) AS large_firm,
AVG(
	CASE 
		WHEN employee_residence = 'US' AND company_size = 'M' THEN salary END) AS medium_firm,
AVG(
	CASE 
		WHEN employee_residence = 'US' AND company_size = 'S' THEN salary END) AS small_firm
FROM ds_salaries
GROUP BY job_title;

-- QUESTION 4: FIND THE AVERAGE SALARY FOR EVERY DATA ANALYTIC JOB INSIDE THE US AND OUTSIDE THE US
SELECT job_title, 
AVG(
	CASE 
		WHEN employee_residence = 'US' THEN salary END) AS average_salary_in_US,
AVG(
	CASE
		WHEN employee_residence <> 'US' THEN salary END) AS average_salary_not_in_US
FROM ds_salaries
GROUP BY job_title;

-- SINCE THIS RESEARCH IS AIMED FOR DATA ANALYTIC JOBS, WE WOULD LOOK INTO THE DATASET THAT IS RELATED TO 'DATA ANALYTIC'

-- QUESTION 5: WHAT IS THE MINIMUN,MAXIMUM, AND THE AVERAGE PAY IN THE US FOR DATA ANALYTIC JOB
SELECT job_title, 
MAX(
	CASE
		WHEN job_title LIKE '%Data Analyst%' AND employee_residence = 'US' THEN salary END) AS max_pay,
MIN(
CASE
		WHEN job_title LIKE '%Data Analyst%' AND employee_residence = 'US' THEN salary END) AS min_pay,
AVG(
CASE
		WHEN job_title LIKE '%Data Analyst%' AND employee_residence = 'US' THEN salary END) AS average_pay
FROM ds_salaries
GROUP BY job_title
ORDER BY 2 DESC;

-- SINCE WE KNOW WHAT JOBS ARE CLOSED TO 'DATA ANALYST' AND THEIR PAY, WE WILL LOOK FURTHER GIVEN FROM THE DATASET
-- QUESTION 6: FIND HOW MANY DATA ANALYTICS JOBS FOR EACH EXPERIENCE LEVEL
SELECT DISTINCT job_title,
SUM(
	CASE
		WHEN experience_level = 'EX' AND employee_residence = 'US' THEN 1 ELSE 0 END) AS executive_jobs,
SUM(
	CASE 
		WHEN experience_level = 'SE' AND employee_residence = 'US'THEN 1 ELSE 0 END) AS senior_jobs,
 SUM(
	CASE
		WHEN experience_level = 'MI' AND employee_residence = 'US' THEN 1 ELSE 0 END) AS middle_jobs,
SUM(
	CASE
		WHEN experience_level = 'EN' AND employee_residence = 'US'  THEN 1 ELSE 0 END) AS entry_jobs
FROM ds_salaries
WHERE job_title LIKE '%Data Analyst%' AND employee_residence = 'US'
GROUP BY job_title;

-- NOW THAT KNOW DATA ANALYST OCCUPIES THE MOST JOB IN THIS DATASET, WE CAN EXAMINE FURTHER TO FIND MORE INSIGHTS
-- QUESTION 7: WHAT ARE THE AVERAGE SALARY FROM THOSE JOBS BASED EXPERIENCE LEVEL
SELECT DISTINCT job_title, 
AVG(
	CASE
		WHEN job_title = 'Data Analyst' AND experience_level = 'EX' AND employee_residence = 'US' THEN salary END) AS ex_salary_in_2_jobs,
AVG(
	CASE
		WHEN job_title = 'Data Analyst' AND experience_level = 'SE' AND employee_residence = 'US' THEN salary END) AS se_salary_in_349_jobs,
AVG(
	CASE
		WHEN job_title = 'Data Analyst' AND experience_level = 'MI' AND employee_residence = 'US' THEN salary END) AS mi_salary_in_127_jobs,
AVG(
	CASE
		WHEN job_title = 'Data Analyst' AND experience_level = 'EN' AND employee_residence = 'US' THEN salary END) AS en_salary_41_jobs
FROM ds_salaries
WHERE job_title = 'Data Analyst'
GROUP BY job_title;

-- WE CAN FIND WHAT ARE FIRMS WILL PAY FOR AVERAGE SALARY BASED ON THEIR SIZE
-- QUESTION 8: FIND AVERAGE SALARY FOR EACH DATA ANALYST JOBS BASED ON FIRM SIZE
SELECT DISTINCT job_title, 
SUM(
	CASE
		WHEN job_title = 'Data Analyst' AND experience_level = 'EN' AND employee_residence = 'US'  THEN 1 ELSE 0 END) AS total_entry_jobs,
SUM(
	CASE
		WHEN job_title = 'Data Analyst' AND experience_level = 'EN' AND employee_residence = 'US' AND company_size = 'L' THEN 1 ELSE 0 END) AS jobs_in_large_firm,
SUM(
	CASE
		WHEN job_title = 'Data Analyst' AND experience_level = 'EN' AND employee_residence = 'US' AND company_size = 'M' THEN 1 ELSE 0 END) AS jobs_in_medium_firm,
SUM(
	CASE
		WHEN job_title = 'Data Analyst' AND experience_level = 'EN' AND employee_residence = 'US' AND company_size = 'S' THEN 1 ELSE 0 END) AS jobs_in_small_firm,
AVG(
	 CASE
		WHEN job_title = 'Data Analyst' AND experience_level = 'EN' AND employee_residence = 'US' AND company_size = 'L' THEN salary END) AS avg_salary_large_firm,
AVG(
	 CASE
		WHEN job_title = 'Data Analyst' AND experience_level = 'EN' AND employee_residence = 'US' AND company_size = 'M' THEN salary END) AS avg_salary_medium_firm,
AVG(
	 CASE
		WHEN job_title = 'Data Analyst' AND experience_level = 'EN' AND employee_residence = 'US' AND company_size = 'S' THEN salary END) AS avg_salary_small_firm
FROM ds_salaries
WHERE job_title = 'Data Analyst'
GROUP BY job_title;

-- WE CAN ALSO LOOK FURTHER INTO THE DATASET ON REMOTE 
-- QUESTION 9: HOW MANY JOBS IN EACH FIRM HAS REMOTE RATIO OF 100 (AKA WORKING REMOTELY)
SELECT DISTINCT job_title, 
SUM(
	CASE
		WHEN job_title = 'Data Analyst' AND experience_level = 'EN' AND employee_residence = 'US'  THEN 1 ELSE 0 END) AS total_entry_jobs,
SUM(
	CASE
		WHEN job_title = 'Data Analyst' AND experience_level = 'EN' AND employee_residence = 'US' AND company_size = 'L' THEN 1 ELSE 0 END) AS jobs_in_large_firm,
SUM(
	CASE
		WHEN job_title = 'Data Analyst' AND experience_level = 'EN' AND employee_residence = 'US' AND company_size = 'M' THEN 1 ELSE 0 END) AS jobs_in_medium_firm,
SUM(
	CASE
		WHEN job_title = 'Data Analyst' AND experience_level = 'EN' AND employee_residence = 'US' AND company_size = 'S' THEN 1 ELSE 0 END) AS jobs_in_small_firm,
SUM(
	CASE 
		WHEN job_title = 'Data Analyst' AND experience_level = 'EN' AND employee_residence = 'US' AND company_size = 'L' AND remote_ratio = 100 THEN 1 ELSE 0 END) AS remote_ratio_large_firm,
        SUM(
	CASE 
		WHEN job_title = 'Data Analyst' AND experience_level = 'EN' AND employee_residence = 'US' AND company_size = 'M' AND remote_ratio = 100 THEN 1 ELSE 0 END) AS remote_ratio_medium_firm,
        SUM(
	CASE 
		WHEN job_title = 'Data Analyst' AND experience_level = 'EN' AND employee_residence = 'US' AND company_size = 'S' AND remote_ratio = 100 THEN 1 ELSE 0 END) AS remote_ratio_small_firm
FROM ds_salaries
WHERE job_title = 'Data Analyst'
GROUP BY job_title;