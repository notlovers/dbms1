-- Assignment: 01
-- Design and Develop at list 10 SQL DDL statements which demonstrate
-- the use of SQL objects such as Table, View, Index, Sequence. Primary key,
-- foreign keys, unique, not null, null constraints whenever necessary.
-- -------------------------------------------------------------------------
-- 1. Create table Department with fields deptno, dname, location.
create table department
(
    deptno int,
    dname varchar(20),
    location varchar(20),
    primary key (deptno)
);
show tables;
describe department;
-- 2. Insert the following records by using any one method
insert into department values
                           (10, 'Accounting', 'Mumbai'),
                           (20, 'Research', 'Pune'),
                           (30, 'Sales', 'Nashik'),
                           (40, 'Operation', 'Nagpur');
-- 3. List the department information.
select *
from department;
-- 4. Create table employee as shown below.
create table employee
(
    Empno int primary key,
    Ename varchar(20),
    Job varchar(20),
    Mgr varchar(10),
    Joined_date date,
    Salary int,
    Commission varchar(20),
    Dept_no int,
    Address varchar(20)
);
describe employee;
insert into employee values
    (1001, 'Nilesh joshi', 'Clerk', 1005, '1995-12-17', 2800, 600, 20, 'Nashik'),
    (1002, 'Avinash pawar', 'Salesman', 1003, '1996-02-20', 5000, 1200, 30, 'Nagpur'),
    (1003, 'Amit kumar', 'Manager', 1004, '1986-04-02', 2000, NULL, 30, 'Pune'),
    (1004, 'Nitin kulkarni', 'President', NULL, '1986-04-19', 50000, NULL, 10, 'Mumbai'),
    (1005, 'Niraj Sharma', 'Analyst', 1003, '1998-12-03', 12000, NULL, 20, 'Satara'),
    (1006, 'Pushkar deshpande', 'Salesman', 1003, '1996-09-01', 6500, 1500, 30, 'Pune'),
    (1007, 'Sumit patil', 'Manager', 1004, '1991-05-01', 25000, NULL, 20, 'Mumbai'),
    (1008, 'Ravi sawant', 'Analyst', 1007, '1995-11-17', 10000, NULL, NULL, 'Amaravati');

-- 5. Write a query to display employee information. Write a name of column explicitly.
select *
from employee;
show columns from employee;
-- bellow commend is alternative for above command.
describe employee;
-- 6. Create a query to display unique jobs from the table.
select distinct Job
from employee;
-- 7. Change the location of dept30 to Banglore instead of Nagpur.
update department
set location = 'Banglore'
where deptno = 40 and location = 'Nagpur';
-- 8. Change the name of the employees 1003 to Nikhil Gosavi.
update employee
set Ename = 'Nikhil Gosavi'
where Empno = 1003;
-- 9. Delete Pushkar deshpande from employee table.
delete from employee
where Ename = 'Pushkar deshpande';
-- 10. Create a table department_temp table from department table, only create the structure not content.
create table department_temp like department;
-- 11. Create view, index , sequence.
create view department_view
as
    select * from department;

create unique index department_index on department(deptno);
show index from department;
-- drop index department_index on department;
-- 12. Insert rows into department_temp table from department table
insert into department_temp select * from department;
select * from department_temp;
-- 13. Display the list of employee whose salary between 5000 and 20000.
select * from employee where Salary >= 5000 and Salary <= 20000;
-- 14. Display the list of employee excluding job title as ‘salesman’.
select * from employee where Job = 'Salesman';