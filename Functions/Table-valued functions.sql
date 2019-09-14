SET STATISTICS IO, TIME ON
GO

-- Inline subquery
SELECT s.ReferenceNumber, s.Priority, sd.TotalMass, sd.TotalVolume, sd.TotalContainers
	FROM dbo.Shipments s
		INNER JOIN (SELECT ShipmentID, SUM(Mass) AS TotalMass, SUM(Volume) AS TotalVolume, SUM(NumberOfContainers) AS TotalContainers 
						FROM dbo.ShipmentDetails
						GROUP BY ShipmentID) sd ON sd.ShipmentID = s.ShipmentID

/*
Table 'Shipments'. Scan count 1, logical reads 232, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'ShipmentDetails'. Scan count 1, logical reads 23173, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 2968 ms,  elapsed time = 3117 ms.
*/

-- multi-statement grouped
SELECT s.ReferenceNumber, s.Priority, sd.TotalMass, sd.TotalVolume, sd.TotalContainers
	FROM dbo.Shipments s
		INNER JOIN dbo.ShipmentTotalsGrouped() sd ON sd.ShipmentID = s.ShipmentID

GO

/*
Table 'Shipments'. Scan count 0, logical reads 64909, physical reads 0, read-ahead reads 3, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table '#B2DDFAA8'. Scan count 1, logical reads 137, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 3328 ms,  elapsed time = 3727 ms.*/

-- multistatement filtered with apply

SELECT s.ReferenceNumber, s.Priority, sd.TotalMass, sd.TotalVolume, sd.TotalContainers
	FROM dbo.Shipments s
		CROSS APPLY dbo.ShipmentTotalsFiltered(s.ShipmentID) sd 
GO

/*
Table '#B3D21EE1'. Scan count 31467, logical reads 31467, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'Shipments'. Scan count 1, logical reads 232, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 11093 ms,  elapsed time = 11703 ms.
   */
