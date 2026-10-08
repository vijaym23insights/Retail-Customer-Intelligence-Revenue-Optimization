# Retail-Customer-Intelligence-Revenue-Optimization
End-to-end retail customer analytics project using Python, PostgreSQL, and Power BI to analyze customer behavior, product performance, purchasing patterns, promotions, subscriptions, and customer experience.

# Retail Customer Intelligence & Revenue Optimization

## 📌 Project Overview

This project analyzes retail customer shopping behavior to understand purchasing patterns, customer segments, product/category performance, promotion usage, subscription adoption, and customer experience.

The project follows an end-to-end Business Analytics workflow:

**Python → PostgreSQL → Power BI → Business Insights & Recommendations**

The objective is not only to analyze the data, but to translate the findings into practical business recommendations.

---

## 🎯 Business Problem

A retail business wants to better understand its customers and purchasing behavior in order to improve product strategy, customer engagement, promotional decisions, and overall shopping experience.

The analysis focuses on questions such as:

- Which categories and products contribute the most purchase value?
- How much do customers typically spend?
- Which customer groups show different purchasing patterns?
- How does purchase behavior differ by frequency and previous purchase history?
- How are discounts and promotions being used?
- How does subscription status relate to purchasing behavior?
- Which categories and products receive stronger customer ratings?
- How do shipping and payment preferences vary?
- Where are the strongest opportunities for business improvement?

---

## 📊 Dataset

The dataset contains **3,900 customer purchase records** and **18 original columns**.

### Key attributes

| Area | Variables |
|---|---|
| Customer | Customer ID, Age, Gender |
| Product | Item Purchased, Category, Size, Color |
| Purchase | Purchase Amount, Season |
| Experience | Review Rating |
| Engagement | Subscription Status, Previous Purchases |
| Promotion | Discount Applied, Promo Code Used |
| Fulfillment | Shipping Type |
| Payment | Payment Method |
| Frequency | Frequency of Purchases |
| Location | Customer Location |

The dataset contained **37 missing Review Rating values**, which were handled during data preparation.

> **Note:** This is a portfolio analytical case study. The dataset does not contain transaction dates or profit/margin information, so the analysis does not claim time-series growth, profitability, ROI, or causal relationships.

---

# 🛠️ Tools & Technologies

- **Python**
  - Pandas
  - NumPy
  - Matplotlib
  - Seaborn
- **PostgreSQL**
  - Data storage
  - Business-question analysis
  - Aggregations and filtering
- **Power BI**
  - DAX measures
  - KPI cards
  - Interactive dashboards
  - Slicers
  - Business reporting
- **GitHub**
  - Project documentation
  - Version control
  - Portfolio presentation

---

# 🐍 1.Python — Data Preparation & Analysis

Python was used to understand, clean, transform, and analyze the dataset before loading it into PostgreSQL.

## Key activities
Loaded and inspected the dataset
Checked data types and missing values
Checked duplicate records
Standardized column names
Handled missing Review Rating values
Created customer age groups
Created subscription, discount, and promotion flags
Created rating categories
Created purchase-history segments
Performed descriptive and category-level analysis
Examined relationships between purchase amount, age, and previous purchases
## Missing-value treatment

Missing review_rating values were imputed using the median rating within each product category.

## Feature Engineering

Additional analytical fields were created, including:

age_group
subscription_flag
discount_flag
promo_flag
rating_category
purchase_history_segment

# 🗄️ 2. PostgreSQL — Business Analysis

The cleaned dataset was loaded into a PostgreSQL table named:

customer

SQL was then used to answer key business questions.

## Key SQL analyses
- Total purchase value and average purchase amount
- Highest-value product categories
- Top products by purchase value
- Category-level customer ratings
- Discounted vs non-discounted purchase behavior
- Discount usage across categories
- Subscriber vs non-subscriber purchasing behavior
- Purchase frequency and average purchase amount
- Most frequently used payment methods
- Products with the highest average customer ratings

The SQL analysis was intentionally kept business-focused and explainable so that each query can be clearly discussed during an interview.

# 📊 3. Power BI — Dashboard

The Power BI report was designed as a 3-page interactive business dashboard.

## Page 1 — Executive Overview
<img width="2594" height="1458" alt="Screenshot 2026-10-08 015536" src="https://github.com/user-attachments/assets/0a75c6ba-e4d9-40b9-bcb4-56809638b9aa" />

## KPIs
- Number of Customers
- Total Purchase Value
- Average Purchase Amount
- Average Review Rating
- Average Previous Purchases
## Visuals
- Purchase Value by Category
- Top 5 Products by Purchase Value
- Average Rating by Category
- Average Purchase by Purchase Frequency
## Slicers
- Category
- Gender
- Season

This page provides management with a high-level view of overall customer and product performance.

