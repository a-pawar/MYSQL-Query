create database company;
use company; 
create table location(location_id int primary key,regional_group varchar(10));
insert into location values(122,'New York'),(123,'Dallas'),(124,'Chicago'),(167,'Boston');

create table department(department_id int primary key,Name varchar(10),location_id int ,
constraint fk_id foreign key(location_id)references location(location_id));
insert into department values(10,'Accounting',122),(20,'Research',124),(30,'Sales',123),(40,'Operations',167);

create table job(job_id int ,Function1 varchar(10));
alter table job modify column job_id int primary key;
insert into job values(667,'clerk'),(668,'staff'),(669,'Analyst'),(670,'saleperson'),(671,'manager'),
(672,'president');

create table employee(employee_id int primary key,last_name varchar(30),first_name varchar(30),middle_name varchar(30),job_id int ,
constraint fk_id1 foreign key (job_id) references job (job_id),manager_id int,hiredate date,salary int,comm int,department_id int,
constraint fk_id2 foreign key(department_id) references department(department_id));
insert into employee values(7369,'smith','john','q',667,7902,'1984-12-17',800,null,20);
insert into employee values(7499,'allen','kevin','j',670,7698,'1985-02-20',1600,300,30),
(7505,'doyle','jean','k',671,7839,'1985-04-04',2850,null,30),
(7506,'dennis','lynn','s',671,7839,'1985-05-15',2750,null,30);
insert into employee values(7507,'baker','leslie','d',671,7839,'1985-06-10',2200,null,40),
(7521,'wark','cynthia','d',670,7698,'1985-02-22',1250,500,30);
desc employee;
use company;
#Simple Queries:
#1.	List all the employee details
select * from employee;
#2.	List all the department details
select * from department;
#3.	List all job details
select * from job;

#select distinct function1 from job 
#4.	List all the location
select * from location;
#5.	List out first name ,last name, salary, commission for all employees
select first_name,last_name,salary,comm from employee;
#6.	List out employee_id, last name, department id for all  employees and rename employee id as “ID of
# the employee”, last name as “Name of the employee”, department id as  “department  ID”
select employee_id,last_name,department_id from employee;
alter table employee rename column employee_id to ID_of_the_employee ,
rename column department_id to department_ID;
alter table employee change last_name Name_of_the_employee varchar(30);
#alter table employee rename column ID_of_the_employee to employee_id,rename column department_ID to department_id,
#rename column Name_of_the_employee to last_name;
#7.	List out the employee’s annual salary with their names only.
select first_name,last_name,salary from employee;

#where condition(8-17)
#8.	List the details about “SMITH”
select * from employee where last_name='SMITH';
#9.	List out the employees who are working in department 20
select * from employee where department_id=20;
#10.List out the employees who are earning salary between 3000 and 4500
select * from employee where salary between 3000 and 4500;
#11.List out the employees who are working in department 10 or 20
select * from employee where department_id in (10,20);
#12.Find out the employees who are not working in department 10 or 30
select * from employee where department_id not in (10,30);
#13.List out the employees whose name starts with “S”
#select * from employee where first_name like 's%';
select * from employee where last_name like 's%';
#14.List out the employees whose name start with “S” and end with “H”
select * from employee where last_name like 's%h';
#15.List out the employees whose name length is 4 and start with “S”
select * from employee where last_name like 's___';
#16.List out the employees who are working in department 10 and draw the salaries more than 3500
select * from employee where department_id =10 and salary >3500;
#17.List out the employees who are not receiving commission.
select * from employee where comm is null;

#order by(18-21)
#18.List out the employee id, last name in ascending order based on the employee id.
select employee_id,last_name from employee order by  employee_id;
#19.List out the employee id, name in descending order based on salary column
select employee_id,first_name,last_name,salary from employee order by salary desc;
#20.List out the employee details according to their last_name in ascending order and salaries in descending order
select * from employee order by last_name asc, salary desc;
#21.List out the employee details according to their last_name in ascending order and then on department_id in descending order.
select * from employee order by last_name asc,department_id desc;

#group by(22-33)
#22.How many employees who are working in different departments wise in the organization
select department_ID,count(department_id) from employee group by department_id;
#23.List out the department wise maximum salary, minimum salary, average salary of the employees
select department_ID,max(salary) as max_sal,min(salary) as min_sal,avg(salary) as avg_sal from employee  group by department_ID ;
#24.List out the job wise maximum salary, minimum salary, average salaries of the employees.
select job_id,max(salary) as max_sal,min(salary) as min_sal,avg(salary) as avg_sal from employee  group by job_id;

