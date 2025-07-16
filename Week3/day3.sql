-- In SQL, we treat tables as if they were flat files:
-- 	•	Like CSV: each row = a record
-- 	•	Like JSON: derived columns = key/value logic

-- If you’re using PostgreSQL:
-- Simulating a table loaded from a file



-- Exercise 1: Read + Filter
-- Use SELECT to filter from a “scores.txt” style table:
CREATE TABLE scores (
  value INT
);

INSERT INTO scores (value) VALUES
(92), (45), (88), (51), (33);



SELECT value FROM scores
WHERE value >= 50;



-- Exercise 2: Simulate File Read + Tag
-- Given a “fields.txt” style table
-- Query to return:
  -- Field: AI
  -- Field: Cognitive Science

-- Use string concatenation with ||.

CREATE TABLE fields (
  name TEXT
);

INSERT INTO fields (name) VALUES
('AI'), ('Cognitive Science'), ('Data Science'), ('Philosophy');



SELECT 
  'Field: ' || name 
FROM fields; 



--  Exercise 3: Simulate Dictionary Export
--  Query to output:
--   VS Code is an Editor
--   Python is a Language

CREATE TABLE tools (
  tool TEXT,
  role TEXT
);

INSERT INTO tools VALUES
('VS Code', 'Editor'),
('Python', 'Language'),
('Notion', 'Notes');



SELECT
  tool || ' is a ' || role
FROM tools;



-- Exercise 4: JSON Export Emulation
-- Given a student table 
-- Simulate a JSON string

CREATE TABLE student (
  name TEXT,
  score INT,
  major TEXT
);

INSERT INTO student VALUES ('Alice', 89, 'CS');



SELECT 
  '{ "name": "' || name || '", "score": ' || score || ', "major": "' || major || '"}' AS json
FROM student;


	-- •	SQL strings are wrapped in '...'
	-- •	JSON keys/values should use " — which is totally okay inside a SQL string
	-- •	Text values like "name" and "major" also need to be wrapped in double quotes



-- Exercise 5: Open-Ended Filtered Join
-- Create table.
-- Write a query that:
-- 	•	Filters idea containing “memory” or “learning”
-- 	•	Returns only matching rows
-- Use ILIKE or SIMILAR TO.

CREATE TABLE research (
  id SERIAL PRIMARY KEY,
  idea TEXT
);

INSERT INTO research (idea) VALUES
('Eye-tracking in learning'), 
('Memory modeling'), 
('Noise robustness'), 
('Visual cortex decoding');


SELECT * 
FROM research
WHERE LOWER(idea) LIKE '%memory%' OR LOWER(idea) LIKE '%learning%';

-- POSTGRESQL ONLY:
  -- SELECT * 
  -- FROM research
  -- WHERE idea ILIKE '%memory%' OR  idea ILIKE '%learning%';



  -- SELECT * 
  -- FROM research 
  -- WHERE idea SIMILAR TO '%(memory|learning)%';
