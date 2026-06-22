-- Group By
select *
from employee_demographics;


SELECT gender
from employee_demographics
group by gender;


SELECT gender,avg(age)
from employee_demographics
group by gender;

SELECT gender,avg(age), min(age), max(age)
from employee_demographics
group by gender;

select occupation, count(occupation)
from employee_salary
group by occupation
;

-- order by
SELECT *
from employee_demographics
order by first_name asc;

SELECT *
from employee_demographics
order by first_name desc;

SELECT *
from employee_demographics
order by birth_date desc;

SELECT *
from employee_demographics
order by gender, age desc
;

