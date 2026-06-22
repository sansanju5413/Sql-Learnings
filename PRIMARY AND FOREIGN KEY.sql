# PRIMARY KEY---->

create temporary table prime_key
(
roll_no int primary key ,
first_name varchar(50) not null,
last_name varchar(50),
marks int(50));

insert into prime_key
values
(1,"sanju", "HS", 98),
(2, "theju", "HS", 89),
(3, "ash", "NR", 67);

select *
from prime_key;

#foreign key--->

create table department
(
dept_id int primary key,
department_name varchar(60));


create table employees
(
emp_id int primary key,
first_name varchar(50) not null,
last_name varchar(50),
dept_id int,
foreign key(dept_id)
references department(dept_id)
);

insert into department
values
(1, "IT"),
(2, "HR"),
(3, "TESTING");

select *
from department;

insert into employees
values
(1,"sanju", "HS", 2);

select *
from employees;

insert into employees
values
(1,"sanju", "HS", 5); #------> it gives error becouse dept_id 5 refers department table and the dept_id 5 is not exist,,,



# usage of unique--->
create temporary table students
(
first_name varchar(50) not null,
email varchar(50) unique);

insert into students
values
("sanju", "sanjusanju5414@gmail.com");  #----> this value is inserts 

insert into students
values
("raj", "sanjusanju5414@gmail.com");  #------> this value is not inserts because sanjusanju5414@gmail.com is already exist , duplicate entry is not allowed due to usage of "unique"

# default----->
CREATE temporary table employ(
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    city VARCHAR(50) DEFAULT 'Mysore'
);

insert into employ(emp_id, first_name)
values
(2, "ranju") ; #it inserts city as mysore , because use fo default

insert into employ
values
(1, "sanju", "banglore");

select *
from employ;








