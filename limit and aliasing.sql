-- limit
select *
from employee_salary
where salary >57000
order by salary
limit 3;


-- give 4 old employee details to fire
select *
from employee_demographics
order by age desc
limit 4; -- gives the top 4 aged employee details

select *
from employee_demographics
order by age desc
limit 5,1  -- it gives the 1st employee or row after 3 rows, means gives a 4th employee data

;

select *
from employee_demographics
order by age desc;


-- ALIASING

select gender, avg(age) as avg_age
from employee_demographics
group by gender
having avg_age>40
;

select occupation, count(occupation) as 'no.of occupation', avg(salary) as avg_salary
from employee_salary
group by occupation








