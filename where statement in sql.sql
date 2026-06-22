# where clause

select *
from employee_salary
where first_name='Leslie';

select *
from employee_salary
where salary<=50000;

select *
from employee_salary
where salary>=50000;

select *
from employee_salary
where salary>50000;


select *
from employee_demographics
where gender = 'female';

select *
from employee_demographics
where gender != 'female';

# logical operators  AND OR NOT
select *
from employee_demographics
where gender = 'female'
and birth_date > '1900-01-01';


select *
from employee_demographics
where gender = 'female'
or birth_date > '1900-01-01';

select *
from employee_demographics
where (first_name = 'Leslie' and age=44)  or (age> 44 and gender='male')
;


select *
from employee_demographics
where first_name = 'Leslie' and age=44 or age>50
;



#  LIKE statement----> 
# %---> begining with mentioned and end with anything
select *
from employee_demographics
where first_name like 'jer%'  #--> must begin with 'jer' and end with anything , no limit
;

select *
from employee_demographics
where first_name like '%r%'  #--> begin with anything and end with anything but must have the 'r'
;


# _ --> used to show how many characters after or before  that character
select *
from employee_demographics
where first_name like 'a__'  # beginning with 'a' and end with anything but only 2 charcters after 'a'
;

select *
from employee_demographics
where first_name like '_n%'  # beginning with anything and end with anything but the second character is must be 'n'
;








