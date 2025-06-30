-- FULL OUTER JOIN Examples
-- Returns all records when there is a match in either left or right table

-- 1. Basic FULL OUTER JOIN - Get all customers and all orders
SELECT 
    c.customer_id,
    c.customer_name,
    c.email,
    o.order_id,
    o.order_date,
    o.total_amount,
    o.status
FROM customers c
FULL OUTER JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_name, o.order_date;

-- 2. FULL OUTER JOIN to identify unmatched records
SELECT 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.total_amount,
    CASE 
        WHEN c.customer_id IS NULL THEN 'Order without customer'
        WHEN o.order_id IS NULL THEN 'Customer without orders'
        ELSE 'Matched record'
    END as record_type
FROM customers c
FULL OUTER JOIN orders o ON c.customer_id = o.customer_id
ORDER BY record_type, c.customer_name;

-- 3. FULL OUTER JOIN with comprehensive analysis
SELECT 
    COALESCE(c.country, 'Unknown') as country,
    COUNT(DISTINCT c.customer_id) as total_customers,
    COUNT(o.order_id) as total_orders,
    COALESCE(SUM(o.total_amount), 0) as total_revenue
FROM customers c
FULL OUTER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.country
ORDER BY total_revenue DESC;
