-- NYKAA BEAUTY & FASHION SALES ANALYSIS
-- Database: nykaa_sales_analysis
-- Total records: 1500

-- 1. Check total records
SELECT COUNT(*) AS total_records
FROM nykaa_sales;

-- 2. Total Revenue
SELECT SUM(recognized_revenue_inr) AS total_revenue
FROM nykaa_sales
WHERE order_status = 'Delivered';

-- 3. Total Profit
SELECT SUM(profit_inr) AS total_profit
FROM nykaa_sales
WHERE order_status = 'Delivered';

-- 4. Total Delivered Orders
SELECT COUNT(*) AS total_orders
FROM nykaa_sales
WHERE order_status = 'Delivered';

-- 5. Total Quantity Sold
SELECT SUM(quantity) AS total_quantity_sold
FROM nykaa_sales
WHERE order_status = 'Delivered';

-- 6. Average Order Value
SELECT ROUND(
    SUM(recognized_revenue_inr) / COUNT(*), 2
) AS average_order_value
FROM nykaa_sales
WHERE order_status = 'Delivered';

-- 7. Profit Margin
SELECT ROUND(
    SUM(profit_inr) / SUM(recognized_revenue_inr) * 100, 2
) AS profit_margin_percentage
FROM nykaa_sales
WHERE order_status = 'Delivered';

-- 8. Revenue by Product Category
SELECT product_category,
       SUM(recognized_revenue_inr) AS total_revenue
FROM nykaa_sales
WHERE order_status = 'Delivered'
GROUP BY product_category
ORDER BY total_revenue DESC;

-- 9. Top 10 Products
SELECT product_name,
       SUM(quantity) AS total_quantity_sold,
       SUM(recognized_revenue_inr) AS total_revenue
FROM nykaa_sales
WHERE order_status = 'Delivered'
GROUP BY product_name
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- 10. Monthly Revenue
SELECT DATE_TRUNC('month', order_date)::date AS sales_month,
       SUM(recognized_revenue_inr) AS monthly_revenue
FROM nykaa_sales
WHERE order_status = 'Delivered'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY sales_month;

-- 11. Revenue by Region
SELECT region,
       SUM(recognized_revenue_inr) AS total_revenue
FROM nykaa_sales
WHERE order_status = 'Delivered'
GROUP BY region
ORDER BY total_revenue DESC;

-- 12. Revenue by Payment Method
SELECT payment_method,
       SUM(recognized_revenue_inr) AS total_revenue
FROM nykaa_sales
WHERE order_status = 'Delivered'
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- 13. Order Status Analysis
SELECT order_status,
       COUNT(*) AS total_orders
FROM nykaa_sales
GROUP BY order_status
ORDER BY total_orders DESC;

-- 14. Revenue by Sales Channel
SELECT sales_channel,
       SUM(recognized_revenue_inr) AS total_revenue
FROM nykaa_sales
WHERE order_status = 'Delivered'
GROUP BY sales_channel
ORDER BY total_revenue DESC;
