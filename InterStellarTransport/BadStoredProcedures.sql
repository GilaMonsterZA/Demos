-- 4 slow procs, slow for different reasons.
-- 1 unnecessary cursor (cursor over distinct priority)
-- 1 catch-all query on transactions
-- 1 lots and lots of temp tables
-- 1 scalar functions

-- Couple queries with terrible indexing, 


CREATE OR ALTER PROCEDURE OutstandingShipments (@TargetDate DATETIME)
AS

DECLARE @Priority INT, @Count INT;
DECLARE @Results TABLE (
	Priority INT,
	ShipmentCount INT
);

DECLARE cPriority CURSOR FOR 
	SELECT DISTINCT Priority FROM dbo.Shipments WHERE DispatchDate >= @TargetDate AND DeliveryDate IS NULL;
OPEN cPriority;

FETCH NEXT FROM cPriority INTO @Priority;

WHILE @@FETCH_STATUS = 0
	BEGIN

		SELECT @Count = COUNT(ShipmentID) FROM dbo.Shipments WHERE Priority = @Priority;

		INSERT INTO @Results (Priority, ShipmentCount)
		VALUES (@Priority, @Count);

		FETCH NEXT FROM cPriority INTO @Priority;
    
	END;

CLOSE cPriority;
DEALLOCATE cPriority;

SELECT Priority,
       ShipmentCount 
	FROM @Results
	ORDER BY Priority;

GO


CREATE OR ALTER PROCEDURE GetTransactions (@InvoiceNumber CHAR(15) = NULL, @ReferenceNumber CHAR(25) = NULL, @DispatchDate DATE = NULL, @LegalName VARCHAR(100) = NULL, @TransactionDate DATETIME, @MaxRows INT = NULL)
AS

IF @MaxRows IS NULL
	SET @MaxRows = 2147483647;

SELECT TOP(@MaxRows)
       t.TransactionDate,
       t.TransactionType,
       t.Amount,
       t.InvoiceNumber,
       c.LegalName,
       s.ReferenceNumber,
       s.Priority,
	   os.OfficialName,
	   ds.OfficialName,
       s.HasTemperatureControlled,
       s.HasHazardous,
       s.HasLivestock,
       s.CreationDate,
       s.DispatchDate,
       s.DeliveryDate 
	FROM dbo.Transactions t 
		INNER JOIN dbo.Clients c ON c.ClientID = t.ClientID
		INNER JOIN dbo.Shipments s ON s.ShipmentID = t.ReferenceShipmentID
		INNER JOIN dbo.Stations os ON os.StationID = s.OriginStationID
		INNER JOIN dbo.Stations ds ON ds.StationID = s.DestinationStationID
	WHERE (t.InvoiceNumber = @InvoiceNumber OR @InvoiceNumber IS NULL)
		AND (s.ReferenceNumber = @ReferenceNumber OR @ReferenceNumber IS NULL)
		AND (s.DispatchDate = @DispatchDate OR @DispatchDate IS NULL)
		AND (c.LegalName = @LegalName OR @LegalName IS NULL)
		AND ((t.TransactionDate >= CAST(@TransactionDate AS DATE) AND t.TransactionDate < DATEADD(DAY,1,CAST(@TransactionDate AS DATE))) OR @TransactionDate IS NULL);

GO

CREATE OR ALTER PROCEDURE ShipmentDashboard (@EffectiveDate DATE)
AS

CREATE TABLE #Results (
	OutstandingShipments INT,
	OutstandingShipmentsWithLivestock INT,
	OutstandingShipmentsWithHazardous INT,
	OutstandingShipmentsWithTemperatureControlled INT,
	TransactionsPreviousWeek INT,
	TransactionValuePreviousWeek NUMERIC(12,2),
	TransactionsPreviousMonth INT,
	TransactionValuePreviousMonth NUMERIC(12,2),
	LivestockContainersPreviousWeek INT,
	LivestockContainersPreviousMonth INT,
	HazardousContainersPreviousWeek INT,
	HazardousContainersPreviousMonth INT,
	TemperatureControlledContainersPreviousWeek INT,
	TemperatureControlledContainersPreviousMonth INT
);

