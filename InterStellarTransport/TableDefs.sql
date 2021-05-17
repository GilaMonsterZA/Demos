CREATE DATABASE InterstellarTransport
GO

USE InterStellarTransport
GO

CREATE TABLE StarSystems (
	StarSystemID INT IDENTITY PRIMARY KEY,
	OfficialName VARCHAR(50) NOT NULL,
	CommonName VARCHAR(50),
	GalacticLatitude NUMERIC(5,2) NOT NULL,
	GalacticLongitude NUMERIC(5,2) NOT NULL, 
	DistanceFromSol NUMERIC(7,2) NOT NULL,
	SpectralType CHAR(2) NOT NULL,
	NumberOfPlanets SMALLINT NOT NULL,
	Magnitude NUMERIC(4,2) NOT NULL,
	IsVariable BIT NOT NULL DEFAULT 0
);

CREATE TABLE Stations (
	StationID INT IDENTITY PRIMARY KEY,
	StarSystemID INT FOREIGN KEY REFERENCES dbo.StarSystems (StarSystemID) NOT NULL,
	OfficialName VARCHAR(50) NOT NULL,
	CommonName VARCHAR(50),
	Planet TINYINT NOT NULL,
	Location VARCHAR(15) NOT NULL
);

CREATE TABLE Routes (
	RouteID INT IDENTITY PRIMARY KEY,
	RouteName VARCHAR(250),
	StartStationID INT NOT NULL FOREIGN KEY REFERENCES dbo.Stations (StationID),
	EndStationID INT NOT NULL FOREIGN KEY REFERENCES dbo.Stations (StationID),
	RouteLength  NUMERIC(7,2) NOT NULL
);

CREATE TABLE RouteStations (
	RouteStationID INT IDENTITY PRIMARY KEY,
	RouteID INT NOT NULL FOREIGN KEY REFERENCES dbo.Routes (RouteID),
	StationID INT NOT NULL FOREIGN KEY REFERENCES dbo.Stations (StationID),
	PositionInRoute TINYINT NOT NULL,
	DistanceToNextStation NUMERIC(7,2) NOT NULL,
	UNIQUE (RouteID, StationID),
	UNIQUE (RouteID, PositionInRoute)
);

CREATE TABLE CustomsCodes (
	CustomsCodeID INT IDENTITY PRIMARY KEY,
	CustomsCode CHAR(4) UNIQUE NOT NULL,
	Description VARCHAR(500)
);

CREATE TABLE ShipClass (
	ShipClassID INT IDENTITY PRIMARY KEY,
	ClassName VARCHAR(50) NOT NULL,
	MaximumSpeed NUMERIC(5,2) NOT NULL,
	CargoVolume NUMERIC(10,2) NOT NULL,
	MaximumContainerSize NUMERIC(8,2) NOT NULL,
	TemperatureControlled BIT NOT NULL DEFAULT 0,
	Hazardous BIT NOT NULL DEFAULT 0,
	Livestock BIT NOT NULL DEFAULT 0
);

CREATE TABLE Ships (
	ShipID INT IDENTITY PRIMARY KEY,
	ShipName VARCHAR(50) NOT NULL,
	Registration CHAR(15) NOT NULL UNIQUE,
	CommissioningDate DATE NOT NULL,
	ShipClassID INT NOT NULL FOREIGN KEY REFERENCES dbo.ShipClass(ShipClassID),
	HomePortId INT NOT NULL FOREIGN KEY REFERENCES dbo.Stations (StationID),
	DistanceSinceCommissioning NUMERIC(12,2) NOT NULL,
	DistanceSinceLastMaintenance NUMERIC(12,2) NOT NULL,
	Notes VARCHAR(MAX)
);

CREATE TABLE Clients (
	ClientID INT IDENTITY PRIMARY KEY,
	LegalName VARCHAR(100) NOT NULL,
	HeadquarterSystemID INT NOT NULL FOREIGN KEY REFERENCES dbo.StarSystems (StarSystemID),
	HypernetAddress CHAR(25) NOT NULL,
);

