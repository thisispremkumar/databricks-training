# Day 2: Advanced SQL Query Practice

Welcome to Day 2 of Databricks Training!  
Today’s focus is on practicing advanced SQL queries using the Employee table. The exercises below cover pattern matching, filtering dates, and working with aggregate functions.

## Exercises Covered

1. **Select Employees whose name starts with ‘J’:**
   ```sql
   select name from Employee where name like 'J%';
   ```

2. **Select Employees whose name ends with ‘e’:**
   ```sql
   select name from Employee where name like '%e';
   ```

3. **Select Employees whose name contains ‘a’:**
   ```sql
   select name from Employee where name like '%a%';
   ```

4. **Select employees whose names are exactly 9 characters long:**
   ```sql
   select name from Employee where name LIKE '_________';
   ```

5. **Select employees whose names have ‘o’ as the second character:**
   ```sql
   select name from Employee where name LIKE '_o%';
   ```

6. **Select employees hired in the year 2020:**
   ```sql
   select name, hire_date from Employee where YEAR(hire_date)=2020;
   ```

7. **Select employees hired in January of any year:**
   ```sql
   select name, hire_date from Employee where MONTH(hire_date)=1;
   ```

8. **Select employees hired before 2019:**
   ```sql
   select name, hire_date from Employee where YEAR(hire_date)<2019;
   ```

9. **Select employees hired on or after March 1, 2021:**
   ```sql
   SELECT name, hire_date FROM Employee WHERE hire_date >= '2021-03-01';
   ```

10. **Select employees hired in the last 2 years (2020-01-01 to 2021-12-31):**
    ```sql
    select name, hire_date from Employee where hire_date between '2020-01-01' and '2021-12-31';
    ```

11. **Select the total salary of all employees:**
    ```sql
    select sum(salary) as Total_salary from Employee;
    ```

12. **Select the average salary of employees:**
    ```sql
    select avg(salary) as avg_salary from Employee;
    ```

13. **Select the minimum salary in the Employee table:**
    ```sql
    select name, salary from Employee where salary = (select min(salary) from Employee);
    ```

14. **Select the number of employees in each department:**
    ```sql
    select department_id, count(*) as employee_count from Employee group by department_id;
    ```

15. **Select the average salary of employees in each department:**
    ```sql
    select department_id, avg(salary) as avg_salary from Employee group by department_id;
    ```

---

Explore each query and try to understand the use of SQL filters, wildcards, date functions, and aggregation. Practice modifying the queries as exercises for deeper understanding!

## File Reference

- [queries.sql](./queries.sql) — Contains all the queries listed above.

---

Happy querying!
````
