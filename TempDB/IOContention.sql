CREATE TABLE #Test (
	SomeValue INT,
	Filler CHAR(3000)
)
GO

INSERT INTO #Test (SomeValue, Filler)
SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 1)) SomeNumber, ''
FROM msdb.sys.columns c1 CROSS JOIN msdb.sys.columns c2;

CHECKPOINT;

DELETE FROM #Test

CHECKPOINT;

GO 1000