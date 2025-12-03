create table dsjobs_fe2 as

select 
    job_id,
    job_title,
    company,
    job_location,
    date_posted,
    city,
    country,
    position,
    job_level,
    job_mode,
    skills,
    case 
        -- Handle variations of "Mid senior"
        when trim(job_level) ilike 'mid senior%' then 1
        when trim(job_level) ilike 'mid-senior%' then 1
        when trim(job_level) ilike 'mid_senior%' then 1
        when trim(job_level) ilike 'senior%' then 1

        -- Handle variations of "Associates"
        when trim(job_level) ilike 'associate%' then 2
        when trim(job_level) ilike 'associates%' then 2
        when trim(job_level) ilike 'assoc%' then 2

        -- Default case
        else null
    
	end as job_level_code

from dsjobs;



--Add primary key in table
alter table dsjobs_fe2
add constraint pk_dsjobs_fe2 primary key (job_id);



--- Sample output query
select job_level,job_level_code,
count(*) as frequency
from dsjobs

group by job_level, job_level_code
order by job_level_code nulls last;
