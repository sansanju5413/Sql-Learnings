-- JOINS-->

select *
from employee_salary;

select *
from employee_demographics;

-- INNER JOINS-->
select *
from employee_demographics
inner join employee_salary
	on employee_demographics.employee_id=employee_salary.employee_id
;
select *
from employee_demographics as demo
inner join employee_salary as sal
	on demo.employee_id=sal.employee_id;


-- if you want exact information in from the both table
select employee_demographics.employee_id, employee_demographics.first_name, employee_demographics.age, gender, employee_salary.occupation, employee_salary.salary
from employee_demographics, employee_salary
where age>40 and salary>20000
order by gender;

-- OUTER JOINS-->

select *
from employee_demographics
LEFT join employee_salary    -- LEFT JOIN IS JOINS THE employee_demographics INTO LEFT AND MATCHES WITH right , 
							-- and which row is not there in the left row , then removes from the right also
	on employee_demographics.employee_id=employee_salary.employee_id
;

select *
from employee_demographics
right join employee_salary	-- right is compared with left ,and add the rows as null to table if different row is there in the right row
	on employee_demographics.employee_id=employee_salary.employee_id
;

-- SELF JOIN-->
-- SELF JOIN is used to join the row from the same table like
-- 1

select *
from employee_salary as emp1
join employee_salary as emp2
	on emp1.employee_id+1=emp2.employee_id
;

select emp1.employee_id as employes, emp2
from employee_salary as emp1
join employee_salary as emp2
	on emp1.employee_id+1=emp2.employee_id
;

select emp1.employee_id as emp_id, emp2.employee_id as manager_id,
emp1.first_name as emp_name, emp2.first_name as manager_name
from employee_salary as emp1
join employee_salary as emp2
	on emp1.employee_id+3=emp2.employee_id
;


-- joining multiple table together----->

select * 
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id=sal.employee_id
inner join parks_departments as dep
	on sal.dept_id=dep.department_id
;

select *
from parks_departments
























