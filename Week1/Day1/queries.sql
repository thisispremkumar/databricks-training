select * from Employee;

select name,salary from Employee;

--3. Select Employees who are older than 30
     select name from Employee
     where age > 30;
--4. Select names of all Departments
     select name from Department;

--5. Select Employess who work in the IT Department 
     select name from Employee where department_id=1;
            --(or)
           SELECT e.name
           FROM Employee e
           JOIN Department d
           ON e.department_id = d.department_id
           WHERE d.name = 'IT';