#25.List out the no. of employees joined in every month in ascending order.
select month(hiredate) as month,monthname(hiredate) as month_name,count(employee_id) as 
no_of_emp_hired from employee group by month order by month ;

#26.List out the no. of employees for each month and year, in the ascending order based on the year, month.
select month(hiredate) as month,monthname(hiredate) as monthname,year(hiredate)as year,count(employee_id) as no_of_emp from employee 
group by month,year order by year,month;

#27.List out the department id having at least four employees.
select department_id,count(department_id) as no_of_emp from employee group by department_id having 
count(department_id)>=4;

#28.How many employees in January month.
select count(employee_id) as emp_joined_in_jan from employee  where month(hiredate)=01 group by employee_id;

#29.How many employees who are joined in January or September month.
select count(employee_id) as emp_joined_in_jan_or_sep from employee where month(hiredate) in(01,09) group by employee_id;

#30.How many employees who are joined in 1985.
#select count(employee_id)as emp_join_in_1985 from employee where year(hiredate)='1985' ;
select count(employee_id)as emp_join_in_1985 from employee where year(hiredate)='1985' group by year(hiredate);

#31.How many employees joined each month in 1985?
select monthname(hiredate)as month_name ,count(employee_id) as no_of_emp_1985 from employee where year(hiredate)=1985 group by month(hiredate);

#32.How many employees who are joined in March 1985.
select count(employee_id) as no_of_emp_march_1985,year(hiredate)as y ,month(hiredate) as m from employee group by m,y having m=03 and y=1985;
#select count(employee_id) as no_of_emp_march_1985,month(hiredate)as m from employee where year(hiredate)='1985' group by month(hiredate),year(hiredate) having m='3';
#select count(employee_id) as emp_joined_in_jan from employee  where month(hiredate)='3' and year(hiredate)='1985';

#33.Which is the department id, having greater than or equal to 3 employees joined in April 1985?
select department_id from employee where month(hiredate)='4' and year(hiredate)='1985' group by month(hiredate),year(hiredate) having count(employee_id)>=3;
#select department_id from employee where month(hiredate)='2' and year(hiredate)='1985' group by month(hiredate),year(hiredate) having count(employee_id)>=2;

#Sub-Queries
#34.Display the employee who got the maximum salary.
select * from employee where salary=(select max(salary) from employee);
#35.Display the employees who are working in Sales department
select * from employee where department_id=(select department_id from department where name="sales");
#36.Display the employees who are working as “Clerk”.
select * from employee where job_id=(select job_id from job where Function1="clerk");
#37.Display the employees who are working in “New York”;     
select * from employee where department_id=( select department_id from department where location_id=(select location_id from location where regional_group="New York"));
#select * from employee where department_id=( select department_id from department where location_id=(select location_id from location where regional_group="Dallas"));

#38.Find out no.of employees working in “Sales” department.
select count(employee_id)as no_of_emp_work_sales from employee where department_id=(select department_id from department where name="sales");
#39.Update the employee’s salaries, who are working as Clerk on the basis of 10%.
update  employee set salary=(salary+(salary*10/100)) where job_id=(select job_id from job where Function1="clerk");
select * from employee;

#40.Delete the employees who are working in accounting department.
delete from employee where department_id=(select department_id from department where name="accounting");
#41.Display the second highest salary drawing employee details.
select * from employee where salary=(select max(salary) from employee where salary<(select max(salary) from employee));
#42.Display the Nth highest salary drawing employee details
select * from employee where salary=(select salary from employee order by salary desc limit n-1,1);

use company;
select *from employee;
#-------------Sub-Query operators: (ALL, ANY, SOME, EXISTS)------------------#
#43.List out the employees who earn more than every employee in department 30.
select * from employee where salary > any (select max(salary) from employee  where department_id=30 );
#44.List out the employees who earn more than the lowest salary in department 30.
select * from employee where salary > any(select min(salary) from employee  where department_id=30);
#45.Find out whose department has not employees.
select department_id,Name from department d where not exists (select department_id from employee e where e.department_id=d.department_id); 
#46.Find out which department does not have any employees.
select department_id,Name from department where not exists (select department_id from employee where employee.department_id=department.department_id); 

#----------------------Co-Related Sub Queries:-------------------------#
#47. Find out the employees who earn greater than the average salary for their department.
select * from employee where salary > all(select avg(salary) from employee group by department_id) ;
#select avg(salary) from employee group by department_id;

#------------join--------------------#
#Simple join
#48. List our employees with their department names
select e.employee_id,e.last_name,e.first_name,d.name from employee e,department d where e.department_id=d.department_id;
select employee.first_name,last_name,department.name from employee inner join department on employee.department_ID=department.department_id; 

