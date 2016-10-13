ALTER PROCEDURE dbo.CarSearch (
	@Make VARCHAR(50) = NULL,
	@MinimumPrice NUMERIC(12,4) = NULL,
	@MaximumPrice NUMERIC(12,4) = NULL,
	@MinimumKM NUMERIC(12,4) = NULL,
	@MaximumKM NUMERIC(12,4) = NULL
 )
 AS
 
 IF @Make IS NULL
	SET @Make = '%';

IF @MinimumPrice IS NULL
	SET @MinimumPrice = 0;

IF @MaximumPrice IS NULL
	SET @MaximumPrice = 99999999.9999;

IF @MinimumKM IS NULL
	SET @MinimumKM = 0;

IF @MaximumKM IS NULL
	SET @MaximumKM = 99999999.9999;

SELECT Make,
       Model,
       ManufacturingYear,
       Price,
       Kilometers
	FROM dbo.SecondHandCars
	WHERE Make LIKE @Make
		AND Price BETWEEN @MinimumPrice AND @MaximumPrice
		AND Kilometers BETWEEN @MinimumKM AND @MaximumKM;

go