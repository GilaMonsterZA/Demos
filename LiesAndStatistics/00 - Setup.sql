ALTER DATABASE InterStellarTransport SET AUTO_CREATE_STATISTICS OFF;

SELECT * 
INTO dbo.TempShipments 
FROM dbo.Shipments

GO