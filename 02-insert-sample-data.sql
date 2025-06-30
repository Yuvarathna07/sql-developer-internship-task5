-- Insert sample data into Customers table
INSERT INTO customers (customer_id, customer_name, email, city, country) VALUES
(1, 'John Smith', 'john.smith@email.com', 'New York', 'USA'),
(2, 'Emma Johnson', 'emma.johnson@email.com', 'London', 'UK'),
(3, 'Michael Brown', 'michael.brown@email.com', 'Toronto', 'Canada'),
(4, 'Sarah Davis', 'sarah.davis@email.com', 'Sydney', 'Australia'),
(5, 'David Wilson', 'david.wilson@email.com', 'Berlin', 'Germany'),
(6, 'Lisa Anderson', 'lisa.anderson@email.com', 'Paris', 'France');

-- Insert sample data into Orders table
INSERT INTO orders (order_id, customer_id, order_date, total_amount, status) VALUES
(101, 1, '2024-01-15', 250.00, 'Completed'),
(102, 1, '2024-02-20', 180.50, 'Completed'),
(103, 2, '2024-01-25', 320.75, 'Pending'),
(104, 3, '2024-02-10', 150.00, 'Completed'),
(105, 3, '2024-03-05', 275.25, 'Shipped'),
(106, 4, '2024-02-28', 95.00, 'Completed'),
(107, NULL, '2024-03-01', 200.00, 'Pending'); -- Order without customer

-- Insert sample data into Products table
INSERT INTO products (product_id, product_name, price, category) VALUES
(1, 'Laptop', 999.99, 'Electronics'),
(2, 'Mouse', 25.99, 'Electronics'),
(3, 'Keyboard', 79.99, 'Electronics'),
(4, 'Monitor', 299.99, 'Electronics'),
(5, 'Desk Chair', 199.99, 'Furniture');

-- Insert sample data into Order_Items table
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 101, 1, 1, 999.99),
(2, 101, 2, 2, 25.99),
(3, 102, 3, 1, 79.99),
(4, 103, 4, 1, 299.99),
(5, 104, 2, 3, 25.99),
(6, 105, 5, 1, 199.99);
