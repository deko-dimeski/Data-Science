
#Exercise 1
CREATE DATABASE minions;

USE minions;  #set reference to the minions DB

#Exercise 2
CREATE TABLE minions(
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    age INT
);

CREATE TABLE towns(
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30)
);

#Exercise 3
ALTER TABLE minions
ADD COLUMN town_id INT(11);

ALTER TABLE minions
ADD CONSTRAINT fk_minions_towns FOREIGN KEY(town_id) REFERENCES towns(id);

#Exercise 4
TRUNCATE TABLE minions;

SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE TABLE towns;
SET FOREIGN_KEY_CHECKS = 1;


INSERT INTO towns(name) VALUES('Sofia'),('Plovdiv'),('Varna');
INSERT INTO minions(name, age, town_id) 
	VALUES
    ('Kevin', 22, 1),
    ('Bob', 15, 3),
    ('Steward', NULL,2);
    
SELECT * FROM minions;
SELECT * FROM towns;

#Exercise 5
TRUNCATE TABLE minions;

SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE TABLE towns;
SET FOREIGN_KEY_CHECKS = 1;

#Exercise 6
DROP TABLE minions;
DROP TABLE towns;
DROP TABLE directors;

#Exercise 7
CREATE TABLE people(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    picture MEDIUMBLOB,
    height DOUBLE(3,2),
    weight DOUBLE(6,2),
	#gender CHAR(1) NOT NULL CHECK (gender IN ('m','f')),
    gender ENUM('m','f') NOT NULL,
    birthdate DATE NOT NULL,
    biography TEXT
);

INSERT INTO people(id, name, picture, height, weight, gender, birthdate, biography)
	VALUES
    (1, 'Pesho', NULL, 1.80, 45.0, 'm', '1985-01-28', 'Аз съм Пешо'),
    (2, 'Gosho', NULL, 1.65, 67.45, 'm', '1986-08-15', 'Аз съм Гошо'),
    (3, 'Ivana', NULL, 1.72, 52.0, 'f', '1988-05-12', 'Казвам се Ивана'),
    (4, 'Mariya', NULL, 1.68, 48, 'f', '1991-12-06', 'My name is Mariya'),
    (5, 'Deko', NULL, 1.78, 79.5, 'm', '1985-10-27', 'Ik haben Deko');

#Exercise 8
CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL,
    password VARCHAR(26) NOT NULL,
    profile_picture BLOB(900),
    last_login_time TIMESTAMP,
    is_deleted ENUM('true', 'false')    
	#is_deleted BIT NOT NULL  #Store 0's and 1's
);

INSERT INTO users(id, username, password, profile_picture, last_login_time, is_deleted)
	VALUES
    (1, 'pesho', '123456789', NULL, NOW(), 'true'),
    (2, 'gosho', 'qwerty', NULL, NOW()+1, 'true'),
    (3, 'ivana', 'iva2000', NULL, NOW()+2, 'false'),
    (4, 'kameliya', 'kami98', NULL, NOW()+3, 'false'),
    (5, 'deko', 'ddimeski', NULL, NOW()+4, 'true');
    
#Exercise 9
ALTER TABLE users MODIFY id INT NOT NULL; #remove auto increment before removing primary key
ALTER TABLE users DROP PRIMARY KEY; #remove primary key
ALTER TABLE users ADD CONSTRAINT pk_users PRIMARY KEY(id, username);

#Exercise 10
ALTER TABLE users MODIFY last_login_time TIMESTAMP DEFAULT NOW();

#Exercise 11
ALTER TABLE users MODIFY id INT NOT NULL;
ALTER TABLE users DROP PRIMARY KEY; #remove primary key
ALTER TABLE users ADD CONSTRAINT pk_users PRIMARY KEY(id);
ALTER TABLE users MODIFY id INT NOT NULL AUTO_INCREMENT;
ALTER TABLE users ADD CONSTRAINT uq_username UNIQUE(username); #ALTER TABLE users DROP INDEX uq_username; #drop the UNIQUE contraint




CREATE DATABASE movies;
USE movies;

#Exercise 12
CREATE TABLE directors(
	id INT PRIMARY KEY AUTO_INCREMENT,
    director_name VARCHAR(50) NOT NULL,
    notes TEXT
);

#TRUNCATE TABLE directors;
INSERT INTO directors(id, director_name, notes)
	VALUES
    (1, 'Martin Scorseze', 'Shutter Island'),
    (2, 'Steven Spilberg', 'Beverli Hills'),
    (3, 'Christopher Nolan', 'Interstellar, Inception...'),
	(4, 'Milcho Manchevski', 'Sample textttt'),
    (5, 'Tarantino', NULL);
    

