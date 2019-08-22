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
SELECT * FROM "Employees";

SELECT emp_no, hire_date
FROM "Employees"
where hire_date = '1986-06-26'