create table dsjobs_fe1 as

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
        
        -- Medical/Laboratory roles
        when job_title Ilike any(ARRAY['%Medical Technologist%', '%Medical Laboratory%', '%MLS%', '%MT%', '%MLT%', '%Clinical Laboratory%']) 
             or skills Ilike any(ARRAY['%Medical Technology%', '%Laboratory Technologist%', '%ASCP%', '%Microbiology%', '%Hematology%'])
        then 'Medical/Laboratory'

        -- Database Administrators
        when job_title Ilike any(ARRAY['%Database Administrator%', '%DBA%', '%Oracle Database%', '%Database Admin%']) 
             or skills Ilike any(ARRAY['%Database Administration%', '%SQL Server%', '%Oracle%', '%Backup and Recovery%', '%Database Tuning%'])
        then 'Database Administrators'

        -- Data Engineers
        when job_title Ilike any(ARRAY['%Data Engineer%', '%Data Engineering%', '%ETL%', '%Big Data%']) 
             or skills Ilike any(ARRAY['%Data Engineering%', '%Hadoop%', '%Spark%', '%Kafka%', '%Data Pipeline%', '%Data Warehousing%'])
        then 'Data Engineers'

        -- Data Scientists/Analysts
        when job_title Ilike any(ARRAY['%Data Scientist%', '%Data Analyst%', '%Market Intelligence%', '%Business Analyst%']) 
             or skills Ilike any(ARRAY['%Data Science%', '%Data Analysis%', '%Machine Learning%', '%Python%', '%R%', '%Statistical Analysis%', '%Predictive Modeling%'])
        then 'Data Scientists/Analysts'

        -- Data Center Operations
        when job_title Ilike any(ARRAY['%Data Center%', '%Operations Technician%', '%Facility Operations%', '%Data Center Operations%']) 
             or skills Ilike any(ARRAY['%Data Center Operations%', '%Server Maintenance%', '%Physical Infrastructure%', '%Electrical Systems%', '%Mechanical Systems%'])
        then 'Data Center Operations'

        -- Specialized Roles (default)
        else 'Specialized Roles'
    
	end as job_category
from dsjobs;



--Add primary key in table
alter table dsjobs_fe1 
add constraint pk_dsjobs_fe1 primary key (job_id);


-- Sample output query
select * from dsjobs_fe1 limit 10;

