create table dsjobs_fe8 as
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
    tech_count,
    
	case
        -- Specialized Certifications (highest priority)
        when job_title Ilike any(ARRAY['%ASCP%', '%certification%', '%license%', '%certified%', '%registration%', '%credential%', '%board certified%']) 
             or position Ilike any(ARRAY['%ASCP%', '%certification%', '%license%', '%certified%', '%registration%', '%credential%', '%board certified%']) 
             or skills Ilike any(ARRAY['%ASCP%', '%certification%', '%license%', '%certified%', '%registration%', '%credential%', '%board certified%'])
        then 'Specialized Certifications'

        -- Master's Degree for senior roles
        when (job_title Ilike any(ARRAY['%Master%', '%M.S.%', '%MS%', '%MBA%', '%PhD%', '%Doctorate%', '%Doctoral%']) 
             or position Ilike any(ARRAY['%Master%', '%M.S.%', '%MS%', '%MBA%', '%PhD%', '%Doctorate%', '%Doctoral%']) 
             or skills Ilike any(ARRAY['%Master%', '%M.S.%', '%MS%', '%MBA%', '%PhD%', '%Doctorate%', '%Doctoral%']))
             and (job_level Ilike '%senior%' or job_level Ilike '%lead%' or job_level Ilike '%principal%' or job_level Ilike '%chief%')
        then 'Master''s Degree'

        -- Default to Bachelor's Degree
        else 'Bachelor''s Degree'
    
	end as edu_requirement

from dsjobs;


--Add primary key in table
alter table dsjobs_fe8
add constraint pk_dsjobs_fe8 primary key (job_id);



-- Sample output to verify results
select  job_id, job_title, position,  job_level,  skills, edu_requirement
from dsjobs;