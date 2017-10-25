USE InterStellarTransport;
GO

DROP TABLE dbo.TempShipments;
DELETE FROM Transactions where TransactionDate > '2410-02-20 16:53'
ALTER DATABASE InterStellarTransport SET AUTO_CREATE_STATISTICS ON;
