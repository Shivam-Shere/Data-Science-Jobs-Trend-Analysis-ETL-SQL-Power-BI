create table dsjobs_fe9 as
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
    edu_requirement,
    
	case
        -- Entry-level: Associate job_level with limited skills
        when job_level = 'Associate' and (tech_count + soft_count) <= 10 then 'Entry-level: 0-2 years'
        
        -- Mid-level: Associate with moderate skills OR Mid Senior with moderate skills
        when (job_level = 'Associate' and (tech_count + soft_count) > 10 and (tech_count + soft_count) <= 20)
             or (job_level = 'Mid Senior' and (tech_count + soft_count) <= 20) 
        then 'Mid-level: 3-5 years'

        -- Senior-level: Mid Senior with high skills OR Associate with very high skills
        when (job_level = 'Mid Senior' and (tech_count + soft_count) > 20)
             or (job_level = 'Associate' and (tech_count + soft_count) > 20)
        then 'Senior-level: 5+ years'
        
        -- Default for any other cases
        else 'Mid-level: 3-5 years'
   
   end as experience_required

from dsjobs;


--Add primary key in table
alter table dsjobs_fe9
add constraint pk_dsjobs_fe9 primary key (job_id);



-- Sample output to verify the results
select  job_id, job_title, job_level,  tech_count,  soft_count,  experience_required
from dsjobs;