-- Window 2

BEGIN TRANSACTION

	DECLARE @MaxRow INT

	SELECT @MaxRow = MAX(SomeColumn) FROM dbo.TestingInserts AS ti

	WAITFOR DELAY '00:00:30'

	INSERT INTO dbo.TestingInserts (SomeColumn, SomeOtherColumn)
	SELECT @MaxRow + 1, 'Insert from Window 2'

COMMIT TRANSACTION