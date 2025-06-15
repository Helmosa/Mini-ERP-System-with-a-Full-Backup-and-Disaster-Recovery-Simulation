USE Mini_ERP_System;

-- Users Table
CREATE TABLE Users (
    UserID INT IDENTITY PRIMARY KEY,
    Username NVARCHAR(50) UNIQUE NOT NULL,
    Role NVARCHAR(20),
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO
-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100),
    Position NVARCHAR(50),
    UserID INT FOREIGN KEY REFERENCES Users(UserID)
);
GO

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100),
    Email NVARCHAR(100),
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100),
    Contact NVARCHAR(100)
);
GO

-- Products Table
CREATE TABLE Products (
    ProductID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100),
    SupplierID INT FOREIGN KEY REFERENCES Suppliers(SupplierID),
    Price DECIMAL(10,2),
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO
-- Inventory Table
CREATE TABLE Inventory (
    InventoryID INT IDENTITY PRIMARY KEY,
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT,
    LastUpdated DATETIME DEFAULT GETDATE()
);
GO

-- Audit Table
CREATE TABLE AuditLog (
    AuditID INT IDENTITY PRIMARY KEY,
    TableName NVARCHAR(50),
    ActionType NVARCHAR(10),
    RecordID INT,
    ChangedAt DATETIME DEFAULT GETDATE(),
    ChangedBy NVARCHAR(50)
);
GO

-- History Table
CREATE TABLE Product_History (
    HistoryID INT IDENTITY PRIMARY KEY,
    ProductID INT,
    Name NVARCHAR(100),
    Price DECIMAL(10,2),
    ChangedAt DATETIME DEFAULT GETDATE()
);
GO

-- Dependent Tables: Sales
CREATE TABLE Sales (
    SaleID INT IDENTITY PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT,
    TotalAmount DECIMAL(10,2),
    SaleDate DATETIME DEFAULT GETDATE()
);
GO

-- Purchases Table
CREATE TABLE Purchases (
    PurchaseID INT IDENTITY PRIMARY KEY,
    SupplierID INT FOREIGN KEY REFERENCES Suppliers(SupplierID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT,
    PurchaseDate DATETIME DEFAULT GETDATE()
);
GO
-- Finance Table
CREATE TABLE Finance (
    FinanceID INT IDENTITY PRIMARY KEY,
    Type NVARCHAR(20), -- 'Sale' or 'Purchase'
    ReferenceID INT,
    Amount DECIMAL(10,2),
    DateRecorded DATETIME DEFAULT GETDATE()
);
GO
