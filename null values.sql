SELECT *
FROM layoff_stagging2 t1  #self join 
JOIN layoff_stagging2 t2;


SELECT * 
FROM world_layoffs.layoff_stagging2
where total_laid_off is null
and percentage_laid_off is null;

update layoff_stagging2
set industry = null 
where industry ='';

select *
from layoff_stagging2
where industry is null 
or industry ='';

select *
from layoff_stagging2
where company ='airbnb';

select *
from layoff_stagging2 t1
join layoff_stagging2 t2
     on t1.company = t2.company
     and t1.location = t2.location
where (t1.industry is null or t1.industry ='')
and t2.industry is not null;

update layoff_stagging2 t1
join layoff_stagging2 t2
     on t1.company = t2.company
     and t1.location = t2.location
set t1.industry =t2.industry
where t1.industry is null 
and t2.industry is not null;


select *
from layoff_stagging2
where company  like 'bally%';


alter table layoff_stagging2
drop column row_num;




