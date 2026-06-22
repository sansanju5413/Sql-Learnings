create temporary table empo
(
emp_id varchar(100),
first_name varchar(50),
last_name varchar(50),
salary varchar(100));

select *
from empo;

INSERT INTO empo
VALUES
('1', 'sanju', 'HS', '50000'),
('2', 'theju', 'HS', '60000');


#creating a permenent table
create table school
(
roll_no varchar(50),
first_name varchar(50),
last_name varchar(50),
marks varchar(50));

insert into school
values
(1, "sanju", "raj", 99),
(2, "theju", "raj", 44);

select *
from school;

create table payment
(
roll_no varchar(50),
first_name varchar(50),
last_name varchar(50),
fees varchar(50));

insert into payment
values
(1, "sanju", "raj", "paid"),
(2, "theju", "raj", "not paid");
select *from payment;


#triggers
delimiter $$
create trigger student_insert
	after insert on payment
    for each row
begin
	insert into school(roll_no, first_name, last_name)
    values(new.roll_no, new.first_name, new.last_name);
end $$
delimiter ;

insert into payment
values ("3", "sure", "raj", null);

select *
from payment;

select *
from school;

#event
delimiter $$
create event remove_from_school
on schedule every 1 day
do
begin
	delete
    from payment
    where fees="not paid";
end $$
delimiter ;

select *
from payment;  


