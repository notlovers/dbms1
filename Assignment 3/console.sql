-- Assignment: 03
-- Design SQL queries for suitable database application using SQL DML
-- statements: Sub-Query and View Use suitable tables.
-- Employee(Emp id, First_name, Last_name, Salary, Designation, Dept_no).
-- Department(Dept_No, Dept_Name, Location)
create table employee
(
    emp_id int primary key,
    first_name varchar(20),
    last_name varchar(20),
    salary int,
    designation varchar(20),
    dept_no int
);
create table department
(
    dept_no int,
    dept_name varchar(20),
    location varchar(20)
);
desc employee;
desc department;

insert into employee values
    (160, 'Tejas', 'Mote', 100000, 'President', null),
    (161, 'Pruthviraj', 'Pawar', 50000, 'Vice-President', null),
    (162, 'Aniket', 'Sandbhor', 25000, 'Manager', 1),
    (163, 'Amit', 'Khade', 25000, 'Manager', 2),
    (164, 'Sudarshan', 'Haral', 25000, 'Assistant-Manager', 1),
    (165, 'Daljeetsingh', 'Bundele', 20000, 'Sales-manager', 2),
    (166, 'Rushi', 'Patil', 20000, 'Salesman', 2),
    (167, 'Aniket', 'Kadam', 25000, 'Salesman', 1),
    (168, 'Ayushi', 'Bechara', 20000, 'Assistant-Manager', 2),
    (169, 'Rajshree', 'Patil', 15000, 'Employee', 2),
    (170, 'Gauri', 'Sandbhor', 20000, 'Employee', 1);

insert into department values
    (1, 'Advertisement', 'Mumbai'),
    (2, 'Public relation', 'Pune');
-- --------------------------------------------------------------------------
-- a. write a SQL query to find those employees who receive a higher salary
-- than the employee with ID 163. Return first name, last name.
select first_name, last_name
from employee
where salary > (select salary from employee where emp_id = 163);

-- b. write a SQL query to find out which employees have the same designation
-- as the employee whose ID is 169. Return first name, last name, department
-- ID
select first_name, last_name, dept_no
from employee
where designation = (select designation from employee where emp_id = 169);

-- c. write a SQL query to find those employees who earn more than the
-- average salary. Return employee ID, first name, last name.
select emp_id, first_name, last_name
from employee
where salary > (select avg(salary) from employee);

-- d. Display a record who has minimum salary
select emp_id, first_name, last_name, designation, dept_no
from employee
where salary = (select min(salary) from employee);

-- e. Display a record who has maximum salary
select emp_id, first_name, last_name, designation, dept_no
from employee
where salary = (select max(salary) from employee);

-- f. Create view on Department and Employee table.
create view department_view
as select *
from department;
create view employee_view
as select *
from employee;

-- g. Create index of emp_id
create unique index emp_id_index on employee(emp_id);

-- -------------------------------------------------------------------------
-- Design SQL queries for suitable database application using SQL
-- DML statements: all types of Join.
create table Salesman
(
    salesman_id int primary key,
    name varchar(20),
    city varchar(20),
    commission int
);

create table Customer
(
    customer_id int primary key,
    cust_name varchar(20),
    city varchar(20),
    grade varchar(1),
    salesman_id int
);

insert into Salesman values
    (1, 'Tejas Mote', 'Sangli', 100),
    (2, 'Pruthviraj Pawar', 'Nagar', 70),
    (3, 'Daljeetsingh Bundele', 'Latur', 80),
    (4, 'Aniket Sandbhor', 'Khed', 90),
    (5, 'Sudarshan Haral', 'Nagar', 50),
    (6, 'Swarada Mote', 'Sangli', 11);

insert into Customer values
    (101, 'Ram', 'Sangli', 'A', 1),
    (102, 'Lakshman', 'Nagar', 'B', 5),
    (103, 'Bharath', 'Nagar', 'A', 2),
    (104, 'Shatrughan', 'Khed', 'A', 4),
    (105, 'Shanta', 'Latur', 'D', 3);

-- 1. write a SQL query to find the salesperson and customer who reside
-- in the same city. Return Salesman, cust_name and city.
select s.name, cust_name, s.city
from Customer c
join Salesman s
    on c.city = s.city;

-- 2. write a SQL query to find salespeople who received commissions of
-- more than 12 percent from the company. Return Customer Name, customer
-- city, Salesman, commission.
select cust_name, Customer.city, Salesman.name, commission
from Customer
inner join Salesman
    on Customer.city = Salesman.city
where commission > 12;

-- 3. write a SQL query to display the customer name, customer city, grade,
-- salesman name, salesman city. The results should be sorted by ascending
-- customer_id.
select customer_id, cust_name, Customer.city, grade, Salesman.name, Salesman.city
from Customer
left outer join Salesman
    on Customer.customer_id;
