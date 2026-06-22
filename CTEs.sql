-- CTEs  (common table expression)--->


-- THIS IS USING A CTE
with CTE as 
(
select gender, avg(salary) avg_sal, min(salary) min_sal, max(salary) max_sal, count(salary) count_sal
from employee_demographics
join employee_salary
	on employee_demographics.employee_id=employee_salary.employee_id
group by gender
)
select avg(avg_sal)
from CTE;


-- THIS IS USING A SUBQUERIES------------------>
select avg(avg_sal)
from(
select gender, avg(salary) avg_sal, min(salary) min_sal, max(salary) max_sal, count(salary) count_sal
from employee_demographics
join employee_salary
	on employee_demographics.employee_id=employee_salary.employee_id
group by gender
) sub_query;
-- ----------------------------------------------------------------------------------------


with cte_example1 as
(select employee_id, first_name, birth_date, gender
from employee_demographics
where birth_date>'1979-09-25'
),
cte_example2 as
(select employee_id, last_name, salary
from employee_salary
where salary>50000
)
select *
from cte_example1
join cte_example2
	on cte_example1.employee_id=cte_example2.employee_id
;


-- and cte is used to rename the headlines like this ----->
# CTE (GENDER, AVG_SAL, MIN_SAL, MAX_SAL, COUNT_SAL)---->FROM(avg(salary) avg_sal, min(salary) min_sal, max(salary) max_sal, count(salary) count_sal
with CTE (GENDER, AVG_SAL, MIN_SAL, MAX_SAL, COUNT_SAL) AS 
(
select gender, avg(salary) avg_sal, min(salary) min_sal, max(salary) max_sal, count(salary) count_sal
from employee_demographics
join employee_salary
	on employee_demographics.employee_id=employee_salary.employee_id
group by gender
)
select *
from CTE;
















