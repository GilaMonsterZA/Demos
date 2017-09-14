CREATE PROCEDURE SearchShipmentsRange 
	@MinMass NUMERIC(6,2) = NULL,
	@MaxMass NUMERIC(6,2) = NULL,
	@MinVolume NUMERIC(6,2) = NULL,
	@MaxVolume NUMERIC(6,2) = NULL,
	@MinContainers SMALLINT = NULL,
	@MaxContainers SMALLINT = NULL
AS

IF (@MinMass IS NULL)	
	SET @MinMass = 0;

IF (@MaxMass IS NULL)
	SET @MaxMass = 9999.99;

IF (@MinVolume IS NULL)	
	SET @MinVolume = 0;

IF (@MaxVolume IS NULL)
	SET @MaxVolume = 9999.99;

IF (@MinContainers IS NULL)	
	SET @MinContainers = 0;

IF (@MaxContainers IS NULL)
	SET @MaxContainers = 32766;

SELECT * 
	FROM dbo.Shipments s INNER JOIN dbo.ShipmentDetails sd ON sd.ShipmentID = s.ShipmentID
	WHERE sd.Mass BETWEEN @MinMass AND @MaxMass
		AND sd.Volume BETWEEN @MinVolume AND @MaxVolume
		AND sd.NumberOfContainers BETWEEN @MinContainers AND @MaxContainers;
