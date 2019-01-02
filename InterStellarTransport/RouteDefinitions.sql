-- correct stations and run again
INSERT INTO dbo.Routes
(
    RouteName,
    StartStationID,
    EndStationID,
    RouteLength
)
VALUES
	('Pollux -> Raselhague', 29, 33, 0),
	('82 Eridant -> Vega', 25, 27, 0),
	('Delta Pavonis -> Rana', 26, 28, 0),
	('82 Eridani -> Deneb Algedi', 25, 31, 0),
	('36 Ophiuchi -> Lalamda 21258', 24, 16, 0),
	('36 Ophiuchi -> Capella', 24, 32, 0),
	('Capella -> Deneb Algedi', 32, 31, 0),
	('Sol In-system', 1, 5, 0)

GO

INSERT INTO dbo.RouteStations
(
    RouteID,
    StationID,
    PositionInRoute
)
VALUES
(0, 0,  0)