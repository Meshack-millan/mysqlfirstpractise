-- Data Cleaning

select *
from layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Null values or blank values
-- 4. Remove any column

create table layoffs_staging
like layoffs;

select *
from layoffs_staging;

insert layoffs_staging
select * from layoffs;

-- removing duplicates with no unique identifiers

select *
from layoffs_staging;

select *,
ROW_NUMBER() OVER( partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions)
as row_num
from layoffs_staging;

select *
from layoffs_staging
where row_num>1;

WITH duplicate_cte AS
(
select *,
ROW_NUMBER() OVER( partition by company,location,
industry,total_laid_off,percentage_laid_off,`date`,stage
,country,funds_raised_millions)
AS row_num
from layoffs_staging)
select * from duplicate_cte
where row_num>1;


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_staging2;

insert into layoffs_staging2
select *,
ROW_NUMBER() OVER( partition by company,location,
industry,total_laid_off,percentage_laid_off,`date`,stage
,country,funds_raised_millions)
AS row_num
from layoffs_staging;

Delete
from layoffs_staging2
where row_num>1;

select *
from layoffs_staging2;


-- standardizing data

select company,trim(company)
from layoffs_staging2;

update layoffs_staging2
set company=trim(company);

select distinct industry
from layoffs_staging2
order by 1;

select *
from layoffs_staging2
where industry like 'Crypto%';

update layoffs_staging2
set industry='Crypto'
where industry like 'Crypto%';

select distinct industry
from layoffs_staging2
order by 1;

select distinct location
from layoffs_staging2
order by 1;

select distinct country
from layoffs_staging2
order by 1;

select *
from layoffs_staging2
where country like 'United State%';

select country, trim(trailing '.' from country)
from layoffs_staging2
order by 1;

update layoffs_staging2
set country=trim(trailing '.' from country)
where country like 'united states%';

select `date`,
str_to_date(`date`,'%m/%d/%Y')
FROM layoffs_staging2;

update layoffs_staging2
set `date`=str_to_date(`date`,'%m/%d/%Y');

Alter table layoffs_staging2
modify column `date` date;

-- Null values

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoffs_staging2
where industry is null
or industry='';

select *
from layoffs_staging2
where company like "Bally's%";

select *
from layoffs_staging2
where company='Airbnb';

select t1.industry,t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
   on t1.company=t2.company
   and t1.location=t2.location
   where (t1.industry is null or t1.industry='')
   and t2.industry is not null;


update layoffs_staging2
set industry=null
where industry='';

update layoffs_staging2 t1
join layoffs_staging2 t2
   on t1.company=t2.company
set t1.industry=t2.industry
where (t1.industry is null or t1.industry='')
and t2.industry is not null;


select *
from layoffs_staging2;

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

delete
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

Alter table layoffs_staging2
drop column row_num;


select *
from layoffs_staging2;





