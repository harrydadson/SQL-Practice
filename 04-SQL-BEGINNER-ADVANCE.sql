-- SQL Version
SELECT @@version

-- How many tables
SELECT *
FROM sys.tables

-- Display Top 10% of rows
SELECT top 10 percent
        TransactionID,
        ProductID,
        TransactionDate,
        TransactionType
FROM Production.TransactionHistory

-- Display the output more understandable (1-Poor, 2-Fair, 3-Good, 4-Very Good, 5-Excellent)
SELECT ProductID,
        ReviewerName,
        CASE Rating
            WHEN 1 THEN 'Poor'
            WHEN 2 THEN 'Fair'
            WHEN 3 THEN 'Good'
            WHEN 4 THEN 'Very Good'
            WHEN 5 THEN 'Excellent'
        END AS Rating
FROM Production.ProductReview


/** Replace NULL values with specific values. In the Output displayed, instead of NULL Values need to have ) for 
    'ProductAssemblyID' column "without changing any values" in the table **/
SELECT BillOfMaterialsID,
        ISNULL(ProductAssemblyID, 0) AS ProductAssemblyID,
        StartDate
FROM Production.BillOfMaterials

-- Replacing the table or column name Temporarily - name cols(ProductModelID, ProductDescription) and table name with an Alias
SELECT ProductModelID AS ID,
        ProductDescriptionID AS DescID
FROM Production.ProductModelProductDescriptionCulture AS A

-- Filtering (WHERE clause) out Information
SELECT * 
FROM Person.AddressType
WHERE NOT Name = 'Archive'

SELECT *
FROM Purchasing.PurchaseOrderDetail
WHERE ProductID = 512 
AND UnitPrice < 35

-- Search within a range of values - find the name of products that has a List Price in the range of $10-$20
SELECT Name,
        ProductNumber,
        ListPrice
FROM Production.Product
WHERE ListPrice BETWEEN 10 AND 20

-- Filtering out data by comparing values
/** 1. Find records for Products with ProductID = 995
    2. Find records for Products with ProductID = 995 that has more than 500 Orders
    3. Find records for Products with ProductID = 995 that has more than 500 Orders and received before May3, 2013.
**/

SELECT *
FROM Production.WorkOrder
WHERE ProductID = 995

SELECT *
FROM Production.WorkOrder
WHERE ProductID = 995 AND OrderQty > 500 AND StartDate < '2013-05-03'

-- Name of countries that start with the letter V
SELECT Name
FROM Person.CountryRegion
WHERE Name like 'V%'

-- Filtering rows based on some values in a SUB_QUERY (Find the Name of Products having more than 20,000 Order Quantity)
SELECT ProductID, Name 
FROM Production.Product
WHERE ProductID = ANY(
    SELECT ProductID 
    FROM Production.WorkOrder
    WHERE OrderQty > 20000
)

-- Return values by converting them into Upper and Lower case
SELECT UPPER(Name) AS NAME, LOWER(ProductNumber) AS ProductNumber
FROM Production.Product

-- Return certain parts of data
SELECT Name, LEFT(ProductNumber, 2) AS ProductNumber
FROM Production.Product

SELECT Name, RIGHT(ProductNumber, 4) AS ProductNumber
FROM Production.Product

-- SELECT data that have matching records in 2 tables (INNER JOIN)
SELECT A.WorkOrderID, A.ProductID, B.Name
FROM Production.WorkOrder AS A
INNER JOIN Production.Product AS B
ON A.ProductID = B.ProductID

-- Left join
SELECT A.ProductID, A.Name, B.SalesOrderID
FROM Production.Product AS A
LEFT JOIN Sales.SalesOrderDetail AS B
ON A.ProductID = B.ProductID

-- Right Join
SELECT A.ProductID, A.Name, B.SalesOrderID
FROM Production.Product AS A
RIGHT JOIN Sales.SalesOrderDetail AS B
ON A.ProductID = B.ProductID

-- FULL JOIN
SELECT A.ProductID, A.Name, A.ProductSubcategoryID, B.Name
FROM Production.Product AS A
FULL JOIN Production.ProductSubcategory AS B
ON A.ProductSubcategoryID = B.ProductSubcategoryID

-- Count
SELECT DISTINCT COUNT(ProductNumber) AS Total
FROM Production.Product

-- Total for Product 777 sold in 2011
SELECT SUM(LineTotal)
FROM Sales.SalesOrderDetail
WHERE ProductID = 777
AND ModifiedDate BETWEEN '2011-01-01' AND '2011-12-31'

-- Combine data from different cols into one col
SELECT StateProvinceID, CONCAT(StateProvinceCode, '-', Name) AS STATE
FROM Person.StateProvince

-- Arrange rows in groups (Group By)
SELECT ProductID,
        MIN(Quantity) AS Qty,
        COUNT(LocationID) as Locations
FROM Production.ProductInventory
GROUP BY ProductID
HAVING COUNT(LocationID) < 3
