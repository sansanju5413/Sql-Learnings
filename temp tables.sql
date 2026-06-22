# temporary tables--->
#process of creating a temporary table , it is not permenent.
create temporary table temp_table
(
first_name varchar(50),
last_name varchar(50),
gender varchar(20),
age varchar(100)
);


insert into temp_table
values ("sanju", "HS", "forrest gump"),
("theju", "HS", "vishnu");

select *
from temp_table;

# create a temporary table using a existing table--->this table is created using a table employee_salary table--->

create temporary table salary_over_50k
select * 
from employee_salary
where salary >= 50000;

select*
from salary_over_50k



