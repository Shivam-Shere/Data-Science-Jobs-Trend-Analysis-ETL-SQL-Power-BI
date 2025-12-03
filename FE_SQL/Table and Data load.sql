---create table 
create table dsjobs(

    job_id  int primary key,
	job_title varchar(255) not null,
	company varchar(255) not null,
	job_location varchar(255),
	date_posted date not null,
	city varchar(100),
	country varchar(100),
	position varchar(100),
	job_level varchar(50),
	job_mode varchar(100),
	skills text

);


select * from dsjobs



---Loading CSV file Data in table

copy dsjobs(job_id, job_title, company, job_location, date_posted, city, country, position, job_level, job_mode, skills)

from 'D:\Shivam\DS_jobs_analysis\DS_Jobs-2024\Cleaned_DS_Jobs_data.csv'

delimiter','

csv header;


select * from dsjobs