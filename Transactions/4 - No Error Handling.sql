BEGIN TRANSACTION

INSERT INTO dbo.TestingInserts (SomeColumn, SomeOtherColumn)
VALUES  (1, 'Row 1')

INSERT INTO dbo.TestingInserts (SomeColumn, SomeOtherColumn)
VALUES  (1/0, 'Will throw an error')

INSERT INTO dbo.TestingInserts (SomeColumn, SomeOtherColumn)
VALUES  (1, 'Row 2')

COMMIT TRANSACTION