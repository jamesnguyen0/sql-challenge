--drop table sql_challenge.titles
create table sql_challenge.titles(
	title_id varchar primary key,
	title varchar
);

select * from sql_challenge.titles
limit 5

--drop table sql_challenge.employees
create table sql_challenge.employees(
	emp_no int primary key,
	emp_title_id varchar,
	foreign key (emp_title_id) references sql_challenge.titles(title_id),
	birth_date varchar,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date varchar
);

select * from sql_challenge.employees
limit 5

--drop table sql_challenge.salaries
create table sql_challenge.salaries(
	emp_no int,
	foreign key (emp_no) references sql_challenge.employees(emp_no),
	salary int,
	primary key (emp_no, salary)
);

select * from sql_challenge.salaries
limit 5

--drop table sql_challenge.departments
create table sql_challenge.departments(
	dept_no varchar primary key,
	dept_name varchar
);

select * from sql_challenge.departments
limit 5

--drop table sql_challenge.dept_emp
create table sql_challenge.dept_emp(
	emp_no int,
	foreign key (emp_no) references sql_challenge.employees(emp_no),
	dept_no varchar,
	foreign key (dept_no) references sql_challenge.departments(dept_no),
	primary key (emp_no, dept_no)
);

select * from sql_challenge.dept_emp
limit 5

--drop table sql_challenge.dept_manager
create table sql_challenge.dept_manager(
	dept_no varchar,
	foreign key (dept_no) references sql_challenge.departments(dept_no),
	emp_no int,
	foreign key (emp_no) references sql_challenge.employees(emp_no),
	primary key (dept_no, emp_no)
);

select * from sql_challenge.dept_manager
limit 5

--employee listing
select e.emp_no, e.emp_title_id, t.title, e.birth_date, e.first_name, e.last_name, e.sex, e.hire_date, 
	   s.salary, de.dept_no, d.dept_name 
from sql_challenge.employees e
join sql_challenge.titles t
on e.emp_title_id = t.title_id
join sql_challenge.salaries s
on e.emp_no = s.emp_no
join sql_challenge.dept_emp de
on e.emp_no = de.emp_no
join sql_challenge.departments d
on de.dept_no = d.dept_no
limit 10

--department listing
select d.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name 
from sql_challenge.departments d
join sql_challenge.dept_manager dm
on d.dept_no = dm.dept_no
join sql_challenge.employees e
on dm.emp_no = e.emp_no
limit 10
