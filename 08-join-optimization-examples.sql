-- JOIN Optimization Examples and Best Practices

-- 1. Using indexes for better join performance
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_customers_country ON customers(country);

-- 2. Efficient join with proper WHERE clause placement
-- Good: Filter early in the join
SELECT 
    c.customer_name,
    o.order_id,
    o.total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id AND o.status = 'Completed'
WHERE c.country = 'USA';

-- 3. Using EXISTS instead of JOIN for existence checks
-- Check if customer has any orders
SELECT 
    c.customer_id,
    c.customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1 
    FROM orders o 
    WHERE o.customer_id = c.customer_id
);

-- 4. Avoiding Cartesian products
-- Bad example (commented out to prevent accidental execution):
-- SELECT * FROM customers, orders; -- This creates Cartesian product

-- Good example with proper join condition:
SELECT 
    c.customer_name,
    o.order_id
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

-- 5. Using UNION for combining different join results
SELECT 
    'Customer without orders' as type,
    c.customer_name as name,
    NULL as order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL

UNION ALL

SELECT 
    'Customer with orders' as type,
    c.customer_name as name,
    COUNT(o.order_id) as order_count
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;
