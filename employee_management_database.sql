CREATE DATABASE employee_project;
use employee_project;
CREATE TABLE employees (
    emp_id INT,
    first_name VARCHAR(50),
    dept_id INT,
    salary INT,
    gender VARCHAR(20)
);
CREATE TABLE departments (
    dept_id INT,
    department_name VARCHAR(50)
);
INSERT INTO employees VALUES
(1, 'Sanju', 101, 50000, 'Male'),
(2, 'Ravi', 102, 65000, 'Male'),
(3, 'Kiran', 101, 72000, 'Female'),
(4, 'Ajay', 103, 45000, 'Male'),
(5, 'Sara', 102, 80000, 'Female'),
(6, 'Meena', 101, 72000, 'Female'),
(7, 'Arun', 103, 55000, 'Male'),
(8, 'Divya', 102, 67000, 'Female');

INSERT INTO departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Sales');

select * from employees;
select * from departments;