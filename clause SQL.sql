-- HAVING CLAUSE(when we want to  see countries who have more than 
SELECT
country,
COUNT(customerid) AS total
FROM customers
GROUP BY country
HAVING COUNT(customerid) > 2;

-- (when sum of score of counteries is greater then 900)
SELECT
 country,
 sum(score) 
FROM customers
GROUP BY country
HAVING sum(score) > 900;

SELECT 
 country,
 AVG(score) as avg_score
 FROM customers
 WHERE score!=0
 GROUP BY country
 HAVING AVG(score)> 430; 
 
 -- DISTINCT and TOP
 SELECT DISTINCT
 country
 FROM customers;
 
 -- LIMIT
 SELECT *
 FROM customers
 ORDER BY score DESC
 LIMIT 3;
 
 -- Q1. List all the unique countries where our customers are located. Ensure no country name is repeated.
 SELECT DISTINCT
   country
FROM customers;

-- Q2. Find the names and salaries of the Top 3 highest paid employees.
SELECT
firstname,
lastname,
salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- Q3. Fnd the total no. of customers for each country ,but only count customers who have a score of 500 or more.
SELECT
country,
COUNT(customerid) AS total_customers
FROM customers
WHERE score >= 500
GROUP BY country;

-- Q4. Find the total salary budget for each department ,but only show deparments where the total budget exceeds 100,000.
SELECT
department,
SUM(salary)
FROM employees
GROUP BY department
HAVING SUM(salary) > 100000;

-- Q5. For each country (excluding india),find the avg customer score .Only return the top country with an avg score higher than 300.
SELECT 
country,
AVG(score)  AS avg_score
FROM customers
WHERE country != 'india'
GROUP BY country
HAVING AVG(score) > 300
ORDER BY avg_score DESC
LIMIT 1;





-- Q1. Find the number of DISTINCT departments where employees earn more than 60000.
SELECT 
COUNT( DISTINCT department)
FROM employees
WHERE (salary) > 60000;

-- Q2. Find departments where the AVG salary is greater than 60000 - but only consider employees earning less than 80000 in the calculation.
SELECT 
department
FROM employees
WHERE (salary) < 80000
GROUP BY department
HAVING AVG(salary) > 60000;

-- Q3. Find each department 's highest salary with employees name.

SELECT department, firstname, lastname, salary
FROM employees e
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department = e.department
);

-- Q4.Find unique combinations of department and gender.
SELECT DISTINCT
department,
gender
FROM employees;

-- Q5. Find how many employees earn above the avg salary.
SELECT
COUNT(employeeid)
FROM employees
WHERE (salary) > (SELECT AVG(salary)
FROM employees);

-- Q6. Find the department with 2nd highest avg salary but only consider department -- where at least 2 employees earn more than 60000 and exclude Marketing --show department name only.

SELECT department
FROM employees
WHERE department != 'Marketing'
  AND salary > 60000
GROUP BY department
HAVING COUNT(employeeid) >= 2
ORDER BY AVG(salary) DESC
LIMIT 1, 1;