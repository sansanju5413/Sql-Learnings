select first_name, last_name, occupation, salary,
case
	when salary<50000 then salary*0.05
    when salary>=50000 then salary*0.07
    else 0
end incremented_salary,
case
	when dept_id=6 then salary*0.10
    else 0
end bonus,

salary
+
case
when salary<50000 then salary*0.05
when salary>=50000 then salary*0.07
else 0
end 
+
case
	when dept_id=6 then salary*0.10
    else 0
end as total_total_salary


from employee_salary
;


SELECT 
    first_name,
    last_name,
    occupation,
    salary,

    CASE
        WHEN salary < 50000 THEN salary * 0.05
        WHEN salary >= 50000 THEN salary * 0.07
        ELSE 0
    END AS incremented_salary,

    CASE
        WHEN dept_id = 6 THEN salary * 0.10
        ELSE 0
    END AS bonus,

    salary
    +
    CASE
        WHEN salary < 50000 THEN salary * 0.05
        WHEN salary >= 50000 THEN salary * 0.07
        ELSE 0
    END
    +
    CASE
        WHEN dept_id = 6 THEN salary * 0.10
        ELSE 0
    END AS total_salary

FROM employee_salary;