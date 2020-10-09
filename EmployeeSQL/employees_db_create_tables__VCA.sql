-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/RftnNi
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "dept_nm" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

SELECT *
	FROM departments


CREATE TABLE "departments_employee" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments_employee" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

SELECT *
	FROM departments_employee
	LIMIT 10;
	

CREATE TABLE "departments_manager" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    CONSTRAINT "pk_departments_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

SELECT *
	FROM departments_manager;


CREATE TABLE "employees" (
    "emp_no" INTEGER   NOT NULL,
    "emp_title_id" VARCHAR(30)   NOT NULL,
    "emp_brth_dt" VARCHAR(30)   NOT NULL,
    "emp_frst_nm" VARCHAR(30)   NOT NULL,
    "emp_lst_nm" VARCHAR(30)   NOT NULL,
    "emp_sex" VARCHAR(30)   NOT NULL,
    "emp_hre_dt" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

SELECT *
	FROM employees
	LIMIT 10;


CREATE TABLE "salaries" (
    "emp_no" INTEGER   NOT NULL,
    "slry" INTEGER   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

SELECT *
	FROM salaries;


CREATE TABLE "titles" (
    "ttl_id" VARCHAR(30)   NOT NULL,
    "ttl" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "ttl_id"
     )
);

SELECT *
	FROM titles;


ALTER TABLE "departments_employee" ADD CONSTRAINT "fk_departments_employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "departments_employee" ADD CONSTRAINT "fk_departments_employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "departments_manager" ADD CONSTRAINT "fk_departments_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "departments_manager" ADD CONSTRAINT "fk_departments_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("ttl_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");