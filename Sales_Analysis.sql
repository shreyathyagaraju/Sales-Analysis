CREATE DATABASE sales_analysis;
USE sales_analysis;

-- Create tables
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    sale_date DATE,
    quantity INT,
    price DECIMAL(10, 2)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(255)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    region VARCHAR(255)
);

-- Insert sample data
INSERT INTO sales VALUES
(1, 101, 1001, '2023-01-01', 2, 20.00),
(2, 102, 1002, '2023-01-05', 1, 15.00),
(3, 103, 1003, '2023-02-01', 5, 10.00),
(4, 101, 1004, '2023-03-01', 3, 20.00),
(5, 102, 1005, '2023-03-05', 4, 15.00);

INSERT INTO products VALUES
(101, 'Product A', 'Category 1'),
(102, 'Product B', 'Category 2'),
(103, 'Product C', 'Category 1');

INSERT INTO customers VALUES
(1001, 'Customer 1', 'Region 1'),
(1002, 'Customer 2', 'Region 2'),
(1003, 'Customer 3', 'Region 3'),
(1004, 'Customer 4', 'Region 1'),
(1005, 'Customer 5', 'Region 2');

-- Query to analyze total sales by region
SELECT
    c.region,
    SUM(s.quantity * s.price) AS total_sales
FROM
    sales s
JOIN
    customers c ON s.customer_id = c.customer_id
GROUP BY
    c.region;

-- Query to analyze top-selling products
SELECT
    p.product_name,
    SUM(s.quantity) AS total_quantity_sold
FROM
    sales s
JOIN
    products p ON s.product_id = p.product_id
GROUP BY
    p.product_name
ORDER BY
    total_quantity_sold DESC
LIMIT 5;

-- Query to analyze monthly sales performance
SELECT
    DATE_FORMAT(s.sale_date, '%Y-%m') AS sale_month,
    SUM(s.quantity * s.price) AS total_sales
FROM
    sales s
GROUP BY
    sale_month
ORDER BY
    sale_month;
