-- Lookup tables

INSERT INTO dbo.CustomsCodes (CustomsCode, Description)
VALUES ('0000', 'Placeholder')


-- Shipments

SELECT ClientID,
       ReferenceNumber,
       Priority,
       OriginStationID,
       DestinationStationID,
       HasTemperatureControlled,
       HasHazardous,
       HasLivestock,
       CreationDate
INTO #Shipments
FROM dbo.Shipments 
WHERE 1=0;

INSERT INTO #Shipments
(
    ClientID,
    ReferenceNumber,
    Priority,
    OriginStationID,
    DestinationStationID,
    HasTemperatureControlled,
    HasHazardous,
    HasLivestock,
    CreationDate
)
SELECT c.ClientID, 
	CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + LEFT(CAST((RAND(CHECKSUM(NEWID()))*89999 + 10000) AS VARCHAR(20)),5), 
	2,  
	Origin.StationID,
	Dest.StationID,
	0,
	0,
	0,
	-- adjustdate. Want 4 years of data
	dbo.AdjustDate(DATEADD(dd, RAND(CHECKSUM(NEWID()))*4*365, '2020-01-01'))
FROM dbo.Clients c 
	CROSS APPLY (SELECT Number FROM dbo.Numbers WHERE Number < RAND(CHECKSUM(newID()))*25 AND Number != c.ClientID) n
	CROSS APPLY (SELECT TOP (1) StationID FROM dbo.Stations WHERE ClientID != StarSystemID ORDER BY NEWID()) Origin
	CROSS APPLY (SELECT TOP (1) StationID FROM dbo.Stations WHERE ClientID != StarSystemID ORDER BY NEWID()) Dest;

INSERT INTO #Shipments
(
    ClientID,
    ReferenceNumber,
    Priority,
    OriginStationID,
    DestinationStationID,
    HasTemperatureControlled,
    HasHazardous,
    HasLivestock,
    CreationDate
)
SELECT c.ClientID, 
	CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + LEFT(CAST((RAND(CHECKSUM(NEWID()))*89999 + 10000) AS VARCHAR(20)),5), 
	2,  
	Origin.StationID,
	Dest.StationID,
	0,
	0,
	0,
	-- adjustdate. Want 4 years of data
	dbo.AdjustDate(DATEADD(dd, RAND(CHECKSUM(NEWID()))*4*365, '2020-01-01'))
FROM dbo.Clients c 
	CROSS APPLY (SELECT Number FROM dbo.Numbers WHERE Number < RAND(CHECKSUM(newID()))*50 AND Number != c.ClientID) n
	CROSS APPLY (SELECT TOP (1) StationID FROM dbo.Stations WHERE ClientID != StarSystemID ORDER BY NEWID()) Origin
	CROSS APPLY (SELECT TOP (1) StationID FROM dbo.Stations WHERE ClientID != StarSystemID ORDER BY NEWID()) Dest
WHERE c.ClientID IN (SELECT TOP (15) PERCENT ClientID FROM dbo.Clients ORDER BY NEWID());

INSERT INTO #Shipments
(
    ClientID,
    ReferenceNumber,
    Priority,
    OriginStationID,
    DestinationStationID,
    HasTemperatureControlled,
    HasHazardous,
    HasLivestock,
    CreationDate
)
SELECT c.ClientID, 
	CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + LEFT(CAST((RAND(CHECKSUM(NEWID()))*89999 + 10000) AS VARCHAR(20)),5), 
	2,  
	Origin.StationID,
	Dest.StationID,
	0,
	0,
	0,
	-- adjustdate. Want 4 years of data
	dbo.AdjustDate(DATEADD(dd, RAND(CHECKSUM(NEWID()))*4*365, '2020-01-01'))
FROM dbo.Clients c 
	CROSS APPLY (SELECT Number FROM dbo.Numbers WHERE Number < RAND(CHECKSUM(newID()))*75 AND Number != c.ClientID) n
	CROSS APPLY (SELECT TOP (1) StationID FROM dbo.Stations WHERE ClientID != StarSystemID ORDER BY NEWID()) Origin
	CROSS APPLY (SELECT TOP (1) StationID FROM dbo.Stations WHERE ClientID != StarSystemID ORDER BY NEWID()) Dest
WHERE c.ClientID IN (SELECT TOP (5) PERCENT ClientID FROM dbo.Clients ORDER BY NEWID());

INSERT INTO dbo.Shipments
(
    ClientID,
    ReferenceNumber,
    Priority,
    OriginStationID,
    DestinationStationID,
    HasTemperatureControlled,
    HasHazardous,
    HasLivestock,
    CreationDate
)
SELECT * FROM #Shipments ORDER BY CreationDate

-- set the dispatch date

UPDATE Shipments
	SET DispatchDate = DATEADD(dd, RAND(CHECKSUM(NEWID()))*30, CreationDate)

UPDATE Shipments
	SET DispatchDate = DATEADD(dd, RAND(CHECKSUM(NEWID()))*30, CreationDate)
	WHERE ShipmentID IN (SELECT TOP (15) PERCENT ShipmentID FROM dbo.Shipments ORDER BY NEWID())
