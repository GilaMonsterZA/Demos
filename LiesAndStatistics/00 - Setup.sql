ALTER DATABASE InterStellarTransport SET AUTO_CREATE_STATISTICS OFF;
ALTER DATABASE InterStellarTransport SET AUTO_UPDATE_STATISTICS OFF;

USE InterStellarTransport

SELECT * 
INTO dbo.TempShipments 
FROM dbo.Shipments

GO