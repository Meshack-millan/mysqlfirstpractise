-- CTEs

select gender,max(salary) max_salary,min(salary) min_salary,count(gender) count, avg(salary) avg_salary
from employee_demographics dem
left join
employee_salary sal
on dem.employee_id=sal.employee_id
group by gender;

with CTE_Examples
as
(select gender,max(salary) max_salary,min(salary) min_salary,count(gender) count, avg(salary) avg_salary
from employee_demographics dem
left join
employee_salary sal
on dem.employee_id=sal.employee_id
group by gender
)
select *
from CTE_Examples;

WITH CTE_Example2 as
(
select gender,max(salary) max_salary,min(salary) min_salary,count(gender) count, avg(salary) avg_salary
from employee_demographics dem
left join
employee_salary sal
on dem.employee_id=sal.employee_id
group by gender
)
select AVG(avg_salary)
from CTE_Example2;

with CTE_Example1 as
(
select employee_id,gender,birth_date
from employee_demographics dem
where birth_date>'1986-01-01'
),
cte_example2
as ( select employee_id,last_name
from employee_salary
where salary>50000
)
select * from 
CTE_Example1 join cte_example2
on CTE_Example1.employee_id=cte_example2.employee_id;


with cte_example (gender,Max_salary,Min_salary,Count,Avg_salary)
 as 
(
select gender,max(salary) max_salary,min(salary) min_salary,count(gender) count, avg(salary) avg_salary
from employee_demographics dem
left join
employee_salary sal
on dem.employee_id=sal.employee_id
group by gender
)
select *
from cte_example;



