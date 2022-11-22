-- Assignment: 02
-- Design at least 10 SQL queries for suitable database application
-- using SQL DML statements: Insert, Select, Update, Delete with operators,
-- functions, and set operator. Primary key, foreign keys, unique, not null,
-- null constraints whenever necessary.
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

select *
from employee;

-- 5. Display the name & salary of all employees whose salary not in the range of 5000 & 10000.
select Ename, Salary
from employee where Salary < 5000 or Salary > 10000;

-- 6. Find all names and joined date of employees whose name starts with 'A'
select Ename, Joined_date
from employee where Ename like 'A%';

-- 7. Find the name of employees having 'i' as a second letter in there name
select Ename
from employee where Ename like '_i%';

-- 8. Find the number, name of employee whose commission is not null
select Empno, Ename
from employee where Commission is not null;

-- 9. Display all employee information in the descending order of employee number.
select *
from employee
order by Empno desc;

-- 10. Display the minimum, maximum, sum & average salary of each job type.
select min(Salary), max(Salary), sum(Salary), avg(Salary)
from employee;

-- 11. Write a query to display the number of employee with the same department.
select Job, count(*)
from employee
group by Job;

-- 12. Select employee number, ename according to the annual salary in ascending order.
select Empno, Ename
from employee
order by Salary asc;

-- 13. Find the department number, maximum salary where the maximum salary is greater than 5000.
select Dept_no, max(Salary)
from employee
where Salary > 5000
group by Dept_no;

-- 14. Find all distinct column values from employee & department table.
select distinct Dept_no
from employee;

-- 15. Find all distinct column values present in employee but not in department table.
select distinct Empno, Ename, Job, Mgr, Joined_date, Salary, Commission, Address
from employee;

-- 16. Display the number of employees in the department 30 who can earn a commission.
select Ename
from employee
where Dept_no = 30 and Commission is not null;

-- 17. Change address of empno 1008 to Pune
update employee
set Address = 'Pune'
where Empno = 1008;

-- 18. Delete a record which is having comission less than 800.
delete from employee
where Commission < 800;