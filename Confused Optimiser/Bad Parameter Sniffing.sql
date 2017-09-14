DBCC FREEPROCCACHE

EXEC dbo.GetClientTransactions @Priority = NULL,  @ClientID = 42;

GO

EXEC dbo.GetClientTransactions @Priority = 2,  @ClientID = 42;

GO
