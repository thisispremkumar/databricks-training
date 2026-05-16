--1. List all students along with their department names
select s.student_name, d.department_name from Student s
Join Department d on s.department_id = d.department_id

--2. Display all staff members and their department names, including staff without departments.
select st.staff_name, d.department_name from Staff st
Left Join Department d on st.department_id = d.department_id

--3. Find all departments that currently have no students assigned.
select d.department_name from Department d
left Join Student s on d.department_id = s.department_id
where s.student_id is null;

--4. Show students who do not have any marks recorded.
select s.student_name from Student s
left join Mark m on s.student_id = m.student_id
where m.marks is null;

--Display subjects that are not assigned to any staff member.
select s.subject_name from Subject s
left join Staff st on s.staff_id = st.staff_id
where s.staff_id is null;

--Find the average CGPA department-wise.
select avg(s.cgpa) as average_cgpa, d.department_name from Student s
join Department d on s.department_id = d.department_id
group by d.department_name;

--7. Display departments where the average CGPA is greater than 8.0.
select avg(s.cgpa) as average_cgpa, d.department_name from Student s
join Department d on s.department_id = d.department_id
group by d.department_name
having avg(s.cgpa) > 8.0;

--8. Find the total number of students in each department.
select count(s.student_id) as total_students, d.department_name from Student s
join Department d on s.department_id = d.department_id
group by d.department_name;

--9. Display the highest and lowest marks scored in each subject.
select min(m.marks) as minimum_marks, max(m.marks) as maximum_marks, s.subject_name from Mark m
join Subject s on m.subject_id = s.subject_id
group by s.subject_name;

--10. Find students who scored more than 90 in any exam.
select s.student_name, max(m.marks) as highest_marks from Mark m
join Student s on m.student_id=s.student_id
where m.marks>90
group by s.student_name;

--11. Display the names of students who belong to the Computer Science department.
select s.student_name from Student s
join Department d on s.department_id = d.department_id
where d.department_name='Computer Science';

--12. Find the number of subjects handled by each staff member.
select s.staff_name, count(su.subject_id) as total_subjects from Staff s
left join Subject su on s.staff_id = su.staff_id
group by s.staff_name;

--13. Display students along with the total marks they obtained across all subjects.
select s.student_name, sum(m.marks) as total_marks from Mark m
left join Student s on m.student_id = s.student_id
group by s.student_name;

--14. Find departments with more than 2 staff members.
select d.department_name, count(s.department_id) as total_staff from Department d
left join Staff s on d.department_id = s.department_id
group by d.department_name
having count(s.department_id) > 2;

--15. Display students whose CGPA is above the average CGPA.
select s.student_name, s.cgpa from Student s
where s.cgpa > (select avg(s2.cgpa) from Student s2);

