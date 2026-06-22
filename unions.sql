-- UNIONS  -- it merges the data of both table whether it is mathcing or not , it just merges with removing the duplicate values
SELECT employee_id, first_name, last_name
from employee_demographics
union  	-- default distinct -means remove the duplicate rows
select employee_id, first_name, last_name
from employee_salary
;

SELECT employee_id, first_name, last_name
from employee_demographics
union all 	-- all--used to show the all values within the table including the duplicate values also
select employee_id, first_name, last_name
from employee_salary;

-- label
SELECT employee_id, first_name, last_name, 'old' as label
from employee_demographics
where age >40
union
SELECT employee_id, first_name, last_name, 'young' as label
from employee_demographics
where age< 40 ;

SELECT employee_id, first_name, last_name, 'old lady' as label
from employee_demographics
where age >40 and gender ='female'
union
SELECT employee_id, first_name, last_name, 'old man' as label
from employee_demographics
where age >40 and gender ='male'
union
SELECT employee_id, first_name, last_name, 'high salary' as label
from employee_salary
where salary>=50000
union
SELECT employee_id, first_name, last_name, 'low salary' as label
from employee_salary
where salary<50000
order by first_name, last_name











