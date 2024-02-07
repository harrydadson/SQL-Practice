SELECT TOP 10 [SalesOrderID]
      ,[SalesOrderDetailID]
      ,[OrderQty]
      ,[ProductID]
      ,[UnitPrice]
      ,[UnitPriceDiscount]
      ,[LineTotal]
      ,[rowguid]
      ,[ModifiedDate]
      ,ProductIDLineTotal = SUM([LineTotal]) OVER(Partition BY [SalesOrderID])
      ,Ranking = ROW_NUMBER() OVER(PARTITION BY [SalesOrderID] ORDER BY [LineTotal] ASC)
  FROM [SalesLT].[SalesOrderDetail]
  ORDER BY [ProductID]