-- Stored procedure

create procedure Young_people1()
select age
from employee_demographics
where age<30;

call Young_people1();

create procedure large_salaries1()
select *
from employee_salary
where salary>50000;
select *
from employee_salary
where salary>10000;

call large_salaries1();

DELIMITER $$

create procedure large_salaries2()
Begin
	select *
	from employee_salary
	where salary>=50000;
	select *
	from employee_salary
	where salary>=10000;
End $$
DELIMITER ;

CALL large_salaries2();

Delimiter $$
create procedure young_salaries1(employee_id int)
Begin
select salary
from employee_salary
where employee_id=employee_id
;
End $$
Delimiter ;

call Young_salaries1(1);
