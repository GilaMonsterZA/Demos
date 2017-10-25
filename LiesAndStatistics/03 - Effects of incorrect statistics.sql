USE InterStellarTransport;
GO

SET STATISTICS IO, TIME ON;


SELECT s.ClientID, SUM(sd.Mass) FROM dbo.Shipments s INNER JOIN dbo.ShipmentDetails sd 
		ON sd.ShipmentID = s.ShipmentID
	WHERE s.Priority = 2
	GROUP BY s.ClientID;
GO

SELECT s.ClientID, SUM(sd.Mass) FROM dbo.TempShipments s INNER JOIN dbo.ShipmentDetails sd 
		ON sd.ShipmentID = s.ShipmentID
	WHERE s.Priority = 2
	GROUP BY s.ClientID;

GO














/*


(5000 rows affected)
Table 'Shipments'. Scan count 9, logical reads 1129, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'ShipmentDetails'. Scan count 9, logical reads 35273, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'Workfile'. Scan count 0, logical reads 0, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'Worktable'. Scan count 0, logical reads 0, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 6641 ms,  elapsed time = 944 ms.


(5000 rows affected)
Table 'ShipmentDetails'. Scan count 125380, logical reads 15767782, physical reads 0, read-ahead reads 15, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'Worktable'. Scan count 0, logical reads 0, physical reads 0, read-ahead reads 189, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'TempShipments'. Scan count 1, logical reads 1316, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.

(1 row affected)

 SQL Server Execution Times:
   CPU time = 9906 ms,  elapsed time = 9950 ms.
SQL Server parse and compile time: 
   CPU time = 0 ms, elapsed time = 0 ms.

*/