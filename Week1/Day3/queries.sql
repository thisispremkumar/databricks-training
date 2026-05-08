-- Create Department table
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Create Employee table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    salary DECIMAL(10, 2),
    department_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Create Project table
CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Insert data into Department table
INSERT INTO Department (department_id, name) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing');

-- Insert data into Employee table
INSERT INTO Employee (emp_id, name, age, salary, department_id, hire_date) VALUES
(1, 'John Doe', 28, 50000.00, 1, '2020-01-15'),
(2, 'Jane Smith', 34, 60000.00, 2, '2019-07-23'),
(3, 'Bob Brown', 45, 80000.00, 1, '2018-02-12'),
(4, 'Alice Blue', 25, 45000.00, 3, '2021-03-22'),
(5, 'Charlie P.', 29, 50000.00, 2, '2019-12-01'),
(6, 'David Green', 38, 70000.00, 4, '2022-05-18'),
(7, 'Eve Black', 40, 55000.00, 3, '2021-08-30');

-- Insert data into Project table
INSERT INTO Project (project_id, name, department_id) VALUES
(1, 'Project Alpha', 1),
(2, 'Project Beta', 2),
(3, 'Project Gamma', 1),
(4, 'Project Delta', 3),
(5, 'Project Epsilon', 4),
(6, 'Project Zeta', 4),
(7, 'Project Eta', 3);


-- Insert additional data into Department table (if needed)
-- No additional departments needed for this data set

-- Insert additional data into Employee table to test edge cases for joins and nested queries
INSERT INTO Employee (emp_id, name, age, salary, department_id, hire_date) VALUES
(8, 'Frank White', 32, 48000.00, NULL, '2021-07-10'),  -- Employee without a department
(9, 'Grace Kelly', 27, 65000.00, 1, '2018-11-13'),
(10, 'Hannah Lee', 30, 53000.00, 4, '2020-02-25');

-- Insert additional data into Project table to test edge cases for joins
INSERT INTO Project (project_id, name, department_id) VALUES
(8, 'Project Theta', 1),
(9, 'Project Iota', NULL);  -- Project without a department

--21. Select the total salary for each department.
      select d.name, SUM(e.salary) as total_salary
      from Employee e
      join Department d
      on e.department_id = d.department_id
      group by d.name;
--22. Select the average age of employees in each department.
      select d.name, avg(e.age) as avg_age
      from Employee e join Department d
      on e.department_id=d.department_id
      group by d.name;

--23. Select the number of employees hired in each year. 
      select YEAR(hire_date) as Year,count(*) as no_of_emps from Employee e
      group by YEAR(hire_date);

--24. Select the highest salary in each department.
      select d.name,MAx(salary) from Employee e join Department d on d.department_id=e.department_id
      group by d.name;

--25. Select the department with the highest average salary. 
      select d.name, avg(e.salary) as avg_salary from Employee e
      join Department d on e.department_id = d.department_id
      group by d.name;

--26. Select departments with more than 2 employees. 
select d.name from Employee e
Join Department d
on e.department_id = d.department_id
group by d.name
having count(*)>2;

--27. Select departments with an average salary grester than 55000.
select d.name from Employee e
Join Department d
on e.department_id = d.department_id
group by d.name
having avg(e.salary)>50000;

--28. Select years with more than 1 employee hired. 
select Year(hire_date) as YEAR, count(*) as Hired from Employee e
group by Year(hire_date)
having count(*)>1;

--29. Select departments with a total salary expense less than 100000. 
select d.name, sum(e.salary) as Salary from Employee e
Join Department d
on e.department_id = d.department_id
group by d.department_id
having sum(e.salary)<100000;

--30. Select departments with the maximum salary 75000.
select d.name, max(e.salary) as Salary from Employee e
Join Department d
on e.department_id = d.department_id
group by d.department_id
having max(e.salary)=75000;

--31. Select all employees ordered by their salary in ascending order.
select e.name, e.salary as Salary from Employee e
order by e.salary;

--32. Select all employees ordered by their age in descending order.
select e.name, e.age as AGE from Employee e
order by e.age DESC;

--33. Select all employees ordered by their hire date in ascending order
select e.name, e.hire_date as DATE from Employee e
order by e.hire_date;

--34. Select employees ordered by their department and then by their salary
select e.name, d.name, e.salary from Employee e
Join Department d
on e.department_id = d.department_id
order by d.name, e.salary;

--35. Select departments ordered by the total salary of their employees.
select d.name, sum(e.salary) as total_salary from Employee e
Join Department d
on e.department_id = d.department_id
group by d.name
order by sum(e.salary);
