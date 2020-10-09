-- #### Data Analysis

-- Once you have a complete database, do the following:
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.emp_lst_nm, employees.emp_frst_nm, employees.emp_sex, salaries.slry
	FROM employees
		JOIN salaries
			ON employees.emp_no = salaries.emp_no;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT employees.emp_frst_nm, employees.emp_lst_nm, employees.emp_hre_dt
	FROM employees
		WHERE  employees.emp_hre_dt like '%86';


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT departments_manager.dept_no, departments.dept_nm, employees.emp_no, employees.emp_lst_nm, employees.emp_frst_nm
	FROM departments_manager
		JOIN employees
			ON employees.emp_no = departments_manager.emp_no
		JOIN departments
			ON departments.dept_no = departments_manager.dept_no;
			

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.emp_lst_nm, employees.emp_frst_nm, departments.dept_nm
	FROM departments_employee
		JOIN departments
			ON departments.dept_no = departments_employee.dept_no
		JOIN employees
			ON employees.emp_no = departments_employee.emp_no;


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT employees.emp_frst_nm, employees.emp_lst_nm, employees.emp_sex
	FROM employees
		WHERE  employees.emp_frst_nm = 'Hercules'
		AND employees.emp_lst_nm LIKE 'B%';


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.emp_lst_nm, employees.emp_frst_nm, departments.dept_nm
	FROM departments_employee
		JOIN employees
			ON employees.emp_no = departments_employee.emp_no
		JOIN departments
			ON departments.dept_no = departments_employee.dept_no
		WHERE  departments.dept_nm = 'Sales';


-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.emp_lst_nm, employees.emp_frst_nm, departments.dept_nm
	FROM departments_employee
		JOIN employees
			ON employees.emp_no = departments_employee.emp_no
		JOIN departments
			ON departments.dept_no = departments_employee.dept_no
		WHERE  departments.dept_nm = 'Sales'
			OR departments.dept_nm = 'Development';
			

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT emp_lst_nm, 
	FROM employees
	GROUP BY emp_lst_nm
	ORDER BY emp_lst_nm DESC;


SELECT 
	DISTINCT emp_lst_nm
	FROM employees
	ORDER BY emp_lst_nm DESC;


SELECT 
	COUNT 
			(
			DISTINCT emp_lst_nm
			)
	FROM employees;
	
	
SELECT 
	FROM employees
	COUNT emp_lst_nm;

		