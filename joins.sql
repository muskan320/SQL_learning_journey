-- joins
 USE salesdb;
 -- No joins
 SELECT *
 FROM customers;
 
 SELECT *
 FROM products;
 
 -- INNER JOIN
 SELECT
 customers.firstname,   -- ambiguity situation
 employees.department
 FROM customers
 INNER JOIN  employees
 ON customerid = employeeid;
 
 
 SELECT *
 FROM customers c
 INNER JOIN orders o
 ON c.customerid = o.orderid;
 
 -- column selection
 SELECT
    c.firstname,
    o.sales
 FROM customers c
 INNER JOIN orders o 
 ON c.customerid = o.orderid; 
 
 
 -- LEFT JOIN
 -- Q get all customers along with there orders including those without orders
 
 SELECT 
   c.customerid,
   c.firstname,
   o.sales
 FROM customers AS c
 LEFT JOIN orders AS o
 ON c.customerid = o.orderid;
 
 -- Right join 
 -- get all customers with their orders including orders without matching customers
 
 
 -- Full join 
 -- get all customers and all orders even if there is no match
 SELECT
  c.customerid,
  c.firstname
FROM customers AS c
FULL OUTER JOIN orders  AS o
ON c.customerid = o.customerid;

-- ADVANCE JOINS
-- Q Identify which customers have placed orders and exactly which products they bought. We only want to see people who have actually made a purchase.
   
 -- LEFT ANTI JOIN
 -- get all customers who haven't placed any order..
 SELECT *
 FROM customers AS c
 LEFT JOIN orders AS o
 ON c.customerid = o.customerid
 WHERE o.customerid IS NULL;
 
 -- get all orders without matching customers
 
 
 -- FULL ANTI JOIN
 SELECT *
 FROM orders AS o
 FULL JOIN customers AS c
 ON o.customerid = c.customerid
 WHERE c.customerid  IS NULL OR  o.customerid IS NULL;
 
 -- CROSS JOIN 
 SELECT *
 FROM customers 
 CROSS JOIN orders;
 
 
 -- Q1. List every customer name and total number of orders they have placed .
 -- Make sure customers who haven't ordered anything still appear with a count of 0.
 SELECT 
  c.firstname,
COUNT(o.orderid) AS totalorders
FROM customers c
LEFT JOIN orders o
ON c.customerid = o.customerid
GROUP BY c.firstname;

-- Q2. Find the names of all employees who have never made a sale.
SELECT
  e.firstname
FROM employees e
LEFT JOIN orders o
ON e.employeeid = o.salespersonid
WHERE o.orderid IS NULL;

-- Q3. List orderid and the product name,but only for orders where the sales amount recorded in the orders table is not 
-- equal to the price listed in the products table.
SELECT 
  o.orderid,
  p.product,
  p.price
FROM orders o
INNER JOIN products p
ON o.productid = p.productid
WHERE o.sales != p.price;

-- Q4. Your orders_archive table should contain everything.Find any orderid that exists in the current 
-- orders table but is missing from the orders_archive.
SELECT
  o.orderid
FROM orders o
LEFT JOIN orders_archive oa
ON o.orderid = oa.orderid
WHERE oa.orderid IS NULL;

-- Q5. List all products and if they were sold on '2024-04-01' , show the orderid .If they 
-- weren't sold on that day ,the product should still appear,but the orderid should be NULL.
SELECT 
p.product,
COUNT(o.orderid) AS orders_on_2024_04_01
FROM products p
LEFT JOIN orders o
ON p.productid = o.productid 
 AND o.orderdate='2024-04-01' 
GROUP BY p.product;


-- Multiple JOIN
SELECT
o.orderid,
o.sales,
c.firstname,
c.lastname,
p.product,
p.price,
e.firstname
FROM orders o
LEFT JOIN customers c
ON o.customerid = c.customerid
LEFT JOIN products p
ON o.productid = p.productid
LEFT JOIN employees e
ON o.salespersonid = e.employeeid;







