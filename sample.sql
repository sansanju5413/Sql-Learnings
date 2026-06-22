create temporary table sanju
(first_name varchar(50),
last_name varchar(50),
age varchar(100),
marks varchar(100),
result varchar(50)
);

insert into sanju
values('sanju', 'H S', 21, 99, "pass",100);

select *
from sanju;


alter table sanju
add total_marks varchar(50);

update sanju
set ('sanju', 'H S', 21, 99, "pass",100);