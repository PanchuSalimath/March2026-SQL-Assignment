-- SELECT e.emp_id, e.emp_name, d.dept_name
-- FROM employees e
-- INNER JOIN departments d
--     ON e.dept_id = d.dept_id

-----------------------------------------------------------------------------------------------------------------------------------------------------
--Basic INNER JOIN

-- SELECT e.emp_id, e.emp_name, d.dept_name
-- from employees e
-- left join departments d
--     on e.dept_id = d.DEPT_ID
-- order by e.emp_id;

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- LEFT OUTER JOIN (all employees)

-- SELECT e.emp_id, e.emp_name, d.dept_name
-- FROM employees e
-- LEFT JOIN departments d
--     ON e.dept_id = d.dept_id
-- ORDER BY e.emp_id;

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- RIGHT OUTER JOIN (all departments)

-- SELECT d.dept_id, d.dept_name, e.emp_name
-- FROM employees e
-- RIGHT JOIN departments d
--     ON e.dept_id = d.dept_id
-- ORDER BY d.dept_id, e.emp_name;

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- FULL OUTER JOIN

-- SELECT e.emp_name, d.dept_name
-- FROM employees e
-- FULL OUTER JOIN departments d
--     ON e.dept_id = d.dept_id
-- ORDER BY d.dept_name, e.emp_name;

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Employees with no matching department

-- SELECT e.emp_id, e.emp_name, e.dept_id
-- FROM employees e
-- LEFT JOIN departments d
--     ON e.dept_id = d.dept_id
-- WHERE d.dept_id IS NULL;

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Departments with no employees

-- SELECT d.dept_id, d.dept_name
-- FROM departments d
-- LEFT JOIN employees e
--     ON d.dept_id = e.dept_id
-- WHERE e.emp_id IS NULL;

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- INNER JOIN with filter on location

-- SELECT e.emp_name, d.dept_name, d.location
-- FROM employees e
-- JOIN departments d
--     ON e.dept_id = d.dept_id
-- WHERE d.location = 'Bengaluru';

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Count employees per department (including empty departments)

-- SELECT d.dept_id,
--        d.dept_name,
--        COUNT(e.emp_id) AS employee_count
-- FROM departments d
-- LEFT JOIN employees e
--     ON d.dept_id = e.dept_id
-- GROUP BY d.dept_id, d.dept_name
-- ORDER BY d.dept_id;

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Average salary per department

-- SELECT d.dept_name,
--        ROUND(AVG(e.salary), 2) AS avg_salary
-- FROM departments d
-- LEFT JOIN employees e
--     ON d.dept_id = e.dept_id
-- GROUP BY d.dept_name
-- ORDER BY d.dept_name;

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- Show 'No Department' for NULL joins

-- SELECT e.emp_name,
--        NVL(d.dept_name, 'No Department') AS dept_label
-- FROM employees e
-- LEFT JOIN departments d
--     ON e.dept_id = d.dept_id
-- ORDER BY e.emp_id;

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- Employees hired after 2023 with department names

-- SELECT e.emp_name, e.hire_date, d.dept_name
-- FROM employees e
-- LEFT JOIN departments d
--     ON e.dept_id = d.dept_id
-- WHERE e.hire_date >= DATE '2023-01-01'
-- ORDER BY e.hire_date;

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- Departments having at least 2 employees

-- SELECT d.dept_name, COUNT(*) AS emp_count
-- FROM departments d
-- JOIN employees e
--     ON d.dept_id = e.dept_id
-- GROUP BY d.dept_name
-- HAVING COUNT(*) >= 2;

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Employee count + total salary by department

-- SELECT d.dept_name,
--        COUNT(e.emp_id) AS emp_count,
--        SUM(e.salary) AS total_salary
-- FROM departments d
-- LEFT JOIN employees e
--     ON d.dept_id = e.dept_id
-- GROUP BY d.dept_name
-- ORDER BY d.dept_name;

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- Use COALESCE for salary display

-- SELECT e.emp_name,
--        COALESCE(TO_CHAR(e.salary), 'Salary Missing') AS salary_text,
--        d.dept_name
-- FROM employees e
-- LEFT JOIN departments d
--     ON e.dept_id = d.dept_id;

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- Find employees in departments located in Mumbai or Delhi

-- SELECT e.emp_name, d.dept_name, d.location
-- FROM employees e
-- JOIN departments d
--     ON e.dept_id = d.dept_id
-- WHERE d.location IN ('Mumbai', 'Delhi');

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- Sort by department then highest salary

-- SELECT d.dept_name, e.emp_name, e.salary
-- FROM departments d
-- LEFT JOIN employees e
--     ON d.dept_id = e.dept_id
-- ORDER BY d.dept_name, e.salary DESC NULLS LAST;

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- Anti-join style using NOT EXISTS (departments without employees)

-- SELECT d.dept_id, d.dept_name
-- FROM departments d
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM employees e
--     WHERE e.dept_id = d.dept_id
-- );

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- Join with computed bucket (high/medium/low salary)

-- SELECT e.emp_name,
--        d.dept_name,
--        CASE
--            WHEN e.salary >= 80000 THEN 'High'
--            WHEN e.salary >= 50000 THEN 'Medium'
--            WHEN e.salary IS NULL THEN 'Unknown'
--            ELSE 'Low'
--        END AS salary_band
-- FROM employees e
-- LEFT JOIN departments d
--     ON e.dept_id = d.dept_id;

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- Count NULL department employees via join result

-- SELECT COUNT(*) AS no_dept_employees
-- FROM employees e
-- LEFT JOIN departments d
--     ON e.dept_id = d.dept_id
-- WHERE d.dept_id IS NULL;

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- CROSS JOIN (all combinations)

-- SELECT d.dept_name, e.emp_name
-- FROM departments d
-- CROSS JOIN employees e;