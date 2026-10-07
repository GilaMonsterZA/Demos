CREATE TABLE DimDate (
    DateKey INT PRIMARY KEY,
    FullDate DATE NOT NULL,
    Year INT NOT NULL,
    Quarter INT NOT NULL,
    Month INT NOT NULL,
    Day INT NOT NULL,
    DayOfWeek INT NOT NULL,
    IsWeekend BIT NOT NULL
);

CREATE TABLE DimStarSystem (
    StarSystemKey INT IDENTITY PRIMARY KEY,
    OfficialName VARCHAR(50) NOT NULL,
    CommonName VARCHAR(50),
    GalacticLatitude NUMERIC(5,2) NOT NULL,
    GalacticLongitude NUMERIC(5,2) NOT NULL,
    DistanceFromSol NUMERIC(7,2) NOT NULL,
    SpectralType CHAR(2) NOT NULL,
    NumberOfPlanets SMALLINT NOT NULL,
    Magnitude NUMERIC(4,2) NOT NULL,
    IsVariable BIT NOT NULL DEFAULT 0,
    EffectiveDate DATE NOT NULL DEFAULT GETDATE(),
    EndDate DATE,
    IsCurrent BIT NOT NULL DEFAULT 1
);

CREATE TABLE DimStation (
    StationKey INT IDENTITY PRIMARY KEY,
    StarSystemKey INT NOT NULL FOREIGN KEY REFERENCES DimStarSystem(StarSystemKey),
    OfficialName VARCHAR(50) NOT NULL,
    CommonName VARCHAR(50),
    Planet TINYINT NULL,
    Location VARCHAR(15) NOT NULL,
    EffectiveDate DATE NOT NULL DEFAULT GETDATE(),
    EndDate DATE,
    IsCurrent BIT NOT NULL DEFAULT 1
);

CREATE TABLE DimCustomsCode (
    CustomsCodeKey INT IDENTITY PRIMARY KEY,
    CustomsCode CHAR(4) UNIQUE NOT NULL,
    Description VARCHAR(500),
    EffectiveDate DATE NOT NULL DEFAULT GETDATE(),
    EndDate DATE,
    IsCurrent BIT NOT NULL DEFAULT 1
);

CREATE TABLE DimClient (
    ClientKey INT IDENTITY PRIMARY KEY,
    LegalName VARCHAR(150),
    EffectiveDate DATE NOT NULL DEFAULT GETDATE(),
    EndDate DATE,
    IsCurrent BIT NOT NULL DEFAULT 1
);

-- Fact Tables
CREATE TABLE FactShipment (
    ShipmentKey INT IDENTITY PRIMARY KEY,
    ClientKey INT NOT NULL FOREIGN KEY REFERENCES DimClient(ClientKey),
    OriginStationKey INT NOT NULL FOREIGN KEY REFERENCES DimStation(StationKey),
    DestinationStationKey INT NOT NULL FOREIGN KEY REFERENCES DimStation(StationKey),
    CustomsCodeKey INT FOREIGN KEY REFERENCES DimCustomsCode(CustomsCodeKey),
    CreationDateKey INT NOT NULL FOREIGN KEY REFERENCES DimDate(DateKey),
    DispatchDateKey INT FOREIGN KEY REFERENCES DimDate(DateKey),
    DeliveryDateKey INT FOREIGN KEY REFERENCES DimDate(DateKey),
    Mass NUMERIC(6,2) NOT NULL,
    Volume NUMERIC(6,2) NOT NULL,
    NumberOfContainers SMALLINT NOT NULL,
    Priority TINYINT NOT NULL,
    HasTemperatureControlled BIT NOT NULL,
    HasHazardous BIT NOT NULL,
    HasLivestock BIT NOT NULL,
    IsTemperatureControlled BIT NOT NULL,
    IsHazardous BIT NOT NULL,
    IsLivestock BIT NOT NULL
);

CREATE TABLE FactTransaction (
    TransactionKey INT IDENTITY PRIMARY KEY,
    TransactionID INT NOT NULL,
    ShipmentKey INT NOT NULL FOREIGN KEY REFERENCES FactShipment(ShipmentKey),
    ClientKey INT NOT NULL FOREIGN KEY REFERENCES DimClient(ClientKey),
    TransactionDateKey INT NOT NULL FOREIGN KEY REFERENCES DimDate(DateKey),
    TransactionType CHAR(1) NOT NULL,
    Amount NUMERIC(8,2) NOT NULL,
    InvoiceNumber CHAR(15) NOT NULL
);