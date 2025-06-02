-- String functions
select *
from employee_demographics;

select first_name,upper(first_name)
from employee_demographics;

select first_name,lower(first_name)
from employee_demographics;

select first_name, substr(first_name,2,3)
from employee_demographics;

select first_name, substr(first_name,2,3)
from employee_demographics;

select first_name,
left(first_name,4)
from employee_demographics;

select first_name,last_name,
right(last_name,3) as last_3_digits
from employee_salary;

select first_name,
left(first_name,3),
right(first_name,4),
substring(first_name,3,2),
birth_date
from employee_demographics;

select birth_date, substring(birth_date,6,2) as Birth_month
from employee_demographics;

select first_name,left(first_name,4) as first_3_letters
from employee_salary;

select first_name, replace(first_name,"a","z")
from employee_salary;

select locate("x","Alexander");

select locate("An",first_name)
from employee_salary;

select first_name,last_name,
concat (first_name,"  ", last_name) as full_name
from employee_salary;

