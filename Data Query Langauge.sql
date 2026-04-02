-- DQL 
-- SELECT and FROM
USE salesdb;

SELECT*
FROM customers;

SELECT
firstname,
country,
score
FROM customers;

-- WHERE CLAUSE
SELECT
score
FROM customers
WHERE country='India';

-- Sort your data
-- ASC and DESC
SELECT*
FROM customers
ORDER BY score DESC;

SELECT*
FROM customers
ORDER BY score ASC;

-- NESTED SORTING
SELECT*
FROM customers
ORDER BY
     firstname ASC,
     score DESC;
     
-- GROUP BY
SELECT
country,
sum(score)
FROM customers
GROUP BY country;

SELECT
country,
sum(score)
FROM customers
GROUP BY country;

SELECT 
    country,
    sum(score) as total_score,
    count(*) as total_customers
FROM customers
GROUP BY country;