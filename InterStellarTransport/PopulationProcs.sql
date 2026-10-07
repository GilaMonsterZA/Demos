CREATE OR ALTER PROCEDURE AddNewShipment
AS

DECLARE @CurrentMaxCreationDate DATETIME,
	@ShipmentID INT

SELECT @CurrentMaxCreationDate = MAX(CreationDate) from dbo.Shipments;

--INSERT INTO Shipments (ClientID, ReferenceNumber, Priority, OriginStationID, DestinationStationID, HasTemperatureControlled, HasHazardous, HasLivestock, CreationDate)
SELECT c.ClientID, 
	CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + LEFT(CAST((RAND(CHECKSUM(NEWID()))*89999 + 10000) AS VARCHAR(20)),5), 
	2,  
	Origin.StationID,
	Dest.StationID,
	0,
	0,
	0,
	-- adjustdate. Want 4 years of data
	DATEADD(dd, RAND(CHECKSUM(NEWID()))*4, @CurrentMaxCreationDate)
FROM dbo.Clients c 
	CROSS APPLY (SELECT TOP (1) StationID FROM dbo.Stations WHERE ClientID != StarSystemID ORDER BY NEWID()) Origin
	CROSS APPLY (SELECT TOP (1) StationID FROM dbo.Stations WHERE ClientID != StarSystemID ORDER BY NEWID()) Dest;

SET @ShipmentID = @@IDENTITY;

--INSERT INTO dbo.ShipmentDetails (ShipmentID, CustomsCodeID, Mass, Volume, NumberOfContainers, IsTemperatureControlled, IsHazardous, IsLivestock)
SELECT @ShipmentID, 
	1, 
	RAND(CHECKSUM(NEWID()))*9000, 
	RAND(CHECKSUM(NEWID()))*9000, 
	RAND(CHECKSUM(NEWID()))*100,
	CASE WHEN RAND(CHECKSUM(NEWID())) < 0.1 THEN 1 ELSE 0 END,
	CASE WHEN RAND(CHECKSUM(NEWID())) < 0.1 THEN 1 ELSE 0 END,
	CASE WHEN RAND(CHECKSUM(NEWID())) < 0.1 THEN 1 ELSE 0 END
FROM (SELECT Number FROM dbo.Numbers WHERE Number < RAND(CHECKSUM(newID()))*75) n;

--INSERT INTO dbo.Transactions (ReferenceShipmentID, ClientID, TransactionDate, TransactionType, Amount, InvoiceNumber)
SELECT ShipmentID,
       ClientID,
       DATEADD(MINUTE,RAND(CHECKSUM(NEWID()))*24*60*2, CAST(CreationDate AS DATETIME)) AS TransactionDate,
	   'W',
	   RAND(CHECKSUM(NEWID()))*5000,
	   CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + LEFT(CAST((RAND(CHECKSUM(NEWID()))*89999 + 10000) AS VARCHAR(20)),5)    
FROM dbo.Shipments
WHERE ShipmentID = @ShipmentID

GO

CREATE OR ALTER PROCEDURE DispatchOrder 
AS
DECLARE @ShipmentID INT;

SELECT TOP(1) @ShipmentID = ShipmentID FROM dbo.Shipments WHERE DispatchDate IS NULL ORDER BY NEWID()

UPDATE dbo.Shipments
	SET DispatchDate = DATEADD(dd, RAND(CHECKSUM(NEWID()))*30, CreationDate)
	WHERE ShipmentID = @ShipmentID;

GO

CREATE OR ALTER PROCEDURE DeliverOrder 
AS
DECLARE @ShipmentID INT;

SELECT TOP(1) @ShipmentID = ShipmentID FROM dbo.Shipments WHERE DeliveryDate IS NULL ORDER BY NEWID()

UPDATE dbo.Shipments
	SET DispatchDate = DATEADD(dd, RAND(CHECKSUM(NEWID()))*15, DispatchDate)
	WHERE ShipmentID = @ShipmentID;

GO

CREATE OR ALTER PROCEDURE ArchiveOldOrder
AS

DECLARE @ShipmentID INT;

SELECT TOP(1) @ShipmentID = ShipmentID FROM dbo.Shipments WHERE CreationDate < '2450-03-01' AND DeliveryDate IS NOT NULL ORDER BY NEWID()

DELETE FROM dbo.Transactions WHERE ReferenceShipmentID = @ShipmentID;
DELETE FROM dbo.ShipmentDetails WHERE ShipmentID = @ShipmentID;
DELETE FROM dbo.Shipments WHERE ShipmentID = @ShipmentID;

GO