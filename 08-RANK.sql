SELECT SalesOrderID, SalesOrderDetailID, LineTotal,
    Ranking = ROW_NUMBER() OVER (PARTITION BY SalesOrderID ORDER BY LineTotal DESC),
    RankingWithRank = RANK() OVER (PARTITION BY SalesOrderID ORDER BY LineTotal DESC),
    RankingWithDenseRank = Dense_RANK() OVER (PARTITION BY SalesOrderID ORDER BY LineTotal DESC)
FROM SalesLT.SalesOrderDetail