-- LEFT JOIN Examples
-- Returns all records from left table and matched records from right table

-- 1. Basic LEFT JOIN - Get all customers and their orders (including customers without orders)
SELECT 
    c.customer_id,
    c.customer_name,
    c.email,
    c.city,
    o.order_id,
    o.order_date,
    o.total_amount,
    o.status
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_name;

-- 2. LEFT JOIN to find customers without orders
SELECT 
    c.customer_id,
    c.customer_name,
    c.email,
    c.city,
    c.country
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- 3. LEFT JOIN with aggregation - Get order statistics for all customers
SELECT 
    c.customer_name,
    c.country,
    COUNT(o.order_id) as total_orders,
    COALESCE(SUM(o.total_amount), 0) as total_spent,
    COALESCE(AVG(o.total_amount), 0) as avg_order_value
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.country
ORDER BY total_orders DESC, c.customer_name;
