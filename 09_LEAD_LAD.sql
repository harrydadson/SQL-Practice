/*
- LEAD and LAG let us grab values from subsequent or previous records relative to the
position of the "current" record in our data

- used to compare a value in a given col to the next or previous value in the same col,
but side-by-side
*/
SELECT SalesOrderID, OrderDate, CustomerID, TotalDue,
    NextTotalDue = LEAD(TotalDue,1) OVER(ORDER BY SalesOrderID),
    PrevTotalDue = LAG(TotalDue,1) OVER(ORDER BY SalesOrderID)
FROM SalesLT.SalesOrderHeader
ORDER BY SalesOrderID

-- Using Partiton BY
SELECT SalesOrderID, OrderDate, CustomerID, TotalDue,
    NextTotalDue = LEAD(TotalDue,1) OVER(PARTITION BY CustomerID ORDER BY SalesOrderID),
    PrevTotalDue = LAG(TotalDue,1) OVER(PARTITION BY CustomerID ORDER BY SalesOrderID)
FROM SalesLT.SalesOrderHeader
ORDER BY CustomerID, SalesOrderID