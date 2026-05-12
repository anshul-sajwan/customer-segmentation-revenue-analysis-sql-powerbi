-- =========================================
-- Customer Segmentation & Revenue Analysis PROJECT
-- =========================================

-- =========================================
-- DATABASE CREATION
-- =========================================

CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

-- =========================================
-- RAW DATA TABLE CREATION
-- =========================================

CREATE TABLE IF NOT EXISTS online_retail  (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID INT,
    Country VARCHAR(50)
);

-- =========================================
-- DATA IMPORT
-- Update file path according to your system
-- =========================================

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ecommerce_sales.csv'
INTO TABLE online_retail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- =========================================
-- DATA VALIDATION
-- =========================================

SELECT COUNT(*) AS total_rows
FROM online_retail;

SELECT *
FROM online_retail
WHERE CustomerID IS NOT NULL
AND CustomerID <> '';

-- =========================================
-- DATA CLEANING
-- Removed:
-- 1. Negative quantities
-- 2. Negative/zero prices
-- 3. Cancelled orders
-- 4. Null customer IDs
-- =========================================

CREATE TABLE online_retail_clean AS
SELECT *
FROM online_retail
WHERE Quantity > 0
AND UnitPrice > 0
AND InvoiceNo NOT LIKE 'C%'
AND CustomerID IS NOT NULL;

-- =========================================
-- CLEAN DATA VALIDATION
-- =========================================

SELECT COUNT(*) AS total_clean_rows
FROM online_retail_clean;

-- =========================================
-- FEATURE ENGINEERING
-- Revenue Calculation
-- =========================================

ALTER TABLE online_retail_clean
ADD COLUMN Revenue DECIMAL(10,2);

UPDATE online_retail_clean
SET Revenue = Quantity * UnitPrice;

-- =========================================
-- FINAL DATA PREVIEW
-- =========================================

SELECT *
FROM online_retail_clean
LIMIT 10;