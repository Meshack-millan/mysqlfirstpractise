-- Case Statements
-- pay increae and Bonus;
-- <50000 =5%
-- >50000 -7%
-- Finance =10% bonus
select *
from employee_demographics;

select *,
CASE
    when age <=30 Then 'Young'
    when age BETWEEN 31 and 40 THEN 'Mid'
    When age >=40 Then 'Old' 
END as Age_brackets
from employee_demographics;

select first_name,last_name,salary,
CASE 
   when salary<50000 Then salary*1.05
   when salary>=50000 Then salary*1.07
END as New_salary,
CASE
    WHEN dept_id=6 THEN salary*0.1
END as Bonus
from employee_salary;


select *
from employee_demographics
where employee_id in
(
select employee_id
from employee_salary
where dept_id=1)


