-- create tables linking via primary keys
CREATE TABLE departments (
	dept_no VARCHAR(4),
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);

CREATE TABLE titles (
  	title_id VARCHAR(5),
	title_name VARCHAR,
	PRIMARY KEY (title_id)
);

CREATE TABLE employees (
  	emp_no INT,
	emp_title_id VARCHAR(5),
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR(1),
	hire_date VARCHAR,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- set emp_no as new pk
ALTER TABLE employees ADD PRIMARY KEY (emp_no);

-- continue
CREATE TABLE dept_emp (
  	emp_no INT,
	dept_no VARCHAR(4),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
  	dept_no VARCHAR(4),
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries (
  	emp_no INT,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- load data to tables and check
select * from departments;

select * from titles;

select * from employees;

select * from salaries;

select * from dept_manager;

select * from dept_emp;

