-- QUESTION 1
-- SELECT ProductId, ProductName, QuantityAvailable
-- FROM Products
-- ORDER BY QuantityAvailable DESC 
-- LIMIT 3;

-- Q2
-- SELECT pd.EmailId, COUNT(*) AS Total_Transactions
-- FROM PurchaseDetails pd 
-- GROUP BY pd.EmailId
-- HAVING COUNT(*) > 10
-- ORDER BY Total_Transactions DESC
-- LIMIT 5; 


-- Q3
-- SELECT c.CategoryName, SUM(p.QuantityAvailable) AS TotalQuantity 
-- FROM Categories c
-- INNER JOIN Products p ON c.CategoryId = p.CategoryId
-- GROUP BY c.CategoryName
-- ORDER BY TotalQuantity DESC; 

-- Q4
-- SELECT p.ProductId, p.ProductName, c.CategoryName, SUM(pd.QuantityPurchased) AS Total_Purchased_Quantity
-- FROM PurchaseDetails pd 
-- INNER JOIN Products p ON pd.ProductId = p.ProductId
-- INNER JOIN Categories c ON p.CategoryId = c.CategoryId
-- GROUP BY p.ProductId
-- ORDER BY Total_Purchased_Quantity DESC
-- LIMIT 1; 

-- Q5. Count of male and female customers
-- SELECT 
--   SUM(CASE WHEN Gender = 'M' THEN 1 ELSE 0 END) AS Male_Customers,
--   SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) AS Female_Customers  
-- FROM Users
-- WHERE RoleId = 2;

-- Q6
-- SELECT
--   ProductId,
--   ProductName,
--   Price,
--   CASE 
--     WHEN Price < 2000 THEN 'Affordable'
--     WHEN Price BETWEEN 2000 AND 50000 THEN 'High End Stuff'
--     ELSE 'Luxury'
--   END AS Item_Classes
-- FROM Products; 


-- Q7
-- SELECT
--   p.ProductId,
--   p.ProductName,
--   c.CategoryName,
--   p.Price AS Old_Price,
--   CASE 
--     WHEN c.CategoryName = 'Motors' THEN p.Price - 3000 
--     WHEN c.CategoryName = 'Electronics' THEN p.Price + 50
--     WHEN c.CategoryName = 'Fashion' THEN p.Price + 150
--     ELSE p.Price
--   END AS New_Price
-- FROM Products p
-- INNER JOIN Categories c ON p.CategoryId = c.CategoryId; 


-- Q8. Percentage of female users 
-- SELECT ROUND(SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Percentage_Females 
-- FROM Users;

-- Q9. Average balance for card types
-- SELECT 
--   CardType,
--   ROUND(AVG(Balance), 2) AS Avg_Balance
-- FROM CardDetails
-- WHERE CVVNumber > 333 AND NameOnCard LIKE '%e'
-- GROUP BY CardType;

-- Q10. 2nd most valuable non-motor item 
-- SELECT 
--   p.ProductName,
--   c.CategoryName,
--   p.Price * p.QuantityAvailable AS Value
-- FROM Products p 
-- JOIN Categories c ON p.CategoryId = c.CategoryId
-- WHERE c.CategoryName <> 'Motors'
-- ORDER BY Value DESC
-- LIMIT 1, 1;

