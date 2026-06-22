-- stored procedures--->
select *
from employee_salary;


create procedure salarized()
select *
from employee_salary
where salary>=50000;


call salarized();


#usage of delimiter
DELIMITER $$
create procedure salarized_3()
begin
	select *
	from employee_salary
	where salary>=50000;
	select*
	from employee_salary
	where salary>=10000;
end $$
DELIMITER ;

call salarized_3()