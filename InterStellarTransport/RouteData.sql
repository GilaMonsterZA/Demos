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
	('Pollux -> Raselhague', 43, 49, 0),
	('82 Eridant -> Vega', 39, 41, 0),
	('Delta Pavonis -> Rana', 40, 42, 0),
	('82 Eridani -> Deneb Algedi', 39, 46, 0),
	('36 Ophiuchi -> Lalanda 21258', 38, 28, 0),
	('36 Ophiuchi -> Capella', 38, 48, 0),
	('Capella -> Deneb Algedi', 48, 46, 0),
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
	(1, 43, 1, 0), (1, 42, 2, 0), (1, 31, 3, 0), (1, 30, 4, 0), (1, 29, 5, 0), (1, 17, 6, 0), (1, 13, 7, 0), (1, 6, 8, 0), (1, 34, 9, 0), (1, 10, 10, 0), (1, 11, 11, 0), (1, 27, 12, 0), (1, 33, 13, 0), (1, 46, 14, 0), (1, 49, 15, 0),
		-- Pollux (43), Rana (42), 40 Eridani (31), 40 Eridani (30), 40 Eridani (29), Epsilon Eridani (17), Lalanda 21185 (13), Sol (6), Wolf 498 (34), Barnard's Star (10), Barnard's Star (11), Ross 780 (27), Altair (33), Deneb Algedi (46), Rasalhague (49)
	(2, 39, 1, 0), (2, 12, 2, 0), (2, 6, 3, 0), (2, 26, 4, 0), (2, 22, 5, 0), (2, 35, 6, 0), (2, 41, 7, 0), 
		-- 82 Eridani (39), Wolf 359 (12), Sol (6), van Maanen's Star (26), 61 Cygni (22), Sigma Draconis (35), Vega (41)
	(3, 40, 1, 0), (3, 36, 2, 0), (3, 23, 3, 0), (3, 8, 4, 0), (3, 9, 5, 0), (3, 12, 6, 0), (3, 14, 7, 0), (3, 15, 8, 0), (3, 16, 9, 0), (3, 21, 10, 0), (3, 25, 11, 0), (3, 42, 12, 0), 
		-- Delta Pavonis (40), Lalanda 27173 (36), Epsilon Indi (23), Alpha Centauri (8), Alpha Centauri (9), Wolf 359 (12), Sirius (14), Sirius (15), Sirius (16)  Procyon (21), Ross 614 (25), Rana (42)
	(4, 39, 1, 0), (4, 20, 2, 0), (4, 21, 3, 0), (4, 17, 4, 0), (4, 24, 5, 0), (4, 11, 6, 0), (4, 32, 7, 0), (4, 46, 8, 0), (4, 45, 9, 0), 
		-- 82 Eridani (39), Procyon (20), Procyon (21), Epsilon Eridani (17), Tau Ceti (24), Barnard's Star (11), 70 Ophiuchi (32), Deneb Algedi (46), Deneb Algedi (45)
	(5, 38, 1, 0), (5, 23, 2, 0), (5, 6, 3, 0), (5, 24, 4, 0), (5, 28, 5, 0), 
		-- 36 Ophiuchi (38), Epsilon Indi (23), Sol (6), Tau Ceti (24), Lalanda 21258 (28)
	(6, 38, 1, 0), (6, 44, 2, 0), (6, 11, 3, 0), (6, 26, 4, 0), (6, 48, 5, 0), (6, 47, 6, 0), 
		-- 36 Ophiuchi (38), Muphrid (44), Barnard's Star (11), van Maanen's Star (26), Capella (48), Capella (47)
	(7, 48, 1, 0), (7, 37, 2, 0), (7, 35, 3, 0), (7, 46, 4, 0), 
		-- Capella (48), Eta Cassiopeiae (37), Sigma Draconis (35), Deneb Algedi (46)
	(8, 1, 1, 0), (8, 7, 2, 0), (8, 3, 3, 0), (8, 4, 4, 0), (8, 5, 5, 0), (8, 6, 6, 0) 
		-- (1), (7), (3), (4), (5), (6)