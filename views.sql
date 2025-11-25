
-- View for top-selling products
CREATE VIEW TopSellingProducts AS
SELECT 
  P.ProductName,
  SUM(O.Quantity) AS TotalQuantitySold
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
GROUP BY P.ProductName
ORDER BY TotalQuantitySold DESC;

-- View for churn risk customers
CREATE VIEW ChurnRiskCustomers AS
SELECT 
  C.CustomerID,
  C.Name,
  MAX(O.OrderDate) AS LastOrderDate
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.Name
HAVING MAX(O.OrderDate) < CURRENT_DATE - INTERVAL '6 months';
