# stored procedures---->

select*
from employee_salary;


#using a stored procedure

create  procedure large_salaries()
select *
from employee_salary
where salary>=50000;

call large_salaries()
;


# create 2 queries here
create  procedure large_salaries2()
select *
from employee_salary
where salary>=50000;
select *
from employee_salary
where salary>=10000; #if we do like it create a stored procedure in one table like both conditions are in one table


call large_salaries2();

# to get the 2 tables in a same stored procedure we need delimiter

delimiter $$
create  procedure large_salaries3()
begin
	select *
	from employee_salary
	where salary>=50000;
	select *
	from employee_salary
	where salary>=10000;
end $$ 
delimiter ;

call large_salaries3;


call new_procedure;


# here the crazy thing--> here we can take a direct column-->look below-->
delimiter $$
create  procedure large_salaries4(employee_id_param int)
begin
	select salary
	from employee_salary
	where employee_id=employee_id_param
    ;

end $$ 
delimiter ;

call large_salaries4(2)

# same as above but crazy, 

delimiter $$
create procedure salary_employes(par_employee_id int)
begin
	select *
    from employee_salary
    where employee_id=par_employee_id;
end $$
delimiter ;

call salary_employes(2);

#taking employees only on dept_id
delimiter $$
create procedure dept_salary(salary_of_dept int)
begin 
	select *
    from employee_salary
    where dept_id=salary_of_dept;
    
end $$
delimiter ;

call dept_salary(5);
# now we can get a dept wise salary
-- --------------------------------------------------------------------------

