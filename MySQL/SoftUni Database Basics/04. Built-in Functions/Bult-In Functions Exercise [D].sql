SELECT * FROM soft_uni.employees;

#Exercise 1
SELECT first_name, last_name FROM employees
WHERE LOWER(substring(first_name, 1, 2)) = 'sa'
ORDER BY employee_id;

#Exercise 2
SELECT first_name, last_name FROM employees
WHERE LOCATE('ei', LOWER(last_name))
ORDER BY employee_id;

#Exercise 3
SELECT first_name FROM employees
WHERE 
	department_id IN (3, 10) AND 
    EXTRACT(YEAR FROM hire_date) BETWEEN 1995 AND 2005
ORDER BY employee_id ASC;

#Exerise 4
SELECT first_name, last_name FROM employees
WHERE LOCATE('engineer', LOWER(job_title)) = 0
ORDER BY employee_id ASC;

#Exercise 5
SELECT name FROM towns
WHERE CHAR_LENGTH(name) IN (5, 6)
ORDER BY name ASC;

