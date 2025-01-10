
--1. Create a new database named "CompanyDB."
create database CompanyDB

--2. Create a schema named "Sales" within the "CompanyDB" database.
use CompanyDB
create schema Sales

--3. Create a table named "employees".
create table Sales.Employees (
employee_id int primary key default(next value for i),
first_name varchar(50),
last_name varchar(50),
salary decimal (10,3)
)
ALTER TABLE Sales.Employees
ALTER COLUMN salary VARCHAR(50);

CREATE SEQUENCE i
AS INT
START WITH 1
INCREMENT BY 1;
drop table Sales.Employees
--4. Alter the "employees" table to add a new column named "hire_date".
alter table Sales.Employees
add hire_date DATE

--////////////////////////--
--1. Select all columns from the "employees" table.
select *
from Sales.Employees

--2. Retrieve only the "first_name" and "last_name" columns from the "employees" table.
select first_name , last_name 
from  Sales.Employees

--3. Retrieve “full name” as one column from the "first_name" and "last_name" columns from the "employees" table.
select first_name + ' ' + last_name AS full_name
from Sales.Employees;

--4.Show the average salary of all employees. 
select  AVG (salary)
from Sales.Employees

--5. Select employees whose salary is greater than 50000.
select * 
from Sales.Employees
where salary > 50000;

--6. Retrieve employees hired in the year 2020.
select * 
from Sales.Employees
where hire_date between '2020-01-01' and '2020-12-31' ;

--7. List employees whose last names start with 'S.'
select *
from Sales.Employees
where last_name like 'S%'

--8. Display the top 10 highest-paid employees.
select top (10) *
from Sales.Employees

--9. Find employees with salaries between 40000 and 60000.
select * 
from Sales.Employees
where salary between 40000 and 60000 ;

--10. Show employees with names containing the substring 'man.'
select *
from Sales.Employees 
where first_name like '%man%' or last_name like '%man%';

--11. Display employees with a NULL value in the "hire_date" column.
select *
from Sales.Employees
where hire_date is null
--Nothing is returned because I did not enter empty data.

--12.	Select employees with a salary in the set (40000, 45000, 50000).
select *
from Sales.Employees
where salary in (40000, 45000, 50000);

--13.	Retrieve employees hired between '2020-01-01' and '2021-01-01.'
select *
from Sales.Employees
where hire_date between '2020-01-01' and '2021-01-01' ;

--14.	List employees with salaries in descending order.
select *
from Sales.Employees 
order by salary desc

--15.	Show the first 5 employees ordered by "last_name" in ascending order.
select top (5) *
from Sales.Employees
order by last_name asc

--16.	Display employees with a salary greater than 55000 and hired in 2020.
select *
from Sales.Employees
where salary > 55000 and hire_date  between '2020-01-01' and '2020-12-31'

--17.	Select employees whose first name is 'John' or 'Jane.'
select *
from Sales.Employees
where first_name in ('John', 'Jane')

--18.	List employees with a salary less than or equal to 55000 and a hire date after '2022-01-01.'
select *
from Sales.Employees
where salary <= 55000 and 
hire_date > '2022-01-01'

--19.	Retrieve employees with a salary greater than the average salary.
select *
from Sales.Employees
where salary > (select AVG(salary) from Sales.Employees)

--20.	Display the 3rd to 7th highest-paid employees.
select *
from Sales.Employees
order by salary desc
 OFFSET 2 rows fetch next 5 rows only

 --21.	List employees hired after '2021-01-01' in alphabetical order.
 select *
 from Sales.Employees
 where hire_date > '2021-01-01'

 --22.	Retrieve employees with a salary greater than 50000 and last name not starting with 'A.'
 select *
 from Sales.Employees
 where salary > 5000
and
 last_name not like '%A'

 --23.	Display employees with a salary that is not NULL.
 select *
 from Sales.Employees
 where salary is not null

 --24.	Show employees with names containing 'e' or 'i' and a salary greater than 45000.
 select *
 from Sales.Employees
 where salary > 45000
 and  (first_name like '%e%' or first_name like '%i%'
		or last_name like '%e%' or last_name like '%i%')
