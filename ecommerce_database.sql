
-- Drop tables if they exist
DROP TABLE IF EXISTS order_items, orders, products, customers;

-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create order_items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert sample customers
INSERT INTO customers VALUES 
(1, 'Saumya', 'saumya@example.com', 'Delhi'),
(2, 'Priya', 'priya@example.com', 'Mumbai'),
(3, 'Ankit', 'ankit@example.com', 'Bangalore');

-- Insert sample products
INSERT INTO products VALUES 
(101, 'Laptop', 'Electronics', 55000.00),
(102, 'Headphones', 'Electronics', 1500.00),
(103, 'Book', 'Books', 500.00);

-- Insert sample orders
INSERT INTO orders VALUES 
(1001, 1, '2025-04-01'),
(1002, 2, '2025-04-03'),
(1003, 3, '2025-04-05');

-- Insert sample order items
INSERT INTO order_items VALUES 
(1, 1001, 101, 1),
(2, 1001, 102, 2),
(3, 1002, 103, 3),
(4, 1003, 102, 1);

USE ecommerce_db;




