ALTER DATABASE InterStellarTransport SET AUTO_CREATE_STATISTICS OFF;

SELECT * 
INTO dbo.TempShipments 
FROM dbo.Shipments

GO

SELECT * FROM dbo.Shipments WHERE Priority = 1;

SELECT * FROM dbo.TempShipments WHERE Priority = 1;

GO

SET STATISTICS IO, TIME ON;

SELECT s.ClientID, SUM(sd.Mass) FROM dbo.Shipments s INNER JOIN dbo.ShipmentDetails sd ON sd.ShipmentID = s.ShipmentID
	WHERE s.Priority = 1
	GROUP BY s.ClientID;

SELECT s.ClientID, SUM(sd.Mass) FROM dbo.TempShipments s INNER JOIN dbo.ShipmentDetails sd ON sd.ShipmentID = s.ShipmentID
	WHERE s.Priority = 1
	GROUP BY s.ClientID;

DROP TABLE dbo.TempShipments;
ALTER DATABASE InterStellarTransport SET AUTO_CREATE_STATISTICS OFF;
