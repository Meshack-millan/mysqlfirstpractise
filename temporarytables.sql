-- Temporary tables

create temporary table movie_persons
(first_name varchar(100),
last_name varchar(200),
movie_ratings int(10),
location varchar(200)
);

select *
from movie_persons;

insert into movie_persons(first_name,last_name,movie_ratings,location)
values 
('Millan','Meshack',9,'Nairobi'),
('Nickmann','Cheberom',6.5,'Naivasha'),
('Cynthia','Cherop',7,'Eldoret');


select distinct *
from movie_persons;

create temporary table salary_over_30k
select *
from employee_salary
where salary>30000;

select * from
salary_over_30k;

create temporary table salary_over_40k
select *
from employee_salary
where salary>40000;

select *
from salary_over_40k;