SELECT ShipmentID, HasTemperatureControlled, HasHazardous, HasLivestock
	INTO #OutStandingShipments
	FROM dbo.Shipments
	WHERE DeliveryDate IS NULL;


SELECT ShipmentID, HasLivestock 
	INTO #OutstandingShipmentWithLivestock
	FROM #OutStandingShipments
	WHERE HasLivestock = 1;

SELECT ShipmentID, HasTemperatureControlled 
	INTO #OutstandingShipmentWithTempControlled
	FROM #OutStandingShipments
	WHERE HasTemperatureControlled = 1;

SELECT ShipmentID, HasHazardous 
	INTO #OutstandingShipmentWithHazardous
	FROM #OutStandingShipments          
	WHERE HasHazardous = 1;

SELECT TransactionID, TransactionDate, TransactionType, Amount 
	INTO #TransactionsPreviousMonth
	FROM dbo.Transactions
	WHERE TransactionDate > DATEADD(MONTH,-1,@EffectiveDate);

SELECT TransactionID, TransactionDate, TransactionType, Amount 
	INTO #TransactionsPreviousWeek
	FROM dbo.Transactions
	WHERE TransactionDate > DATEADD(WEEK,-1,@EffectiveDate);

SELECT s.ShipmentID, sd.ShipmentDetailID, s.CreationDate, sd.Mass 
	INTO #LivestockLastWeek
	FROM dbo.Shipments s 
		INNER JOIN dbo.ShipmentDetails sd ON sd.ShipmentID = s.ShipmentID
	WHERE s.CreationDate >= DATEADD(WEEK,-1,@EffectiveDate)
		AND sd.IsLivestock = 1;

SELECT s.ShipmentID, sd.ShipmentDetailID, s.CreationDate, sd.Mass 
	INTO #LivestockLastMonth
	FROM dbo.Shipments s 
		INNER JOIN dbo.ShipmentDetails sd ON sd.ShipmentID = s.ShipmentID
	WHERE s.CreationDate >= DATEADD(MONTH,-1,@EffectiveDate)
		AND sd.IsLivestock = 1;

SELECT s.ShipmentID, sd.ShipmentDetailID, s.CreationDate, sd.Mass 
	INTO #TemperatureControlledLastWeek
	FROM dbo.Shipments s 
		INNER JOIN dbo.ShipmentDetails sd ON sd.ShipmentID = s.ShipmentID
	WHERE s.CreationDate >= DATEADD(WEEK,-1,@EffectiveDate)
		AND sd.IsTemperatureControlled = 1;

SELECT s.ShipmentID, sd.ShipmentDetailID, s.CreationDate, sd.Mass 
	INTO #TemperatureControlledLastMonth
	FROM dbo.Shipments s 
		INNER JOIN dbo.ShipmentDetails sd ON sd.ShipmentID = s.ShipmentID
	WHERE s.CreationDate >= DATEADD(MONTH,-1,@EffectiveDate)
		AND sd.IsTemperatureControlled = 1;

SELECT s.ShipmentID, sd.ShipmentDetailID, s.CreationDate, sd.Mass 
	INTO #HazardousLastWeek
	FROM dbo.Shipments s 
		INNER JOIN dbo.ShipmentDetails sd ON sd.ShipmentID = s.ShipmentID
	WHERE s.CreationDate >= DATEADD(WEEK,-1,@EffectiveDate)
		AND sd.IsHazardous = 1;

SELECT s.ShipmentID, sd.ShipmentDetailID, s.CreationDate, sd.Mass 
	INTO #HazardousLastMonth
	FROM dbo.Shipments s 
		INNER JOIN dbo.ShipmentDetails sd ON sd.ShipmentID = s.ShipmentID
	WHERE s.CreationDate >= DATEADD(MONTH,-1,@EffectiveDate)
		AND sd.IsHazardous = 1;

INSERT INTO #Results (OutstandingShipments, OutstandingShipmentsWithLivestock, OutstandingShipmentsWithHazardous,
                      OutstandingShipmentsWithTemperatureControlled, TransactionsPreviousWeek,
                      TransactionValuePreviousWeek, TransactionsPreviousMonth, TransactionValuePreviousMonth,
                      LivestockContainersPreviousWeek, LivestockContainersPreviousMonth,
                      HazardousContainersPreviousWeek, HazardousContainersPreviousMonth,
                      TemperatureControlledContainersPreviousWeek, TemperatureControlledContainersPreviousMonth)