CREATE TABLE Shipments (
	ShipmentID INT IDENTITY PRIMARY KEY,
	ClientID INT NOT NULL FOREIGN KEY REFERENCES dbo.Clients (ClientID),
	ReferenceNumber CHAR(25) NOT NULL UNIQUE,
	Priority TINYINT NOT NULL CHECK (Priority IN (1,2,3)),
	OriginStationID INT NOT NULL FOREIGN KEY REFERENCES dbo.Stations (StationID),
	DestinationStationID INT NOT NULL FOREIGN KEY REFERENCES dbo.Stations (StationID),
	HasTemperatureControlled BIT NOT NULL DEFAULT 0,
	HasHazardous BIT NOT NULL DEFAULT 0,
	HasLivestock BIT NOT NULL DEFAULT 0,
	CreationDate DATE DEFAULT dbo.AdjustDate(GETDATE()),
	DispatchDate DATE DEFAULT dbo.AdjustDate(GETDATE()),
	DeliveryDate DATE
);

CREATE TABLE ShipmentDetails (
	ShipmentDetailID INT IDENTITY PRIMARY KEY,
	ShipmentID INT NOT NULL FOREIGN KEY REFERENCES dbo.Shipments (ShipmentID),
	CustomsCodeID INT NOT NULL REFERENCES dbo.CustomsCodes (CustomsCodeID),
	Mass NUMERIC(6,2) NOT NULL,
	Volume NUMERIC(6,2) NOT NULL,
	NumberOfContainers SMALLINT NOT NULL,
	IsTemperatureControlled BIT NOT NULL DEFAULT 0,
	IsHazardous BIT NOT NULL DEFAULT 0,
	IsLivestock BIT NOT NULL DEFAULT 0
);

CREATE TABLE Transactions (
	TransactionID INT IDENTITY PRIMARY KEY,
	ReferenceShipmentID INT NOT NULL FOREIGN KEY REFERENCES dbo.Shipments (ShipmentID),
	ClientID INT NOT NULL FOREIGN KEY REFERENCES Clients (ClientID), 
	TransactionDate DATETIME NOT NULL dbo.AdjustDate(GETDATE()),
	TransactionType CHAR(1) NOT NULL,
	Amount NUMERIC(8,2) NOT NULL,
	InvoiceNumber CHAR(15) NOT NULL
);

CREATE TABLE TransitLog (
	TransitLogID INT IDENTITY PRIMARY KEY,
	ShipmentID INT NOT NULL FOREIGN KEY REFERENCES dbo.Shipments (ShipmentID),
	ShipID INT NOT NULL FOREIGN KEY REFERENCES dbo.Ships (ShipID),
	ShipmentStartTime DATETIME2(7) NOT NULL,
	StartingStationID INT NOT NULL FOREIGN KEY REFERENCES dbo.Stations (StationID),
	ShipmentDeliveryTime DATETIME2(7),
	EndingStationID INT FOREIGN KEY REFERENCES dbo.Stations (StationID),
	RouteID INT NOT NULL FOREIGN KEY REFERENCES dbo.Routes (RouteID),
	TransitLegOrder SMALLINT NOT NULL
);

CREATE TABLE Numbers (
	Number INT
);


WITH
    L0   AS(SELECT 1 AS C UNION ALL SELECT 1 AS O), -- 2 rows
    L1   AS(SELECT 1 AS C FROM L0 AS A CROSS JOIN L0 AS B), -- 4 rows
    L2   AS(SELECT 1 AS C FROM L1 AS A CROSS JOIN L1 AS B), -- 16 rows
    L3   AS(SELECT 1 AS C FROM L2 AS A CROSS JOIN L2 AS B), -- 256 rows
    L4   AS(SELECT 1 AS C FROM L3 AS A CROSS JOIN L3 AS B), -- 65 536 rows
    L5   AS(SELECT 1 AS C FROM L4 AS A CROSS JOIN L2 AS B), -- 1 048 576 rows
    Nums AS(SELECT ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS N FROM L5)
INSERT INTO Numbers SELECT N FROM Nums ORDER BY N;

