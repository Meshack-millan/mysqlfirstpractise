-- Exploratory data
select *
from layoffs_staging2;

-- checking industries with the least and most laid offs

select industry, min(total_laid_off) , MAX(total_laid_off)
from layoffs_staging2
group by industry order by 1;

-- total laid off by country
select country, sum(total_laid_off)
from layoffs_staging2
group by country order by 2 desc;

-- year with the most laid off
select year(`date`), sum(total_laid_off)
from layoffs_staging
group by `date`;

-- select the max total laid off and percentage

select max(total_laid_off),max(percentage_laid_off)
from layoffs_staging2;

select *
from layoffs_staging2
where percentage_laid_off=1;


-- records with highest laid off
select *
from layoffs_staging2
where total_laid_off=12000;

select *
from layoffs_staging2
where percentage_laid_off=1
order by total_laid_off desc;

-- countries with highest fundings
select country,sum(funds_raised_millions) as total_funds_raised_in_millions
from layoffs_staging2
group by country
order by total_funds_raised_in_millions desc;

select company, sum(total_laid_off) 
from layoffs_staging2
group by company order by 2 desc;

-- finding year with highest laying  off
select year(`date`) as year, sum(total_laid_off) as total_laid_off
from layoffs_staging2
group by year(`date`) 
order by 2 desc;

-- finding layoffs in according to stages
select stage, sum(total_laid_off) as total_laid_off
from layoffs_staging2
group by stage
order by 2 desc;

select *
from layoffs_staging2;

-- layoffs according to the months
select substring(`date`,6,2) as `month`,sum(total_laid_off) as sum_of_total_layoffs
from layoffs_staging2
where month is not null
group by `month`
order by 2 desc;


with rolling_total as
(
select substring(`date`,1,7) as `month`,sum(total_laid_off) as sum_of_total_layoffs
from layoffs_staging2
where substring(`date`,1,7)  is not null
group by `month`
order by 2 asc
)
select `month`,sum_of_total_layoffs, sum(sum_of_total_layoffs)
over(order by `month`) as rolling_tota
from rolling_total;

select company, year(`date`),sum(total_laid_off) 
from layoffs_staging2
group by company ,year(`date`)
order by 3 desc;

with company_year(company,years,total_laid_off) as
(
select company, year(`date`),sum(total_laid_off) 
from layoffs_staging2
group by company ,year(`date`)
),company_year_ranking as
(
select *,dense_rank() over(partition by years order by total_laid_off desc) as Ranking
from company_year
where years is not null
)
select *
from company_year_ranking
where ranking<=10;