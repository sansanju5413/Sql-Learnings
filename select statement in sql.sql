select *
from employee_demographics;

select first_name
from parks_and_recreation.employee_demographics;

select first_name, last_name, employee_id
from parks_and_recreation.employee_demographics;

select first_name,
last_name,
employee_id,
age,
age+10
from parks_and_recreation.employee_demographics;

# sql follows the PEMDAS rule
#paranthesis, exponential, multiplication, division, addition, subtraction

select first_name,
last_name,
age,
age+10,
(age+10)*2
from parks_and_recreation.employee_demographics;


select distinct first_name
from parks_and_recreation.employee_demographics;


select distinct gender  # distinct is used to filter or show the distinct value
from parks_and_recreation.employee_demographics;



