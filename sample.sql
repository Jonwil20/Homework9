DROP TABLE IF EXISTS "Dept_Manager";
DROP TABLE IF EXISTS "Departments";
DROP TABLE IF EXISTS "Dept_Emp";
DROP TABLE IF EXISTS "Salaries";
DROP TABLE IF EXISTS "Titles";
DROP TABLE IF EXISTS "Employees";

CREATE TABLE "Dept_Manager" (
    "Dept_no" varchar   NOT NULL,
    "emp_no" varchar   NOT NULL,
    "from_date" varchar   NOT NULL,
    "to_date" varchar   NOT NULL
);

CREATE TABLE "Departments" (
    "Dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Dept_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" varchar   NOT NULL,
    "to_date" varchar   NOT NULL
);
CREATE TABLE "Dept_Emp" (
    "emp_no" int   NOT NULL,
    "Dept_no" varchar   NOT NULL,
    "from_date" varchar   NOT NULL,
    "to_date" varchar   NOT NULL
);

CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "birth_date" varchar   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "gender" varchar   NOT NULL,
    "hire_date" varchar   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
     "emp_no")
);

CREATE TABLE "Titles" (
	"emp_no" int   NOT NULL,
    "title" varchar   NOT NULL,
    "from_date" varchar   NOT NULL,
    "to_date" varchar   NOT NULL
);
select 'total rows:' 							as "counts  >>>  ",
	(select count(*) from "Employees") 		as "employees",
	(select count(*) from "Departments") 		as "departments",
	(select count(*) from "Salaries") 		as "salaries",
	(select count(*) from "Titles") 			as "titles",
	(select count(*) from "Dept_Manager") 	as "dept-managers",
	(select count(*) from "Dept_Emp") 		as "dept-employees"
	;
--1: EMPLOYEE LIST--
select emp_no as "Emp No", last_name as "Last Name", first_name as "First Name", gender as "Gender" , salary as "Salary"
from "Employees" 
join "Salaries"  on "Salaries".emp_no = "Employees".emp_no
;

-- 2: EMPLOYEES HIRED IN 1986
select 	emp_no as "Emp No", last_name as "Last Name", first_name as "First Name", gender as "Gender", hire_date as "Hire Date"
from 	"Employees" 
where 	hire_date between '1986-01-01' and '1986-12-31'
;
-----------------------------------------------------------------------------------------------------------------
-- 3. MANAGER LIST WITH START & END EMPLOYMENT DATES (and TITLE)
select Dept_no as "Dept No", dept_name as "Dept Name", emp_no as "Manager Emp No", last_name as "Manager Last Name", first_name as "Manager First Name", hire_date as "Start Date", to_date "End Date", title as "Title"
from "Dept_Manager" 
join "Departments"  	on Departments.Dept_no = Dept_Manager.Dept_no
join "Employees" 	on Employees._emp_no = Dept_Manager.emp_no
join "Titles" 	on Titles.emp_no = Employees.emp_no and Title = 'Manager'
;
-----------------------------------------------------------------------------------------------------------------
-- 4. EMPLOYEE LIST WITH DEPARTMENT (and START/END DATES)
select emp_no as "Emp No", last_name as "Last Name", first_name as "First Name", Dept_name as "Dept Name", from_date as "START DATE", to_date as "END DATE"
from "Employees"
join Dept_Emp_dept_emp 	on Dept_Emp.emp_no = Employees.emp_no 		and Employees_emp_no in ('100001','100010','100018')  --> Used for checkouts; else it runs forever without an index
join Departments on Departments.dept_no = Dept_Emp.dept_no
where Dept_Emp_to_date = 
(select max(Dept_Emp_to_date) from Dept_Emp)
;
-----------------------------------------------------------------------------------------------------------------
-- 5. "HERCULES B." LIST
select Employees_emp_no as "Emp No", last_name as "Last Name starts with B", first_name as "First Name is Hercules"
from "Employees"
where first_name = 'Hercules' and last_name like 'B%'
;
-----------------------------------------------------------------------------------------------------------------
-- 6. EMPLOYEES IN SALES					--> used to confirm unique rows in results set
select emp_no as "Emp No", last_name as "Last Name", first_name as "First Name", D_dept_name as "Department"
from "Employees"
join "Dept_Emp"	on Dept_Emp.emp_no = Employees.emp_no
join "Departments" 	on Departments.dept_no = Dept_Emp.dept_no and Departments.dept_name = 'Sales'
;
-----------------------------------------------------------------------------------------------------------------
-- 7. EMPLOYEES IN SALES AND DEVELOPMENT
select emp_no as "Emp No", last_name as "Last Name", first_name as "First Name", Departments_dept_name as "Department"
from "Employees"
join "Dept_Emp" on Dept_Emp.emp_no = Employees._emp_no
join "Departments" on Departments.dept_no = Dept_Emp.dept_no and Departments.dept_name in ('Sales','Development')
;
-----------------------------------------------------------------------------------------------------------------
-- 8. SAME LAST-NAMES FROM MOST common to LEAST common
select _last_name as "Employee Last Name", count(*) as "Number of Employees with same Last Name"
from "Employees"
group by  last_name
order by 2 desc
;
