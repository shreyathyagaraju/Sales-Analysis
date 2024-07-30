# Sales Analysis Project

This project contains SQL scripts for creating and analyzing a sales database. It includes table creation, sample data insertion, and various analysis queries to provide insights into sales performance.

## Table of Contents
- [Overview](#overview)
- [Setup Instructions](#setup-instructions)
- [Project Structure](#project-structure)
- [SQL Scripts](#sql-scripts)
- [Contributing](#contributing)
- [License](#license)

## Overview

The Sales Analysis Project is designed to help understand sales trends, top-selling products, and regional performance using SQL and data visualization tools like Tableau.

## Setup Instructions

To set up and run the analysis, follow these steps:

1. **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/sales-analysis.git
    cd sales-analysis
    ```

2. **Set up the database:**
    ```sql
    -- Create and use the database
    CREATE DATABASE sales_analysis;
    USE sales_analysis;

    -- Create tables
    CREATE TABLE customers (
        customer_id INT PRIMARY KEY,
        name VARCHAR(50),
        region VARCHAR(50)
    );

    CREATE TABLE products (
        product_id INT PRIMARY KEY,
        product_name VARCHAR(50),
        category VARCHAR(50)
    );

    CREATE TABLE sales (
        sale_id INT PRIMARY KEY,
        product_id INT,
        customer_id INT,
        sale_date DATE,
        quantity INT,
        price DECIMAL(10, 2),
        FOREIGN KEY (product_id) REFERENCES products(product_id),
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    );

    -- Insert sample data into tables
    INSERT INTO customers (customer_id, name, region) VALUES
    (1, 'John Doe', 'North'),
    (2, 'Jane Smith', 'South'),
    (3, 'Jim Brown', 'East'),
    (4, 'Jake White', 'West');

    INSERT INTO products (product_id, product_name, category) VALUES
    (1, 'Product A', 'Category 1'),
    (2, 'Product B', 'Category 2'),
    (3, 'Product C', 'Category 1'),
    (4, 'Product D', 'Category 2');

    INSERT INTO sales (sale_id, product_id, customer_id, sale_date, quantity, price) VALUES
    (1, 1, 1, '2023-01-01', 10, 99.99),
    (2, 2, 2, '2023-01-02', 5, 199.99),
    (3, 3, 3, '2023-01-03', 2, 299.99),
    (4, 4, 4, '2023-01-04', 1, 399.99);
    ```

3. **Run analysis queries:**
    ```sql
    -- Total Sales by Region
    SELECT region, SUM(quantity * price) AS total_sales
    FROM sales
    JOIN customers ON sales.customer_id = customers.customer_id
    GROUP BY region;

    -- Top-Selling Products
    SELECT product_name, SUM(quantity) AS total_quantity
    FROM sales
    JOIN products ON sales.product_id = products.product_id
    GROUP BY product_name
    ORDER BY total_quantity DESC
    LIMIT 5;

    -- Monthly Sales Performance
    SELECT YEAR(sale_date) AS year, MONTH(sale_date) AS month, SUM(quantity * price) AS total_sales
    FROM sales
    GROUP BY year, month
    ORDER BY year, month;
    ```

## Project Structure
sales-analysis/
├── data/
│ └── sample_data.sql
├── queries/
│ ├── create_tables.sql
│ └── analysis_queries.sql
├── README.md
