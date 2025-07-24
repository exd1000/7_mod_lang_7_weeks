-- 🧠 Week 5 – Day 3: SQL – Functional Thinking in Query Composition

-- In SQL:
-- 	•	You describe what you want, not how to compute it.
-- 	•	You compose logic through nested queries, CTEs, and reusable views.
-- 	•	You chain transformations just like you would in functional programming (map, filter, reduce → SELECT, WHERE, GROUP BY).

-- Filter - WHERE
-- Map / Projection - SELECT col1, col2
-- Reduce - GROUP BY with SUM(), AVG(), etc.
-- Function call - UPPER(), ROUND(), DATE_TRUNC()
-- Composition - CTEs (WITH), subqueries 
-- View-like abstraction - CTEs, subqueries, and views


-- Composable / Declarative Query Logic
-- You can build queries like functional pipelines.
-- This is functionally equivalent to:
-- 	1.	Filtering → WHERE
-- 	2.	Mapping → SELECT with transformation
-- 	3.	Sorting → ORDER BY
SELECT 
  name,
  age,
  salary * 1.05 AS adjusted_salary
FROM employees
WHERE department = 'Engineering'
ORDER BY adjusted_salary DESC;


-- "Filter → transform → aggregate"
SELECT department, COUNT(*) AS total_high_earners
FROM (
  SELECT *
  FROM employees
  WHERE salary > 100000
) AS high_earners
GROUP BY department;


-- View-Based Abstraction
-- Think of a VIEW like a reusable named query – it’s modular and composable.
CREATE VIEW high_earners AS -- Define a view
SELECT name, salary
FROM employees
WHERE salary > 100000;

-- Use the view like a table
SELECT * FROM high_earners WHERE name ILIKE '%emily%'; 



-- CTEs – Common Table Expressions
-- These are temporary result sets (like functional blocks!) used to build up logic.
WITH avg_salaries AS (
  SELECT department, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department
)
SELECT e.name, e.salary, a.avg_salary
FROM employees e
JOIN avg_salaries a ON e.department = a.department;


-- Window Functions
-- Window functions let you calculate things across rows without collapsing them.
SELECT name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;

-- Other examples:
-- 	•	ROW_NUMBER()
-- 	•	SUM() OVER (...) ← rolling totals
-- 	•	LAG() / LEAD() ← access previous/next row


-- User-Defined Functions (UDFs)
-- In Postgres, you can define your own logic in SQL or PL/pgSQL:
CREATE FUNCTION double_salary(salary NUMERIC)
RETURNS NUMERIC AS $$
BEGIN
  RETURN salary * 2;
END;
$$ LANGUAGE plpgsql;

-- Usage:
SELECT name, double_salary(salary) FROM employees;



-- Create a View
-- Given a table employees(name, department, salary), 
-- create a view marketing_team with all employees in the Marketing department.
CREATE VIEW marketing_team AS
SELECT name, department, salary
FROM employees
WHERE department = 'Marketing';
-- Now try querying the view:
SELECT * FROM marketing_team;

-- Use a CTE
-- Write a query that calculates the average salary per department using a CTE, 
-- and returns employees whose salary is above their department’s average.
WITH dept_avg AS (
  SELECT department, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department
)
SELECT e.name, e.salary, e.department, d.avg_salary
FROM employees e
JOIN dept_avg d ON e.department = d.department
WHERE e.salary > d.avg_salary;

-- Window Function
-- List each employee and their rank within their department based on salary (highest = rank 1).
SELECT name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;


-- Composable Queries
-- First filter employees who make more than $90,000, then count how many are in each department.
SELECT department, COUNT(*) AS high_earner_count
FROM (
  SELECT * FROM employees WHERE salary > 90000
) AS high_earners
GROUP BY department;


-- Add a UDF (User-Defined Function)
-- Write a function that adds a 10% bonus to a salary.
CREATE FUNCTION add_bonus(salary NUMERIC)
RETURNS NUMERIC AS $$
BEGIN
  RETURN salary * 1.10;
END;
$$ LANGUAGE plpgsql;

-- Use it:
SELECT name, salary, add_bonus(salary) AS with_bonus FROM employees;




-- EXERCISES


CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name TEXT,
  age INT,
  country TEXT
);

CREATE TABLE purchases (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id),
  amount NUMERIC,
  created_at TIMESTAMP
);


-- Exercise 1 – Filter + Transform
-- Write a query to list all users from the US over age 30, showing their name and age.
SELECT name, age
FROM users
WHERE age > 30 AND country = 'US';

-- Exercise 2 – Grouping & Aggregation
-- For each country, show:
-- 	•	total number of users
-- 	•	average age

SELECT 
  country, 
  COUNT(*) as total_users,
  AVG(age) as avg_age
FROM users
GROUP BY country;



-- Exercise 3 – CTE Composition
-- Write a CTE that finds all users who made purchases over $100 total. 
-- Return their name, total amount spent, and number of purchases.
WITH user_spending AS (
  SELECT
    u.id AS user_id,
    u.name,
    SUM(p.amount) AS total_spent,
    COUNT(p.id) AS purchase_count
  FROM users u 
  JOIN purchases p on u.id = p.user_id
  GROUP BY u.id, u.name
)

SELECT
  name,
  total_spent,
  purchase_count
FROM user_spending
WHERE total_spent > 100;

-- Exercise 4 – Subquery Logic
-- List all users who made more than 3 purchases, using a subquery to count purchases per user.
SELECT name
FROM users
WHERE id IN (
  SELECT user_id
  FROM purchases 
  GROUP BY user_id
  HAVING COUNT(*) > 3
);


-- Exercise 5 – View-style Nesting
-- Write a layered query:
-- 	•	First: a subquery that calculates each user’s lifetime spend
-- 	•	Second: selects users whose lifetime spend is in the top 5
SELECT name, total_spent
FROM (
  SELECT 
    u.name,
    SUM(p.amount) AS total_spent
  FROM users u
  JOIN purchases p ON u.id = p.user_id
  GROUP BY u.name
  ORDER BY total_spent DESC
  LIMIT 5
) AS top_spenders;

-- You can turn that inner subquery into a view or wrap it as a CTE too.
-- The ORDER BY ... LIMIT clause must be outside the subquery in some SQL 
-- engines unless wrapped in a CTE or view.
-- To ensure universal compatibility:
-- Recommended rewrite:
-- WITH lifetime_spend AS (
--   SELECT 
--     u.name,
--     SUM(p.amount) AS total_spent
--   FROM users u
--   JOIN purchases p ON u.id = p.user_id
--   GROUP BY u.name
-- )
-- SELECT name, total_spent
-- FROM lifetime_spend
-- ORDER BY total_spent DESC
-- LIMIT 5;