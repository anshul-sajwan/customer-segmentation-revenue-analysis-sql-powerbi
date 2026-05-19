# Customer Segmentation & Revenue Analysis | Excel + SQL + Power BI

Analyze customer segments and revenue contribution to identify high-value customers, monitor revenue trends, and support business decision-making using Excel, SQL, and Power BI.

---

## Overview

An end-to-end analytics workflow was built using Excel for data preparation, SQL for data cleaning and transformation, and Power BI for dashboard development and visualization.

Customers were segmented into High Value, Medium Value, and Low Value groups based on revenue contribution using percentile-based segmentation logic (P50 and P80 thresholds).

---

## Business Problem

Businesses often struggle to identify:

- Customers driving the highest revenue
- Customer segments requiring retention or upselling strategies
- Revenue concentration across customer segments
- Countries contributing the most to overall revenue
- Seasonal revenue trends affecting business performance

This project addresses these challenges through customer segmentation and revenue analysis using interactive Power BI visualizations

---

## Dataset

**Dataset Source:** https://archive.ics.uci.edu/dataset/502/online+retail+ii

### Key Columns
- InvoiceNo
- StockCode
- Description
- Quantity
- InvoiceDate
- UnitPrice
- CustomerID
- Country
- Revenue

---

## Tools & Technologies

- **Excel** → Data consolidation and CSV preparation
- **SQL (MySQL)** → Data cleaning and transformation
- **Power BI** → Data modeling and dashboard development
- **DAX** → KPI and customer segmentation calculations

---

## Data Preparation & Workflow

### Excel
- Merged yearly sheets (2009–2010 and 2010–2011)
- Consolidated raw transactional data
- Converted Excel data into CSV format for efficient MySQL ingestion

### SQL
- Imported CSV data into MySQL
- Removed:
  - Null customer IDs
  - Negative quantities
  - Invalid unit prices
  - Cancelled invoices
- Created revenue column for analysis

### Power BI
- Designed a star schema data model with fact and dimension tables for optimized filtering and analysis
- Developed DAX measures for KPIs and customer segmentation
- Implemented customer segmentation logic using revenue percentile thresholds (P50 & P80) to classify customers into High, Medium and Low Value segments
- Built an interactive dashboard for revenue and customer analysis

---

## Important SQL Operations

```sql
CREATE TABLE online_retail_clean AS
SELECT *
FROM online_retail
WHERE Quantity > 0
AND UnitPrice > 0
AND InvoiceNo NOT LIKE 'C%'
AND CustomerID IS NOT NULL;

ALTER TABLE online_retail_clean
ADD COLUMN Revenue DECIMAL(12,2);

UPDATE online_retail_clean
SET Revenue = Quantity * UnitPrice;
```

---

## Key Insights

- High-value customers (~20%) contribute nearly 77% of total revenue
- Around 50% of customers belong to the low-value segment
- Revenue peaks during September–November, indicating seasonal demand
- The United Kingdom contributes the highest share of overall revenue
- Revenue is heavily concentrated among top-performing customers

---

## Dashboard Features

- KPI Cards
- Customer Segment Distribution
- Revenue Contribution by Segment
- Monthly Revenue Trend
- Top Customers by Revenue
- Top Countries by Revenue
- Interactive Filters & Slicers

---

## Dashboard Preview

![Dashboard Preview](images/dashboard.png)

---

## How to Run This Project

1. Load the dataset and update the CSV file path inside:
```sql
data_cleaning.sql
```

2. Run the SQL script:
```sql
data_cleaning.sql
```

3. Open the Power BI dashboard:
```bash
customer_segmentation_revenue_analysis.pbix
```

---

## Final Recommendations

- Prioritize retention strategies for high-value customers
- Target medium-value customers with upselling campaigns
- Improve engagement for low-value customers
- Increase focus during seasonal revenue peaks

---

## Author

**Anshul Sajwan**

- LinkedIn: linkedin.com/in/anshul-sajwan
- Email: anshulsajwan.32@gmail.com