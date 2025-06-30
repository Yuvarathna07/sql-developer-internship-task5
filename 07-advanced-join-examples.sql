-- Advanced JOIN Examples

-- 1. CROSS JOIN - Cartesian product (use carefully!)
SELECT 
    c.customer_name,
    p.product_name,
    p.price
FROM customers c
CROSS JOIN products p
WHERE c.country = 'USA'
LIMIT 10; -- Limiting results as CROSS JOIN can produce many rows

-- 2. SELF JOIN - Join table to itself
-- Create a simple employee table for self-join example
CREATE TABLE IF NOT EXISTS employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

INSERT INTO employees (emp_id, emp_name, manager_id) VALUES
(1, 'Alice Johnson', NULL),
(2, 'Bob Smith', 1),
(3, 'Carol Davis', 1),
(4, 'David Wilson', 2),
(5, 'Eva Brown', 2);

-- Self-join to get employee and their manager
SELECT 
    e.emp_name as employee,
    m.emp_name as manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;

-- 3. Multiple table joins (3+ tables)
SELECT 
    c.customer_name,
    o.order_id,
    o.order_date,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) as line_total
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
ORDER BY c.customer_name, o.order_date, p.product_name;

-- 4. Complex join with subquery
SELECT 
    c.customer_name,
    c.country,
    customer_stats.total_orders,
    customer_stats.total_spent,
    customer_stats.avg_order_value
FROM customers c
INNER JOIN (
    SELECT 
        customer_id,
        COUNT(order_id) as total_orders,
        SUM(total_amount) as total_spent,
        AVG(total_amount) as avg_order_value
    FROM orders
    WHERE status = 'Completed'
    GROUP BY customer_id
) customer_stats ON c.customer_id = customer_stats.customer_id
WHERE customer_stats.total_spent > 200
ORDER BY customer_stats.total_spent DESC;
