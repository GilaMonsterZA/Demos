TRUNCATE TABLE TestingInserts;
GO

BEGIN TRANSACTION

INSERT INTO dbo.TestingInserts (SomeColumn, SomeOtherColumn)
VALUES  (1, 'Row 1')

INSERT INTO dbo.TestingInserts (SomeColumn, SomeOtherColumn)
VALUES  (1, 'Row 2')

-- not committed
-- Demo 1, now another window kill session. 
-- Demo 2, restart service