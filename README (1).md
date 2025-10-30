# 🎓 College Management System (MySQL Project)

##  Project Overview

This project is a **College Management System Database** created using **MySQL**.  
It is designed to help students and beginners practice **core SQL concepts** — including table creation, relationships, joins, subqueries, and transactions — through a real-world-style database.

The project demonstrates how colleges manage data related to **students, courses, teachers, fees, and results**, and how these tables interact through relationships.

---

##  Database Structure

The database consists of **five main tables**:

| Table Name | Description |
|-------------|-------------|
| **students** | Contains student details such as name, gender, course, admission year, and marks |
| **courses** | Stores information about available courses, duration, and fees |
| **teachers** | Holds teacher details like department, salary, and hire date |
| **fees** | Tracks fee payments made by each student |
| **results** | Records student exam results, scores, and grades |

---

##  SQL Concepts Covered

### 🔹 DDL – *Data Definition Language*
Used to **define or modify** the database structure.

Commands covered:
```sql
CREATE DATABASE
CREATE TABLE
ALTER TABLE
DROP TABLE
RENAME TABLE
TRUNCATE TABLE
```

---

### 🔹 DML – *Data Manipulation Language*
Used to **insert, update, delete, and retrieve** data.

Commands covered:
```sql
INSERT INTO
UPDATE
DELETE
SELECT
```

Includes examples with:
- `WHERE`, `ORDER BY`, `GROUP BY`, `HAVING`, `IN`, `BETWEEN`, `LIKE`, `DISTINCT`
- Aggregates like `SUM()`, `AVG()`, `MAX()`, `COUNT()`

---

### 🔹 DCL – *Data Control Language*
Used to **control access** to database objects.

Commands covered:
```sql
CREATE USER
GRANT
REVOKE
```

Example:
```sql
GRANT SELECT, INSERT, UPDATE ON college_management.* TO 'college_user'@'localhost';
REVOKE DELETE ON college_management.* FROM 'college_user'@'localhost';
```

---

### 🔹 TCL – *Transaction Control Language*
Used to manage database transactions safely.

Commands covered:
```sql
START TRANSACTION
SAVEPOINT
ROLLBACK
COMMIT
```

Example:
```sql
START TRANSACTION;
DELETE FROM students WHERE total_marks < 70;
ROLLBACK;  -- Undo delete
COMMIT;    -- Save final changes
```

---

### 🔹 JOINS
Used to retrieve related data from multiple tables.

Types covered:
- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- `SELF JOIN`
- `FULL JOIN` *(simulated using UNION)*

Example:
```sql
SELECT s.first_name, c.course_name, c.department
FROM students s
JOIN courses c ON s.course_id = c.course_id;
```

---

### 🔹 SUBQUERIES
Queries inside another query for advanced filtering.

Example:
```sql
SELECT first_name, total_marks
FROM students
WHERE total_marks > (SELECT AVG(total_marks) FROM students);
```

---

### 🔹 UNION and UNION ALL
Used to combine results from multiple queries.

Example:
```sql
SELECT first_name AS name, 'Student' AS type FROM students
UNION
SELECT teacher_name AS name, 'Teacher' AS type FROM teachers;
```

---

### 🔹 VIEWS
Virtual tables created for frequently accessed queries.

Example:
```sql
CREATE VIEW student_course_view AS
SELECT s.first_name, s.last_name, c.course_name, c.department
FROM students s
JOIN courses c ON s.course_id = c.course_id;
```

---

##  Practice Queries Included
✅ Retrieve top 3 students by marks  
✅ Calculate average fee per department  
✅ Display students with pending fees  
✅ List teachers hired before 2020  
✅ Find total number of students in each course  
✅ Show students who scored above the overall average  
✅ Combine teacher and student names using UNION  

---

## ⚙️ How to Use

1. **Open MySQL Workbench** (or any SQL IDE)  
2. Run the file:
   ```sql
   SOURCE path_to_your/project.sql;
   ```
3. All tables, data, and queries will be created automatically.  
4. You can then modify, test, and run the included queries.

---

## 📂 Project Files

| File Name | Description |
|------------|-------------|
| `project.sql` | The main SQL script with DDL, DML, DCL, and all query examples |
| `README.md` | Documentation file (this one) describing the project and structure |

---

##  Learning Outcomes

By completing this project, you will:
- Understand how to design relational databases  
- Learn practical MySQL syntax and operations  
- Practice joins, subqueries, views, and constraints  
- Gain hands-on experience with real-world-style data modeling  

---

## 🧑‍💻 Author

**Ariyan Shaikh**  
📍 BSc IT Graduate | Passionate about SQL, Python & Data Projects  
📧 ariyanshaikh2004@gmail.com  

---

## ⭐ Contribute & Support

If you found this useful:
- Give this repo a ⭐ on GitHub  
- Fork it and try adding your own queries  
- Connect on LinkedIn or GitHub for collaborations!

---

> 💬 “Learning SQL is like learning to communicate with your data.”
