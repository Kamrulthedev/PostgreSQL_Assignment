-- Active: 1729741556078@@127.0.0.1@5432@university_db

#### Query 1:
--### Table Creation
-- Create Students Table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    age INT CHECK (age > 0),
    email VARCHAR(255) UNIQUE NOT NULL,
    frontend_mark INT CHECK (frontend_mark >= 0),
    backend_mark INT CHECK (backend_mark >= 0),
    status VARCHAR(50)
);

-- Create Courses Table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,  
    course_name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0)
);

-- Create Enrollment Table
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id) ON DELETE CASCADE, 
    course_id INT REFERENCES courses(course_id) ON DELETE CASCADE 
);

--get all tables data
SELECT * FROM students;


--Insert a new student
INSERT INTO students(student_name, age, email, frontend_mark, backend_mark, status)
VALUES
('Hamim', 22, 'hamim@gmail.com', 85, 90, NULL),
('Kamim', 22, 'kamim@example.com', 85, 90, NULL),
('Rajjak', 22, 'rajjak@example.com', 85, 90, NULL),
('Helal', 22, 'helal@gmail.com', 85, 90, NULL);


--Insert a course data
INSERT INTO courses (course_name, credits)
VALUES
('Next.js', 3),
('React.js', 4),
('Next.js', 3),
('Next.js', 4),
('Software Engineering', 3);

--get all tables data
SELECT * FROM courses;

-- Enroll student
INSERT INTO enrollment (student_id, course_id)
VALUES (3, 4);

-- Check all enrollment data
SELECT * FROM enrollment;

#### Query 2:
-- Query to retrieve names of students enrolled in 'Next.js'
SELECT s.student_name
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Next.js';

#### Query 3:
-- Update the status of the student with the highest total (`frontend_mark + backend_mark`) to 'Awarded'.
UPDATE students
SET status = 'Awarded'
WHERE student_id = (
    SELECT student_id
    FROM students
    ORDER BY (frontend_mark + backend_mark) DESC
    LIMIT 1
);

#### Query 4:
-- Delete all courses that have no students enrolled
DELETE FROM courses
WHERE course_id IN (
    SELECT c.course_id
    FROM courses c
    LEFT JOIN enrollment e ON c.course_id = e.course_id
    WHERE e.student_id IS NULL
);

#### Query 5:
-- Retrieve names of students, limiting to 2, starting from the 3rd student
SELECT student_name
FROM students
ORDER BY student_id 
LIMIT 2 OFFSET 2;    

#### Query 6:
--Retrieve the course names and the number of students enrolled in each course.
SELECT c.course_name, COUNT(e.student_id) AS students_enrolled
FROM courses c
LEFT JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY c.course_name; 

#### Query 7:
--Calculate and display the average age of all students.
SELECT AVG(age) AS average_age
FROM students;


#### Query 8:
--Retrieve the names of students whose email addresses contain 'example.com'.
SELECT student_name
FROM students
WHERE email LIKE '%example.com%';



