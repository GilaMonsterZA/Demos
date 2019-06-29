-- useful for showing off bad parameter sniffing

CREATE OR ALTER PROCEDURE GetClientTransactions (@Priority TINYINT, @ClientID INT)
AS

SELECT c.LegalName,
       ss.OfficialName,
       s.Priority,
	   s.ReferenceNumber,
       SUM(t.Amount) AS ShipmentTotal,
	   sd.TotalMass,
	   sd.TotalVolume,
	   sd.TotalContainers
	FROM dbo.Clients c 
		INNER JOIN dbo.Shipments s ON s.ClientID = c.ClientID 
		INNER JOIN (SELECT shipmentID, SUM(Mass) AS TotalMass, SUM(Volume) AS TotalVolume, SUM(NumberOfContainers) AS TotalContainers FROM dbo.ShipmentDetails GROUP BY ShipmentID) sd ON sd.ShipmentID = s.ShipmentID
		INNER JOIN dbo.Transactions t ON t.ReferenceShipmentID = s.ShipmentID
		INNER JOIN dbo.StarSystems ss ON ss.StarSystemID = c.HeadquarterSystemID
	WHERE s.Priority = @Priority AND c.ClientID = @ClientID
	GROUP BY c.LegalName,
             ss.OfficialName,
             s.Priority,
             s.ReferenceNumber,
             sd.TotalMass,
             sd.TotalVolume,
             sd.TotalContainers;