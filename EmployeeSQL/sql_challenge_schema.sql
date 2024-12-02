-- Drop tables if they already exist
DROP TABLE IF EXISTS dept_managers;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_info;
DROP TABLE IF EXISTS title;

-- Create Employee Title Table
-- These first 3 tables are created now because the final 3 were causing conflicts when loaded first 
CREATE TABLE "title" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title_names" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_title" PRIMARY KEY (
        "title_id"
     )
);

-- Create Department Info Table
CREATE TABLE "dept_info" (
    "dept_id" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_dept_info" PRIMARY KEY (
        "dept_id"
     )
);

-- Create Salaries Table
CREATE TABLE "salaries" (
    "emp_id" INT   NOT NULL,
    "emp_salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_id"
     )
);

-- Create Employees Table
CREATE TABLE "employees" (
    "emp_id" INT   NOT NULL,
    "emp_title" VARCHAR(5)   NOT NULL,
    "emp_bday" VARCHAR(10)   NOT NULL,
    "first_name" VARCHAR(20)   NOT NULL,
    "last_name" VARCHAR(20)   NOT NULL,
    "emp_sex" VARCHAR(1)   NOT NULL,
    "emp_hiredate" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_id"
     )
);

-- Create Department Employees Table
-- This shows which employee is assigned to a specific department, represented by their respective ID numbers.
-- It has 2 primary keys because an employee is able to be assigned to multiple departments.
CREATE TABLE "dept_emp" (
    "emp_id" INT   NOT NULL,
    "dept_id" VARCHAR(4)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_id","dept_id"
     )
);

-- Create Department Managers Table
-- Same situation as above, multiple managers can be assigned to multiple departments.
CREATE TABLE "dept_managers" (
    "dept_id" VARCHAR(4)   NOT NULL,
    "emp_id" INT   NOT NULL,
    CONSTRAINT "pk_dept_managers" PRIMARY KEY (
        "dept_id","emp_id"
     )
);

-- Set up composite keys for the tables created above
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_id" FOREIGN KEY("emp_id")
REFERENCES "salaries" ("emp_id");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "title" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_id" FOREIGN KEY("dept_id")
REFERENCES "dept_info" ("dept_id");

ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_dept_id" FOREIGN KEY("dept_id")
REFERENCES "dept_info" ("dept_id");

ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

