select gender,avg(age)
from employee_demographics
group by gender
having avg(age)>40;

select gender,avg(age) as avg_age
from employee_demographics
group by gender
having avg_age>38;

select *
from employee_salary
limit 9,3;

select occupation, avg(salary)
from employee_salary
group by occupation
order by avg(salary) desc
limit 5;
