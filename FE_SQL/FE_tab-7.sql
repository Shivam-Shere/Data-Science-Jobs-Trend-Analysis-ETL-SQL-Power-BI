create table dsjobs_fe7 as

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
    soft_skills,
    technical_skills,
    total_skills,
    soft_count,
    
	case 
        when technical_skills is null or trim(technical_skills) = '' then 0
        else (
            select count(*) 
            from unnest(string_to_array(technical_skills, ',')) as skill
            where trim(skill) <> ''
        )
    end as tech_count

from dsjobs;



--Add primary key in table
alter table dsjobs_fe7
add constraint pk_dsjobs_fe7 primary key (job_id);



-- Sample output to verify the results
select  job_id, technical_skills, tech_count
from dsjobs;