#49. Display employees with their designations (jobs)
select e.employee_id,e.last_name,e.first_name,e.middle_name,j.function1 from employee e ,job j where e.job_id=j.job_id;
select employee.first_name,last_name,job.Function1 from employee inner join job on employee.job_id=job.job_id; 
#50. Display the employees with their department name and regional groups.
select e.employee_id,e.last_name,e.first_name,e.middle_name,d.name,loc.regional_group from employee e,department d,location loc 
where e.department_id=d.department_id and d.location_id=loc.location_id;
select e.employee_id,e.last_name,e.first_name,e.middle_name,d.name,l.regional_group from (employee e inner join department d 
on e.department_id=d.department_id) inner join location l on d.location_id=l.location_id;  

#51. How many employees who are working in different departments and display with department name.
select d.Name,count(e.employee_id)as no_of_emp_works from employee e,department d where e.department_id=d.department_id group  by e.department_id;
select d.Name,count(e.employee_id)as no_of_emp_works from employee e inner join department d on e.department_id=d.department_id group by e.department_id;
#52. How many employees who are working in sales department.
select d.Name,count(e.employee_id)as no_of_emp_works from employee e,department d where e.department_id=d.department_id group  by d.department_id having d.Name='sales';
select d.Name,count(e.employee_id)as no_of_emp_works from employee e inner join department d on e.department_id=d.department_id group  by d.department_id having d.Name='sales';
#53. Which is the department having greater than or equal to 5 employees and display the department names in ascending order?
select d.name,count(e.department_id) from employee e, department d where d.department_id=e.department_id group by e.department_id having count(e.department_id)>=5;
select d.name,count(e.department_id) from employee e inner join department d on d.department_id=e.department_id group by e.department_id having count(e.department_id)>=5;
#54. How many jobs in the organization with designations.
Select function1, count(employee_id) from employee e, job j where j.job_id=e.job_id group by function1;
#55. How many employees working in “New York”.
select count(employee_id) no_of_emp from employee where department_id=( select department_id from department where location_id=(select location_id from location where regional_group="new york"));

#Non – Equi Join:
#56. Display employee details with salary grades.
Select employee_id, last_name, grade_id from employee e, salary_grade s where salary 
between lower_bound and upper_bound order by last_name;

#57. List out the no. of employees on grade wise.
Select grade_id, count(*) from employee e, salary_grade s where salary 
between lower_bound and upper_bound group by grade_id order by grade_id desc;

#58. Display the employ salary grades and no. of employees between 2000 to 5000 range of salary.
Select grade_id, count(*) from employee e, salary_grade s where salary between lower_bound and upper_bound 
and lower_bound>=2000 and upper_bound<=5000 group by grade_id order by grade_id desc;

#Self Join:
#59. Display the employee details with their manager names.
select a.*,b.last_name,b.first_name from employee a,employee b where a.employee_id=b.manager_id; 
#60. Display the employee details who earn more than their managers salaries.
select a.*,b.last_name,b.first_name from employee a,employee b where a.employee_id=b.manager_id and a.salary>b.salary; 
#61. Show the no. of employees working under every manager.
select b.manager_id,count(a.employee_id) from employee a,employee b where a.employee_id=b.manager_id group by b.manager_id; 
#Outer Join:
#62. Display employee details with all departments.
select * from employee e right outer join department d on e.department_id=d.department_id;
#63. Display all employees in sales or operation departments.
select last_name,e.employee_id,d.name from employee e right outer join department d on e.department_id=d.department_id where d.Name='operations' OR d.name='sales';

#----------------Set Operators:-------------------------#
#64. List out the distinct jobs in Sales and Accounting Departments.
Select function1 from job where job_id in (Select job_id from employee where department_id=(select department_id from 
department where name="SALES")) 
union
 Select function1 from job where job_id in (Select job_id from employee where 
department_id=(select department_id from department where name="ACCOUNTING"));

#65. List out the ALL jobs in Sales and Accounting Departments.
Select function1 from job where job_id in (Select job_id from employee where department_id=(select department_id 
from department where name="SALES")) union all Select function1 from job where job_id in (Select job_id from 
employee where department_id=(select department_id from department where name="ACCOUNTING"));

#66. List out the common jobs in Research and Accounting Departments in ascending order.
Select function1 from job where job_id in (Select job_id from employee where department_id=(select department_id 
from department where name="RESEARCH")) intersect Select function1 from job where job_id in (Select job_id from 
employee where department_id=(select department_id from department where name="ACCOUNTING")) order by function1;