SELECT 
	(SELECT COUNT(*) FROM #OutStandingShipments),
	(SELECT COUNT(*) FROM #OutstandingShipmentWithLivestock),
	(SELECT COUNT(*) FROM #OutstandingShipmentWithHazardous),
	(SELECT COUNT(*) FROM #OutstandingShipmentWithTempControlled),
	(SELECT COUNT(*) FROM #TransactionsPreviousWeek),
	(SELECT SUM(Amount) FROM #TransactionsPreviousWeek),
	(SELECT COUNT(*) FROM #TransactionsPreviousMonth),
	(SELECT SUM(Amount) FROM #TransactionsPreviousMonth),
	(SELECT COUNT(*) FROM #LivestockLastWeek),
	(SELECT COUNT(*) FROM #LivestockLastMonth),
	(SELECT COUNT(*) FROM #HazardousLastWeek),
	(SELECT COUNT(*) FROM #HazardousLastMonth),
	(SELECT COUNT(*) FROM #TemperatureControlledLastWeek),
	(SELECT COUNT(*) FROM #TemperatureControlledLastMonth)

SELECT OutstandingShipments,
       OutstandingShipmentsWithLivestock,
       OutstandingShipmentsWithHazardous,
       OutstandingShipmentsWithTemperatureControlled,
       TransactionsPreviousWeek,
       TransactionValuePreviousWeek,
       TransactionsPreviousMonth,
       TransactionValuePreviousMonth,
       LivestockContainersPreviousWeek,
       LivestockContainersPreviousMonth,
       HazardousContainersPreviousWeek,
       HazardousContainersPreviousMonth,
       TemperatureControlledContainersPreviousWeek,
       TemperatureControlledContainersPreviousMonth 
FROM #Results

GO

CREATE OR ALTER FUNCTION dbo.ClientName (@ClientID INT)
RETURNS VARCHAR(50)
AS
BEGIN
    
	DECLARE @ClientDetails VARCHAR(50)
	SELECT @ClientDetails = LegalName + ' (' + HypernetAddress + ')' FROM dbo.Clients WHERE ClientID = @ClientID

	RETURN @ClientDetails
END


GO


CREATE OR ALTER FUNCTION dbo.StationName (@StationID INT)
RETURNS VARCHAR(50)
AS
BEGIN
    
	DECLARE @StationDetails VARCHAR(50)
	SELECT @StationDetails = OfficialName + ' (' + Location + ' Planet ' + CAST(Planet AS VARCHAR(3)) + ')' FROM dbo.Stations WHERE StationID = @StationID

	RETURN @StationDetails
END
GO

CREATE OR ALTER FUNCTION dbo.ShipmentVolume (@ShipmentID INT)
RETURNS NUMERIC(20,4)
AS
BEGIN
    DECLARE @ShipmentVolume NUMERIC(20,4);
    SELECT @ShipmentVolume = SUM(sd.Volume) FROM dbo.ShipmentDetails sd WHERE sd.ShipmentID = @ShipmentID;
 
    RETURN @ShipmentVolume;
 
END

GO

CREATE OR ALTER PROCEDURE CustomerInvoice (@ClientID INT, @StartDate DATE)
AS

SELECT dbo.ClientName(s.ClientID) AS ClientName,
       s.ReferenceNumber,
       s.Priority,
	   dbo.StationName(s.OriginStationID) AS OriginStation,
	   dbo.StationName(s.DestinationStationID) AS DestinationStation,
       s.HasTemperatureControlled,
       s.HasHazardous,
       s.HasLivestock,
       s.CreationDate,
       s.DispatchDate,
       s.DeliveryDate,
       dbo.ShipmentMass(s.ShipmentID) AS ShipmentMass,
       dbo.ShipmentVolume(s.ShipmentID) AS ShipmentVolume,
       t.TransactionDate,
       t.TransactionType,
       t.Amount,
       t.InvoiceNumber 
	FROM dbo.Shipments s 
		INNER JOIN dbo.Transactions t ON t.ReferenceShipmentID = s.ShipmentID
	WHERE t.ClientID = @ClientID AND t.TransactionDate > @StartDate;



GO
