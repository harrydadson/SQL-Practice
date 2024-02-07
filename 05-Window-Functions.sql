/*
Window Functions
-------------------------

# Window functions allow you to include aggregate calculations in your queries WITHOUT otherwise changing the output in anyway
# The aggregate calculation is simple tacked on to the query as an additional column
# it is also possible to group these calculations just like we can with aggregate queries, using partition
*/

SELECT ProductID, [Name], ProductNumber, ListPrice, [Size]
    ,MaxPrice=Max(ListPrice) OVER()
    ,MaxSize=MAX([Size]) OVER()
FROM SalesLT.Product