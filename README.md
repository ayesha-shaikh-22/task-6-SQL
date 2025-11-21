

# **Task 6 – Sales Trend Analysis Using SQL (MySQL)**

**Data Analyst Internship – Daily Task**

---

## **Objective**

To analyze **monthly revenue** and **order volume** from the **Superstore** dataset using SQL aggregations in MySQL (XAMPP).

---

## **Dataset Used**

**File:** `Sample - Superstore.csv`
**Table Name:** `superstore`

### **Important Columns**

| Column Name | Description                            |
| ----------- | -------------------------------------- |
| order_date  | Date of order (converted to DATE type) |
| ship_date   | Date of shipment                       |
| Amount      | Sales amount                           |
| Order_ID    | Order identifier                       |
| Quantity    | Quantity sold                          |
| Profit      | Profit value                           |

---

## ⚙️ **Step 1 – Import Dataset in MySQL**

1. Open **phpMyAdmin**
2. Create a database (example: `task6_db`)
3. Import the CSV file as a table named **superstore**
4. Make sure the headers match the column names

---

## ⚙️ **Step 2 – Convert TEXT Dates to DATE Format**

If `Order Date` and `Ship Date` were imported as TEXT, they must be converted.

### ➤ Add new DATE columns

```sql
ALTER TABLE superstore
ADD COLUMN order_date_new DATE,
ADD COLUMN ship_date_new DATE;
```

### ➤ Convert using `STR_TO_DATE()`

```sql
UPDATE superstore
SET 
    order_date_new = STR_TO_DATE(`Order Date`, '%m/%d/%Y'),
    ship_date_new = STR_TO_DATE(`Ship Date`, '%m/%d/%Y');
```

### ➤ Drop old TEXT columns

```sql
ALTER TABLE superstore
DROP COLUMN `Order Date`,
DROP COLUMN `Ship Date`;
```

### ➤ Rename new columns

```sql
ALTER TABLE superstore
CHANGE order_date_new order_date DATE,
CHANGE ship_date_new ship_date DATE;
```

---

## **Step 3 – SQL Queries for Task 6**

### **1. Monthly Revenue & Order Volume**

```sql
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(Amount) AS total_revenue,
    COUNT(DISTINCT Order_ID) AS total_orders
FROM superstore
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;
```

---

### **2. Top 3 Months by Revenue**

```sql
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(Amount) AS total_revenue
FROM superstore
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY total_revenue DESC
LIMIT 3;
```

---

###  **3. Monthly Order Volume**

```sql
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(DISTINCT Order_ID) AS order_volume
FROM superstore
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;
```

---

ion”** or **“GitHub description”**.
