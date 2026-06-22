-- 1 Show all employees.
select * 
from employee_demographics;

-- 2 Show only first_name and age.
select first_name, age
from employee_demographics;

#3 Find employees older than 30.
select *
from employee_demographics
where age>30
;

#4 Find employees whose age is less than 25.
select *
from employee_demographics
where age<25;

#5 Find female employees.
select *
from employee_demographics
where gender="Female"
;

#6 Find employees whose first name starts with 'A'.
select *
from employee_demographics
where first_name like "A%";

#7 Find employees whose first name ends with 'n'.
select *
from employee_demographics
where first_name like "%n";

#8 Find employees aged between 25 and 35.
select *
from employee_demographics
where age between 25 and 35;

#9 Find employees not equal to age 30.
select *
from employee_demographics
where age !=30;

#10 Display employees sorted by age descending.
select *
from employee_demographics
order by age desc;

#11 Find total number of employees.
select count(employee_id)
from employee_demographics;

# 12 Find average age group by gender.
select gender, avg(age)
from employee_demographics
group by gender;

# 12 Find average age
select avg(avg_age)
from
(select gender, avg(age) avg_age
from employee_demographics
group by gender) as agre
;

#13 Find maximum salary.
select max(salary) max_sal
from employee_salary;

# 14 Find minimum salary.
select min(salary) min_sal
from employee_salary;

#15 Find total salary paid to employees.
select sum(salary) total_sal
from employee_salary;

#16 Count employees by gender.
select gender, count(employee_id)
from employee_demographics
group by gender;

#17Find average age by gender.
select gender, avg(age)
from employee_demographics
group by gender;

#18 Find average salary by department.
select dept_id, avg(salary)
from employee_salary
group by dept_id
;

#19 Show departments having more than 2 employees.
select dept_id, count(employee_id)
from employee_salary
group by dept_id
having count(employee_id)>2;

#20 Show genders whose average age is above 30.
with cte as(

select gender, avg(age) as avg_age
from employee_demographics
group by gender) 

select *
from cte
where avg_age>30;

select gender, avg(age) avg_age
from employee_demographics
group by gender
having avg_age>30
;
select*
from employee_salary
;

#21 Show employee name with salary.
select concat(dem.first_name, " " , dem.last_name) as employee_name, sal.salary
from employee_demographics dem
join employee_salary sal
on dem.employee_id=sal.employee_id;

#22 Show employee name and occupation.
select concat(first_name, " ", last_name) employee_name, occupation
from employee_salary;

#23  Show employee name, salary, and age.
select concat(dem.first_name, " " , dem.last_name) as employee_name, sal.salary, dem.age
from employee_demographics dem
join employee_salary sal
on dem.employee_id=sal.employee_id;

#24 Show employees earning more than 50,000.
select dem.employee_id, concat(dem.first_name, " " , dem.last_name) as employee_name, sal.salary, dem.age
from employee_demographics dem
join employee_salary sal
on dem.employee_id=sal.employee_id
where sal.salary>50000;

#25 Show employees from department 1.
select dem.employee_id, concat(dem.first_name, " " , dem.last_name) as employee_name, sal.salary, dem.age
from employee_demographics dem
join employee_salary sal
on dem.employee_id=sal.employee_id
where sal.dept_id=1;

#26 Show employees whose age is greater than 30 and salary greater than 60,000.
select dem.employee_id, concat(dem.first_name, " " , dem.last_name) as employee_name, dem.age, sal.salary
from employee_demographics dem
join employee_salary sal
on dem.employee_id=sal.employee_id
where dem.age>30 and sal.salary>60000;


#27 Show all employees even if salary information is missing.
select *
from employee_demographics dem
left join employee_salary sal
on sal.employee_id=dem.employee_id;


#28 Show all salary records even if employee details are missing.
select *
from employee_salary sal
left join employee_demographics dem
on sal.employee_id=dem.employee_id;

#29 Count employees in each department.
select dept_id, count(employee_id)
from employee_salary
group by dept_id;


#30 Find highest-paid employee.
select *
from employee_salary
order by salary desc
limit 1;

select *
from employee_salary
where salary=
(select max(salary) as max_sal
		from employee_salary);
        
        
