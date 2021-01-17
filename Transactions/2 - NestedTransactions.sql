TRUNCATE TABLE TestingInserts;
GO

BEGIN TRANSACTION
	INSERT INTO dbo.TestingInserts (SomeColumn, SomeOtherColumn)
	VALUES  (1, 'Row 1')

	BEGIN TRANSACTION
	
		INSERT INTO dbo.TestingInserts (SomeColumn, SomeOtherColumn)
		VALUES  (2, 'Row 2')

		BEGIN TRANSACTION

			INSERT INTO dbo.TestingInserts (SomeColumn, SomeOtherColumn)
			VALUES  (3, 'Row 3')

		COMMIT TRANSACTION

	COMMIT TRANSACTION
	-- ROLLBACK TRANSACTION

COMMIT TRANSACTION