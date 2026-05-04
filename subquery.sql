-- sub query
-- query inside another query
-- NON - CORRELATED SUBQUERY

-- Find all orders where sales is greater than average sales.
SELECT *
FROM salesdb.orders
WHERE sales >
(SELECT
AVG(sales) AS AvgSales
FROM salesdb.orders
);


-- CORRELATED QUERY
-- Find orders where sales is greater than average sales of that same product

SELECT *
FROM salesdb.orders AS o
WHERE o.sales > (
SELECT 
AVG(sales)
FROM salesdb.orders
WHERE productid= o.productid
);

-- scaler subquery
SELECT 
AVG(sales)
FROM salesdb.orders;

-- use scaler subquery inside WHERE clause
SELECT *
FROM salesdb.orders
WHERE sales >
(SELECT 
AVG(sales)
FROM salesdb.orders);


-- Find the orders that have same (productid,sales) as a specific order.
--  ROW SUBQUERY

SELECT *
FROM salesdb.orders
WHERE (productid,sales)=
(
SELECT productid,sales
FROM salesdb.orders
WHERE orderid =3);

-- Table subquery
SELECT *
FROM
(
SELECT
productid,
SUM(sales) AS total_sales
FROM salesdb.orders
GROUP BY productid
) AS t
WHERE total_sales;


-- Find product where price is greater than query.



-- rank customer based on sum of sales
SELECT
t.customerid,
t.total_sales,
RANK() OVER(ORDER BY t.total_sales DESC )AS customer_rank
FROM (
SELECT
customerid,
SUM(Sales) AS total_Sales
FROM salesdb.orders
GROUP BY customerid
) AS t;