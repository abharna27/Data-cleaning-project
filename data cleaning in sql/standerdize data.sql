---- standardizing data ----

select distinct trim((company))
from layoff_stagging2;

select company , trim((company))
from layoff_stagging2;

update layoff_stagging2
set company = trim((company));

select distinct industry
from layoff_stagging2
order by 1;

select*
from layoff_stagging2
where industry like 'crypto%';

update layoff_stagging2
set industry = 'crypto'
where industry like 'crypto%';
select distinct industry
from layoff_stagging2;

select distinct country , trim(TRAILING '.' FROM country)
from layoff_stagging2
order by 1 ;

UPDATE layoff_stagging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

select date,
str_to_date ( date, '%m/%d/%Y')
from layoff_stagging2;
 # in the dataset there are mixed data set present in date column so firstly change / format then change dd-mm-yyyy format
 
UPDATE layoff_stagging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y')
WHERE `date` LIKE '%/%';
select date 
from layoff_stagging2;

SELECT `date`
FROM layoff_stagging2
WHERE `date` REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$'
ORDER BY `date`;

UPDATE layoff_stagging2
SET `date` = STR_TO_DATE(`date`, '%d-%m-%Y')
WHERE `date` REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$';

select date 
from layoff_stagging2
order by 1;


DESCRIBE layoff_stagging2;

alter table layoff_stagging2
modify column date DATE;


