
CREATE PROCEDURE CatchAll
(@Product int = NULL, @TransactionType char(1) = NULL, @Qty int = NULL)
AS
SELECT ProductID, TransactionType, Quantity
from Production.TransactionHistory
WHERE (ProductID = @Product Or @Product IS NULL)
AND (TransactionType = @TransactionType OR @TransactionType Is NULL)
AND (Quantity = @Qty Or @Qty is null)
GO


EXEC dbo.CatchAll @Product = 42, @Qty = 10
GO

EXEC dbo.CatchAll @TransactionType = 'W', @Qty = 10
go

SELECT * FROM sys.dm_db_partition_stats WHERE OBJECT_ID = OBJECT_ID('Production.TransactionHistory')