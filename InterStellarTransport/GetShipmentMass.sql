CREATE FUNCTION dbo.GetShipmentMass (@ShipmentID INT)
	RETURNS NUMERIC(8,2) AS
    BEGIN
    
		DECLARE @ShipmentMass NUMERIC(8,2) = 0;
		SELECT @ShipmentMass = SUM(Mass) FROM dbo.ShipmentDetails WHERE ShipmentID = @ShipmentID;
		RETURN @ShipmentMass;

	END
    