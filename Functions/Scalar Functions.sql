SET STATISTICS IO, TIME ON
GO

-- scalar functions without data

SELECT CAST(TransactionDate AS DATE) AS TransactionDateOnly, TransactionType, Amount, InvoiceNumber 
FROM dbo.Transactions;
GO

/*
Table 'Transactions'. Scan count 1, logical reads 198, physical reads 1, read-ahead reads 203, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 421 ms.
 */

SELECT dbo.DateOnly(TransactionDate) AS TransactionDateOnly, TransactionType, Amount, InvoiceNumber 
FROM dbo.Transactions;
GO

/*
Table 'Transactions'. Scan count 1, logical reads 198, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 94 ms,  elapsed time = 359 ms.
*/

SELECT dt.DateWithoutTime AS TransactionDateOnly, TransactionType, Amount, InvoiceNumber 
FROM dbo.Transactions CROSS APPLY dbo.DateOnly_table(TransactionDate) dt;
GO

-- scalar function with data

SELECT s.ReferenceNumber, s.Priority, 
	(SELECT SUM(Mass) FROM dbo.ShipmentDetails WHERE ShipmentID = s.ShipmentID) AS TotalMass
	FROM dbo.Shipments s

GO

/*
Table 'Shipments'. Scan count 1, logical reads 232, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'ShipmentDetails'. Scan count 1, logical reads 23173, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 1671 ms,  elapsed time = 1815 ms.
 */

SELECT s.ReferenceNumber, s.Priority, dbo.ShipmentTotalMass(s.ShipmentID) AS TotalMass
	FROM dbo.Shipments s
GO

/*
Table 'Shipments'. Scan count 1, logical reads 232, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 3625 ms,  elapsed time = 3785 ms.
 */