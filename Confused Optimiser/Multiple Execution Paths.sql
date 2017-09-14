CREATE PROCEDURE CheckMaxContainers (@ClientID INT = NULL)

AS

IF @ClientID IS NULL
	SELECT MAX(NumberOfContainers) FROM dbo.Shipments s INNER JOIN dbo.ShipmentDetails sd ON sd.ShipmentID = s.ShipmentID;
ELSE
	SELECT MAX(NumberOfContainers) FROM dbo.Shipments s INNER JOIN dbo.ShipmentDetails sd ON sd.ShipmentID = s.ShipmentID
	WHERE s.ClientID = 42;
GO
