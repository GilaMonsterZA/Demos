SET STATISTICS IO, TIME ON;

SELECT s.ClientID, SUM(sd.Mass) FROM dbo.Shipments s INNER JOIN dbo.ShipmentDetails sd ON sd.ShipmentID = s.ShipmentID
	WHERE s.Priority = 1
	GROUP BY s.ClientID;

SELECT s.ClientID, SUM(sd.Mass) FROM dbo.TempShipments s INNER JOIN dbo.ShipmentDetails sd ON sd.ShipmentID = s.ShipmentID
	WHERE s.Priority = 1
	GROUP BY s.ClientID;

DROP TABLE dbo.TempShipments;
ALTER DATABASE InterStellarTransport SET AUTO_CREATE_STATISTICS ON;
