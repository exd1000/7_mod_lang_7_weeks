-- CASE WHEN: SQL's if/else
SELECT
  name,
  score,
  CASE
    WHEN score >= 90 THEN 'Top-tier'
    WHEN score >= 75 THEN 'Strong'
    WHEN score >= 50 THEN 'Average'
    ELSE 'Needs review'
  END AS rating
FROM test_results;





-- Filtering rows
SELECT * FROM test_results
WHERE score >= 60;




-- Ordering results
SELECT * FROM test_results
ORDER BY score DESC;




-- Aggregates 
SELECT AVG(score), MAX(score), COUNT(*) FROM test_results;




-- Sample Table 
CREATE TABLE test_results (
  name TEXT,
  score INT
);

INSERT INTO test_results (name, score) VALUES
('Alice', 89),
('Bob', 56),
('Charlie', 92),
('Diana', 33),
('Evan', 75),
('Fatima', 62);



/* Ex1: Basic Condition

Query all students with a score ≥ 60. 
*/ 


SELECT * FROM test_results
WHERE score >=60 



/* Ex2: Grading with CASE

Create a SELECT that includes:
	•	name, score, and grade using this logic:
	•	90+: “Top-tier”
	•	75–89: “Strong”
	•	50–74: “Average”
	•	Below 50: “Needs review”

*/ 


SELECT name, score, grade,
  CASE 
      WHEN score >= 90 THEN 'Top-tier'
      WHEN score >= 75 THEN 'Strong'
      WHEN score >= 50 THEN 'Average'
      ELSE 'Needs review'
 END AS grade
FROM test_results;
   
   
   
/* 
❌ Bug: You’re selecting grade before it’s defined.
🔧 Fix: Remove the grade from the SELECT line before the CASE:

SELECT name, score,
  CASE 
      WHEN score >= 90 THEN 'Top-tier'
      WHEN score >= 75 THEN 'Strong'
      WHEN score >= 50 THEN 'Average'
      ELSE 'Needs review'
  END AS grade
FROM test_results;
*/ 




      


/* Ex3: Order By Score

Show all rows with grade labels (as above), sorted highest to lowest score.
*/ 

SELECT * FROM test_results 
ORDER BY grade DESC;


/* 
❌ Bug: grade doesn’t exist in the base table — it’s a derived field.
🔧 Fix: Reuse your CASE WHEN from Ex2, like this:

SELECT name, score,
  CASE 
      WHEN score >= 90 THEN 'Top-tier'
      WHEN score >= 75 THEN 'Strong'
      WHEN score >= 50 THEN 'Average'
      ELSE 'Needs review'
  END AS grade
FROM test_results
ORDER BY score DESC;
✅ Now you’re sorting by score, which makes more sense for ranking.
*/








/* Ex4: Count By Grade

Use a subquery or GROUP BY to return:
*/ 

grade         | count
---------------------
Top-tier      | 1
Strong        | 2
Average       | 2
Needs review  | 1


SELECT COUNT(grade) FROM test_results;


/* 
But grade is a derived column — it doesn’t exist yet.

SELECT 
  CASE 
      WHEN score >= 90 THEN 'Top-tier'
      WHEN score >= 75 THEN 'Strong'
      WHEN score >= 50 THEN 'Average'
      ELSE 'Needs review'
  END AS grade,
  COUNT(*) AS count
FROM test_results
GROUP BY grade
ORDER BY count DESC;
*/ 







/* Ex5: Open-Ended Query

Write a query to return:
	•	Only the top 3 scorers
	•	Include name, score, and grade (same CASE logic)
*/ 



SELECT name, score, grade FROM test_results
ORDER BY score DESC 
LIMIT 3; 

/* 
❌ Same issue: grade isn’t a column in the table.
🔧 Fix: Add the CASE WHEN again

SELECT name, score,
  CASE 
      WHEN score >= 90 THEN 'Top-tier'
      WHEN score >= 75 THEN 'Strong'
      WHEN score >= 50 THEN 'Average'
      ELSE 'Needs review'
  END AS grade
FROM test_results
ORDER BY score DESC
LIMIT 3;

✅ This gives the correct top 3 scorers, each with a grade.

*/ 




