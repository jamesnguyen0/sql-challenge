--Data Analysis
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
from sql_challenge.employees e
join sql_challenge.salaries s
on e.emp_no = s.emp_no
limit 10

--2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from sql_challenge.employees
where hire_date like '%%/%%/1986'
limit 10

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select d.dept_no, d.dept_name, dm.emp_no as "manager_id_no", e.last_name, e.first_name 
from sql_challenge.departments d
join sql_challenge.dept_manager dm
on d.dept_no = dm.dept_no
join sql_challenge.employees e
on dm.emp_no = e.emp_no
limit 10

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name 
from sql_challenge.employees e
join sql_challenge.dept_emp de
on e.emp_no = de.emp_no
join sql_challenge.departments d
on de.dept_no = d.dept_no
limit 10

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from sql_challenge.employees
where first_name = 'Hercules' and last_name like 'B%'
limit 10

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name 
from sql_challenge.employees e
join sql_challenge.dept_emp de
on e.emp_no = de.emp_no
join sql_challenge.departments d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales'
limit 10

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name 
from sql_challenge.employees e
join sql_challenge.dept_emp de
on e.emp_no = de.emp_no
join sql_challenge.departments d
on de.dept_no = d.dept_no
where d.dept_name = 'Development' or d.dept_name = 'Sales'
limit 10

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as count
from sql_challenge.employees
group by last_name
order by count desc
limit 10

--EPILOGUE
select * from sql_challenge.employees
where emp_no = 499942