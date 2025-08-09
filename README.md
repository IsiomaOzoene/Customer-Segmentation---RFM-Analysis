# Customer-Segmentation---RFM-Analysis
1. Overview
This project analyzes customer behavior using Recency, Frequency, and Monetary (RFM) analysis to segment customers and recommend targeted marketing strategies aimed at boosting customer engagement and retention for each segment.

2. RFM Logic
   
Recency (R): Days since last purchase

Frequency (F): Number of unique invoices per customer

Monetary (M): Total revenue generated from each customer

3. Tools & Process
   
Excel & SQL (PostgreSQL): Data cleaning, transformation, and RFM scoring

Power BI: Visualization and dashboard creation

4. Data Cleaning
   
Excel:

Removed transactions where Quantity <= 0.

SQL:

Removed cancelled invoices (InvoiceNo starting with “C”).
Removed rows with blank CustomerID.

5. RFM Analysis Steps
   
Created separate tables for Recency, Frequency, and Monetary values.

Applied quantile scoring (1–5) for each metric.

Merged scores into a single RFM score.

Created customer segments based on RFM combinations.

6. Insights & Observations
   
6.1 Total Revenue Performance

Total revenue: $8.9M from 4,339 customers.

Average revenue per customer (CLV proxy): $2,000.

6.2 Customer Engagement

Average recency: 93 days (~3 months).

Indicates slowed customer engagement over time.

6.3 Customer Segmentation Distribution

Potential Customers: 993

Sleeping Customers: 957

Champions: 908

Insight: While there’s a strong base of high-performing customers (Champions), a larger share is inactive, requiring targeted reactivation.

6.4 Revenue Contribution by Segment

Sleeping Customers: ~$5.7M — high past purchases, low current engagement.

Potential Customers: ~$1.2M — strong opportunity for conversion.

Champions & Loyal Customers: ~$207K and ~$397K — smaller revenue share despite loyalty.

6.5 Segment Quality

Big Spenders: Lowest count (102) and revenue (~$29K) — high-value single purchases but low repeat rate.

At Risk Customers: 451 customers, ~$182K revenue — high potential if re-engaged.

6.6 Top Customers by Revenue

Top Customer (ID: 14646): $280K revenue.

Top 5 customers combined: ~$1M+ revenue.

Insight: A small group of customers contributes a disproportionately large share of revenue — requiring VIP retention strategies.

7. Business Recommendations
   
7.1 Customer Reactivation Campaigns

Target Sleeping and At Risk customers with personalized offers, discounts, or reminders.

7.2 Nurture Potential Customers

Convert to Loyal or Champion segments via incentives, follow-up engagement, and product bundles.

7.3 Reward Top Customers

Implement loyalty programs, exclusive deals, or early product access to retain and grow VIP spenders.

7.4 Monitor CLV Trends

Track average CLV ($2K) quarterly, segmented by recency, to ensure improvement.

7.5 Boost Frequency & Recency

Offer subscription services, loyalty bonuses, and post-purchase discounts to encourage repeat purchases.
