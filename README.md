# Simple MySQL Joins Tutorial - Extended Examples

This repository contains simple and easy-to-understand MySQL examples for learning SQL joins, perfect for beginners.

## 🎯 What's New in This Extended Version

### Additional Tables:
- **students** - Student information with more sample data
- **courses** - Course catalog with instructors and fees  
- **enrollments** - Student-course relationships with grades
- **departments** - Department information with budgets
- **teachers** - Teacher information with salaries
- **employees** - Employee hierarchy for self-join examples

### More Sample Data:
- 10 students from different cities
- 8 courses with various instructors
- 15+ enrollment records with grades
- 6 departments with budgets
- 8 teachers with salary information
- Employee hierarchy data

## 📚 Simple Examples Included

### 1. Basic INNER JOINs
\`\`\`sql
-- Show students and their courses
SELECT s.student_name, c.course_name, e.grade
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id;
\`\`\`

### 2. Easy LEFT JOINs
\`\`\`sql
-- Find students without any courses
SELECT s.student_name, s.city
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;
\`\`\`

### 3. Simple RIGHT JOINs
\`\`\`sql
-- Show all enrollments with student details
SELECT s.student_name, e.grade, c.course_name
FROM students s
RIGHT JOIN enrollments e ON s.student_id = e.student_id
RIGHT JOIN courses c ON e.course_id = c.course_id;
\`\`\`

### 4. FULL OUTER JOIN (Using UNION)
\`\`\`sql
-- MySQL doesn't support FULL OUTER JOIN directly
-- We use UNION to combine LEFT and RIGHT joins
SELECT s.student_name, c.course_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id
UNION
SELECT s.student_name, c.course_name
FROM students s
RIGHT JOIN enrollments e ON s.student_id = e.student_id
RIGHT JOIN courses c ON e.course_id = c.course_id;
\`\`\`

### 5. SELF JOIN Examples
\`\`\`sql
-- Show employees and their managers
SELECT e.emp_name as employee, m.emp_name as manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;
\`\`\`

## 🚀 How to Run These Examples

### Step 1: Setup Database
\`\`\`sql
CREATE DATABASE school_db;
USE school_db;
\`\`\`

### Step 2: Run Scripts in Order
1. `01-create-simple-tables.sql` - Create all tables
2. `02-insert-more-sample-data.sql` - Insert sample data
3. `03-simple-inner-joins.sql` - Practice INNER JOINs
4. `04-simple-left-joins.sql` - Practice LEFT JOINs
5. `05-simple-right-joins.sql` - Practice RIGHT JOINs
6. `06-simple-full-outer-joins.sql` - Practice FULL OUTER JOINs
7. `07-simple-cross-joins.sql` - Practice CROSS JOINs
8. `08-simple-self-joins.sql` - Practice SELF JOINs
9. `09-simple-multiple-joins.sql` - Practice multiple table joins
10. `10-simple-practice-queries.sql` - Practice queries by difficulty
11. `11-simple-view-examples.sql` - Create and use views

## 📊 Sample Data Overview

### Students Table (10 records):
- Students from different cities (New York, Los Angeles, Chicago, etc.)
- Ages ranging from 19-23
- Complete contact information

### Courses Table (8 records):
- Various subjects (Math, Physics, Chemistry, Biology, etc.)
- Different instructors and credit hours
- Course fees ranging from $300-$700

### Enrollments Table (15+ records):
- Student-course relationships
- Grades (A, B, C)
- Enrollment dates

### Departments Table (6 records):
- Different academic departments
- Budget information
- Building locations

### Teachers Table (8 records):
- Teacher information with salaries
- Department assignments
- Hire dates

## 🎓 Learning Path

### Beginner Level:
1. Start with simple SELECT statements
2. Practice basic INNER JOINs
3. Learn LEFT JOINs to find missing data

### Intermediate Level:
4. Use RIGHT JOINs and understand the difference
5. Practice CROSS JOINs (carefully!)
6. Learn SELF JOINs with employee-manager examples

### Advanced Level:
7. Combine multiple tables in single queries
8. Use aggregate functions with JOINs
9. Create and use VIEWs
10. Optimize queries for better performance

## 💡 Key Learning Points

### MySQL-Specific Notes:
- MySQL uses `AUTO_INCREMENT` for auto-incrementing primary keys
- MySQL doesn't support `FULL OUTER JOIN` directly - use `UNION`
- Use `DECIMAL(precision, scale)` for monetary values
- Date format: 'YYYY-MM-DD'

### Best Practices:
- Always use table aliases (s, c, e, etc.)
- Include proper WHERE clauses to avoid Cartesian products
- Use meaningful column names in results
- Group related queries together
- Comment your SQL code

## 🔧 Tools Recommended

- **MySQL Workbench** - Visual database design and query tool
- **phpMyAdmin** - Web-based MySQL administration
- **MySQL Command Line** - Direct database access
- **DB Browser for SQLite** - Alternative for SQLite practice

