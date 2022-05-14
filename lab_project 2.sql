show databases;
use lab_project;
show tables;

create table empl(empno int,ename varchar(20),job varchar(20),mgr int,hiredate date,sal float ,
 comm float,deptno int);
desc empl; 

insert into empl values(8369,'Smith','Clerk',8902,'1990-12-18',800.00,null,20);
insert into empl values(8499,'Anya','Salesman',8698,'1991-02-20',1600,300.00,30),
(8521,'Seth','Salesman',8698,'1991-02-22',1250.00,500.00,30);
insert into empl values(8566,'Mahadevan','Manager',8839,'1991-04-02',2985,null,20),
(8654,'Momin','Salesman',8698,'1991-09-28',1250.00,1400.00,30),
(8698,'Bina','Manager',8839,'1991-05-01',2850,null,30),
(8882,'Shivansh','Manager',8839,'1991-06-09',2450,null,10),
(8888,'Scott','Analyst',8566,'1992-12-09',3000,null,20),
(8839,'Amir','President',null,'1991-11-18',5000,null,10),
(8844,'Kuldeep','Salesman',8698,'1991-09-08',1500,0,30);
select * from empl;

#a. Write a query to display EName and Sal of employees whose salary are greater than or equal to 22000?
select Ename,sal from empl where sal>=2200;
#b. Write a query to display details of employs who are not getting commission?
select *from empl  where comm is null;
#select * from empl where isnull(comm);
#c. Write a query to display employee name and salary of those employees who don't have their salary in range of 2500 to 4000 ?
select ename,sal from empl where sal not between 2500 and 4000;
#d. Write a query to display the name job title and salary of employees who don't have manager ?
select ename,job,sal from empl where mgr is null;
#select ename,job,sal from empl where isnull(mgr);
#e. Write a query to display the name of employee whose name contain "A" as third alphabet?
select ename from empl where ename like'__a%';  
#f. Write a query to display the name of employee whose name contain "T" as last alphabet?
select ename from empl where ename like'%t';  
#g. Write a query to display the name of employee whose name contain "M" as first and "L" as third alphabet?
select ename from empl where ename like'm_l%';  
#h. Write a query to display details of employs with the text "Not given",if commission is null?
select empno,ename,job,mgr,hiredate,sal,IFNULL(comm,'Not given') as comm ,deptno from empl;

#ctrl+alt+4 
select ename ,concat('₹',sal) as salary,sal from empl; 
