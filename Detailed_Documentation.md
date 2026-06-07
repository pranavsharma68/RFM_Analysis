# RFM Customer Segmentation Analysis

## Project Overview

This project focuses on customer segmentation using the RFM (Recency, Frequency, Monetary) framework to identify customer purchasing behavior and business value. The objective was to classify customers into meaningful segments such as Champions, Loyal VIPs, At Risk, and Lost Customers, enabling data-driven retention and marketing strategies.

Using SQL for data preparation and Power BI for visualization, the project transforms transactional sales data into actionable customer intelligence that can support business growth and customer retention initiatives.

---

# Business Problem

Businesses often struggle to understand:

- Which customers generate the highest value
- Which customers are likely to churn
- How frequently customers make purchases
- Which customer groups require retention efforts
- How to allocate marketing resources effectively

The goal was to develop a customer segmentation framework that helps businesses improve retention, customer engagement, and revenue generation.

---

# Dataset Description

The dataset contains transactional sales records, including:

- Customer ID
- Order Date
- Sales Amount
- Transaction History
- Purchase Frequency Information

The data was processed to calculate RFM metrics and generate customer segments.

---

# Data Cleaning & Preparation

## Using SQL

- Combined multiple datasets into a unified analytical dataset
- Removed duplicate records
- Standardized date formats
- Handled missing and inconsistent values
- Calculated customer-level metrics

## RFM Calculation

The following metrics were calculated:

### Recency
Measures how recently a customer made a purchase.

### Frequency
Measures how often a customer purchases.

### Monetary Value
Measures how much a customer spends.

Customers were assigned scores based on these metrics and grouped into meaningful business segments.

---

# Tools & Technologies

- SQL → Data Cleaning, Transformation & RFM Scoring
- Power BI → Dashboard Development & Visualization
- Data Analytics → Customer Segmentation & Business Analysis

---

# Customer Segments Created

- Champions
- Loyal VIPs
- Potential Loyalists
- Promising Customers
- Engaged Customers
- Requires Attention
- At Risk Customers
- Lost / Inactive Customers

---

# Key Insights

- Champions represent the most valuable customer segment, contributing significantly to overall revenue

- Loyal VIP customers demonstrate strong purchasing consistency and high engagement

- A segment of customers has become inactive despite previous purchasing activity, indicating churn risk

- At Risk customers show declining purchase frequency and require targeted retention efforts

- Customer behavior varies significantly across segments, highlighting the need for personalized marketing strategies

---

# Business Recommendations

- Reward Champions and Loyal VIP customers through loyalty programs and exclusive offers

- Develop personalized campaigns for Potential Loyalists to increase engagement

- Launch retention campaigns targeting At Risk customers before churn occurs

- Re-engage Lost Customers through promotional offers and targeted communication

- Allocate marketing budgets based on customer segment value and behavior

---

# Dashboard Overview (Power BI)

The interactive dashboard includes:

- Customer Segment Distribution
- Recency Analysis
- Frequency Analysis
- Monetary Value Analysis
- RFM Score Breakdown
- Customer Retention Insights
- Segment-Level Performance Tracking
- Interactive Filters and Drilldowns

The dashboard enables stakeholders to quickly identify valuable customers, churn risks, and customer behavior trends.

---

# Challenges Faced

- Preparing customer-level analytical data from transactional records

- Designing accurate RFM scoring logic

- Creating meaningful customer segments that align with business objectives

- Building intuitive visualizations for non-technical stakeholders

---

# What I Learned / Skills Demonstrated

- Applied RFM methodology for customer segmentation

- Performed advanced data transformation using SQL

- Developed customer-centric business intelligence solutions

- Built interactive Power BI dashboards for customer analytics

- Translated customer behavior data into actionable business recommendations

- Improved understanding of customer retention, loyalty, and churn analysis
