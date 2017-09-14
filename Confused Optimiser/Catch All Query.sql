CREATE PROCEDURE SearchShipments 
	@ClientID INT = NULL, 
	@OriginStationID INT = NULL,
	@DestinationStationID INT = NULL 

AS

SELECT Priority,
       os.OfficialName,
	   ds.OfficialName,
       s.HasTemperatureControlled,
       s.HasHazardous,
       s.HasLivestock,
       s.ReferenceNumber       
FROM dbo.Shipments s 
	INNER JOIN dbo.Clients c ON c.ClientID = s.ClientID
	INNER JOIN dbo.Stations os ON os.StationID = s.OriginStationID
	INNER JOIN dbo.Stations ds ON ds.StationID = s.DestinationStationID
WHERE 
	(s.ClientID = @ClientID OR @ClientID IS NULL)
	AND
	(s.OriginStationID = @OriginStationID OR @OriginStationID IS NULL)
	AND
	(s.DestinationStationID = @DestinationStationID OR @DestinationStationID IS NULL)
GO

EXEC dbo.SearchShipments @ClientID = 42

GO

EXEC dbo.SearchShipments @OriginStationID = 1