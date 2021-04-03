--Drop Table titles;

CREATE TABLE departments(
	dept_no Varchar (20) Primary Key,
	dept_name Varchar (30) Not Null
);
select * from departments;

CREATE Table dept_emp(
	emp_no Int,
	dept_no Varchar (10) Not Null,
	Foreign Key (dept_no) References 
	departments(dept_no)
);
select * from dept_emp;

CREATE Table dept_manager(
	dept_no Varchar (10) Not Null,
	emp_no Int,
	Foreign Key (dept_no) References 
	departments(dept_no)
);	
select * from dept_manager;

Create Table employees(
	emp_no Integer Primary Key,
	emp_title_id Varchar(10) Not Null,
	birth_date Varchar(20) Not Null,
	first_name Varchar(20) Not Null,
	last_name Varchar(20) Not Null,
	sex Varchar(2) Not Null,
	hire_date DATE Not Null
);
select * from employees limit (6);

Create Table salaries(
	emp_no Integer,
	salary Integer,
	Foreign Key (emp_no) References 
	employees(emp_no)
);
select * from salaries limit (6);

CREATE Table titles(
	title_id Varchar (10) Not Null Primary Key,
	title Varchar(30) Not Null
);
select * from titles;






