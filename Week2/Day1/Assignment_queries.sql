--Convert emp_name to proper case ---upper
select UPPER(emp_name) as emp_name, department, base_salary, bonus, joining_date from employee_payments;

--Convert emp_name to proper case ---lower
select LOWER(emp_name) as emp_name, department, base_salary, bonus, joining_date from employee_payments;

--Calculate total income = base_salary + bonus (NULL safe)
select emp_name, department, base_salary, bonus, joining_date,sum(base_salary + isnull(bonus, 0)) as total_compensation from employee_payments group by emp_name, department, base_salary, bonus, joining_date;

--Round total income to nearest integer
select emp_name, department, base_salary, bonus, joining_date,round(base_salary + isnull(bonus, 0),0) as total_compensation from employee_payments group by emp_name, department, base_salary, bonus, joining_date;

--Extract joining year
select Year(joining_date) as joining_year, emp_name from employee_payments;

/*· Use CASE to classify:
o Senior if experience > 7 years
o Mid if between 4 and 7
o Junior otherwise
*/
select emp_name, department,joining_date,
case
when Year(joining_date) < 2019 then 'Senior'
when Year(joining_date) >= 2019 and Year(joining_date) < 2023 then 'Mid-level'
else 'Junior'
end
as experience_level
from employee_payments;
