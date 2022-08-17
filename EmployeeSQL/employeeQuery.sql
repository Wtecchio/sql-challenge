-- Data Analysis Queries for sql-challenge
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no AS employee_number
	, emp.lastName
	, emp.firstName
	, emp.sex
	, sal.salary
FROM "Employees" AS emp
INNER JOIN "Salaries" AS sal ON emp.emp_no = sal.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT firstName
	, lastName
	, hire_date
FROM "Employees"
WHERE DATE_PART('year', hire_date) = 1986

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_man.dept_no AS department_number
	, dept.deptName AS department
	, dept_man.emp_no AS employee_number
	, emp.lastName
	, emp.firstName
FROM "Dept_Manager" AS dept_man
INNER JOIN "Employees" AS emp ON dept_man.emp_no = emp.emp_no
INNER JOIN "Departments" AS dept ON dept_man.dept_no = dept.dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp.emp_no
	, emp.lastName
	, emp.firstName
	, dept.deptName
FROM "Employees" AS emp
INNER JOIN "Dept_Employee" AS deptEmp ON emp.emp_no = deptEmp.emp_no
INNER JOIN "Departments" AS dept ON deptEmp.dept_no = dept.dept_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT firstName
	, lastName
	, sex
FROM "Employees"
WHERE firstName = 'Hercules' AND lastName LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp.emp_no
	, emp.lastName
	, emp.firstName
	, dept.deptName
FROM "Employees" AS emp
INNER JOIN "Dept_Employee" AS deptEmp ON emp.emp_no = deptEmp.emp_no
INNER JOIN "Departments" AS dept ON deptEmp.dept_no = dept.dept_no
WHERE deptEmp.dept_no = 'd007';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no
	, emp.lastName
	, emp.firstName
	, dept.deptName
FROM "Employees" AS emp
INNER JOIN "Dept_Employee" AS deptEmp ON emp.emp_no = deptEmp.emp_no
INNER JOIN "Departments" AS dept ON deptEmp.dept_no = dept.dept_no
WHERE deptEmp.dept_no = 'd007' OR deptEmp.dept_no = 'd005';

-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT lastName, COUNT(lastName) AS lastName_count
FROM "Employees"
GROUP BY lastName
ORDER BY lastName_count DESC;