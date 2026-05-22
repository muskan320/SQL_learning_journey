CREATE DATABASE retail_oltp;
USE retail_oltp;

CREATE TABLE online_retail (
      InvoiceNo VARCHAR(20),
      StockCode VARCHAR(20),
      Description TEXT,
      Quantity INT,
      InvoiceDate VARCHAR(50),
      UnitPrice DOUBLE,
      CustomerID VARCHAR(20),
      Country VARCHAR(100)
);
LOAD DATA LOCAL INFILE 'C:\\Users\\himal\\Downloads\\online-retail-dataset (3).csv'
INTO TABLE online_retail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SHOW VARIABLES LIKE 'local_infile';

SET GLOBAL local_infile = 1;

SELECT *
FROM retail_oltp.online_retail;