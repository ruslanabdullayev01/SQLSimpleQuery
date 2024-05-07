CREATE DATABASE ProductCatalog

USE ProductCatalog

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100)
)

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName NVARCHAR(100)
)

CREATE TABLE ProductCategories (
    ProductID INT FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    CategoryID INT FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    PRIMARY KEY (ProductID, CategoryID)
)

INSERT INTO Products (ProductID, ProductName) VALUES 
    (1, 'Product 1'),
    (2, 'Product 2'),
    (3, 'Product 3');

INSERT INTO Categories (CategoryID, CategoryName) VALUES 
    (1, 'Category 1'),
    (2, 'Category 2'),
    (3, 'Category 3');

INSERT INTO ProductCategories (ProductID, CategoryID) VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (3, 3)


SELECT 
    p.ProductName, 
    ISNULL(c.CategoryName, 'Без категории') AS CategoryName
FROM 
    Products p
LEFT JOIN 
    ProductCategories pc ON p.ProductID = pc.ProductID
LEFT JOIN 
    Categories c ON pc.CategoryID = c.CategoryID;