GO

-- and the delivery date

UPDATE dbo.Shipments SET DeliveryDate = DATEADD(DAY, RAND(CHECKSUM(NEWID()))*60, DispatchDate)

DECLARE @MaxDispatchDate DATETIME = (SELECT MAX(DispatchDate) FROM Shipments)

UPDATE dbo.Shipments SET DeliveryDate = NULL
WHERE DeliveryDate >= @MaxDispatchDate

-- update some of the priorities

UPDATE Shipments
	SET Priority = 1
WHERE ShipmentID IN (SELECT TOP (20) PERCENT ShipmentID FROM dbo.Shipments ORDER BY NEWID())


UPDATE Shipments
	SET Priority = 3
WHERE ShipmentID IN (SELECT TOP (40) PERCENT ShipmentID FROM dbo.Shipments ORDER BY NEWID())

--------------------------------------------------------------------------------
	






-- shipment details

WITH Source AS (
	SELECT *, CHECKSUM(newID()) AS rng FROM dbo.Shipments s
)
INSERT INTO dbo.ShipmentDetails
(
    ShipmentID,
    CustomsCodeID,
    Mass,
    Volume,
    NumberOfContainers,
    IsTemperatureControlled,
    IsHazardous,
    IsLivestock
)
SELECT Source.ShipmentID, 
	1, 
	RAND(CHECKSUM(NEWID()))*9000, 
	RAND(CHECKSUM(NEWID()))*9000, 
	RAND(CHECKSUM(NEWID()))*100,
	CASE WHEN RAND(CHECKSUM(NEWID())) < 0.1 THEN 1 ELSE 0 END,
	CASE WHEN RAND(CHECKSUM(NEWID())) < 0.1 THEN 1 ELSE 0 END,
	CASE WHEN RAND(CHECKSUM(NEWID())) < 0.1 THEN 1 ELSE 0 END
FROM Source
	CROSS APPLY (SELECT Number FROM dbo.Numbers WHERE Number < RAND(CHECKSUM(newID()))*75 AND Number != Source.ShipmentID) n;

-- and a small percentage are for more.


WITH Source AS (
	SELECT TOP(10) PERCENT *, CHECKSUM(newID()) AS rng FROM dbo.Shipments s
)
INSERT INTO dbo.ShipmentDetails
(
    ShipmentID,
    CustomsCodeID,
    Mass,
    Volume,
    NumberOfContainers,
    IsTemperatureControlled,
    IsHazardous,
    IsLivestock
)
SELECT Source.ShipmentID, 
	1, 
	RAND(CHECKSUM(NEWID()))*9000, 
	RAND(CHECKSUM(NEWID()))*9000, 
	RAND(CHECKSUM(NEWID()))*100,
	CASE WHEN RAND(CHECKSUM(NEWID())) < 0.1 THEN 1 ELSE 0 END,
	CASE WHEN RAND(CHECKSUM(NEWID())) < 0.1 THEN 1 ELSE 0 END,
	CASE WHEN RAND(CHECKSUM(NEWID())) < 0.1 THEN 1 ELSE 0 END
FROM Source
	CROSS APPLY (SELECT Number FROM dbo.Numbers WHERE Number < RAND(CHECKSUM(newID()))*250 AND Number != Source.ShipmentID) n;

---


UPDATE s
	SET HasTemperatureControlled = sd.HasTemperatureControlled,
		HasHazardous = sd.HasTemperatureControlled,
		HasLivestock = sd.HasLivestock
FROM dbo.Shipments s
	INNER JOIN (SELECT ShipmentID, 
						MAX(CAST(IsTemperatureControlled AS TINYINT)) AS HasTemperatureControlled,  
						MAX(CAST(IsHazardous AS TINYINT)) AS HasHazardous,
						MAX(CAST(IsLivestock AS TINYINT)) AS HasLivestock
				FROM dbo.ShipmentDetails
				GROUP BY ShipmentID
				) sd ON sd.ShipmentID = s.ShipmentID


-- very much a placeholder, transactions

INSERT INTO dbo.Transactions (ReferenceShipmentID, ClientID, TransactionDate, TransactionType, Amount, InvoiceNumber)
SELECT ShipmentID,
       ClientID,
       DATEADD(MINUTE,RAND(CHECKSUM(NEWID()))*24*60*2, CAST(CreationDate AS DATETIME)) AS TransactionDate,
	   'W',
	   RAND(CHECKSUM(NEWID()))*5000,
	   CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + CHAR(RAND(CHECKSUM(NEWID()))*26 + 65) + LEFT(CAST((RAND(CHECKSUM(NEWID()))*89999 + 10000) AS VARCHAR(20)),5)    
FROM dbo.Shipments
ORDER BY TransactionDate

UPDATE dbo.Transactions
	SET TransactionType = 'D'
	WHERE TransactionID IN (SELECT TOP (25) PERCENT TransactionID FROM dbo.Transactions ORDER BY NEWID())

UPDATE dbo.Transactions
	SET TransactionType = 'S'
	WHERE TransactionID IN (SELECT TOP (15) PERCENT TransactionID FROM dbo.Transactions ORDER BY NEWID())

	
	