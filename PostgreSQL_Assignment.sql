-- Active: 1729741556078@@127.0.0.1@5432@university_db

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
VALUES (1, 1);

-- Check all enrollment data
SELECT * FROM enrollment;


-- Query to retrieve names of students enrolled in 'Next.js'
SELECT s.student_name
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Next.js';
