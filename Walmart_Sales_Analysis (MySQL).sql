CREATE DATABASE IF NOT EXISTS salesdatawalmart;

CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantiity INT NOT NULL,
    VAT FLOAT(6,4) NOT NULL,
    total DECIMAL(12,4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4) NOT NULL,
    rating FLOAT(2,1)
);

-- -------------------------------------------------------------------------------------

-- Feature Engineering --

-- 1. Time_of_day --

SELECT 
	time,
	 (CASE 
		WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
        END) AS time_of_day
FROM sales;


ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales 
SET time_of_day = (CASE 
		WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
        END);
        
-- 2. Day Name -- 

SELECT date, DAYNAME(date)
 FROM sales;
 
ALTER TABLE sales
ADD COLUMN day_name VARCHAR(20);

UPDATE sales
SET day_name = DAYNAME(date);

-- 3. Month Name --

SELECT date, monthname(date)
FROM sales;

ALTER TABLE sales
ADD COLUMN month_name VARCHAR(20);

UPDATE sales
SET month_name = MONTHNAME(date);

-- -------------------------------------------------------------------------------------

-- GENERIC QUESTION --

-- 1. How many unique cities and branches does the data have? --

SELECT DISTINCT city, branch
FROM sales;


-- --------------------------------------------------------------------------------

-- PRODUCT QUESTION --

-- 1. Unique Product Lines --

SELECT COUNT(distinct product_line)
FROM sales;

-- 2. Most Common Payment Method --

SELECT payment, COUNT(payment) AS COUNT
FROM sales
GROUP BY payment
ORDER BY COUNT DESC; 

-- 3. Most Selling Product Line --

SELECT product_line, COUNT(product_line) AS COUNT, SUM(total)
FROM sales
GROUP BY product_line
ORDER BY COUNT DESC;

-- 4. What is the Total Revenue by Month --

SELECT month_name AS month, SUM(total) AS total
FROM sales
GROUP BY month
ORDER BY total;

-- 5. Largest Cogs --

SELECT month_name AS month, SUM(cogs) AS cogs
FROM sales
GROUP BY month
ORDER BY cogs DESC;

-- 6. What Product has the largest revenue --

SELECT product_line, SUM(total) AS Revenue
FROM sales
GROUP BY product_line
ORDER BY Revenue;

-- 7. City with the Largest Revenue --

SELECT city, SUM(total) AS REVENUE
FROM sales
group by city
ORDER BY REVENUE DESC;

-- 8. Product with the largest VAT --

SELECT product_line, SUM(VAT) as Total_VAT
FROM sales
GROUP BY product_line
ORDER BY Total_VAT DESC;

-- 9. Which branch sold more products than average product sold --

SELECT branch, SUM(quantiity) AS qty
FROM sales
GROUP BY branch
HAVING SUM(quantiity) > (SELECT AVG(quantiity) FROM sales);

-- 10. Most common product line by gender --

SELECT gender, product_line, COUNT(gender) AS cnt
FROM sales
group by gender, product_line
order by cnt DESC;

-- 11. Average Rating of each product line --

SELECT product_line, ROUND(AVG(rating), 2)
FROM sales
group by product_line
ORDER by AVG(rating) DESC;

-- --------------------------------------------------------------------------------

-- SALES QUESTION --

-- 1. No. of sales made in each time of the day per weekday --

SELECT time_of_day, COUNT(*) AS total_sales
FROM sales
WHERE day_name = "Sunday"
GROUP BY time_of_day;

-- 2. Which type of customer brings the most revenue --

SELECT customer_type, ROUND(SUM(total), 2) AS revenue
FROM sales
GROUP BY customer_type
ORDER BY revenue DESC;

-- 3. Which city has the largest VAT --

SELECT city, avg(VAT) AS VAT
from sales
GROUP BY city
ORDER BY VAT DESC;

-- 4. Which customer type pays the most in VAT --

SELECT customer_type, AVG(VAT) AS VAT
FROM sales
GROUP BY customer_type
ORDER BY VAT DESC;


-- --------------------------------------------------------------------------------

-- CUSTOMER QUESTION --

-- 1. Unique Customer_type --

SELECT DISTINCT(customer_type)
FROM sales;

-- 2. Unique Payment Methods --

SELECT DISTINCT(payment)
FROM sales;

-- 3. Which customer buys the most --

SELECT customer_type, COUNT(*) AS COUNT
FROM sales
GROUP BY customer_type;

-- 4. Gender --

SELECT gender, count(*) AS COUNT
FROM sales
group by gender;

-- 5. Gender Distribution per branch --

SELECT gender, count(*) AS COUNT
FROM sales
WHERE branch = "B"
group by gender;

-- 6. What time of the day in which the customers give the most ratings --

SELECT time_of_day, AVG(rating) AS avg_rating
from sales
GROUP BY time_of_day;

-- 7. What time of the day in which the customers give the most ratings per branch --

SELECT time_of_day, AVG(rating) AS avg_rating
from sales
WHERE branch = "A"
GROUP BY time_of_day;

-- 8. Which day of the week has the best avg rating --

select day_name, AVG(rating) AS RATING
FROM sales
GROUP BY day_name;

-- 9. Which day of the week has the best avg rating per branch --

select day_name, AVG(rating) AS RATING
FROM sales
WHERE branch = "B"
GROUP BY day_name;



