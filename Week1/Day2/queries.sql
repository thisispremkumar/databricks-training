--6. Select Employees whose name start with ‘J’ 
     select name from Employee
     where name like 'J%';

--7. Select Employees whose name end with ‘e’ 
     select name from Employee
     where name like '%e';
--8. Select Employees whose name contains ‘a’ 
     select name from Employee
    where name like '%a%';
--9. Select employees whose names are exactly 9 characters long.
     select name
     from Employee
     where name LIKE '_________';
--10. select employees whose names have ‘o’ as  the second character.
      select name
      from Employee
      where name LIKE '_o%';

--11. Select employees hired in the year 2020.
      select name,hire_date
      from Employee
      where YEAR(hire_date)=2020;

--12. Select employees hired in January of any year
      select name,hire_date
      from Employee 
      Where MONTH(hire_date)=1;

--13. Select employees hired before 2019.
      select name,hire_date
      from Employee
      where YEAR(hire_date)<2019;

--14. Select employees hired on or after March 1, 2021. 
      SELECT name,hire_date
      FROM Employee
      WHERE hire_date >= '2021-03-01';

--15. Select employees hired in the last 2 years
      select name,hire_date
      from Employee 
      where
      hire_date between '2020-01-1' and '2021-12-31';

--16. Select the total salary of all employees. 
      select sum(salary) as Total_salary
      from Employee;

--17.Select the average salary of employee. 
     select avg(salary) as avg_salary
     from Employee;

--18. Select the minimum salary in the Employee table. 
      select name, salary
      from Employee
      where salary = (select min(salary) from Employee);

--19. Select the number of employees in each department.
      select department_id, count(*) as employee_count
      from Employee
      group by department_id;

--20. Select the average salary of employees in each department. 
      select department_id,avg(salary) as avg_salary
      from Employee
      group by department_id;
