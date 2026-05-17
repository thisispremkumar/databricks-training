--16. Find staff members earning more than the average salary of their department
select s.staff_name, s.salary, d.department_name from Staff s
join Department d on s.department_id = d.department_id
where s.salary > (select avg(s1.salary) from Staff s1
where s1.department_id = s.department_id);

--17. Display the second highest salary among staff members.
with highest_second as (
select s.staff_name, s.salary, DENSE_RANK() over (order by s.salary desc) as salary_rank from Staff s)
select s.staff_name, s.salary from highest_second s
where s.salary_rank = 2;

--18. Find students who scored the highest marks in each subject.
select s.student_name,m.marks,su.subject_name from Mark m
join Student s on m.student_id = s.student_id
join Subject su on m.subject_id = su.subject_id
where m.marks = (select max(marks) from Mark where subject_id = m.subject_id);

--(or)

with highest_marks as (
select student_id, marks, subject_id, DENSE_RANK() over (partition by subject_id order by m.marks desc) as rank from Mark m
)
select s.student_name,marks, su.subject_name from highest_marks
join Student s on highest_marks.student_id = s.student_id
join Subject su on highest_marks.subject_id = su.subject_id
where rank = 1;

--19. Display all students and their marks, including students without marks.
select s.student_name, m.marks from Student s
left join Mark m on s.student_id = m.student_id;

--20. Find subjects where the average marks are below 70.
with average_marks as (
select subject_id, avg(marks) over(partition by subject_id) as avg_marks from Mark
)
select s.subject_name, avg_marks from average_marks a
join Subject s on a.subject_id = s.subject_id
where avg_marks < 70;

--21. Display students ordered by CGPA in descending order.
select student_name,cgpa from Student
order by cgpa desc;

--22. Find the total salary expenditure department-wise.
select d.department_name, sum(salary) as total_salary from Staff s
left join Department d on s.department_id = d.department_id
group by d.department_name;

--23. Display departments where the total salary exceeds 200000.
select d.department_name, sum(salary) as total_salary from Staff s
join Department d on s.department_id = d.department_id
group by d.department_name
having sum(salary) > 200000;

--24. Find students admitted after 2021 and having CGPA above 7.5.
select student_name,admission_year,cgpa from Student
where admission_year>2021 and cgpa>7.5;

--25. Display the number of students admitted each year.
select admission_year, count(student_id) as total_students from Student
group by admission_year;

--26. Find the city with the maximum number of students.
with city_students as (
select city,count(student_id) as total_students from Student
group by city
)
select city,total_students from city_students
where total_students = (select max(total_students) from city_students);

--(or)

select top 1
city, count(student_id) as total_students from Student
group by city
order by total_students desc;

--27. Display all departments and their staff count, including empty departments.
select d.department_name, count(s.staff_id) as total_staff from Department d
left join Staff s on d.department_id = s.department_id
group by d.department_name;

--28. Find students who have failed in at least one subject (marks < 50).
select s.student_name, m.marks, su.subject_name from Student s
left join Mark m on s.student_id = m.student_id
join Subject su on m.subject_id = su.subject_id
where m.marks<50;

--29. Display staff hired before 2018.
select staff_name, hire_date from Staff where Year(hire_date) < 2018;

--30. Find departments where no staff salary is recorded as NULL.
select d.department_name from Department d
join Staff s on d.department_id = s.department_id
group by d.department_name
having count(s.staff_id) = count(s.salary);
