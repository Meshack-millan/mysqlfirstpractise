select gender, COUNT(age)
FROM employee_demographics
group by gender;

select *
FROM employee_demographics;

select *
FROM employee_salary;

select occupation, max(salary),min(salary)
from employee_salary
group by occupation;

select occupation,salary
from employee_salary
order by salary desc;

select gender,age
from employee_demographics
order by age desc;

select gender,avg(age)
from employee_demographics
group by gender
having avg(age)>40;

select occupation, avg(salary),count(occupation),max(salary)
from employee_salary
where occupation like ("%manager%")
group by occupation
having avg(salary)>60000;

select * from employee_demographics;

select gender,avg(age)
from employee_demographics
group by gender
having avg(age)>40;


