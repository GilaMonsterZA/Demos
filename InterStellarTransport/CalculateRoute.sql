CREATE FUNCTION CalculateRoutes (@StartStationID INT, @EndStationID INT) 
RETURNS  @RouteList TABLE (RouteID INT, RouteSequence SmallINT) 
AS
BEGIN
	DECLARE @Done BIT = 0;

	-- If the start and end stations are on a single route
	IF EXISTS (SELECT RouteID FROM dbo.RouteStations WHERE StationID = @StartStationID OR StationID = @EndStationID GROUP BY RouteID HAVING COUNT(*) = 1)
 

	-- If the start and end stations are on different routes that have a station in common


	-- If the routes do not overlap, however there is one other route that intersects both


	-- Otherwise insert a -1 and let the user fix by hand


	RETURN
END
