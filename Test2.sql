SELECT job_title, AVG(salary) as average_salary
FROM ds_salaries
WHERE employee_residence = 'US'
GROUP BY job_title
ORDER BY average_salary DESC;