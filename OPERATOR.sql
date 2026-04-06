USE salesdb;
-- comparison operator

-- Equal oprator
SELECT *
FROM customers 
WHERE country = 'Germany';

-- NOt equal to
SELECT *
FROM customers
WHERE country != 'Germany';

-- Greater than
SELECT *;


-- Logical operator
-- AND
SELECT *
FROM customers
WHERE country = 'india' AND score > 800;

-- OR / either
SELECT *
FROM customers
WHERE country = 'india' OR score > 800;

-- NOT
SELECT *
FROM customers
WHERE NOT score < 500;

-- Range operator
-- BETWEEN
SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500;

SELECT *
FROM customers
WHERE score >= 100 AND score <= 500;

-- IN operator
SELECT *
FROM customers
WHERE country IN ('Germany','india','uk');
-- same thing can be done with or operator
 
 -- search operator
 -- LIKE
SELECT *
FROM customers
WHERE firstname LIKE 'M%';





