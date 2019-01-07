-- correct stations and run again
SELECT * FROM dbo.Stations
INSERT INTO dbo.Routes
(
    RouteName,
    StartStationID,
    EndStationID,
    RouteLength
)
VALUES
	('Pollux -> Raselhague', 42, 48, 0),
	('82 Eridant -> Vega', 38, 40, 0),
	('Delta Pavonis -> Rana', 39, 41, 0),
	('82 Eridani -> Deneb Algedi', 38, 45, 0),
	('36 Ophiuchi -> Lalanda 21258', 37, 27, 0),
	('36 Ophiuchi -> Capella', 37, 47, 0),
	('Capella -> Deneb Algedi', 47, 45, 0),
	('Sol In-system', 1, 5, 0)

GO

SELECT * FROM dbo.Routes
INSERT INTO dbo.RouteStations
(
    RouteID,
    StationID,
    PositionInRoute,
	DistanceToNextStation
)
VALUES
	-- Pollux, Rana, 40 Eridani, 40 Eridani, 40 Eridani, Epsilon Eridani, Lalanda 21185, Sol, Wolf 498, Barnard's Star, Barnard's Star, Ross 780, Altair, Deneb Algedi, Rasalhague
	(1, 42, 1, 16.09), (1, 41, 2, 10.08), (1, 30, 3, 0.00), (1, 29, 4, 0.00), (1, 28, 5, 8.06), (1, 16, 6, 4.94), (1, 12, 7, 4.88), (1, 5, 8, 7.53), (1, 33, 9, 3.78), (1, 9, 10, 0.00), (1, 10, 11, 3.16), (1, 26, 12, 10.89), (1, 32, 13, 15.22), (1, 45, 14, 21.31), (1, 48, 15, 0.00), 
	-- 82 Eridani, Wolf 359, Sol, van Maanen's Star, 61 Cygni, Sigma Draconis, Vega
	(2, 38, 1, 6.95), (2, 11, 2, 4.75), (2, 5, 3, 8.73), (2, 25, 4, 9.21), (2, 21, 5, 9.12), (2, 34, 6, 18.23), (2, 40, 7, 0.00),
	-- Delta Pavonis, Lalanda 27173, Epsilon Indi, Alpha Centauri, Alpha Centauri, Wolf 359, Sirius, Sirius, Sirius, Procyon, Ross 614, Rana
	(3, 39, 1, 2.58), (3, 35, 2, 11.42), (3, 22, 3, 5.76), (3, 7, 4, 0.00), (3, 8, 5, 7.20), (3, 11, 6, 5.95), (3, 13, 7, 0.00), (3, 14, 8, 0.00), (3, 15, 9, 4.92), (3, 20, 10, 2.98), (3, 24, 11, 11.27), (3, 41, 12, 0.00), 
	-- 82 Eridani, Procyon, Procyon, Epsilon Eridani, Tau Ceti, Barnard's Star, 70 Ophiuchi, Deneb Algedi, Deneb Algedi
	(4, 38, 1, 8.99), (4, 19, 2, 0.00), (4, 20, 3, 5.53), (4, 16, 4, 5.30), (4, 23, 5, 12.03), (4, 10, 6, 13.94), (4, 31, 7, 13.39), (4, 45, 8, 0.00), (4, 44, 9, 0.00), 
	-- 36 Ophiuchi, Epsilon Indi, Sol, Tau Ceti, Lalanda 21258
	(5, 37, 1, 17.37), (5, 22, 2, 10.71), (5, 5, 3, 4.79), (5, 23, 4, 5.21), (5, 27, 5, 0.00), 
	-- 36 Ophiuchi, Muphrid, Barnard's Star, van Maanen's Star, Capella, Capella
	(6, 37, 1, 12.27), (6, 43, 2, 8.47), (6, 10, 3, 13.25), (6, 25, 4, 51.08), (6, 47, 5, 0.00), (6, 46, 6, 0.00), 
	-- Capella, Eta Cassiopeiae, Sigma Draconis, Deneb Algedi
	(7, 47, 1, 41.93), (7, 36, 2, 9.94), (7, 34, 3, 35.20), (7, 45, 4, 0.00), 
	-- (1), (7), (3), (4), (5), (6)
	(8, 1, 1, 0.00), (8, 6, 2, 0.00), (8, 2, 3, 0.00), (8, 3, 4, 0.00), (8, 4, 5, 0.00), (8, 5, 6, 0.00)
