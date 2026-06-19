-- 1.Total Revenue
SELECT
SUM([Purchase Amount (USD)]) AS Total_Revenue
FROM shopping_trends;

-- 2.Revenue by Category
SELECT
Category,
SUM([Purchase Amount (USD)]) AS Revenue
FROM shopping_trends
GROUP BY Category
ORDER BY Revenue DESC;

-- 3.Top 10 Spending Customers
SELECT
[Customer ID],
SUM([Purchase Amount (USD)]) AS Total_Spent
FROM shopping_trends
GROUP BY [Customer ID]
ORDER BY Total_Spent DESC
LIMIT 10;

-- 4.Revenue by Season
SELECT
Season,
SUM([Purchase Amount (USD)]) AS Revenue
FROM shopping_trends
GROUP BY Season
ORDER BY Revenue DESC;

-- 5.Average Spend by Gender
SELECT
Gender,
ROUND(AVG([Purchase Amount (USD)]),2) AS Avg_Spend
FROM shopping_trends
GROUP BY Gender;
-- 6. Most Popular Products
SELECT
[Item Purchased],
COUNT(*) AS Times_Purchased
FROM shopping_trends
GROUP BY [Item Purchased]
ORDER BY Times_Purchased DESC
LIMIT 10;

-- 7. Top Revenue Generating Products
SELECT
[Item Purchased],
SUM([Purchase Amount (USD)]) AS Revenue
FROM shopping_trends
GROUP BY [Item Purchased]
ORDER BY Revenue DESC
LIMIT 10;

-- 8. Payment Method Usage
SELECT
[Payment Method],
COUNT(*) AS Usage_Count
FROM shopping_trends
GROUP BY [Payment Method]
ORDER BY Usage_Count DESC;

-- 9. Subscription vs Non-Subscription Spending
SELECT
[Subscription Status],
ROUND(AVG([Purchase Amount (USD)]),2) AS Avg_Spend
FROM shopping_trends
GROUP BY [Subscription Status];

-- 10. Revenue by Location
SELECT
Location,
SUM([Purchase Amount (USD)]) AS Revenue
FROM shopping_trends
GROUP BY Location
ORDER BY Revenue DESC
LIMIT 10;

-- 11. Average Review Rating by Category
SELECT
Category,
ROUND(AVG([Review Rating]),2) AS Avg_Rating
FROM shopping_trends
GROUP BY Category
ORDER BY Avg_Rating DESC;

-- 12. Discount Impact
SELECT
[Discount Applied],
COUNT(*) AS Orders,
ROUND(AVG([Purchase Amount (USD)]),2) AS Avg_Order_Value
FROM shopping_trends
GROUP BY [Discount Applied];

-- 13. Promo Code Usage
SELECT
[Promo Code Used],
COUNT(*) AS Orders
FROM shopping_trends
GROUP BY [Promo Code Used];

-- 14. Revenue by Age Group
SELECT
CASE
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN Age BETWEEN 46 AND 55 THEN '46-55'
    ELSE '56+'
END AS Age_Group,
SUM([Purchase Amount (USD)]) AS Revenue
FROM shopping_trends
GROUP BY Age_Group
ORDER BY Revenue DESC;

-- 15. Customer Lifetime Value Estimate
SELECT
[Customer ID],
COUNT(*) AS Orders,
SUM([Purchase Amount (USD)]) AS Lifetime_Value
FROM shopping_trends
GROUP BY [Customer ID]
ORDER BY Lifetime_Value DESC
LIMIT 10;