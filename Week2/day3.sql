/* tables behave like lists of dictionaries or arrays of objects 
	•	A table = a list of rows = like an array of dicts ([{...}, {...}])
	•	A row = one structured record
	•	A column = like a property in a dict or object
	•	A JOIN = like merging two arrays based on shared keys
*/

-- tables --

CREATE TABLE students (
  name TEXT,
  major TEXT,
  score INT
);

INSERT INTO students VALUES
('Alice', 'CS', 89),
('Bob', 'Bio', 56),
('Charlie', 'CS', 92),
('Diana', 'Math', 40);


-- basic SELECT -- 
SELECT * FROM students;


-- derived columns (like mapping or adding properties) -- 
SELECT name, score,
  CASE
    WHEN score >= 90 THEN 'Top-tier'
    WHEN score >= 75 THEN 'Strong'
    WHEN score >= 50 THEN 'Average'
    ELSE 'Needs review'
  END AS grade
FROM students;


-- filtering & GROUP BY (like using sets or keys) --
SELECT major, COUNT(*) FROM students GROUP BY major;


-- JOIN (like merging dictionaries or objects) --
SELECT s.name, s.major, a.advisor
FROM students s
JOIN advisors a ON s.major = a.major;


/* 
Exercise 1: Create a Table

Create a books table with:
	•	title, author, year, rating

Insert 4 records. 
*/ 

CREATE TABLE books (
    title TEXT,
    author TEXT, 
    year INT, 
    rating INT
); 

INSERT INTO books VALUES 
('TKAMB', 'Harper Lee', 1968, 3.5),
('Great Gatsby', 'Scott Fitz', 1963, 4.5),
('Meditations', 'Marcus Aurelius', 1300, 5),
('Junie B. Jones', 'Barbara Park', 2000, 2.5);


--  your rating column should be REAL instead of INT to allow decimals. -- 



/* 
Exercise 2: Select & Filter

Query all books with a rating ≥ 4.0. 
*/ 

-- SELECT *
-- CASE
--     WHEN rating >= 4
-- FROM books;


/* 
❌ Syntax is invalid — there’s no need for a CASE here.
🔧 Fix: Use simple WHERE clause
*/

SELECT * FROM books
WHERE rating >= 4.0;


/* 
Exercise 3: Derived Column (CASE WHEN)

Return:
	•	title, rating, and a new quality column:
	•	4.5+: “Excellent”
	•	3.5–4.4: “Good”
	•	Below 3.5: “Average”
*/ 

SELECT title, rating, 
CASE 
    WHEN rating >= 4.5 THEN 'Excellent'
    WHEN rating >= 3.5 THEN 'Good'
    WHEN rating < 3.5 THEN 'Average'
END AS quality
FROM books;



/* 
Exercise 4: GROUP BY & COUNT

Count how many books each author has in the table.
*/ 


SELECT author, COUNT(*) FROM books GROUP BY author 


/* 
Exercise 5: JOIN Challenge

Create another table given
Insert genres for 3 of your books.

Write a query that joins books and genres to print:
Title | Author | Genre
*/ 

CREATE TABLE genres (
  title TEXT,
  genre TEXT
);

INSERT INTO genres VALUES
('Great Gatsby','Classic'),
('Junie B. Jones', 'Fiction'),
('TKAMB', 'Classic');

SELECT b.title, b.author, g.genre
FROM books b
JOIN genres g ON b.title = g.title; 


-- 🧠 Practice Tips
-- 	•	Always end inserts with commas between rows
-- 	•	CASE is for creating new columns — not for filtering
-- 	•	Use LEFT JOIN to explore records that don’t match