----Views & Materialized Views:


--1. Total number of job postings

create or replace view vw_total_jobs as
select count(*) as total_jobs
from dsjobs;

select * from vw_total_jobs
postgres



--2. Jobs posted per city

create or replace view vw_jobs_by_city as

select city, count(job_id) as jobs_count
from dsjobs
group by city
order by jobs_count desc;

select * from vw_jobs_by_city


--3. Total number of cities hiring

create or replace view vw_total_cities as
select count(distinct city) as total_cities
from dsjobs;

select * from vw_total_cities;



---4. Total number of companies hiring

create or replace view vw_total_companies as
select count(distinct company) as total_companies
from dsjobs;

select * from vw_total_companies;


--5. Job posted per Country?
create or replace view vw_jobs_by_country as

select country, count(job_id) as jobs_count
from dsjobs
group by country
order by jobs_count desc;

select * from vw_jobs_by_country



--6. Total number of countries hiring

create or replace view vw_total_countries as
select count(distinct country) as total_countries
from dsjobs;

select * from vw_total_countries;



--7. Jobs per Job Category?

create or replace view vw_jobs_by_category as

select job_category, count(job_id) as jobs_count
from dsjobs_fe1
group by job_category
order by jobs_count desc;

select * from vw_jobs_by_category



--8. Jobs per Job Level?

create or replace view vw_jobs_by_level as

select job_level, count(job_id) as jobs_count
from dsjobs_fe2
group by job_level
order by jobs_count desc;

select * from vw_jobs_by_level



--9. Jobs per Job Mode? (Remote/Onsite/Hybrid)

create or replace view vw_jobs_by_mode as

select job_mode, count(job_id) as jobs_count
from dsjobs_fe3
group by job_mode
order by jobs_count desc;

select * from vw_jobs_by_mode



--10. Average Total Skills per Job Category?

create or replace view vw_avg_skills_by_category as

select f1.job_category, 
       round(avg(f5.total_skills)) as avg_skills
from dsjobs_fe1 f1
join dsjobs_fe5 f5 using (job_id)
group by f1.job_category
order by avg_skills desc;



select * from vw_avg_skills_by_category



--MATERIALIZED VIEW

--11. Top-10 Technical Skills?

-- Create Materialized View for Top-10 Technical Skills
create materialized view mv_top_10_tech_skills as

with skill_counts as (
    select unnest(string_to_array(lower(trim(technical_skills)), ','))::text as skill
    from dsjobs_fe4
    where technical_skills is not null 
      and trim(technical_skills) <> ''
)

select trim(skill) as tech_skill, count(*)::bigint as cnt
from skill_counts
group by trim(skill)
order by cnt desc
limit 10;



select * from mv_top_10_tech_skills;


-- Refresh when new data is inserted/updated in dsjobs
refresh materialized view  mv_top_10_tech_skills;







--12. Top-10 Soft Skills?

create materialized view mv_top_10_soft_skills as

with skill_counts as (
    select skill, count(*)::bigint as cnt
    from (
        select regexp_split_to_table(lower(trim(soft_skills)), '\s*,\s*') as skill
        from dsjobs_fe4
        where soft_skills is not null
          and trim(soft_skills) <> ''
    ) s
    group by skill

)

select skill, cnt
from skill_counts
order by cnt desc
limit 10;


select * from mv_top_10_soft_skills;



-- Refresh when new data is inserted/updated in dsjobs
refresh materialized view  mv_top_10_soft_skills;




--13. Jobs requiring experience v/s not?

create or replace view vw_experience_breakdown as

select experience_required, count(job_id) as jobs_count
from dsjobs_fe9
group by experience_required;


select * from vw_experience_breakdown;




--14. Jobs by Education requirement?

create or replace view vw_edu_requirement as

select edu_requirement, count(job_id) as jobs_count
from dsjobs_fe8
group by edu_requirement
order by jobs_count desc;


select * from vw_edu_requirement;




--15. Jobs Posted over time (Day wise Trend)?

create or replace view vw_jobs_trend_daily as

select date_trunc('day', date_posted) as day, count(job_id) as jobs_count
from dsjobs
group by day
order by day;


select * from vw_jobs_trend_daily;




--16. Average Technical and Soft Skills per Job Category?

create or replace view vw_avg_tech_soft_by_category as

select f1.job_category, 
       round(avg(f7.tech_count)) as avg_tech_skills,
       round(avg(f7.soft_count)) as avg_soft_skills

from dsjobs_fe1 f1
join dsjobs_fe7 f7 using (job_id)

group by f1.job_category
order by avg_tech_skills desc;


select * from vw_avg_tech_soft_by_category; 





--17.  Top-10 Cities with Highest Average Skills required?

create materialized view mv_top_10_cities_avg_skills as

select city, round(avg(total_skills)) as avg_total_skills
from dsjobs_fe5

where city is not null and trim(city) <> ''
group by city
order by avg_total_skills desc
limit 10;



select * from mv_top_10_cities_avg_skills;


-- Refresh when new data is inserted/updated in dsjobs
refresh materialized view mv_top_10_cities_avg_skills;


--18. Top-10 Companies hiring the most jobs?

create materialized view mv_top_10_companies as

select company, count(job_id) as jobs_count
from dsjobs
where company is not null and trim(company) <> ''
group by company
order by jobs_count desc
limit 10;


select * from mv_top_10_companies;


-- Refresh when new data is inserted/updated in dsjobs
refresh materialized view mv_top_10_companies;

