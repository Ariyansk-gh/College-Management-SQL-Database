

/*🎓 Project: College Management System Database
 👨‍💻 Author: Ariyan Shaikh
📘 Description:
		A detailed MySQL practice database covering clauses, joins, subqueries, views, TCL, and more.*/
----------------------------------------------------------------------------------------------------------

-- Step 1: Create and Use Database
CREATE DATABASE college_management;
USE college_management;

-- Step 2: Create Tables

  # Students Table :

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    age INT,
    course_id INT,
    admission_year YEAR,
    email VARCHAR(100),
    phone VARCHAR(15),
    total_marks DECIMAL(5,2),
    CONSTRAINT chk_marks CHECK (total_marks BETWEEN 0 AND 100)
);

  # Courses Table :

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    duration_months INT,
    department VARCHAR(50),
    course_fee DECIMAL(10,2)
);

  # Teachers Table :
  
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

  # Fees Table :
  
CREATE TABLE fees (
    fee_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    amount_paid DECIMAL(10,2),
    payment_date DATE,
    payment_mode VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

  # Results Table :
  
CREATE TABLE results (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    exam_name VARCHAR(50),
    score DECIMAL(5,2),
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- -------------------------------------------------------------
   # Step 3: Insert Data 


  # Insert Students :

INSERT INTO students (first_name, last_name, gender, age, course_id, admission_year, email, phone, total_marks)
VALUES
('Ariyan', 'Shaikh', 'M', 20, 1, 2022, 'ariyan.shaikh@example.com', '9876543210', 88.50),
('Riya', 'Patel', 'F', 21, 3, 2021, 'riya.patel@example.com', '9786541230', 91.20),
('Kabir', 'Khan', 'M', 22, 2, 2020, 'kabir.khan@example.com', '9123456780', 76.30),
('Sneha', 'Mehta', 'F', 19, 4, 2023, 'sneha.mehta@example.com', '9812345670', 82.00),
('Rohan', 'Verma', 'M', 23, 1, 2020, 'rohan.verma@example.com', '9898765432', 67.50),
('Priya', 'Nair', 'F', 20, 5, 2022, 'priya.nair@example.com', '9012345678', 85.40),
('Amit', 'Sharma', 'M', 22, 3, 2021, 'amit.sharma@example.com', '9976543210', 92.70),
('Sara', 'Malik', 'F', 21, 1, 2022, 'sara.malik@example.com', '9954321789', 78.60),
('Yash', 'Tiwari', 'M', 24, 2, 2020, 'yash.tiwari@example.com', '9812341122', 73.40),
('Neha', 'Jain', 'F', 20, 5, 2023, 'neha.jain@example.com', '9822233344', 87.90);

  # Insert Courses :
  
INSERT INTO courses (course_name, duration_months, department, course_fee)
VALUES
('Computer Science', 36, 'IT', 45000),
('Business Management', 24, 'Commerce', 40000),
('Data Science', 18, 'IT', 55000),
('Marketing', 12, 'Commerce', 30000),
('Psychology', 24, 'Arts', 35000);

  # Insert Teachers :
  
INSERT INTO teachers (teacher_name, department, salary, hire_date)
VALUES
('Dr. Meena Kapoor', 'IT', 60000, '2020-05-14'),
('Prof. Raj Malhotra', 'Commerce', 55000, '2019-11-09'),
('Dr. Aisha Khan', 'IT', 62000, '2021-03-20'),
('Prof. Karan Mehta', 'Arts', 50000, '2018-07-30'),
('Dr. Nita Desai', 'Commerce', 58000, '2022-01-10');

  # Insert Fees :
  
INSERT INTO fees (student_id, amount_paid, payment_date, payment_mode)
VALUES
(1, 25000, '2023-05-12', 'Online'),
(2, 30000, '2023-03-08', 'Cash'),
(3, 15000, '2022-10-20', 'Card'),
(4, 18000, '2023-01-25', 'Online'),
(5, 26000, '2021-12-10', 'Cash'),
(6, 20000, '2023-02-14', 'Card'),
(7, 31000, '2022-11-18', 'Online'),
(8, 28000, '2023-04-21', 'Cash'),
(9, 23000, '2021-08-22', 'Online'),
(10, 34000, '2023-05-05', 'Card');

  # Insert Results :
  
INSERT INTO results (student_id, exam_name, score, grade)
VALUES
(1, 'Mid Term', 85.5, 'A'),
(1, 'Final', 89.0, 'A'),
(2, 'Mid Term', 90.2, 'A'),
(3, 'Mid Term', 72.3, 'B'),
(4, 'Final', 80.0, 'B'),
(5, 'Final', 65.5, 'C'),
(6, 'Mid Term', 83.4, 'B'),
(7, 'Final', 95.1, 'A'),
(8, 'Mid Term', 77.2, 'B'),
(9, 'Final', 69.0, 'C'),
(10, 'Mid Term', 86.7, 'A');

/* Quick recap :
I have created 5 interlinked tables (with foreign keys).
Added 10+ rows for analysis.
*/
-----------------------------------------------------------------------------

/* 1. Data Definition Language (DDL) :
There are totaly 4 commands in DDL
1) Create
2) Drop
3) Alter 
4) Truncate
*/

-- Add a new column to Students
ALTER TABLE students ADD address VARCHAR(255);
select * from students;

-- Modify column type
ALTER TABLE teachers MODIFY salary DECIMAL(12,2);
select * from teachers;

-- Drop a column example
ALTER TABLE results DROP COLUMN grade;
select * from results;

-- Rename a table
RENAME TABLE results TO student_results;
select * from student_results;

-- Alter a table 
ALTER TABLE students ALTER address set default 'Mumbai';
select * from students;
-------------------------------------------------------------------------------

/* 2. Data Manipulation Language:
1) Insert
2) Update
3) Delete
*/ 

-- INSERT Data

INSERT INTO students (first_name, last_name, gender, age, course_id, admission_year, email, phone, total_marks)
VALUES
('Ariyan', 'Shaikh', 'M', 20, 1, 2022, 'ariyan.shaikh@example.com', '9876543210', 88.50),
('Riya', 'Patel', 'F', 21, 3, 2021, 'riya.patel@example.com', '9786541230', 91.20),
('Kabir', 'Khan', 'M', 22, 2, 2020, 'kabir.khan@example.com', '9123456780', 76.30);

INSERT INTO courses (course_name, duration_months, department, course_fee)
VALUES
('Computer Science', 36, 'IT', 45000),
('Data Science', 24, 'IT', 55000),
('Marketing', 12, 'Commerce', 30000);

INSERT INTO teachers (teacher_name, department, salary, hire_date)
VALUES
('Dr. Meena Kapoor', 'IT', 60000, '2020-05-14'),
('Prof. Raj Malhotra', 'Commerce', 55000, '2019-11-09');

-- UPDATE Example
UPDATE students
SET total_marks = 93.5
WHERE first_name = 'Riya';

UPDATE courses 
SET department = 'CA'
WHERE department = 'IT';

-- DELETE Example
DELETE FROM students
WHERE total_marks < 75;

DELETE FROM teachers 
WHERE salary>60000;

-- SELECT Examples
SELECT * FROM students;
SELECT first_name, last_name, total_marks FROM students WHERE total_marks > 85;
----------------------------------------------------------------------------------------------------

/*  3.Transaction Control Language (TCL) :
1) Commit
2) Roll Back
3) Save Point
*/

START TRANSACTION;

INSERT INTO courses (course_name, duration_months, department, course_fee)
VALUES ('Graphic Design', 18, 'Arts', 32000);

SAVEPOINT before_delete;

DELETE FROM courses WHERE course_fee < 50000;

ROLLBACK TO before_delete; -- Undo delete, keep new course

COMMIT; -- Save all changes
---------------------------------------------------------------------------------------------------------

# Clauses :
-- We are using clauses to make the query more informative.

# SELECT & WHERE CLAUSE :

-- Fetch all student details who scored more than 80 marks
SELECT * 
FROM students
WHERE total_marks > 80;

/*  GROUP BY CLAUSE :
  GROUP BY Clause: The GROUP BY clause is used to group rows that have the same 
  values in one or more columns. 
*/

-- Find average marks department-wise
SELECT c.department, AVG(s.total_marks) AS avg_marks
FROM students s
JOIN courses c 
ON s.course_id = c.course_id
GROUP BY c.department;


/* ORDER BY CLAUSE :
   USED TO SORT THE DATA EITHER INTO ASCENDING OR DESCENDING ORDER.
*/   

-- List all students sorted by marks in descending order
SELECT student_id, first_name, last_name, total_marks
FROM students
ORDER BY total_marks DESC;

# LIMIT CLAUSE :

-- Display top 3 highest scoring students
SELECT first_name, last_name, total_marks
FROM students
ORDER BY total_marks DESC
LIMIT 3;

/* DISTINCT CLAUSE :
  The DISTINCT clause is used in SQL to return only unique values from 
  a column or group of columns. 
*/

-- Find all unique departments
SELECT DISTINCT department FROM courses;

# BETWEEN & IN CLAUSES :

-- Students having marks between 70 and 90
SELECT first_name, total_marks
FROM students
WHERE total_marks BETWEEN 70 AND 90;

-- Students enrolled in course IDs 1, 2, or 3
SELECT first_name, course_id
FROM students
WHERE course_id IN (1, 2, 3);

# LIKE CLAUSE :

-- Students whose name starts with 'A'
SELECT first_name, last_name
FROM students
WHERE first_name LIKE 'A%';

-- Students whose name ends with 'a'
SELECT first_name
FROM students
WHERE first_name LIKE '%a';

/* HAVING CLAUSE :
  The HAVING clause is used to filter records in a GROUP BY 
query based on conditions.
It works similarly to the WHERE clause but operates on grouped data 
rather than individual rows. 
*/

-- Show departments with average marks greater than 80
SELECT c.department, AVG(s.total_marks) AS avg_marks
FROM students s
JOIN courses c ON s.course_id = c.course_id
GROUP BY c.department
---------------------------------------------------------------------------------------------

# JOINS :

-- INNER JOIN: Students with their course details
SELECT s.first_name, s.last_name, c.course_name, c.department
FROM students s
INNER JOIN courses c 
ON s.course_id = c.course_id;

-- Students in IT department and marks > 85
SELECT s.first_name, s.last_name, c.department, s.total_marks
FROM students s
JOIN courses c ON s.course_id = c.course_id
WHERE c.department = 'IT' AND s.total_marks > 85;

-- LEFT JOIN: All students + matching course info (even if null)
SELECT s.first_name, s.last_name, c.course_name
FROM students s
LEFT JOIN courses c 
ON s.course_id = c.course_id;

-- RIGHT JOIN: All courses + matching students (even if null)
SELECT s.first_name, s.last_name, c.course_name
FROM students s
RIGHT JOIN courses c 
ON s.course_id = c.course_id;

-- FULL JOIN :
SELECT s.first_name, s.last_name, c.course_name
FROM students s
LEFT JOIN courses c ON s.course_id = c.course_id
UNION
SELECT s.first_name, s.last_name, c.course_name
FROM students s
RIGHT JOIN courses c ON s.course_id = c.course_id;

# SELF JOIN :
-- Let's assume teachers mentoring other teachers
-- Example: Find teacher pairs from same department

SELECT t1.teacher_name AS Teacher_1, t2.teacher_name AS Teacher_2, t1.department
FROM teachers t1
JOIN teachers t2 
ON t1.department = t2.department 
AND t1.teacher_id <> t2.teacher_id;
---------------------------------------------------------------------------------------

# UNION and UNION ALL Examples :
-- UNION is used to combine results from multiple SELECT statements
-- It removes duplicate rows by default.
-- UNION ALL keeps duplicates.

-- Example 1: Combine names of Students and Teachers
SELECT first_name AS name, 'Student' AS role
FROM students
UNION
SELECT teacher_name AS name, 'Teacher' AS role
FROM teachers;

-- Example 2: Using UNION ALL (keeps duplicates)
SELECT first_name AS name, 'Student' AS role
FROM students
UNION ALL
SELECT teacher_name AS name, 'Teacher' AS role
FROM teachers;
-------------------------------------------------------------------------------------------

# SUBQUERIES (Single-row, Multi-row, and Nested) :

-- Example 1: Find students who scored above the average marks of all students
SELECT first_name, total_marks
FROM students
WHERE total_marks > (
    SELECT AVG(total_marks)
    FROM students
);

-- Example 2: Get course details for students who paid more than ₹30,000 fees
SELECT c.course_name, c.department
FROM courses c
WHERE c.course_id IN (
    SELECT s.course_id
    FROM students s
    JOIN fees f ON s.student_id = f.student_id
    WHERE f.amount_paid > 30000
);

-- Example 3: Find student(s) with the highest marks
SELECT * 
FROM students
WHERE total_marks = (
    SELECT MAX(total_marks)
    FROM students
);
-----------------------------------------------------------------------------

# VIEWS (Virtual Tables) :
-- A view is a saved SQL query that acts like a table.

-- Create a view for high scorers
CREATE VIEW high_scorers AS
SELECT first_name, last_name, total_marks
FROM students
WHERE total_marks > 85;

-- Retrieve data from the view
SELECT * FROM high_scorers;

-- 2) Joined view :
DROP VIEW IF EXISTS student_course_details;
CREATE VIEW student_course_details AS
SELECT s.student_id, CONCAT(s.first_name, ' ', s.last_name) AS full_name,
       c.course_name, c.department, s.total_marks
FROM students s
JOIN courses c ON s.course_id = c.course_id;

SELECT * FROM student_course_details;















