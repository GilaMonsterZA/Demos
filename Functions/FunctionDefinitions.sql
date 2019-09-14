CREATE OR ALTER FUNCTION dbo.ShipmentTotalsGrouped()
RETURNS @sd TABLE (ShipmentID INT, TotalMass NUMERIC(10,2), TotalVolume  NUMERIC(10,2), TotalContainers INT)
AS
BEGIN
	INSERT INTO @sd
	SELECT ShipmentID, SUM(Mass) AS TotalMass, SUM(Volume) AS TotalVolume, SUM(NumberOfContainers) AS TotalContainers 
		FROM dbo.ShipmentDetails
		GROUP BY ShipmentID;
RETURN;
END

GO

CREATE OR ALTER FUNCTION dbo.ShipmentTotalsFiltered(@ShipmentID INT)
RETURNS @sd TABLE (TotalMass NUMERIC(10,2), TotalVolume  NUMERIC(10,2), TotalContainers INT)
AS
BEGIN
	INSERT INTO @sd
	SELECT SUM(Mass) AS TotalMass, SUM(Volume) AS TotalVolume, SUM(NumberOfContainers) AS TotalContainers 
		FROM dbo.ShipmentDetails
		WHERE ShipmentID = @ShipmentID;
RETURN;
END

GO

CREATE OR ALTER FUNCTION dbo.ShipmentTotalMass(@ShipmentID INT)
RETURNS NUMERIC(10,2)
WITH SCHEMABINDING
AS
BEGIN
	
	DECLARE @TotalMass NUMERIC(10,2);

	SELECT @TotalMass = SUM(Mass)
		FROM dbo.ShipmentDetails
		WHERE ShipmentID = @ShipmentID;

RETURN @TotalMass;
END

GO

CREATE OR ALTER FUNCTION dbo.DateOnly(@Date DATETIME)
	RETURNS DATE 
AS
BEGIN
	RETURN CAST(@Date AS DATE)
END
go

CREATE OR ALTER FUNCTION dbo.DateOnly_table(@Date DATETIME)
	RETURNS table 
AS
RETURN (
	SELECT CAST(@Date AS DATE) AS DateWithoutTime
)
go
