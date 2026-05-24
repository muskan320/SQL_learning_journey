-- PART B
-- QUES1 Display all orders details together with the total sales for that product across all orders.
-- Answer
SELECT
o.orderid,
o.productid,
o.orderdate,
o.sales,
SUM(o.sales) OVER(PARTITION BY o.productid) AS total_Sales_per_product
FROM salesdb.orders o;

-- Ques2 Calculate the running(cummulative) total sales across the entire dataset,ordered by orderdate.
-- Answer
SELECT
o.orderid,
o.orderdate,
o.sales,
SUM(o.sales) OVER(PARTITION BY o.orderdate) AS running_total
FROM salesdb.orders o;

-- Oues 3 For each customer,calculate their individual running total sales ordered by orderdate.
-- Answer
SELECT
o.orderid,
o.customerid,
o.orderdate,
o.sales,
SUM(o.sales) OVER(PARTITION BY o.customerid ORDER BY o.orderdate) AS customer_running_total
FROM salesdb.orders o;

-- Ques 4 Rank orders within each product by sales amount in descending order.Use RANK()
-- Answer
SELECT
o.orderid,
o.productid,
o.sales,
RANK() OVER(partition by o.productid ORDER BY o.sales DESC) AS Sales_rank_per_product
FROM salesdb.orders o;

-- Ques 5 For each order ,Show the sales amount from the previous order made by the same customer,
-- Return Null for the first order of each customer.
-- Answer
SELECT
o.orderid,
o.customerid,
o.orderdate,
o.sales,
LAG(o.sales) OVER(PARTITION BY o.customerid ORDER BY o.orderdate) AS prev_sales
FROM salesdb.orders o;
-- Ques 6 Find the top 2 highest sales orders for each product using a window function and filtering
SELECT
orderid,
productid,
sales,
rankk
FROM( SELECT
     o.orderid,
     o.productid,
     o.sales,
     RANK() OVER(PARTITION BY o.productid ORDER BY o.sales DESC) AS rankk
     FROM salesdb.orders o)t
WHERE rankk <=2;

-- Ques 7 For each order,calculate two percentage contributions:
-- its percentage contribution to overall grand total sales.
-- its percentage contribution to that specific product's tota; sales.

SELECT
o.orderid,
o.productid,
o.sales,
(o.sales * 100.0 /SUM(o.sales) OVER()) AS overall_percentage,
(o.sales * 100.0/SUM(o.sales) OVER(PARTITION BY o.productid)) AS product_percentage
FROM salesdb.orders o;


