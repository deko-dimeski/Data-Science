CREATE DATABASE IF NOT EXISTS `hospital`; 
USE `hospital`;

CREATE TABLE departments (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50)
);

INSERT INTO departments(name) VALUES('Therapy'), ('Support'), ('Management'), ('Other');

CREATE TABLE employees (
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	job_title VARCHAR(50) NOT NULL,
	department_id INT NOT NULL,
	salary DOUBLE NOT NULL,
	CONSTRAINT `fk_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
);

INSERT INTO `employees` (`first_name`,`last_name`, `job_title`,`department_id`,`salary`) VALUES
	('John', 'Smith', 'Therapist',1, 900.00),
	('John', 'Johnson', 'Acupuncturist',1, 880.00),
	('Smith', 'Johnson', 'Technician',2, 1100.00),
	('Peter', 'Petrov', 'Supervisor',3, 1100.00),
	('Peter', 'Ivanov', 'Dentist',4, 1500.23),
	('Ivan' ,'Petrov', 'Therapist',1, 990.00),
	('Jack', 'Jackson', 'Epidemiologist',4, 1800.00),
	('Pedro', 'Petrov', 'Medical Director',3, 2100.00),
	('Nikolay', 'Ivanov', 'Nutrition Technician',4, 1600.00);
	

	
CREATE TABLE rooms (
	id INT PRIMARY KEY AUTO_INCREMENT,
	occupation VARCHAR(30)
);

INSERT INTO rooms(`occupation`) VALUES('free'), ('occupied'),('free'),('free'),('occupied');

CREATE TABLE patients (
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	room_id INT NOT NULL
);

INSERT INTO patients(`first_name`,`last_name`,`room_id`) VALUES('Pesho','Petrov',1),('Gosho','Georgiev',3),('Mariya','Marieva', 2), ('Katya','Katerinova', 2), ('Nikolay','Nikolaev',3);


###############################################################################################################################
#Exercise 1
USE soft_uni;

SELECT * FROM departments
ORDER BY department_id;

#Exercise 2
SELECT name FROM departments
ORDER BY department_id;

#Exercise 3
SELECT first_name, last_name, salary FROM employees
ORDER BY employee_id;

#Exercise 4
SELECT first_name, middle_name, last_name FROM employees
ORDER BY employee_id;

#Exercise 5
SELECT concat(first_name,'.',last_name,'@softuni.bg') as 'full_email_address' FROM employees;

#Exercise 6
SELECT DISTINCT salary FROM employees
ORDER BY employee_id;

#Exercise 7
SELECT * FROM employees
WHERE job_title = 'Sales Representative'
ORDER BY employee_id;

#Ex 8
SELECT first_name, last_name, job_title FROM employees
WHERE salary BETWEEN 20000 AND 30000
ORDER BY employee_id;

#Ex 9
SELECT concat_ws(' ', first_name, middle_name, last_name) as 'Full Name' FROM employees
WHERE salary IN (25000, 14000, 12500, 23600);
#ORDER BY salary;

#Ex 10
SELECT first_name, last_name FROM employees
WHERE manager_id IS NULL;

#Ex 11
SELECT first_name, last_name, salary FROM employees
WHERE salary > 50000
ORDER BY salary DESC;

#Ex 12
SELECT first_name, last_name FROM employees
ORDER BY salary DESC
LIMIT 5;

#Ex 13
SELECT first_name, last_name FROM employees
WHERE department_id NOT IN (4);

#Ex 14
SELECT * FROM employees
ORDER BY salary desc, first_name asc, last_name desc, middle_name asc, employee_id asc;

#Ex 15
CREATE VIEW v_employees_salaries AS
	SELECT first_name, last_name, salary FROM employees;
    
#Ex 16
CREATE VIEW v_employees_job_titles AS
	SELECT concat_ws(' ', first_name, IFNULL(middle_name,''), last_name) as 'full_name', job_title FROM employees;
    
#Ex 17
SELECT DISTINCT job_title FROM employees
ORDER BY job_title ASC;

#Ex 18
SELECT * FROM projects
ORDER BY start_date ASC, name ASC, project_id ASC
LIMIT 10;
    
#Ex 19
SELECT first_name, last_name, hire_date FROM employees
ORDER BY hire_date DESC
LIMIT 7;

#Exercise 20

#WORKS!!!! but not valid
UPDATE employees
SET salary = salary * 1.12
WHERE employee_id IN (
SELECT * FROM (
	SELECT e.employee_id FROM employees AS e
	JOIN departments AS d
	ON e.department_id = d.department_id
	WHERE d.name IN('Engineering','Tool Design','Marketing','Information Services')
    ) AS c
);
SELECT salary as 'Salary' FROM employees;

#Exercise 20-2

UPDATE employees
SET salary = salary * 1.12
WHERE department_id IN (
	SELECT department_id FROM soft_uni.departments
	WHERE name IN ('Engineering','Tool Design','Marketing','Information Services')
    );
SELECT salary as 'Salary' FROM employees;

#Exercise 20-3
UPDATE employees
SET salary = salary * 1.12
WHERE department_id IN (1, 2, 4, 11);
SELECT salary as 'Salary' FROM employees;

#Exercise 21
USE geography;

SELECT peak_name FROM peaks
ORDER BY peak_name ASC;

#Exercise 22
SELECT country_name, population FROM countries
WHERE continent_code = 'EU'
ORDER BY population DESC
LIMIT 30;

#Exercise 23
SELECT country_name, country_code, (
CASE
	WHEN currency_code = 'EUR' THEN 'Euro'
    ELSE 'Not Euro'
END) AS currency
FROM countries
ORDER BY country_name ASC;

#Exercise 24
USE diablo;
SELECT name FROM characters
ORDER BY name ASC; 








    