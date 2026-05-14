-- Aggregation function
-- COUNT(*)

SELECT
orderid,
COUNT(*)  OVER() AS TotalOrders
FROM salesdb.orders;


