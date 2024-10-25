# University Database Management System

## Description

This project is a simple database management system for a university that utilizes PostgreSQL. It includes functionalities to manage students, courses, and enrollments, allowing users to perform various operations such as creating, reading, updating, and deleting data.

## Features

- **Student Management**: Add, update, and delete student records.
- **Course Management**: Add, update, and delete courses.
- **Enrollment Management**: Enroll students in courses and manage enrollments.
- **Query Capabilities**: Retrieve data with various queries, including counts, averages, and filters.

## Database Setup

1. Install PostgreSQL on your system if not already installed.
2. Create a new database titled `university_db`.

## Tables

### Students Table

- `student_id (Primary Key)`: Integer, unique identifier for students.
- `student_name`: String, representing the student's name.
- `age`: Integer, indicating the student's age.
- `email`: String, storing the student's email address.
- `frontend_mark`: Integer, indicating the student's frontend assignment marks.
- `backend_mark`: Integer, indicating the student's backend assignment marks.
- `status`: String, storing the student's result status.

### Courses Table

- `course_id (Primary Key)`: Integer, unique identifier for courses.
- `course_name`: String, indicating the course's name.
- `credits`: Integer, signifying the number of credits for the course.

### Enrollment Table

- `enrollment_id (Primary Key)`: Integer, unique identifier for enrollments.
- `student_id (Foreign Key)`: Integer, referencing `student_id` in the "Students" table.
- `course_id (Foreign Key)`: Integer, referencing `course_id` in the "Courses" table.

## Queries

- **Retrieve student names with specific criteria.**
- **Calculate averages and totals.**
- **Update and delete records as needed.**

## Questions and Answers

1. **What is PostgreSQL?**
   PostgreSQL is a powerful, open-source relational database management system (RDBMS) designed to handle a wide range of workloads, from small single-machine applications to large internet-facing applications. It is known for its robustness, extensibility, and compliance with SQL standards.

2. **What is the purpose of a database schema in PostgreSQL?**
   A database schema is a blueprint of how the database is structured. It defines the tables, the fields in each table, the relationships between tables, and other database objects. Schemas help organize database objects and manage permissions and security.

3. **Explain the primary key and foreign key concepts in PostgreSQL.**

   - A **primary key** is a unique identifier for each record in a table, ensuring that no two rows can have the same primary key value.
   - A **foreign key** is a field (or a collection of fields) in one table that uniquely identifies a row in another table. It creates a relationship between the two tables, enforcing referential integrity.

4. **What is the difference between the VARCHAR and CHAR data types?**

   - **VARCHAR** (variable character) is a data type that allows for strings of variable length. It uses only as much space as needed.
   - **CHAR** (character) is a fixed-length data type. If the input string is shorter than the specified length, it is padded with spaces.

5. **Explain the purpose of the WHERE clause in a SELECT statement.**
   The `WHERE` clause filters records returned by a `SELECT` statement, allowing only those that meet specified conditions to be included in the result set.

6. **What are the LIMIT and OFFSET clauses used for?**
   The `LIMIT` clause restricts the number of rows returned by a query, while the `OFFSET` clause skips a specified number of rows before starting to return rows from the query result. This is useful for pagination.

7. **How can you perform data modification using UPDATE statements?**
   The `UPDATE` statement modifies existing records in a table. You specify the table to update, the columns to change, and a `WHERE` clause to define which records should be updated.

   ```sql
   UPDATE table_name
   SET column1 = value1, column2 = value2
   WHERE condition;

   ```

8. **What is the significance of the JOIN operation, and how does it work in PostgreSQL?**
   The JOIN operation combines rows from two or more tables based on related columns between them. This allows for retrieving related
   data from multiple tables in a single query. Common types of joins include `INNER` `JOIN`, `LEFT` `JOIN`, `RIGHT` `JOIN`, and `FULL` `JOIN`.

9. **Explain the GROUP BY clause and its role in aggregation operations.**
   The `GROUP` BY clause groups rows that have the same values in specified columns into summary rows. It is often used with aggregate functions (like `COUNT`, `SUM`, `AVG`) to perform calculations on each group.

10. **How can you calculate aggregate functions like COUNT, SUM, and AVG in PostgreSQL?**
    Aggregate functions can be applied to a set of values to return a single value. For example:

```bash
SELECT COUNT(*), SUM(column_name), AVG(column_name)
FROM table_name
GROUP BY group_column;
```

11. **What is the purpose of an index in PostgreSQL, and how does it optimize query performance?**
    An index improves the speed of data retrieval operations on a database table by providing a quick lookup capability. It allows the database engine to find rows faster without scanning the entire table, optimizing query performance.

12. **Explain the concept of a PostgreSQL view and how it differs from a table.**
    A view is a virtual table based on the result of a SQL query. It does not store data itself but presents data from one or more tables. Views can simplify complex queries and provide a layer of security by restricting access to specific rows and columns. Unlike a table, views do not store physical data but rather query the underlying tables each time they are accessed.

## Installation

1.  Clone the repository:

```bash
   https://github.com/Kamrulthedev/PostgreSQL_Assignment
   cd university_db
```

2. Open your PostgreSQL client and execute the SQL scripts provided in the repository to set up the database and tables.