-- 1️.Create Database
CREATE DATABASE ECommerce_DB;
USE ECommerce_DB;

-- 2️.Create Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0)
);

-- 3️.Create Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    sale_amount DECIMAL(10,2) CHECK (sale_amount > 0),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- 4️.Insert Sample Data into Product Table
INSERT INTO Product (product_id, product_name, price) VALUES
(1, 'Laptop', 85000.00),
(2, 'Smartphone', 45000.00),
(3, 'Headphones', 5000.00),
(4, 'Keyboard', 1200.00),
(5, 'Mouse', 800.00),
(6, 'Monitor', 15000.00),
(7, 'Webcam', 3500.00);

-- 5️.Insert Sample Data into Sales Table
INSERT INTO Sales (sale_id, product_id, quantity, sale_amount) VALUES
(1, 1, 2, 170000.00),
(2, 2, 3, 135000.00),
(3, 3, 5, 25000.00),
(4, 4, 10, 12000.00),
(5, 5, 15, 12000.00),
(6, 6, 2, 30000.00),
(7, 7, 4, 14000.00);


-- ORDER BY & LIMIT

SELECT product_id, product_name, price
FROM Product
ORDER BY price DESC
LIMIT 3;

-- Aggregate Functions

SELECT 
    COUNT(*) AS total_sales_records,
    SUM(sale_amount) AS total_sales_amount,
    AVG(sale_amount) AS average_sale_amount,
    MAX(sale_amount) AS highest_sale_amount,
    MIN(sale_amount) AS lowest_sale_amount
FROM Sales;



-- GROUP BY & HAVING


SELECT 
    p.product_id, 
    p.product_name, 
    SUM(s.sale_amount) AS total_sales_amount
FROM Sales s
JOIN Product p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(s.sale_amount) > 100;


-- Window Functions

-- Using RANK()
SELECT 
    product_id, 
    product_name, 
    price,
    RANK() OVER (ORDER BY price DESC) AS price_rank
FROM Product;

-- Using DENSE_RANK() (no gaps in ranking)
SELECT 
    product_id, 
    product_name, 
    price,
    DENSE_RANK() OVER (ORDER BY price DESC) AS price_rank
FROM Product;
