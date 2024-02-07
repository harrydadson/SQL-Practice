/*
- Partition By allow to compute aggregate totals for groups within data,
while stile retaining row-level detail

- Partition By assigns each row of the query output to a group, w/o
collapsing data into fewer rows as with Group By

- Instead of groups being assigned based on the distinct values of ALL 
the non-aggregated columns of the data, we need to specify the columns these
groups will be based on
*/

SELECT TOP 10 [SalesOrderID]
      ,[SalesOrderDetailID]
      ,[OrderQty]
      ,[ProductID]
      ,[UnitPrice]
      ,[UnitPriceDiscount]
      ,[LineTotal]
      ,[rowguid]
      ,[ModifiedDate]
      ,ProductIDLineTotal = SUM([LineTotal]) OVER(Partition BY [ProductID], [OrderQty])
  FROM [SalesLT].[SalesOrderDetail]
  ORDER BY [ProductID], OrderQty DESC

