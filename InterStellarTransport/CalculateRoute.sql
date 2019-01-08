DECLARE @Origin INT = 46,
	@Destination INT = 1;

WITH RouteSegments AS (
	SELECT  starting.RouteID,
			starting.StationID AS StartingStation,
			ending.StationID AS EndingStation,
			starting.DistanceToNextStation
		FROM dbo.RouteStations starting INNER JOIN dbo.RouteStations ending ON ending.RouteID = starting.RouteID AND ending.PositionInRoute = starting.PositionInRoute + 1
	UNION 
	SELECT  starting.RouteID,
			starting.StationID AS StartingStation,
			ending.StationID AS EndingStation,
			ending.DistanceToNextStation
		FROM dbo.RouteStations starting INNER JOIN dbo.RouteStations ending ON ending.RouteID = starting.RouteID AND ending.PositionInRoute = starting.PositionInRoute - 1
),
Routing AS (
	SELECT RouteSegments.* FROM RouteSegments WHERE StartingStation = @Origin
	UNION ALL
    SELECT RouteSegments.* FROM RouteSegments INNER JOIN Routing ON Routing.EndingStation = RouteSegments.StartingStation
		WHERE Routing.StartingStation != RouteSegments.EndingStation
)
SELECT * FROM Routing
OPTION (MAXRECURSION 200)
	

GO
--CREATE OR ALTER FUNCTION CalculateRoutes (@StartStationID INT, @EndStationID INT) 
--RETURNS  @RouteList TABLE (RouteID INT, RouteSequence SmallINT) 
--AS
--BEGIN
--	DECLARE @Done BIT = 0;

--	-- If the start and end stations are on a single route

--	-- If the start and end stations are on different routes that have a station in common


--	-- If the routes do not overlap, however there is one other route that intersects both


--	-- Otherwise insert a -1 and let the user fix by hand



--	RETURN 
--END
