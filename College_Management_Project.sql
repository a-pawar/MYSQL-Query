#Project For Student information Management  in College

create database College;
use College;
create table student(S_id varchar(20) primary key,First_name varchar(20),Last_name varchar(20),Middle_name varchar(20),Father_name varchar(40),DOB date,
Local_add varchar(40),Permanent_add varchar(40),Mob bigint,Aadhar_no bigint,Enrollment_no varchar(20),Admission_date date,Course varchar(20),
Branch varchar(20),Sem int);
desc student;

alter table student modify Enrollment_no varchar(20);

insert into student value("S101","Anshul","Pawar",null,"Keshorao Pawar","2002-10-09","Dunawa Dist. Betul,MP","Indrapuri Colony Indore,MP",7649089771,769927434371,"DE2002072","2020-08-12","Mtech(5yrs)","IT",4);
insert into student value("S102","Purushottam","Kaushik",null,"Darshan Kaushik","2002-07-09","Dunawa Dist. Betul,MP","Indrapuri Colony Indore,MP",6265064289,654387923015,"DE2002266","2020-07-18","Mtech(5yrs)","IoT",4);
insert into student value("S103","Akhil","Suryawanshi",null,"Shivshankar Suryawanshi ","2002-09-10","Multai Dist. Betul,MP","Indrapuri Colony Indore,MP",6784379213,832509416273,"DE2002040","2020-08-16","Mtech(5yrs)","IT",4);
select * from student;






