SELECT 'g.AddV(''Station'').Property(''ID'', ''' + CAST(StationID AS VARCHAR(4)) + ''').Property(''Name'',''' + OfficialName + ''')'
	FROM dbo.Stations

SELECT 'g.V().has(''ID'', ''' + CAST(starting.StationID AS VARCHAR(4)) + ''').addE(''RouteLeg'').to(g.V().has(''ID'', ''' + CAST(ending.StationID AS VARCHAR(4)) + ''')).Property(''Distance'', ' + CAST(starting.DistanceToNextStation AS VARCHAR(10)) + ')',
			starting.StationID AS StartingStation,
			ending.StationID AS EndingStation,
			starting.DistanceToNextStation
		FROM dbo.RouteStations starting INNER JOIN dbo.RouteStations ending ON 
			ending.RouteID = starting.RouteID AND ending.PositionInRoute = starting.PositionInRoute + 1
	ORDER BY starting.RouteID, starting.PositionInRoute