CREATE TABLE genres(
	id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(30) NOT NULL UNIQUE,
    notes TEXT
);

INSERT INTO genres(id, genre_name, notes)
	VALUES
    (1, 'Drama', NULL),
    (2, 'Thriller', 'Best genre'),
    (3, 'Action', 'Sample text'),
    (4, 'Si-Fi', NULL),
    (5, 'Horor', 'Scaryyyyy');
    
CREATE TABLE categories(
	id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(30) NOT NULL UNIQUE,
    notes TEXT
);

INSERT INTO categories(id, category_name, notes)
	VALUES
	(1, 'Kids', 'Sample cathegory'),
    (2, 'Audult', 'bla bla'),
    (3, '16+', NULL),
    (4, '12+', NULL),
    (5, 'Family', 'sample text');

CREATE TABLE movies(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    director_id INT NOT NULL,
    copyright_year INT NOT NULL,
	length INT NOT NULL,
    genre_id INT,
    category_id INT,
    rating INT,
    notes TEXT
    #FOREIGN KEY (director_id) REFERENCES directors(id),
    #FOREIGN KEY (genre_id) REFERENCES genres(id),
    #FOREIGN KEY (category_id) REFERENCES categories(id)
);

INSERT INTO movies(id, title, director_id, copyright_year, length, genre_id, category_id, rating, notes)
	VALUES
    (1, 'Shutter Island', 1, '2018', 155, 2, 2, 8, 'Best movie ever'),
    (2,'Beverli Hills', 2, '2010', 45, 1, 4, 7, 'telenovela'),
	(3, 'Shutter Island2', 1, '2016', 55, 2, 2, 8, 'Best movie ever'),
    (4,'Beverli Hills2', 2, '2011', 42, 1, 4, 5, 'telenovela'),
	(5,'Beverli Hills3', 4, '2012', 177, 1, 5, 6, 'telenovela');
    
#------------------------------------------------------------------------------------------------------------------------

#Exercise 15

CREATE DATABASE soft_uni;
USE soft_uni;

CREATE TABLE towns(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50)
);

CREATE TABLE addresses(
	id INT PRIMARY KEY AUTO_INCREMENT,
    address_text VARCHAR(255),
    town_id INT,
    FOREIGN KEY (town_id) REFERENCES towns(id)
);

CREATE TABLE departments(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)
);

CREATE TABLE employees(
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30),
    middle_name VARCHAR(30),
    last_name VARCHAR(30),
    job_title VARCHAR(30),
    department_id INT,
    hire_date DATE,
    salary DOUBLE(11,2),
    address_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id),
    FOREIGN KEY (address_id) REFERENCES addresses(id)
);


#Exercise 17
INSERT INTO towns(name)
	VALUES ('Sofia'), ('Plovdiv'), ('Varna'), ('Burgas');
    
INSERT INTO departments(name)
	VALUES ('Engineering'),('Sales'),('Marketing'),('Software Development'),('Quality Assurance');

SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE TABLE departments;
SET FOREIGN_KEY_CHECKS = 1; 
    
INSERT INTO employees(first_name, middle_name, last_name, job_title, department_id, hire_date, salary)
	VALUES
    ('Ivan','Ivanov','Ivanov','.NET Developer', 4, '2013-02-01', 3500.00),
    ('Petar','Petrov','Petrov','Senior Engineer', 1, '2004-03-02', 4000.00),
    ('Maria','Petrova','Ivanova', 'Intern', 5,'2016-08-28', 525.25),
    ('Georgi','Terziev','Ivanov', 'CEO', 2, '2007-12-09', 3000.00),
    ('Peter','Pan','Pan', 'Intern', 3,'2016-08-28', 599.88);


#Exercise 18
SELECT * FROM towns;
SELECT * FROM departments;
SELECT * FROM employees;

#Exercise 19
SELECT * FROM towns
ORDER BY name ASC;

SELECT * FROM departments
ORDER BY name ASC;

SELECT * FROM employees
ORDER BY salary DESC;

#Exercise 20
SELECT name FROM towns
ORDER BY name ASC;

SELECT name FROM departments
ORDER BY name ASC;

SELECT first_name, last_name, job_title, salary FROM employees
ORDER BY salary DESC;


#Exercise 21
UPDATE employees SET salary = salary * 1.1;
SELECT salary FROM employees;
