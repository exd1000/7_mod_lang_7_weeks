-- 📊 Week 4, Day 3 – SQL: Error Handling & Query Safety

-- CASE WHEN - Conditional logic in SQL
-- COALESCE - Default fallback values for NULLs
-- NULLIF - Avoiding divide-by-zero or unexpected errors
-- CHECK Constraints - Enforcing field validity at schema level
-- Transaction Safety - Preventing partial updates / errors




-- Exercise 1 – Use CASE WHEN
-- Write a query that returns "pass" if a score is ≥ 60 and "fail" otherwise.
-- Use sample table:
CREATE TABLE students (name TEXT, score INTEGER);
INSERT INTO students VALUES
('Alice', 92), ('Ben', 55), ('Cara', 70), ('Dan', 33);

SELECT name, score,
    CASE
        WHEN score >= 60 THEN 'pass'
        ELSE 'fail'
    END AS result
FROM students; 

-- Exercise 2 – Use COALESCE (returns the first non-NULL value in the list)
-- Given a table with nickname and username, return the nickname if present, otherwise fallback to username.


CREATE TABLE users(username TEXT NOT NULL, nickname TEXT); 
INSERT INTO users VALUES
  ('phoenix123', 'Nix'),
  ('sparkle42', NULL),
  ('coder_girl', 'Lex'),
  ('dinoKing', NULL);

SELECT COALESCE(nickname, username) as display_name
FROM users;


-- ⚠️ Important Notes
-- COALESCE returns the data type of the first non-NULL value
-- It short-circuits: stops evaluating after the first non-NULL match
-- Returns the first expr that is not NULL (from left to right).

-- Example 1: Fallback to username if nickname is NULL
--     SELECT COALESCE(nickname, username) AS display_name
--     FROM users;
-- Example 2: Replace NULL with a default value
--     SELECT COALESCE(phone_number, 'Not Provided') AS phone
--     FROM contacts;
--     If phone_number is NULL, you’ll see "Not Provided" instead.
-- Example 3: Multiple fallback values
--     COALESCE(nickname, display_name, 'Anonymous')
--     → This checks nickname, then display_name, and if both are NULL, returns "Anonymous".



-- Exercise 3 – Use NULLIF for Safe Division
-- Prevent divide-by-zero by using NULLIF.

CREATE TABLE grades(student TEXT, total_points INTEGER, num_assignments INTEGER);
INSERT INTO grades VALUES
  ('Alice', 450, 5),
  ('Ben', 390, 0),   -- division by zero risk
  ('Cara', 380, 4);

SELECT total_points / NULLIF(num_assignments,0) AS avg_score
FROM grades;


-- Exercise 4 – Add CHECK Constraint
-- Create a table that enforces a CHECK constraint where age must be ≥ 0.
-- Try inserting valid and invalid rows and capture the error.


CREATE TABLE people (
    name TEXT,
    age INTEGER CHECK (age >= 0)
);

INSERT INTO people VALUES ('Em', 27);
INSERT INTO people VALUES ('Eli',-2);

-- I keep forgetting the ; at the end sigh 🤦‍♀️



-- Exercise 5 – Safe Update with Transaction
-- Simulate an update that could fail mid-way. Use BEGIN, ROLLBACK, and COMMIT to ensure data safety.

CREATE TABLE accounts(user TEXT, balance INTEGER);
INSERT INTO accounts VALUES
  ('Alice', 500),
  ('Ben', 300);

BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE user = 'Alice';
ROLLBACK;
SELECT * FROM accounts;

-- 🧨 ROLLBACK
-- 	•	Cancels everything done since the BEGIN
-- 	•	Undoes all inserts, updates, deletes
-- 	•	Nothing gets saved
-- 🧠 Alice’s balance will stay the same — the update is discarded.


BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE user = 'Alice';
COMMIT;
SELECT * FROM accounts;


-- ✅ COMMIT
-- 	•	Confirms all changes
-- 	•	Makes them permanent in the database
-- 	•	Cannot be undone afterward (except via a manual undo/update)
-- 🧠 Alice’s balance is now actually reduced by 100 — this is real.


-- Use Case Tips
-- 	•	Use ROLLBACK when:
-- 	•	An error occurs (e.g., divide by zero, constraint fails)
-- 	•	You want to safely test or simulate an update
-- 	•	Use COMMIT when:
-- 	•	You’re sure the transaction should go through
-- 	•	All checks/validations have passed