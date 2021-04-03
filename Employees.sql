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

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, last_name, first_name, sex, salary
From employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no


--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees 
WHERE DATE_PART('year', hire_date) = 1986

--3. List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.
SELECT departments.dept_no, dept_name, dept_manager.emp_no, last_name, first_name
FROM departments
INNER JOIN dept_manager ON
departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
From employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.emp_no, last_name, first_name
From employees WHERE first_name = 'Hercules' AND
last_name LIKE 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees 
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, 
--and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees 
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name in ('Sales', 'Development')

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) as last_name_cnt
FROM employees
GROUP BY last_name
ORDER BY "last_name_cnt" Desc

-- BONUS




