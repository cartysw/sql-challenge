-- List the employee number, last name, first name, sex, and salary of each employee.
-- Used aliases here to simplify things a bit
SELECT e.emp_id, 
	e.last_name, 
	e.first_name, 
	e.emp_sex, 
	s.emp_salary
FROM employees as e
JOIN salaries as s ON
	e.emp_id = s.emp_id;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
-- Used simple wildcard function
SELECT first_name, 
	last_name, 
	emp_hiredate
FROM employees
WHERE emp_hiredate LIKE '%1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
-- More aliases here for simplicity. Used 2 joins to gather all the info necessary.
SELECT m.dept_id, 
	m.emp_id, 
	d.dept_name, 
	e.last_name, 
	e.first_name
FROM dept_managers AS m
JOIN dept_info AS d ON
	m.dept_id = d.dept_id
JOIN employees AS e ON
	m.emp_id = e.emp_id;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
-- Used the same exact process as above.
SELECT de.dept_id,
	de.emp_id,
	e.last_name,
	e.first_name,
	di.dept_name
FROM dept_emp AS de
JOIN employees AS e ON
	de.emp_id = e.emp_id
JOIN dept_info AS di ON
	de.dept_id = di.dept_id;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
-- Had to use the AND operator to get this to work. Also, I used another wildcard function to find last names that start with B.
SELECT first_name, 
	last_name, 
	emp_sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
-- Added a where function at the end to filter for Sales department
SELECT e.first_name,
	e.last_name,
	e.emp_id,
	di.dept_name
FROM employees AS e
JOIN dept_emp AS de ON
	de.emp_id = e.emp_id
JOIN dept_info AS di ON
	de.dept_id = di.dept_id
WHERE di.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- Basically copied the above query and just added an OR condition at the end of the WHERE statement to also show employees in the Development department.
SELECT e.first_name,
	e.last_name,
	e.emp_id,
	di.dept_name
FROM employees AS e
JOIN dept_emp AS de ON
	de.emp_id = e.emp_id
JOIN dept_info AS di ON
	de.dept_id = di.dept_id
WHERE di.dept_name = 'Sales' OR di.dept_name= 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,
	COUNT(last_name) AS "Last Name Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Frequency" DESC;