select first_name, last_name,salary, "high paid employee" as label
from employee_salary
where salary=
(select max(salary) as max_sal
		from employee_salary);
        
        
        
/*31 Classify employees:
Salary > 70,000 → High
Else → Low*/

select *,
case
when salary>70000 then "high"
else "low"
end clasify
from employee_salary;

/*
32
Give bonus:
Salary > 60,000 → 10%
Otherwise → 5%*/
select *,
case
when salary > 60000 then salary*0.10
else salary*0.05
end bonus,

salary+
case
when salary > 60000 then salary*0.10
else salary*0.05
end total_salary
from employee_salary;

/*
33
Create age category:
Age < 30 → Young
Age >= 30 → Senior
*/
select *,
case
when age<30 then "young"
when age>=30 then "senior"
end age_clasify
from employee_demographics;

/*
34
Increase salary:

Dept 1 → +10%
Dept 2 → +5%
*/

select *,
case 
when dept_id=1 then salary*0.10
when dept_id=2 then salary*0.05
else 0
end increment,
salary+
case 
when dept_id=1 then salary*0.10
when dept_id=2 then salary*0.05
else 0
end total_salary
from employee_salary;

/*
35
Display employee performance category based on salary.*/
select *,
case 
when salary >=65000 then "excellent"
when salary between 25000 and 55000 then "good"
else "average"
end performance
from employee_salary;


/*
36
Find employees earning above average salary.
*/
select *
from employee_salary
where salary>(select avg(salary)
				from employee_salary
                );
/*
37
Find employees older than average age.
*/
select *
from employee_demographics
where age>(select avg(age)
			from employee_demographics);

/*
38
Find department having highest average salary.
*/
select dept_id, avg(salary) as avg_sal
from employee_salary
group by dept_id
order by avg_sal desc
limit 1;


select *
from (
select dept_id, avg(salary) as avg_salary
from employee_salary
group by dept_id
order by avg_salary desc
limit 1
) max_sal;


/*
39
Find employees earning same as maximum salary.
*/

select *
from employee_salary
where salary=(
select max(salary)
from employee_salary
);

/*
40
Find employees from department with highest average salary.
*/
select *
from employee_salary
where dept_id=(select dept_id
				from employee_salary
				group by dept_id
                order by avg(salary) desc
                limit 1);

/*
41
Create a CTE showing average salary per department.
*/
with cte as(
select dept_id, avg(salary) as avg_sal
from employee_salary
group by dept_id
)
select *
from cte;

/*
42
Show departments whose average salary exceeds 60,000.
*/
with cte as(
select dept_id, avg(salary) as avg_sal
from employee_salary
group by dept_id
)
select dept_id, avg_sal, "exceed" as label
from cte
where avg_sal>60000;

/*
43
Find employees earning above department average.
*/
with cte as(
select dept_id, avg(salary) as avg_sal
from employee_salary
group by dept_id),
cte2 as(
select dept_id, employee_id,first_name, last_name, salary
from employee_salary)
select cte2.employee_id, cte2.first_name, cte2.last_name, cte.dept_id, cte2.salary, cte.avg_sal
from cte
join cte2
on cte.dept_id=cte2.dept_id
where salary> avg_sal;
/*
44
Count employees per department using a CTE.
*/
with cte as(
select dept_id, count(employee_id) as employees_per_dept
from employee_salary
group by dept_id)
select *
from cte;
/*
45
Find highest salary department using a CTE.
*/
with cte as(
select dept_id, max(salary) as highest_salary
from employee_salary
group by dept_id
order by highest_salary desc
limit 1)
select *
from cte;


/*
46
Show rolling salary total by gender.

Example:

SUM(salary) OVER(PARTITION BY gender)
*/

