-- ----------------------------------------------------
-- TASK 6 – Sales Trend Analysis Using Aggregations
-- Database: MySQL (XAMPP)
-- Table Name: superstore
-- ----------------------------------------------------

-- 1️ Check first few rows
SELECT * FROM superstore LIMIT 10;

-- 2️ Check if order_date and ship_date have valid values
SELECT order_date, ship_date FROM superstore LIMIT 10;

-- 3️ Count total rows in table
SELECT COUNT(*) AS total_rows FROM superstore;

-- ----------------------------------------------------
-- MAIN TASK 6 QUERIES
-- ----------------------------------------------------

-- 1. Monthly Revenue & Order Volume
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(Amount) AS total_revenue,
    COUNT(DISTINCT Order_ID) AS total_orders
FROM superstore
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

--  2. Top 3 Months by Revenue
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(Amount) AS total_revenue
FROM superstore
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY total_revenue DESC
LIMIT 3;

--  3. Monthly Order Volume Only
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(DISTINCT Order_ID) AS order_volume
FROM superstore
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- ----------------------------------------------------
-- EXTRA OPTIONAL COMMANDS
-- ----------------------------------------------------

-- Find min and max dates in dataset
SELECT MIN(order_date) AS start_date, MAX(order_date) AS end_date
FROM superstore;

-- Total yearly revenue summary
SELECT 
    YEAR(order_date) AS year,
    SUM(Amount) AS yearly_revenue
FROM superstore
GROUP BY YEAR(order_date)
ORDER BY year ASC;

-- List distinct months available
SELECT DISTINCT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month
FROM superstore
ORDER BY year, month;
