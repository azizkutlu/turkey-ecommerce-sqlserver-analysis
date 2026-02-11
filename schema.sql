-- Author: Aziz Kutlu
-- Project: Turkey E-Commerce SQL Server Analysis
-- Database: Microsoft SQL Server
-- Description: Database schema for e-commerce sales analysis

CREATE TABLE customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_name NVARCHAR(100),
    city NVARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name NVARCHAR(100),
    category NVARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES customers(customer_id),
    order_date DATE,
    total_amount DECIMAL(10,2)
);

CREATE TABLE order_items (
    order_item_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT FOREIGN KEY REFERENCES orders(order_id),
    product_id INT FOREIGN KEY REFERENCES products(product_id),
    quantity INT
);
