-- list all the unique countries where our customers are located. Ensure no country name is repeated.
SELECT  DISTINCT 
country
FROM customers ;

-- Find the names and salaries of the TOP 3 highest paid employees.

USE salesdb ;
SELECT *
FROM employees;

SELECT  
firstname,lastname,salary
FROM employees
ORDER BY salary  DESC
LIMIT 3;


USE salesdb;
SELECT country,
   COUNT( * ) AS Total_customers
FROM customers
WHERE score>=500
GROUP BY country;

-- Find the total salary budget for each department,but only show departments where total budget exceeds 100,000
SELECT department,
SUM(salary) AS Total_salary

FROM employees
GROUP BY department
HAVING SUM(salary)>100000;


-- For each country (excluding India) ,find the average customer score.Only return the top country with an average score higher than 300.
SELECT country,
AVG(score) as Average_customer_score
FROM customers
WHERE country !='India'
GROUP BY country 
HAVING AVG(score)>300;
