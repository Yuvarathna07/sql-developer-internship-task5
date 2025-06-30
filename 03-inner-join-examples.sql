-- INNER JOIN Examples
-- Returns only records that have matching values in both tables

-- 1. Basic INNER JOIN - Get customers with their orders
SELECT 
    c.customer_id,
    c.customer_name,
    c.email,
    o.order_id,
    o.order_date,
    o.total_amount,
    o.status
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_name, o.order_date;

-- 2. INNER JOIN with WHERE clause - Get completed orders with customer details
SELECT 
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status = 'Completed'
ORDER BY o.total_amount DESC;

-- 3. INNER JOIN with aggregation - Get total orders and amount per customer
SELECT 
    c.customer_name,
    c.country,
    COUNT(o.order_id) as total_orders,
    SUM(o.total_amount) as total_spent,
    AVG(o.total_amount) as avg_order_value
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.country
ORDER BY total_spent DESC;
