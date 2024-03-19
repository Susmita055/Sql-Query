--1.
SELECT PurchaseOrderID
FROM Purchasing.PurchaseOrderDetail;

--2.
select PurchaseOrderDetailID
from Purchasing.PurchaseOrderDetail;

--3.
SELECT OrderQty
FROM Purchasing.PurchaseOrderDetail;

--4.
SELECT UnitPrice
FROM Purchasing.PurchaseOrderDetail;

--5.
SELECT LineTotal
FROM Purchasing.PurchaseOrderDetail;

--6.
SELECT OrderDate
FROM Purchasing.PurchaseOrderHeader;

--7.
SELECT 
    PurchaseOrderID,
    OrderQty,
    CASE
        WHEN OrderQty > 500 THEN 'Large'
        WHEN OrderQty > 50 THEN 'Medium'
        ELSE 'Small'
    END AS OrderSizeCategory
FROM Purchasing.PurchaseOrderDetail;

--8
SELECT 
    Name AS ProductName
FROM 
    Production.Product;

--9
SELECT 
    CASE 
        WHEN Name IS NULL THEN 'None'
        ELSE Name 
    END AS Subcategory
FROM 
    Production.ProductSubcategory;

--10
SELECT 
    ISNULL(pc.Name, 'None') AS Category
FROM 
    Production.ProductCategory pc
JOIN 
    Production.ProductSubcategory psc ON pc.ProductCategoryID = psc.ProductCategoryID
JOIN 
    Production.Product p ON psc.ProductSubcategoryID = p.ProductSubcategoryID
JOIN 
    Purchasing.PurchaseOrderDetail pod ON p.ProductID = pod.ProductID
JOIN 
    Purchasing.PurchaseOrderHeader poh ON pod.PurchaseOrderID = poh.PurchaseOrderID
WHERE 
    MONTH(poh.OrderDate) = 12;







	










