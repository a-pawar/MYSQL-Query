show databases;
create database lab_project;
use lab_project;
alter table employee5 rename to employee;
show tables;
create table Employee(EMPNO varchar(20),EMP_NAME varchar(20),DEPT varchar(20),SALARY int,DOJ date,BRANCH varchar(20));
insert into employee values('E101','Amit','Production',45000,'2000-03-12','Bangalor');
insert into employee values('E102','Amit','HR',70000,'2002-07-03','Bangalor'),
('E103','Sunita','Manager',120000,'2001-01-11','mysore'),
('E105','Sunita','IT',67000,'2001-08-11','mysore'),
('E106','Mahesh','Civil',145000,'2003-09-20','Mumbai');

#1. Display all the fields of employee table
select * from employee;
#2. Retrieve employee number and their salary
select EMPNO,SALARY from employee;
#3. Retrieve average salary of all employee
select avg(salary) from employee;
#4. Retrieve  number of employee
select count(empno) from employee;
#5. Retrieve distinct number of employee
select count(distinct emp_name) from employee;
#6. Retrieve total salary of employee group by employee name and count similar names
select emp_name,count(emp_name),sum(SALARY) from employee  group by emp_name;
#7. Retrieve total salary of employee which is greater than > 120000 
select emp_name,sum(salary) from employee group by emp_name having sum(salary)>120000;
#8. Display name of employee in descending order
select emp_name from  employee order by emp_name desc;
#9. Dispaly details of employee whose name is AMIT and salary greater than 50000
select * from employee where emp_name='AMIT' and salary>50000;

#Retrieve date in other form
select date_format(DOJ,'%Y %b %d')as DOJ from employee;
select date_format(DOJ,'%Y %M %d')as date_of_join from employee;
