create table dsjobs_fe4 as

with soft_skills_list as (
  select ARRAY[
    'Communication skills', 'Interpersonal skills', 'Problem-solving', 
    'Teamwork', 'Attention to detail', 'Leadership', 
    'Time Management', 'Budget Management', 'Motivation', 
    'Strategy Implementation', 'Communication', 'Presentation', 'Collaboration', 'ProblemSolving'
  ] as skills_array
),


exploded_skills as (
  select 
    job_id,
    trim(skill) as skill,
    case 
      when lower(trim(skill)) = any(select lower(unnest(skills_array)) from soft_skills_list)
      then 'soft'
      else 'technical'
    end as skill_type
  from dsjobs, 
       unnest(string_to_array(skills, ',')) as skill
),


aggregated_skills as (
  select 
    job_id,
    string_agg(skill, ', ') filter (where skill_type = 'soft') as soft_skills,
    string_agg(skill, ', ') filter (where skill_type = 'technical') as technical_skills
  from exploded_skills
  group by job_id
)


select 
    d.job_id,
    d.job_title,
    d.company,
    d.job_location,
    d.date_posted,
    d.city,
    d.country,
    d.position,
    d.job_level,
    d.job_mode,
    d.skills,
    a.soft_skills,
    a.technical_skills

from dsjobs d
left join aggregated_skills a on d.job_id = a.job_id;


--Add primary key in table
alter table dsjobs_fe4
add constraint pk_dsjobs_fe4 primary key (job_id);



-- Sample output to verify
select job_id, skills, soft_skills, technical_skills
from dsjobs_fe4;

