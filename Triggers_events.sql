-- Trigers and events

select *
from employee_demographics;

select *
from employee_salary;

Delimiter $$
create trigger employee_insert
  after insert on employee_salary
  for each row
Begin
  insert into employee_demographics(employee_id,first_name,last_name)
  values(new.employee_id,new.first_name,new.last_name);
End $$
Delimiter ;

insert into employee_salary(employee_id,first_name,last_name, occupation,salary,dept_id)
values(15,'Millan','Meshack','Engineer',70000,2);

select *
from employee_salary;

select *
from employee_demographics;

-- Events

Delimiter $$
create event delete_retirees
on schedule every 30 second
Do
Begin
  Delete
  from employee_demographics
  where age>=60;
END $$
Delimiter ;

select *
from employee_demographics;

show variables like 'event%';
