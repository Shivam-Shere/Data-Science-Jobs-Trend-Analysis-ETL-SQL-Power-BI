create table dsjobs_fe10 as

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
    experience_required,
    
	coalesce(
        trim(
            regexp_replace(
                regexp_replace(
                    trim(coalesce(job_location, '')) || ', ' || 
                    trim(coalesce(city, '')) || ', ' || 
                    trim(coalesce(country, '')),
                    '([^,]+)(, \1)+', '\1', 'g'
                ),
                '^[, ]+|[, ]+$', '', 'g'
            )
        ),
        ''
    ) as full_location

from dsjobs;


--Add primary key in table
alter table dsjobs_fe10
add constraint pk_dsjobs_fe10 primary key (job_id);


-- Sample output to verify the results
select  job_id, job_location,  city,  country, full_location
from dsjobs;