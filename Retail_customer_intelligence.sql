SELECT * 
FROM customer 
LIMIT 10;

SELECT COUNT(*) AS total_records
FROM customer;

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(*) - COUNT(review_rating) AS missing_ratings
FROM customer;

--Q1.What is the total purchase value and average purchase amount?
SELECT
    SUM(purchase_amount) AS total_purchase_value,
    ROUND(AVG(purchase_amount)::numeric, 2) AS average_purchase_amount
FROM customer;

--Q2.Which category generates the highest purchase value?
SELECT
    category,
    SUM(purchase_amount) AS total_purchase_value
FROM customer
GROUP BY category
ORDER BY total_purchase_value DESC;

--Q3. Which products are the top 5 by purchase value?
SELECT
    item_purchased,
    SUM(purchase_amount) AS total_purchase_value
FROM customer
GROUP BY item_purchased
ORDER BY total_purchase_value DESC
LIMIT 5;

--Q4.Which category has the highest average customer rating?
SELECT
    category,
    ROUND(AVG(review_rating)::numeric, 2) AS average_rating
FROM customer
GROUP BY category
ORDER BY average_rating DESC;

--Q5.Do customers who use discounts have a higher average purchase amount?
SELECT
    discount_applied,
    ROUND(AVG(purchase_amount)::numeric, 2) AS average_purchase_amount
FROM customer
GROUP BY discount_applied;

--Q6.Which categories use discounts the most?
SELECT
    category,
    COUNT(*) AS discounted_purchases
FROM customer
WHERE discount_applied = 'Yes'
GROUP BY category
ORDER BY discounted_purchases DESC;

--Q7.Which product is the top performer within each category?
WITH product_performance AS (
    SELECT
        category,
        item_purchased,
        COUNT(*) AS purchase_count,
        ROUND(SUM(purchase_amount)::numeric, 2) AS total_purchase_value,
        ROUND(AVG(review_rating)::numeric, 2) AS average_rating,

        RANK() OVER (
            PARTITION BY category
            ORDER BY SUM(purchase_amount) DESC
        ) AS category_rank

    FROM customer

    GROUP BY
        category,
        item_purchased
)

SELECT
    category,
    item_purchased,
    purchase_count,
    total_purchase_value,
    average_rating
FROM product_performance
WHERE category_rank = 1
ORDER BY total_purchase_value DESC;

--Q8.Which purchase frequency group has the highest average purchase amount?
SELECT
    purchase_frequency,
    ROUND(AVG(purchase_amount)::numeric, 2) AS average_purchase_amount
FROM customer
GROUP BY purchase_frequency
ORDER BY average_purchase_amount DESC;

--Q9.Which payment method is used most frequently?
SELECT
    payment_method,
    COUNT(*) AS purchase_count
FROM customer
GROUP BY payment_method
ORDER BY purchase_count DESC;

--Q10.Which customer-value segments are the most valuable?
WITH customer_segments AS (
    SELECT
        customer_id,
        purchase_amount,
        previous_purchases,

        CASE
            WHEN purchase_amount >= 75
                 AND previous_purchases >= 25
                THEN 'Very High Value'

            WHEN purchase_amount >= 60
                 AND previous_purchases >= 25
                THEN 'High Value'

            WHEN purchase_amount >= 60
                 OR previous_purchases >= 25
                THEN 'Developing'

            ELSE 'Low Value'
        END AS customer_value_segment

    FROM customer
)

SELECT
    customer_value_segment,
    COUNT(DISTINCT customer_id) AS customer_count,
    ROUND(AVG(purchase_amount)::numeric, 2) AS average_purchase_amount,
    ROUND(AVG(previous_purchases)::numeric, 2) AS average_previous_purchases,
    ROUND(SUM(purchase_amount)::numeric, 2) AS total_purchase_value
FROM customer_segments
GROUP BY customer_value_segment
ORDER BY average_purchase_amount DESC;