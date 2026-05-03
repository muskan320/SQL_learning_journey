-- Find how many orders exist for each product, while keeping every order row visible
SELECT
o.orderid,
o.productid,
COUNT(*) OVER(PARTITION BY o.productid) as orders_per_product
FROM salesdb.orders AS o;

-- Count only orders that have non null sales value per product
SELECT 
o.orderid,
o.productid,
COUNT(Sales) OVER ( PARTITION BY o.productid) as NonNull_Sales_Orders_Per_Product
FROM salesdb.orders as o;


-- Find total orders and still shows level detail
SELECT
o.orderid,
o.orderdate,
COUNT(*) OVER() AS total_orders
FROM salesdb.orders as o;


-- Find how many orders each customers placed,per order row
SELECT
o.orderid,
o.customerid,
COUNT(*)OVER(PARTITION BY o.customerid) AS orders_per_customer
FROM salesdb.orders as o;

-- Find how many customers actually have score
SELECT
c.customerid,
COUNT(c.score) OVER() AS total_Sales
FROM salesdb.customers as c;

-- detection of duplicatea by COUNT() window function
-- verify weather order id contains duplicate or not
SELECT
o.orderid,
COUNT(*)  OVER(PARTITION BY o.orderid) AS check_primary_key  -- partition by creates window first --  then count  --SELECT
FROM salesdb.orders as o;


-- Identify duplicates orderid values in archive data
SELECT
oa.orderid,
COUNT(*) OVER(partition by oa.orderid) as check_pri_key
FROM salesdb.orders_archive as oa;



-- Identify duplicates orderid values in archive data
SELECT *
FROM(
SELECT
oa.*,
COUNT(*) OVER(PARTITION BY oa.orderid) AS check_pri_key
FROM salesdb.orders_archive AS oa
) AS sub
WHERE check_pri_key >1;



-- SUM()
-- TASK1 : Find the total sales for each product while keeping every order
SELECT
o.orderid,
o.productid,
o.sales,
SUM(sales) OVER( PARTITION BY productid) AS TotalSalesByProduct
FROM salesdb.orders AS o;


-- TASK2: Show overall total sales,while keeping order level details
SELECT
o.orderid,
o.productid,
o.sales,
SUM(sales) OVER() AS TotalSales
FROM salesdb.orders AS o;

-- TASK3:Find how muh each order contributes to the total sales
SELECT
o.orderid,
o.productid,
o.sales,
ROUND(
     (CAST(o.sales AS DECIMAL(10,2))/SUM(o.sales) OVER()) *100,
	 2
)AS percentage_of_total
FROM salesdb.orders o;

