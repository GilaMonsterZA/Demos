WITH RouteSequence AS (
	SELECT  starting.RouteID,
			starting.StationID AS StartingStation,
			ending.StationID AS EndingStation
		FROM dbo.RouteStations starting LEFT OUTER JOIN dbo.RouteStations ending ON ending.RouteID = starting.RouteID AND ending.PositionInRoute = starting.PositionInRoute + 1
),
StationLocations AS (
SELECT 
	rs.*, 
	StartingStation.OfficialName AS StartingStationName, StartingSystem.OfficialName AS StartingSystemName,
	EndingStation.OfficialName AS EndingStationName, EndingSystem.OfficialName AS EndingSystemName,
	StartingSystem.DistanceFromSol*COS(RADIANS(StartingSystem.GalacticLongitude))*SIN(RADIANS(StartingSystem.GalacticLatitude)) AS StartingSystemX,
	StartingSystem.DistanceFromSol*COS(RADIANS(StartingSystem.GalacticLongitude))*COS(RADIANS(StartingSystem.GalacticLatitude)) AS StartingSystemY,
	StartingSystem.DistanceFromSol*SIN(RADIANS(StartingSystem.GalacticLongitude)) AS StartingSystemZ,
	EndingSystem.DistanceFromSol*COS(RADIANS(EndingSystem.GalacticLongitude))*SIN(RADIANS(EndingSystem.GalacticLatitude)) AS EndingSystemX,
	EndingSystem.DistanceFromSol*COS(RADIANS(EndingSystem.GalacticLongitude))*COS(RADIANS(EndingSystem.GalacticLatitude)) AS EndingSystemY,
	EndingSystem.DistanceFromSol*SIN(RADIANS(EndingSystem.GalacticLongitude)) AS EndingSystemZ
FROM RouteSequence rs
	INNER JOIN dbo.Stations StartingStation ON StartingStation.StationID = rs.StartingStation INNER JOIN dbo.StarSystems StartingSystem ON StartingStation.StarSystemID = StartingSystem.StarSystemID
	LEFT OUTER JOIN dbo.Stations EndingStation ON EndingStation.StationID = rs.EndingStation INNER JOIN dbo.StarSystems EndingSystem ON EndingStation.StarSystemID = EndingSystem.StarSystemID
),
StationDistances AS 
(
SELECT RouteID, StartingStation,
	SQRT(SQUARE(EndingSystemX - StartingSystemX) + SQUARE(EndingSystemY - StartingSystemY) + SQUARE(EndingSystemY - StartingSystemY)) AS Distance 
FROM StationLocations
)
UPDATE dbo.RouteStations
	SET DistanceToNextStation = Distance
	FROM dbo.RouteStations INNER JOIN StationDistances ON StationDistances.RouteID = RouteStations.RouteID AND StationID = StationDistances.StartingStation

GO


SELECT * FROM dbo.RouteStations