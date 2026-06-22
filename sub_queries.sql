-- subqueries--->alter

select *
from parks_departments;

select * 
from employee_demographics
;

select*
from employee_salary;


select * 
from employee_demographics
where employee_id in 
(select employee_id
from employee_salary
where dept_id=1); 


select first_name, salary, avg(salary),
(select
avg(salary)
from employee_salary)
from employee_salary
group by first_name,salary
;

-- this will give the correct information like aggregate function , but what if i need avg age of min age
select gender, max(age), min(age), avg(age), count(age)
from employee_demographics
group by gender;

select avg(max_age), avg(min_age), avg(avg_age), avg(count_age)
from(
select gender, max(age) as max_age, min(age) as min_age, avg(age) as avg_age, count(age) as count_age
from employee_demographics
group by gender) as aggr_information
 ;
 
 
 
 
 select *
 from employee_demographics











