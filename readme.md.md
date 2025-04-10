
 📊 Data Analyst Internship Task 3: SQL for Data Analysis

 📁 Dataset: E-commerce SQL Database

This project demonstrates the use of SQL to extract and analyze data from a structured e-commerce relational database. The dataset includes customers, products, orders, and order_items tables. 

---

 ✅ Tools Used
- MySQL Workbench
- MySQL Server
- Sample SQL Script (`ecommerce_database.sql`)

---

 🎯 Objective

To perform various SQL queries using:
- `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`
- JOINS (`INNER`, `LEFT`, `RIGHT`)
- Subqueries
- Aggregate functions (`SUM`, `AVG`)
- Views
- Indexes
- NULL value handling

---

 🗃️ Tables in Database

 `customers (customer_id, name, email, city)`
 `products (product_id, name, category, price)`
 `orders (order_id, customer_id, order_date)`
 `order_items (order_item_id, order_id, product_id, quantity)`

---

 📌 SQL Queries & Descriptions

 1. View all customers
```sql
SELECT  FROM customers;
```

 2. Show products with price > ₹1000
```sql
SELECT  FROM products WHERE price > 1000 ORDER BY price DESC;
```

 3. Orders with customer names
```sql
SELECT o.order_id, c.name AS customer_name, o.order_date
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;
```

 4. Total quantity sold per product
```sql
SELECT p.name AS product_name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC;
```

 5. Total spent by each customer
```sql
SELECT c.name, SUM(p.price  oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC;
```

 6. Subquery: Customers who spent more than ₹3000
```sql
SELECT name
FROM customers
WHERE customer_id IN (
    SELECT o.customer_id
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.customer_id
    HAVING SUM(p.price  oi.quantity) > 3000
);
```

 7. Create a view of customer spending
```sql
CREATE VIEW customer_spending AS
SELECT c.customer_id, c.name, SUM(p.price  oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id;
```

 8. Optimize query with index
```sql
CREATE INDEX idx_customer_id ON orders(customer_id);
```

 9. Handle NULL values in city
```sql
SELECT name, COALESCE(city, 'Unknown') AS city FROM customers;
```

---

 📸 Screenshots

Screenshots of query execution and outputs are available in the `/screenshots` folder.

---

  Repository Structure

ecommerce-sql-task

 ecommerce_database.sql        SQL script to create and populate the database
 README.md                     This file
 screenshots                  Output screenshots for each query




  Interview Questions (with brief answers)

1. What is the difference between WHERE and HAVING?  
   `WHERE` filters rows before grouping; `HAVING` filters after `GROUP BY`.

2. What are the different types of joins?  
   INNER, LEFT, RIGHT, FULL (MySQL doesn't support FULL JOIN directly).

3. How do you calculate average revenue per user in SQL?  
   `SELECT AVG(total_spent) FROM (subquery calculating revenue per user);`

4. What are subqueries?  
   A subquery is a query nested inside another query.

5. How do you optimize a SQL query?  
   Use indexes, avoid SELECT , use WHERE clauses, and optimize joins.

6. What is a view in SQL?  
   A virtual table based on a SQL query, useful for simplifying complex joins.

7. How would you handle NULL values in SQL?  
   Use `COALESCE()` or `IS NULL`/`IS NOT NULL` conditions.


 💼 Outcome

- Gained hands-on experience in writing SQL queries
- Learned how to manipulate and analyze structured data
- Improved problem-solving skills in data-related queries



 ✨ Made  by Saumya Giri
