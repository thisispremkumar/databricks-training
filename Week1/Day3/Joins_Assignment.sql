-- 1. Display all students and the courses they are enrolled in, including those not enrolled.
select s.student_name,c.course_name from students s
Left JOIN enrollments e
ON e.student_id = s.student_id
Left JOIN courses c
ON e.course_id = c.course_id;

-- 2. Find all courses that currently have no students enrolled.
SELECT c.course_name from courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
WHERE e.student_id IS NULL;

-- 3. Display all instructors and the courses they teach, including instructors without courses.
SELECT i.instructor_name, c.course_name from instructors i
LEFT JOIN courses c ON i.instructor_id = c.instructor_id;

-- 4. Find all courses that do not have an instructor assigned.
SELECT course_name 
FROM courses
WHERE instructor_id IS NULL;

-- 5. Display all students and enrollment information using a RIGHT JOIN.
SELECT s.student_id, s.student_name, e.enrollment_id, e.course_id, e.enrollment_date
FROM enrollments e
RIGHT JOIN students s ON e.student_id = s.student_id;

-- 6. Find students who are not enrolled in any course.
SELECT s.student_name 
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

-- 7. Use a FULL OUTER JOIN to display all students and enrollments including unmatched rows.
SELECT s.student_id, s.student_name, e.enrollment_id, e.course_id
FROM students s
FULL OUTER JOIN enrollments e ON s.student_id = e.student_id;

-- 8. Find all courses that have never appeared in the enrollments table.
SELECT c.course_name 
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;

-- 9. Display all instructors and courses using FULL OUTER JOIN and identify unmatched rows.
SELECT i.instructor_name, c.course_name
FROM instructors i
FULL OUTER JOIN courses c 
ON i.instructor_id = c.instructor_id;

-- 10. Report showing: student name, course name, and instructor name (include unmatched).
SELECT 
    s.student_name, 
    c.course_name, 
    i.instructor_name 
FROM dbo.students s
LEFT JOIN dbo.enrollments e ON s.student_id = e.student_id
LEFT JOIN dbo.courses c ON e.course_id = c.course_id
LEFT JOIN dbo.instructors i ON c.instructor_id = i.instructor_id;
