SELECT
	MAX(ListPrice)
FROM SalesLT.Product
SELECT
	AVG(ListPrice)
FROM SalesLT.Product

--Example 2: Scalar subqueries in the SELECT and WHERE clauses

SELECT 
	   ProductID
      ,[Name]
      ,StandardCost
      ,ListPrice
	  ,AvgListPrice = (SELECT AVG(ListPrice) FROM SalesLT.Product)
	  ,AvgListPriceDiff = ListPrice - (SELECT AVG(ListPrice) FROM SalesLT.Product)

FROM SalesLT.Product

WHERE ListPrice > (SELECT AVG(ListPrice) FROM SalesLT.Product)

ORDER BY ListPrice ASC