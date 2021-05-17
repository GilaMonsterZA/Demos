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
	TemperatureControlledContainersPreviousMonth INT,
	NewShipmentsPreviousWeek INT
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

GO

CREATE OR ALTER PROCEDURE CustomerInvoice (@ClientID INT, @StartDate DATE)
AS;



GO
