create table dsjobs_fe3 as

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
        when job_mode = 'Onsite' then 1   -- Most frequent
        when job_mode = 'Remote' then 2   -- Second most frequent
        when job_mode = 'Hybrid' then 3   -- Least frequent
        else null
    end as job_mode_code

from dsjobs;


--Add primary key in table
alter table dsjobs_fe3
add constraint pk_dsjobs_fe3 primary key (job_id);



-- Sample output query
select job_mode,job_mode_code,
count (*) as frequency
from dsjobs

group by job_mode, job_mode_code
order by job_mode_code nulls last;


