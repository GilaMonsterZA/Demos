-- FIX!!

CREATE OR ALTER PROCEDURE ShipmentTotalsByStation (@OriginStation INT)
AS

SELECT ClientID, Priority, ReferenceNumber, SUM(NumberOfContainers) as TotalContainers 
	FROM shipments s 
		INNER HASH JOIN ShipmentDetailsColumnStore sd on s.ShipmentID = sd.ShipmentDetailID
	WHERE OriginStationID = @OriginStation
	GROUP BY ClientID, Priority, ReferenceNumber
	ORDER BY s.Priority, s.ReferenceNumber;
GO


EXEC ShipmentTotalsByStation 0