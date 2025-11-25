
-- Total sales by product
SELECT 
  P.ProductName,
  SUM(O.Quantity * P.Price) AS TotalSales
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
GROUP BY P.ProductName
ORDER BY TotalSales DESC;

-- Revenue by month
SELECT 
  DATE_TRUNC('month', OrderDate) AS OrderMonth,
  SUM(O.Quantity * P.Price) AS MonthlyRevenue
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
GROUP BY OrderMonth
ORDER BY OrderMonth;