## Page 2 — Customer & Promotion Analysis
<img width="2628" height="1346" alt="Screenshot 2026-10-08 015610" src="https://github.com/user-attachments/assets/9d3d9058-6158-4ca0-b441-03c2b2ac4164" />

## KPIs
- Subscribers
- Discounted Purchases
- Average Previous Purchases
## Visuals
- Average Purchase by Subscription Status
- Average Purchase: Discount vs Non-Discount
- Discounted Purchases by Category
- Previous Purchase History by Frequency
- Customer Distribution by Purchase History
- Subscription Status by Category
## Slicers
- Subscription Status
- Discount Applied
- Purchase Frequency

This page focuses on customer engagement, purchase history, subscription behavior, and promotional activity.

## Page 3 — Product & Customer Experience
<img width="2620" height="1190" alt="Screenshot 2026-10-08 015635" src="https://github.com/user-attachments/assets/1eedaf1a-471d-4635-a2b3-e3dddff81293" />

## Visuals
- Top 10 Products by Purchase Value
- Top Rated Products
- Customer Rating Distribution
- Average Purchase by Shipping Type
- Purchases by Payment Method
- Category Performance Summary
## Category Performance Metrics
- Number of Customers
- Total Purchase Value
- Average Purchase Amount
- Average Review Rating
## Slicers
- Category
- Shipping Type
- Payment Method

# 📈 Key Business Insights
## 1. Clothing is the highest-value category

- Clothing generated approximately $104K in total purchase value, making it the strongest category by overall purchase value.

- However, its average purchase amount is around $60, which is broadly similar to the other categories.

- Business interpretation: Clothing's leadership is primarily associated with its purchase volume rather than a substantially higher average transaction value.

## 2. Average purchase value is relatively consistent across categories

- The average purchase amount remains close to $60 across the major categories.

- Business interpretation: There is no strong evidence that one category consistently commands a much higher average transaction value.

## 3. Age is not strongly associated with purchase amount

- The correlation between age and purchase amount is approximately -0.01.

- Business interpretation: In this dataset, age alone does not appear to be a meaningful linear predictor of spending.

## 4. Previous purchase history is not strongly associated with purchase amount

- The correlation between previous purchases and purchase amount is approximately 0.008.

- Business interpretation: Having more previous purchases does not automatically correspond to a higher current purchase amount in this dataset.

## 5. Customer ratings are relatively stable across categories

- Average category ratings are close to one another, with Footwear showing the highest average rating at approximately 3.79.

- Business interpretation: Customer satisfaction appears relatively consistent across categories, although some products may provide opportunities for stronger customer experience.

## 6. Promotions and subscriptions should be interpreted as associations

- Differences between customers using discounts, promotions, or subscriptions can be observed in the data.

- However, the dataset is observational and does not contain the information required to establish causality.

- Therefore, the project does not claim that discounts or subscriptions directly cause higher or lower spending.

# 💡 Business Recommendations
## 1. Strengthen cross-category selling

Since Clothing is the largest contributor to purchase value, the business could use Clothing purchases as an opportunity to promote complementary Accessories and Footwear products.

## 2. Use behavior-based customer segmentation

Customer segments based on purchase frequency and previous purchase history can support more targeted campaigns instead of relying only on demographic attributes.

## 3. Promote high-rated products

Products with stronger customer ratings can be highlighted in recommendations, campaigns, and merchandising strategies.

## 4. Evaluate promotional effectiveness more carefully

Discount and promotion usage should be monitored alongside purchase behavior. Future analysis should include margin, discount percentage, and historical transaction data before making ROI decisions.

## 5. Improve subscription analysis

Subscriber behavior can be monitored to understand whether subscription programs are associated with stronger engagement and repeat purchasing.

## 6. Improve future customer analytics

With transaction dates and customer-level historical transactions, the business could perform retention, cohort, recency, and customer lifetime value analysis.

# ⚠️ Project Limitations

This dataset has several analytical limitations:

- No transaction date
- No profit or margin information
- No discount percentage
- No customer acquisition cost
- No detailed transaction history over time
- No true customer-level retention timeline

Therefore, the project does not claim:

- Monthly or yearly revenue trends
- Profitability
- ROI
- True customer lifetime value
- Cohort retention
- Causal impact of discounts or subscriptions

These limitations are explicitly considered when interpreting the results.


# 🔄 Project Workflow

```text
Raw Dataset
     ↓
Data Understanding & Cleaning
     ↓
Feature Engineering with Python
     ↓
Exploratory Data Analysis
     ↓
Load Cleaned Data into PostgreSQL
     ↓
Business Question Analysis using SQL
     ↓
Power BI Data Connection
     ↓
DAX Measures & Dashboard Development
     ↓
Business Insights
     ↓
Recommendations
