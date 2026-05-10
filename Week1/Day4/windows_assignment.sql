-- 1. Use ROW_NUMBER() to assign a row number to employees ordered by salary descending.
SELECT 
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS RowNum,
    employee_name, 
    salary
FROM employees;

-- 2. Use RANK() to rank employees by salary.
SELECT 
    RANK() OVER (ORDER BY salary DESC) AS SalaryRank,
    employee_name, 
    salary
FROM employees;

-- 3. Use DENSE_RANK() to rank employees by salary.
SELECT 
    DENSE_RANK() OVER (ORDER BY salary DESC) AS SalaryDenseRank,
    employee_name, 
    salary
FROM employees;

-- 4. Find the top 3 highest-paid employees using a window function.
WITH RankedEmployees AS (
    SELECT 
        employee_id,
        employee_name,
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS SalaryRank
    FROM employees
)
SELECT * 
FROM RankedEmployees 
WHERE SalaryRank <= 3;

-- 5. Rank employees within each department using PARTITION BY.
SELECT 
    department,
    employee_name,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS DeptSalaryRank
FROM employees;

-- 6. Display the highest salary in each department using a window function.
SELECT 
    department,
    employee_name,
    salary,
    MAX(salary) OVER (PARTITION BY department) AS Highest_Department_Salary
FROM employees;

-- 7. Calculate the running total of order amounts ordered by order_date.
SELECT 
    order_date, 
    total_amount,
    SUM(total_amount) OVER(ORDER BY order_date) AS running_total_all
FROM orders;

-- 8. Calculate the cumulative sales amount for each employee.
SELECT 
    employee_id,
    order_date, 
    total_amount,
    SUM(total_amount) OVER(PARTITION BY employee_id ORDER BY order_date) AS running_total_per_employee
FROM orders;

-- 9 & 10. Use LAG() and LEAD() to show previous and next order amounts for each customer.
SELECT 
    customer_id,
    order_date,
    total_amount AS current_order_amount,
    LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_order_amount,
    LEAD(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS next_order_amount
FROM orders
ORDER BY customer_id, order_date;
