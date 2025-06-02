-- joins--
select *
from employee_demographics
inner join employee_salary
   on employee_demographics.employee_id=employee_salary.employee_id
limit 10;
   
select *
from employee_demographics;
   
select *
from employee_demographics
left join employee_salary
   on employee_demographics.employee_id=employee_salary.employee_id;
   
   
select *
from employee_demographics as dem
right join employee_salary as sal
   on dem.employee_id=sal.employee_id;
   
select *
from employee_demographics as dem
right join employee_salary as sal
  on dem.employee_id=sal.employee_id
left join parks_departments as dep
  on sal.dept_id=dep.department_id;
  
select *
from employee_demographics as dem
right join employee_salary as sal
  on dem.employee_id=sal.employee_id
join parks_departments as dep
  on sal.dept_id=dep.department_id;
  
