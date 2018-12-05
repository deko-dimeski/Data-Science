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

#Exercise 6
SELECT town_id, name FROM towns
WHERE LEFT(LOWER(name), 1) IN ('M','K','B','E')
ORDER BY name ASC;

#Exercise 7
SELECT town_id, name FROM towns
WHERE LEFT(LOWER(name), 1) NOT IN ('r','b','d')
ORDER BY name ASC;

#Exercise 8
CREATE VIEW v_employees_hired_after_2000 AS
SELECT first_name, last_name FROM employees
WHERE YEAR(hire_date) > 2000;

#Exercise 9
SELECT first_name, last_name FROM employees
WHERE char_length(last_name) = 5;

#Exercise 10
USE geography;

SELECT country_name, iso_code FROM countries
WHERE LOWER(country_name) LIKE '%a%a%a%'
ORDER BY iso_code;

#Exercise 11
SELECT 	peak_name, 
		river_name,
		LOWER(CONCAT(peak_name, SUBSTRING(river_name, 2))) as mix
		#LOWER(CONCAT(`peak_name`, SUBSTRING(`river_name`, 2))) AS 'mix'
FROM 	peaks, 
		rivers
WHERE LOWER(RIGHT(peak_name, 1)) = LOWER(LEFT(river_name, 1))
ORDER BY mix;

#Exercise 12
USE diablo;

SELECT name, DATE_FORMAT(start, '%Y-%m-%d') FROM games
WHERE YEAR(start) IN (2011, 2012)
ORDER BY start, name
LIMIT 50;

#Exercise 13
SELECT 	user_name,
		REVERSE(SUBSTRING(REVERSE(email) FROM 1 FOR (LOCATE('@', REVERSE(email))-1))) AS `Email Provider`
FROM users
ORDER BY `Email Provider`, user_name;

#another solurtion
SELECT 
    `user_name`,
    SUBSTRING_INDEX(`email`, '@', - 1) AS 'Email Provider'
FROM
    `users`
ORDER BY `Email Provider` , `user_name`;

#Exercise 14
SELECT user_name, ip_address FROM users
WHERE ip_address LIKE '___.1%.%.___'
ORDER BY user_name;

#Exercise 15
