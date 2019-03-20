SELECT s.ShipmentID 
	FROM dbo.Shipments s 
	INNER JOIN dbo.Stations ss ON ss.StationID = s.OriginStationID
	WHERE ss.OfficialName = '40 Eridani'
		AND s.Priority = 3



















---------------------------

DECLARE @p1 SMALLINT = 3, @p2 VARCHAR(50) = '40 Eridani'

SELECT s.ShipmentID 
	FROM dbo.Shipments s 
	INNER JOIN dbo.Stations ss ON ss.StationID = s.OriginStationID
	WHERE ss.OfficialName = @p2
		AND s.Priority = @p1


