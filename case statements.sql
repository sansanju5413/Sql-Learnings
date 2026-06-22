-- case statement --->
-- case statement is used to create a new column in select using when condition

select first_name,
last_name, age,
case
	when age <=30 then 'young'
    when age >=40 then 'old'
    when age between 30 and 40 then 'average'
end as range_of_age
from employee_demographics
;



-- <50000  then 5%
-- >=50000 then 7%
-- =finance then 10%

select first_name, last_name, occupation, salary,
case
	when salary<50000 then salary*1.05
    when salary>=50000 then salary*1.07
end updated_salary,
case
	when dept_id=6 then salary*0.10
end bonus

from employee_salary
;


-- for extra my usability
select first_name, last_name, occupation, salary,
case
	when salary<50000 then salary*1.05
    when salary>=50000 then salary*1.07
end updated_salary,
case
	when dept_id=6 then salary*0.10
end bonus,

(
        CASE
            WHEN salary < 50000 THEN salary * 1.05
            WHEN salary >= 50000 THEN salary * 1.07
        END
        +
        CASE
            WHEN dept_id = 6 THEN salary * 0.10
            ELSE 0
        END
    ) AS total_salary

from employee_salary


