# 📊 Day 4: SQL Coding Challenge – Clauses & Operators
# Database: ECommerce_DB
# 🔹 Objectives
Practice sorting and limiting results with ORDER BY and LIMIT/TOP

Apply aggregate functions for summary statistics

Use GROUP BY + HAVING to filter aggregated data

Explore window functions for ranking

# ✅ Key Queries & Outputs
Top 3 most expensive products

sql
SELECT product_id, product_name, price
FROM Product
ORDER BY price DESC
LIMIT 3;
→ Returns Laptop, Smartphone, Monitor

# Sales summary statistics

sql
SELECT COUNT(*) AS total_sales_records,
       SUM(sale_amount) AS total_sales_amount,
       AVG(sale_amount) AS average_sale_amount,
       MAX(sale_amount) AS highest_sale_amount,
       MIN(sale_amount) AS lowest_sale_amount
FROM Sales;
→ 7 records, ₹394,000 total, avg ≈ ₹56,285.71, highest ₹170,000, lowest ₹12,000

# Products with total sales > ₹100

sql
SELECT p.product_id, p.product_name, SUM(s.sale_amount) AS total_sales_amount
FROM Sales s
JOIN Product p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(s.sale_amount) > 100;
→ All products qualify

# Ranking products by price

sql
SELECT product_id, product_name, price,
       RANK() OVER (ORDER BY price DESC) AS price_rank
FROM Product;
→ Laptop ranked 1, Smartphone 2, Monitor 3, … Mouse 7

# 📌 Insights
ORDER BY + LIMIT/TOP → Quickly identifies top performers for management.

Aggregate functions → Provide a snapshot of overall sales health.

GROUP BY + HAVING → Highlights products contributing significantly to revenue.

Window functions → Enable advanced analytics like ranking without collapsing rows.
