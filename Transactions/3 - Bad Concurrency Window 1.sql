-- Window 1

-- Setup first
INSERT INTO dbo.TestingInserts (SomeColumn, SomeOtherColumn)
VALUES  (1, 'Row 1')

BEGIN TRANSACTION

	DECLARE @MaxRow INT

	SELECT @MaxRow = MAX(SomeColumn) FROM dbo.TestingInserts AS ti

	WAITFOR DELAY '00:05:00'

	INSERT INTO dbo.TestingInserts (SomeColumn, SomeOtherColumn)
	SELECT @MaxRow + 1, 'Insert from Window 1'

COMMIT TRANSACTION