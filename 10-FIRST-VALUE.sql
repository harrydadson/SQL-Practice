/*
- Operates over a window of rows defined by a PARTITION BY clause
-Returns the first value from the specified column within that window
Useful for comparing the values in each row of a window with the first one
*/
SELECT SalesOrderID, SalesOrderDetailID, LineTotal,
    Ranking = ROW_NUMBER() OVER (PARTITION BY SalesOrderID ORDER BY LineTotal DESC),
    HighestToatal = FIRST_VALUE(LineTotal) OVER(PARTITION BY SalesOrderID ORDER BY LineTotal)
FROM SalesLT.SalesOrderDetail
ORDER BY SalesOrderID, LineTotal DESC