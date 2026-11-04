CREATE DATABASE employee;
USE employee;
CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(100)
);
CREATE TABLE location (
    location_id INT,
    location VARCHAR(30)
);
CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(50),
    gender ENUM('M','F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2)
);
SHOW TABLES;
ALTER TABLE employees
ADD COLUMN email VARCHAR(150);
ALTER TABLE employees
MODIFY COLUMN designation VARCHAR(200);
ALTER TABLE employees
ADD CONSTRAINT chk_employee_age CHECK (age >= 18);
ALTER TABLE employees
DROP CHECK chk_employee_age;
ALTER TABLE employees
DROP COLUMN age;
ALTER TABLE employees
RENAME COLUMN hire_date TO date_of_joining;
DESCRIBE employees;
RENAME TABLE departments TO departments_info;
RENAME TABLE location TO locations;
SHOW TABLES;
TRUNCATE TABLE employees;
SELECT * FROM employees;
DROP TABLE employees;
SHOW TABLES;
DROP DATABASE employee;
CREATE DATABASE employee;
USE employee;
CREATE TABLE departments (
    department_id INT NOT NULL,
    department_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (department_id),
    UNIQUE (department_name)
);
SHOW TABLES;
CREATE TABLE location (
    location_id INT NOT NULL AUTO_INCREMENT,
    location VARCHAR(100) NOT NULL,
    PRIMARY KEY (location_id),
    UNIQUE (location)
);
CREATE TABLE employees (
    employee_id INT NOT NULL,
    employee_name VARCHAR(100) NOT NULL,
    gender ENUM('M', 'F'),
    age INT NOT NULL,
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(200),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),

    PRIMARY KEY (employee_id),

    CONSTRAINT chk_employee_age
    CHECK (age >= 18),

    CONSTRAINT fk_employee_department
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id),

    CONSTRAINT fk_employee_location
    FOREIGN KEY (location_id)
    REFERENCES location(location_id)
);
SHOW TABLES;
SHOW CREATE TABLE employees;