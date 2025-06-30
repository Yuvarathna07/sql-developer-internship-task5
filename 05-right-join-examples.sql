-- RIGHT JOIN Examples
-- Returns all records from right table and matched records from left table

-- 1. Basic RIGHT JOIN - Get all orders and their customer details (including orders without customers)
SELECT 
    c.customer_id,
    c.customer_name,
    c.email,
    o.order_id,
    o.order_date,
    o.total_amount,
    o.status
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY o.order_date;

-- 2. RIGHT JOIN to find orders without customers
SELECT 
    o.order_id,
    o.order_date,
    o.total_amount,
    o.status
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

-- 3. RIGHT JOIN with status analysis
SELECT 
    o.status,
    COUNT(o.order_id) as order_count,
    SUM(o.total_amount) as total_amount,
    COUNT(c.customer_id) as customers_with_orders
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY o.status
ORDER BY order_count DESC;
