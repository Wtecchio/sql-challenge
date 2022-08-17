-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/PE28Cu
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "DeptManager" (
    "deptNumber" int   NOT NULL,
    "empNumber" int   NOT NULL,
    CONSTRAINT "pk_DeptManager" PRIMARY KEY (
        "deptNumber","empNumber"
     )
);

CREATE TABLE "Departments" (
    "deptNumber" VARCHAR   NOT NULL,
    "deptName" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "deptNumber"
     )
);

CREATE TABLE "DeptEmployee" (
    "empNumber" INT   NOT NULL,
    "deptNumber" VARCHAR   NOT NULL,
    CONSTRAINT "pk_DeptEmployee" PRIMARY KEY (
        "empNumber","deptNumber"
     )
);

CREATE TABLE "Titles" (
    "TitleID" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "TitleID"
     )
);

CREATE TABLE "Employees" (
    "empNumber" int   NOT NULL,
    "empTitle" VARCHAR   NOT NULL,
    "dob" DATE   NOT NULL,
    "firstName" VARCHAR   NOT NULL,
    "lastName" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hireDate" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "empNumber"
     )
);

CREATE TABLE "Salary" (
    "empNumber" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_Salary" PRIMARY KEY (
        "empNumber","salary"
     )
);

ALTER TABLE "DeptManager" ADD CONSTRAINT "fk_DeptManager_deptNumber" FOREIGN KEY("deptNumber")
REFERENCES "Departments" ("deptNumber");

ALTER TABLE "DeptManager" ADD CONSTRAINT "fk_DeptManager_empNumber" FOREIGN KEY("empNumber")
REFERENCES "Employees" ("empNumber");

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_deptNumber" FOREIGN KEY("deptNumber")
REFERENCES "DeptEmployee" ("deptNumber");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_TitleID" FOREIGN KEY("TitleID")
REFERENCES "Employees" ("empTitle");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_empNumber" FOREIGN KEY("empNumber")
REFERENCES "DeptEmployee" ("empNumber");

ALTER TABLE "Salary" ADD CONSTRAINT "fk_Salary_empNumber" FOREIGN KEY("empNumber")
REFERENCES "Employees" ("empNumber");

