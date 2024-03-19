--10.
SELECT 
    CASE WHEN MONTH(PH.OrderDate) = 12 THEN ISNULL(PC.Name, 'None') END AS Category,
    PH.OrderDate
FROM 
    Purchasing.PurchaseOrderHeader PH
JOIN 
    Purchasing.PurchaseOrderDetail PD ON PH.PurchaseOrderID = PD.PurchaseOrderID
JOIN 
    Production.Product P ON PD.ProductID = P.ProductID
JOIN 
    Production.ProductSubcategory PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID
JOIN 
    Production.ProductCategory PC ON PS.ProductCategoryID = PC.ProductCategoryID
WHERE 
    MONTH(PH.OrderDate) = 12

UNION

SELECT 
    CASE WHEN MONTH(SH.OrderDate) = 12 THEN ISNULL(PC.Name, 'None') END AS Category,
    SH.OrderDate
FROM 
    Sales.SalesOrderHeader SH
JOIN 
    Sales.SalesOrderDetail SD ON SH.SalesOrderID = SD.SalesOrderID
JOIN 
    Production.Product P ON SD.ProductID = P.ProductID
JOIN 
    Production.ProductSubcategory PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID
JOIN 
    Production.ProductCategory PC ON PS.ProductCategoryID = PC.ProductCategoryID
WHERE 
    MONTH(SH.OrderDate) = 12;


--14.
SELECT AddressLine1 AS Address
FROM Person.Address;

--15.
Select City
from Person.Address;


--16.
select PostalCode
from Person.Address;

--17.

SELECT Name AS State
FROM Person.StateProvince;

--18.
SELECT PR.Name AS Country
FROM Person.CountryRegion AS PR
JOIN Person.StateProvince AS SP ON PR.CountryRegionCode = SP.CountryRegionCode
JOIN Person.Address AS A ON SP.StateProvinceID = A.StateProvinceID
JOIN Person.Person AS P ON A.AddressID = P.BusinessEntityID
WHERE P.PersonType = 'SP'
   OR (LEFT(A.PostalCode, 1) = '9' AND LEN(A.PostalCode) = 5 AND PR.Name = 'United States');



   --QN.3. 1

  SELECT *
FROM Person.Person AS p
LEFT JOIN HumanResources.Employee AS e
ON p.BusinessEntityID = e.BusinessEntityID;


--2.
SELECT
    p.BusinessEntityID,
    p.FirstName,
    p.LastName,
    CASE
        WHEN e.JobTitle IS NULL THEN 'None'
        ELSE e.JobTitle
    END AS JobTitle
FROM
    Person.Person p
LEFT JOIN
    HumanResources.Employee e ON p.BusinessEntityID = e.BusinessEntityID;

	--3.

	SELECT 
    JobTitle,
    CASE 
        WHEN JobTitle IS NULL THEN 'NA'
        WHEN JobTitle LIKE '%Manager%' OR JobTitle LIKE '%President%' OR JobTitle LIKE '%Executive%' THEN 'Management'
        WHEN JobTitle LIKE '%Engineer%' THEN 'Engineering'
        WHEN JobTitle LIKE '%Production%' THEN 'Production'
        WHEN JobTitle LIKE '%Marketing%' THEN 'Marketing'
        WHEN JobTitle IN ('Recruiter', 'Benefits Specialist', 'Human Resources Administrative Assistant') THEN 'Human Resources'
        ELSE 'Other'
    END AS JobCategory
FROM 
   HumanResources.Employee ;

--4.

DECLARE @CurrentDate DATE = GETDATE(); 


DECLARE @Year INT = DATEPART(YEAR, @CurrentDate);
DECLARE @Month INT = DATEPART(MONTH, @CurrentDate);


DECLARE @EndOfMonth DATE = DATEADD(DAY, -1, DATEFROMPARTS(@Year, @Month + 1, 1));


DECLARE @DaysRemaining INT = DATEDIFF(DAY, @CurrentDate, @EndOfMonth);

SELECT @DaysRemaining AS DaysRemaining;






