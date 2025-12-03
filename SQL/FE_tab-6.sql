create table dsjobs_fe6 as

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
    
	case 
        when soft_skills is null or trim(soft_skills) = '' then 0
        else (
            select count(*) 
            from unnest(string_to_array(soft_skills, ',')) as skill
            where trim(skill) <> ''
        )
    end as soft_count

from dsjobs;


--Add primary key in table
alter table dsjobs_fe6
add constraint pk_dsjobs_fe6 primary key (job_id);



-- Sample output to verify the results
select  job_id, soft_skills, soft_count
from dsjobs;
