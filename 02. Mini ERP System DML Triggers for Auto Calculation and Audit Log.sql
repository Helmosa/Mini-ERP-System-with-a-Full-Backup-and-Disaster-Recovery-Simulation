-- Trigger: Calculate total amount for sales
CREATE TRIGGER trg_CalculateTotalAmount
ON Sales
AFTER INSERT
AS
BEGIN
    UPDATE s
    SET TotalAmount = i.Quantity * p.Price
    FROM Sales s
    JOIN inserted i ON s.SaleID = i.SaleID
    JOIN Products p ON i.ProductID = p.ProductID;
END;
GO

-- Trigger: Log inventory updates into AuditLog
CREATE TRIGGER trg_Inventory_AuditLog
ON Inventory
AFTER UPDATE
AS
BEGIN
    INSERT INTO AuditLog (TableName, ActionType, RecordID, ChangedAt, ChangedBy)
    SELECT 
        'Inventory',
        'UPDATE',
        i.InventoryID,
        GETDATE(),
        CONVERT(NVARCHAR(50), SESSION_CONTEXT(N'username'))
    FROM inserted i;
END;
GO

-- Trigger: Log product changes into Product_History
CREATE TRIGGER trg_ProductHistory
ON Products
AFTER UPDATE
AS
BEGIN
    INSERT INTO Product_History (ProductID, Name, Price, ChangedAt)
    SELECT 
        i.ProductID,
        i.Name,
        i.Price,
        GETDATE()
    FROM inserted i;
END;
GO

-- Trigger: Add sale/purchase entries to Finance
CREATE TRIGGER trg_FinanceAutoLog
ON Sales
AFTER INSERT
AS
BEGIN
    INSERT INTO Finance (Type, ReferenceID, Amount, DateRecorded)
    SELECT 
        'Sale',
        i.SaleID,
        i.Quantity * p.Price,
        GETDATE()
    FROM inserted i
    JOIN Products p ON i.ProductID = p.ProductID;
END;
GO

CREATE TRIGGER trg_FinanceAutoLog_Purchase
ON Purchases
AFTER INSERT
AS
BEGIN
    INSERT INTO Finance (Type, ReferenceID, Amount, DateRecorded)
    SELECT 
        'Purchase',
        i.PurchaseID,
        i.Quantity * p.Price,
        GETDATE()
    FROM inserted i
    JOIN Products p ON i.ProductID = p.ProductID;
END;
GO
