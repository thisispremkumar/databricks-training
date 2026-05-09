select s.student_name,c.course_name from students s
Left JOIN enrollments e
ON e.student_id = s.student_id
Left JOIN courses c
ON e.course_id = c.course_id

