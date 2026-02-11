-- Author: Aziz Kutlu
-- Project: Turkey E-Commerce SQL Server Analysis
-- Database: Microsoft SQL Server
-- Description: Business analysis queries for revenue and customer insights


-- 1️⃣ Total Revenue
SELECT SUM(total_amount) AS total_revenue
FROM orders;


-- 2️⃣ Revenue by City
SELECT c.city,
       SUM(o.total_amount) AS city_revenue
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY city_revenue DESC;


-- 3️⃣ Top 5 Customers by Spending
SELECT TOP 5
       c.customer_name,
       SUM(o.total_amount) AS total_spent
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;


-- 4️⃣ Repeat Customers
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;
