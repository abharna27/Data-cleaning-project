--- data cleaning--
create table layoff_stagging
like layoffs;

SELECT * 
FROM layoff_stagging;

insert layoff_stagging
select *
from layoffs;

select * ,
Row_number() over( 
partition by company , industry , total_laid_off , percentage_laid_off , 'date') as row_num
from layoff_stagging ;

with duplicate_cte as
( 
select * ,
Row_number() over( 
partition by company , industry , total_laid_off , percentage_laid_off , 'date') as row_num
from layoff_stagging )
select *
from duplicate_cte
where row_num> 1 ;

SELECT * 
FROM layoff_stagging
where company ='oda'; #this is not duplicates row because two columns are diff

with duplicate_cte as
( 
select * ,
Row_number() over( 
partition by company , location, industry , total_laid_off , percentage_laid_off , 'date',stage , country, funds_raised_millions) as row_num
from layoff_stagging )
select *
from duplicate_cte
where row_num> 1 ;

SELECT * 
FROM layoff_stagging
where company ='casper'; #these have two rows common 

CREATE TABLE `layoff_stagging2` (
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

SELECT * 
FROM layoff_stagging2
where row_num>1;

insert into layoff_stagging2
select * ,
Row_number() over( 
partition by company , location, industry , total_laid_off , percentage_laid_off , 'date',stage , country, funds_raised_millions) as row_num
from layoff_stagging ;

delete 
FROM layoff_stagging2
where row_num>1;
SELECT * 
FROM layoff_stagging2
where row_num>1;






