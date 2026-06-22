-- having vs where
select gender, avg(age)
from employee_demographics
where avg(age)>40 -- it will give error because, where cannot uses the aggregate function , and it still not avg the age.
group by gender
;

select gender, avg(age)
from employee_demographics
group by gender
having avg(age)>40;

select  occupation,avg(salary)
from employee_salary
group by occupation
having avg(salary)>20000
;

select  occupation,avg(salary)
from employee_salary
where occupation like '%manager'
group by occupation
having avg(salary)>20000
;

select  occupation,avg(salary)
from employee_salary
where occupation like '%r'
group by occupation
having avg(salary)>20000
;

























