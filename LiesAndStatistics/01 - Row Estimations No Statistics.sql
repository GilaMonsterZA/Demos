USE InterStellarTransport;
GO

SELECT * FROM dbo.Shipments WHERE Priority = 1
ORDER BY ReferenceNumber;

SELECT * FROM dbo.TempShipments WHERE Priority = 1
ORDER BY ReferenceNumber;

GO


