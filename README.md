# Walmart Sales Data Analysis

## Overview

This project focuses on analyzing Walmart's sales data to identify top-performing branches and products, understand sales trends across different product categories, and assess customer behavior. The goal is to explore ways to enhance and optimize sales strategies.

## Project Objectives

The primary objective of this project is to gain insights into Walmart's sales data to understand the various factors influencing sales across different branches.

## Data Description

The dataset was sourced from the [Kaggle Walmart Sales Forecasting Competition]. The dataset consists of 17 columns and 1,000 rows, as detailed below:

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| invoice_id              | Unique identifier for each sale         | VARCHAR(30)    |
| branch                  | Store location where the sale occurred  | VARCHAR(5)     |
| city                    | City where the branch is located        | VARCHAR(30)    |
| customer_type           | Category of the customer                | VARCHAR(30)    |
| gender                  | Gender of the purchasing customer       | VARCHAR(10)    |
| product_line            | Category of the product sold            | VARCHAR(100)   |
| unit_price              | Price per unit of the product           | DECIMAL(10, 2) |
| quantity                | Number of units sold                    | INT            |
| VAT                     | Tax amount on the purchase              | FLOAT(6, 4)    |
| total                   | Total transaction amount                | DECIMAL(10, 2) |
| date                    | Date of purchase                        | DATE           |
| time                    | Time of purchase                        | TIMESTAMP      |
| payment_method          | Method used for payment                 | VARCHAR(30)    |
| cogs                    | Cost of Goods Sold                      | DECIMAL(10, 2) |
| gross_margin_percentage | Percentage margin on the sale           | FLOAT(11, 9)   |
| gross_income            | Gross income from the sale              | DECIMAL(10, 2) |
| rating                  | Customer rating for the transaction     | FLOAT(2, 1)    |

## Analysis Focus Areas

### 1. Product Analysis

- **Objective:** Conduct a thorough examination of the data to understand the various product lines, identify the top-performing lines, and determine which areas need improvement.

### 2. Sales Analysis

- **Objective:** This analysis seeks to uncover sales trends across products. The results will help evaluate the effectiveness of different sales strategies and identify necessary adjustments to increase sales.

### 3. Customer Analysis

- **Objective:** This analysis focuses on identifying different customer segments, understanding their purchasing behavior, and assessing the profitability of each segment.

## Approach

### 1. Data Wrangling

- The initial step involves inspecting the data to identify and handle missing or NULL values.
  - Set up a database.
  - Create tables and insert data.
  - Identify columns with NULL values. As the database tables are created with **NOT NULL** constraints, NULL values are filtered out.

### 2. Feature Engineering

- Generate new columns from existing data to provide additional insights.
  - Add a `time_of_day` column to categorize sales into Morning, Afternoon, and Evening, helping to identify when most sales occur.
  - Introduce a `day_name` column to extract and categorize transactions by the day of the week, revealing which days each branch is busiest.
  - Create a `month_name` column to categorize transactions by month, helping to identify peak sales periods.

## Business Questions to Address

### General Queries

1. How many unique cities are represented in the dataset?
2. In which city is each branch located?

### Product Analysis

1. How many unique product lines are in the dataset?
2. Which payment method is most commonly used?
3. Which product line has the highest sales volume?
4. What is the total revenue by month?
5. Which month recorded the highest Cost of Goods Sold (COGS)?
6. Which product line generated the most revenue?
7. Which city has the highest revenue?
8. Which product line incurred the highest VAT?
9. Rank each product line by sales and label them as "Good" or "Bad" based on whether they perform above or below the average sales.
10. Which branch exceeds the average number of products sold?
11. What is the most popular product line by gender?
12. What is the average rating for each product line?

### Sales Analysis

1. Number of sales made in each time of the day per weekday.
2. Which customer type contributes the most to revenue?
3. Which city has the highest VAT percentage?
4. Which customer type pays the most in VAT?

### Customer Analysis

1. How many unique customer types are there?
2. How many different payment methods are used?
3. What is the most common customer type?
4. Which customer type makes the most purchases?
5. What is the gender distribution of customers?
6. What is the gender distribution across branches?
7. At what time of day do customers leave the highest ratings?
8. At what time of day do customers leave the highest ratings by branch?
9. Which day of the week receives the best average ratings?
10. Which day of the week receives the best average ratings by branch?
