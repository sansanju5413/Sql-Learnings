-- window functions---->
# without window function
select  gender, avg(salary) avg_sal
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id
group by gender
;


#with window function--> used when we add the first name , and last name the above query gives error, 
# but when i use this query as "partition by it gives perfectly withoout error"
select dem.first_name, dem.last_name, gender, avg(salary) over(partition by gender)
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id
;



select dem.first_name, dem.last_name, gender,salary, 
sum(salary) over(partition by gender order by dem.employee_id) as rolling_total # partition by will do the partition over what we mention
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id
;


select dem.first_name, dem.last_name, gender,salary, 
row_number() over(partition by gender order by salary desc) row_no , 
 #row_number() is do the work of adding the row numbers
rank() over(partition by gender order by salary desc) rank_no,
 #rank() used to provide a number same as row_number() ,but in this order column(same) is have the same value then it gives same number
 dense_rank() over(partition by gender order by salary desc) dense_rank_no

from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id=sal.employee_id
;


