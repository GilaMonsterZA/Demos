SELECT s.ShipmentID 
	FROM dbo.Shipments s 
	INNER JOIN dbo.Stations ss ON ss.StationID = s.OriginStationID
	WHERE ss.OfficialName = '40 Eridani'