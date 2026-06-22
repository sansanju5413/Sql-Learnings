-- string function---->

select length('sanju');



select first_name, length(first_name)
from employee_demographics
order by 1;

-- upper and lower
select upper('sanju');
select lower('SANJU');

select first_name, upper(first_name)
from employee_demographics;

select upper(first_name), lower(FIRST_NAME)
from employee_demographics
;

# TRIM
SELECT trim('     sanju         ') as 'names';

-- left trim
SELECT ltrim('     sanju         ') as 'names';

-- right trim
SELECT rtrim('     sanju         ') as 'names';


select first_name, left(first_name, 4)
from employee_demographics;

select first_name, right(first_name, 4)
from employee_demographics;

select first_name,
left(first_name, 6),
substring(first_name, 2, 3),
substring(left(first_name,6), 2,3)
from employee_demographics;

select first_name, age,
right(birth_date, 2) as 'date of born',
substring(birth_date, 6, 2) as 'month of born',
left(birth_date, 4) as 'year of born'
from employee_demographics
;

select *
from employee_demographics;

-- Replace--->
select employee_id, replace(first_name, 'Leslie', 'sanju') as 'first_name', replace(last_name,'Knope', 'H S') last_name
from employee_demographics;

select employee_id, replace(first_name, 'Leslie', 'sanju') as 'first_name', last_name
from employee_demographics
;

-- locate--->
select locate('u','sanju');


select employee_id, locate('les',first_name)
from employee_demographics
;

-- concatination--->
select first_name, last_name,
concat(first_name, ' ', last_name) as 'full_name'
from employee_demographics






