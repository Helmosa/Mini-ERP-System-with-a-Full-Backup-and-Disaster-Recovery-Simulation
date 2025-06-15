CREATE VIEW vw_RecentSalesReport AS
SELECT 
    s.SaleID,
    c.Name AS Customer,
    p.Name AS Product,
    s.Quantity,
    s.TotalAmount,
    s.SaleDate
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
JOIN Products p ON s.ProductID = p.ProductID
WHERE s.SaleDate >= DATEADD(DAY, -30, GETDATE());
GO



CREATE VIEW vw_InventorySummary AS
SELECT 
    i.InventoryID,
    p.Name AS Product,
    i.Quantity,
    i.LastUpdated
FROM Inventory i
JOIN Products p ON i.ProductID = p.ProductID;
GO