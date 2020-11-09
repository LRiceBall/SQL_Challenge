-- merge necessary data
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary
FROM employees
LEFT JOIN salaries ON employees.emp_no=salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE hire_date LIKE '%1986';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, 
	departments.dept_name, 
	dept_manager.emp_no, 
	employees.last_name, 
	employees.first_name
FROM dept_manager, 
	departments, 
	employees
WHERE dept_manager.emp_no = employees.emp_no 
AND dept_manager.dept_no = departments.dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	departments.dept_name
FROM employees, 
	departments, 
	dept_emp
WHERE employees.emp_no = dept_emp.emp_no 
AND departments.dept_no = dept_emp.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, 
	last_name, 
	sex
FROM employees
WHERE first_name = 'Hercules' 
and last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	departments.dept_name
FROM employees, 
	departments, 
	dept_emp
WHERE employees.emp_no = dept_emp.emp_no 
AND departments.dept_no = dept_emp.dept_no 
AND departments.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	departments.dept_name
FROM employees, 
	departments, 
	dept_emp
WHERE employees.emp_no = dept_emp.emp_no 
AND departments.dept_no = dept_emp.dept_no 
AND departments.dept_name IN ('Sales', 'Development'); 

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) 
FROM employees 
GROUP BY last_name
ORDER BY COUNT(*) DESC;




