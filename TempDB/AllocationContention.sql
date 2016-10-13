SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 1)) SomeNumber
INTO #Test
FROM msdb.sys.columns c1 CROSS JOIN msdb.sys.columns c2;

ALTER TABLE #Test ADD Filler VARCHAR(10) NULL;

DROP TABLE #Test;

GO 1000