select dem.employee_id, dem.first_name, dem.last_name,dem.gender, sal.dept_id, sal.salary,
sum(salary) over(partition by gender order by dem.employee_id) as rolling_salary
from employee_demographics dem
join employee_salary as sal
on dem.employee_id=sal.employee_id;
/*
47
Rank employees by salary.
*/
select dem.employee_id,dem.first_name,dem.last_name, dem.gender, sal.salary,
rank() over (partition by dem.gender order by sal.salary desc) as rank_no
from employee_demographics as dem
join employee_salary as sal
on dem.employee_id=sal.employee_id;
/*
48
Dense rank employees by salary.
*/
select dem.employee_id,dem.first_name,dem.last_name, dem.gender, sal.salary,
rank() over (partition by dem.gender order by sal.salary desc) as rank_no,
dense_rank() over (partition by dem.gender order by sal.salary desc) as dense_ranks
from employee_demographics as dem
join employee_salary as sal
on dem.employee_id=sal.employee_id;
/*
49
Find highest salary employee in each department using ROW_NUMBER().
*/
select dem.employee_id,dem.first_name,dem.last_name, dem.gender, sal.dept_id,sal.salary,
row_number() over(partition by dept_id order by salary desc) as row_numbers
from employee_demographics as dem
join employee_salary as sal
on dem.employee_id=sal.employee_id;


with cte as(
select *,
row_number() over(partition by dept_id order by salary desc) as row_numbers
from employee_salary)
select *
from cte
where row_numbers=1;

/*
50
Show cumulative salary ordered by employee_id.
*/
select employee_id, first_name, salary,
sum(salary) over (order by employee_id) as cumulative_salary
from employee_salary
;

select * 
from employee_salary;


#1 Find the employee(s) who earn the second highest salary.
select *
from employee_salary;

with cte as(
select employee_id, first_name, salary,
row_number() over(order by salary desc) as row_no
from employee_salary)
select * 
from cte
where row_no=2;


#2 Find departments whose average salary is greater than the company's overall average salary.

with cte as(
select dept_id,
(select  avg(salary)
from employee_salary
) as com_avg_sal
from employee_salary
),
ctes as(
select dept_id, avg(salary) as dep_avg_sal
from employee_salary
group by dept_id )

select ctes.dept_id, dep_avg_sal
from cte
join ctes
on cte.dept_id=ctes.dept_id
where dep_avg_sal>com_avg_sal
group by ctes.dept_id
;

# 3 Show the highest-paid employee from each department.

with cte as(
select dept_id,employee_id, first_name, last_name,salary,
row_number() over(partition by dept_id order by salary desc) as row_no
from employee_salary)
select dept_id,employee_id, first_name, salary
from cte
where row_no=1
;

# 4 Find employees whose salary is greater than the average salary of their own department.
with cte as(
select employee_id,dept_id, first_name, salary
from employee_salary),
cte2 as(

select dept_id, avg(salary) as dep_avg_sal
from employee_salary
group by dept_id )
select cte.first_name, cte.employee_id, salary, dep_avg_sal
from cte
join cte2
on cte.dept_id=cte2.dept_id
having cte.salary>cte2.dep_avg_sal;

# 5 Rank all employees by salary from highest to lowest.
select concat(first_name," ", last_name) full_name, salary,
rank() over(order by salary desc) as rank_salary
from employee_salary
;

# 6 Show cumulative salary ordered by employee_id.
select employee_id, salary,
sum(salary) over(order by employee_id) as rolling_total
from employee_salary;

/* 7: Department Employee Count

But only departments with more than 2 employees.*/

select dept_id, count(employee_id) employee_count
from employee_salary
group by dept_id
having employee_count>2;

/* 8: Employees Sharing Same Salary

Find employees who have the same salary as at least one other employee.*/
select first_name, last_name, salary
from employee_salary
where salary in (select salary
					from employee_salary
                    group by salary
                    having count(*)>1
                    )
                    order by salary desc, employee_id;
                    
                    
# 9 Show each employee's salary difference from the average salary of their department.(i dont know this)

with cte as(
select dept_id, avg(salary) avg_sal
from employee_salary
group by dept_id),
cte2 as(
select dept_id, salary
from employee_salary)
select *
from cte
join cte2
on cte.dept_id=cte2.dept_id
having difference=avg_sal-salary;

/*
Question 10 (Most Important)

Management asks:

For each department, show:

Total Employees
Average Salary
Highest Salary
Lowest Salary*/

select dept_id, count(employee_id) total_employees, avg(salary) avg_sal, max(salary) highest_sal, min(salary) lowest_sal
from employee_salary
group by dept_id;







