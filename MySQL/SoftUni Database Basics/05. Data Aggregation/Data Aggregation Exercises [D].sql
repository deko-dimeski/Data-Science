#Exercise 1
SELECT COUNT(*) as `count` FROM wizzard_deposits;

#Exercise 2
SELECT MAX(magic_wand_size) AS `longest_magic_wand` FROM wizzard_deposits;

#Exercise 3
SELECT deposit_group, MAX(magic_wand_size) AS `longest_magic_wand` FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY longest_magic_wand ASC, deposit_group ASC;

#Exercise 4
SELECT deposit_group 
FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY AVG(magic_wand_size)
LIMIT 1;

#Exercise 5
SELECT deposit_group, SUM(deposit_amount) as total_sum
FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY total_sum;

#Exercise 6
SELECT deposit_group, SUM(deposit_amount) as total_sum
FROM wizzard_deposits
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
#HAVING magic_wand_creator = 'Ollivander family'
ORDER BY deposit_group;

#Exercise 7
SELECT deposit_group, SUM(deposit_amount) as total_sum
FROM wizzard_deposits
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
HAVING total_sum < 150000
ORDER BY total_sum DESC;

#Exercise 8
SELECT deposit_group, magic_wand_creator, MIN(deposit_charge) as min_deposit_charge
FROM wizzard_deposits
GROUP BY deposit_group, magic_wand_creator
ORDER BY magic_wand_creator ASC, deposit_group ASC;


#Exercise 8
SELECT deposit_group, magic_wand_creator, MIN(deposit_charge) as min_deposit_charge
FROM wizzard_deposits;

#Exercise 9
SELECT
	CASE
		WHEN age BETWEEN 0 AND 10 THEN '[0-10]'
        WHEN age BETWEEN 11 AND 20 THEN '[11-20]'
        WHEN age BETWEEN 21 AND 30 THEN '[21-30]'
        WHEN age BETWEEN 31 AND 40 THEN '[31-40]'
        WHEN age BETWEEN 41 AND 50 THEN '[41-50]'
        WHEN age BETWEEN 51 AND 60 THEN '[51-60]'
        ELSE '[61+]'
	END AS age_group,
    COUNT(magic_wand_creator) AS wizard_count
FROM wizzard_deposits
GROUP BY age_group
ORDER BY age_group ASC;

#Exercise 10
SELECT LEFT(first_name, 1) AS first_letter
FROM wizzard_deposits
GROUP BY deposit_group, first_letter
HAVING deposit_group = 'Troll Chest'
ORDER BY first_letter;

#Exercise 11
SELECT	deposit_group,
		is_deposit_expired,
        AVG(deposit_interest) AS average_imterest
FROM wizzard_deposits
WHERE deposit_start_date > STR_TO_DATE('01,01,1985', '%d,%m,%Y')
GROUP BY deposit_group, is_deposit_expired
ORDER BY deposit_group DESC;

#Exercise 12 LONG
SELECT SUM(temp_table.difference) AS sum_difference FROM 
(SELECT	id AS host_id,
		first_name AS host_wizard,
		deposit_amount AS host_wizard_deposit,
        (SELECT id FROM wizzard_deposits
			WHERE id = host_id + 1
		) AS guest_id,
        (SELECT first_name FROM wizzard_deposits
			WHERE id = host_id + 1
		) AS guest_wizard,
        (SELECT deposit_amount FROM wizzard_deposits
			WHERE id = host_id + 1
		) AS guest_wizard_deposit,
        deposit_amount - (SELECT deposit_amount FROM wizzard_deposits
			WHERE id = host_id + 1) AS difference
FROM wizzard_deposits
WHERE id != (SELECT MAX(id) FROM wizzard_deposits)) AS temp_table;


#Exercise 12 SHORT
SELECT SUM(t2.difference) AS sum_difference FROM 
(SELECT deposit_amount - (SELECT deposit_amount FROM wizzard_deposits
			WHERE id = t1.id + 1) AS difference
FROM wizzard_deposits as t1
WHERE id != (SELECT MAX(id) FROM wizzard_deposits)) AS t2;

#Exercise 13
USE soft_uni;

SELECT department_id, MIN(salary) FROM employees
WHERE hire_date > STR_TO_DATE('01/01/2000','%d/%m/%Y')
GROUP BY department_id
HAVING department_id IN (2, 5, 7)
ORDER BY department_id;

#Exercise 14
#Note: according to the requirements we are not increasing the average but the absolute employee salary

SELECT  
	department_id,
	IF(department_id = 1, AVG(salary) + 5000, AVG(salary)) as avg_salary
FROM employees
WHERE salary > 30000 AND manager_id != 42
GROUP BY department_id
ORDER BY department_id;

#Exercise 15
SELECT department_id, MAX(salary) as max_salary
FROM employees
GROUP BY department_id
HAVING max_salary NOT BETWEEN 30000 AND 70000
ORDER BY department_id;
