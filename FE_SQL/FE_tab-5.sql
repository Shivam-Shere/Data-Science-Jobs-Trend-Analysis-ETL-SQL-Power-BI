create table dsjobs_fe5 as

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
        when skills is null or trim(skills) = '' then 0
        else (
            select count(*) 
            from unnest(string_to_array(skills, ',')) as skill
            where trim(skill) <> ''
        )
    end as total_skills

from dsjobs;


--Add primary key in table
alter table dsjobs_fe5
add constraint pk_dsjobs_fe5 primary key (job_id);



-- Sample output to verify the results
select job_id, skills, total_skills
from dsjobs_fe5;