SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT first_name,last_name 
FROM employee_salary;

SELECT distinct gender
FROM employee_demographics;

SELECT distinct first_name,gender
FROM employee_demographics;

SELECT
first_name,
last_name,
age,
age+10
FROM employee_demographics;

SELECT * 
FROM employee_salary WHERE salary>50000;

SELECT first_name,last_name
FROM employee_salary WHERE occupation="Nurse"; 

SELECT first_name,last_name
FROM employee_demographics WHERE gender="female"; 

SELECT *
FROM employee_demographics WHERE gender!="female";

-- AND OR NOT -- Logical operators
SELECT *
FROM employee_demographics WHERE
gender!="female" AND 	age>20; 

SELECT *
FROM employee_demographics WHERE
(gender!="male" AND 	age>20) OR (gender!="male" AND birth_date>1979-01-01);

-- LIKE Statement
-- % and_ --
SELECT *
FROM employee_demographics WHERE 
first_name LIKE "A%"; 

SELECT *
FROM employee_demographics WHERE
first_name LIKE  "___";

SELECT *
FROM employee_demographics WHERE
birth_date LIKE "1988%";

select gender
from employee_demographics
group by gender;


 
