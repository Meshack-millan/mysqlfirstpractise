
select gender,min_age
from(
select gender,AVG(age) as avg_age,max(age) as max_age,min(age) as min_age,count(age)
from employee_demographics
group by gender) as Agg_Table
group by gender;

select *
from employee_demographics
where employee_id in
(select employee_id from employee_salary
where dept_id=1)

