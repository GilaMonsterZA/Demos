CREATE TABLE dbo.Members(
	MemberID INT IDENTITY(1,1) NOT NULL,
	Name VARCHAR(100) NULL
)
AS NODE

   
CREATE TABLE dbo.Books (
	BookID INT IDENTITY(1,1) NOT NULL,
	Title VARCHAR(100) NULL,
	Genre VARCHAR(100) NULL       
)
AS NODE

CREATE TABLE dbo.Friends
AS EDGE
   
CREATE TABLE dbo.Reading (
	StartDate DATETIME,
	EndDate DATETIME
)
AS EDGE
   
CREATE TABLE dbo.Rates (
	Rating TINYINT
)
AS EDGE

GO

INSERT INTO dbo.Members (Name)
VALUES
('Joe'), ('Sarah'), ('Bob'), ('Mary'), 
	('Mark'), ('Jane')












INSERT INTO Friends ($from_id, $to_id) 
VALUES 
  	((SELECT $node_id FROM dbo.Members WHERE Name='Joe'),(SELECT $node_id FROM dbo.Members WHERE Name='Sarah')),
	((SELECT $node_id FROM dbo.Members WHERE Name='Joe'),(SELECT $node_id FROM dbo.Members WHERE Name='Mark')),
	((SELECT $node_id FROM dbo.Members WHERE Name='Bob'),(SELECT $node_id FROM dbo.Members WHERE Name='Sarah')),
	((SELECT $node_id FROM dbo.Members WHERE Name='Mark'),(SELECT $node_id FROM dbo.Members WHERE Name='Joe')),
	((SELECT $node_id FROM dbo.Members WHERE Name='Jane'),(SELECT $node_id FROM dbo.Members WHERE Name='Sarah')),
	((SELECT $node_id FROM dbo.Members WHERE Name='Sarah'),(SELECT $node_id FROM dbo.Members WHERE Name='Jane')),
	((SELECT $node_id FROM dbo.Members WHERE Name='Sarah'),(SELECT $node_id FROM dbo.Members WHERE Name='Bob'))












INSERT INTO dbo.Books (
    Title,
    Genre
)
VALUES
	('Left Hand of Darkness','Sci-Fi'),
	('Song for Arbonne', 'Fantasy'),
	('Words of Radiance', 'Fantasy'),
	('Way of Kings','Fantasy'),
	('Lathe of Heaven', 'Sci-Fi'),
	('The Dispossessed', 'Sci-Fi'),
	('American Gods','Fantasy'),
	('The Pillars of Heaven', 'Historical')


INSERT INTO dbo.Reading ($from_id, $to_id, StartDate, EndDate)
VALUES 
	((SELECT $node_id FROM dbo.Members WHERE Name='Joe'), 
		(SELECT $node_id FROM dbo.Books WHERE BookID = 7), 
		'2018-07-01', NULL),
	((SELECT $node_id FROM dbo.Members WHERE Name='Joe'), 
		(SELECT $node_id FROM dbo.Books WHERE BookID = 4), 
		NULL, NULL),
	((SELECT $node_id FROM dbo.Members WHERE Name='Sarah'), 
		(SELECT $node_id FROM dbo.Books WHERE BookID = 6), 
		'2018-07-05', '2018-08-10'),
	((SELECT $node_id FROM dbo.Members WHERE Name='Sarah'), 
		(SELECT $node_id FROM dbo.Books WHERE BookID = 2), 
		'2018-08-12', NULL),
	((SELECT $node_id FROM dbo.Members WHERE Name='Sarah'), 
		(SELECT $node_id FROM dbo.Books WHERE BookID = 4), 
		NULL, NULL),
	((SELECT $node_id FROM dbo.Members WHERE Name='Bob'), 
		(SELECT $node_id FROM dbo.Books WHERE BookID = 7), 
		NULL, NULL),
	((SELECT $node_id FROM dbo.Members WHERE Name='Mark'), 
		(SELECT $node_id FROM dbo.Books WHERE BookID = 8), 
		'2018-07-10', '2018-08-10'),
	((SELECT $node_id FROM dbo.Members WHERE Name='Mark'), 
		(SELECT $node_id FROM dbo.Books WHERE BookID = 3), 
		NULL, NULL),
	((SELECT $node_id FROM dbo.Members WHERE Name='Mary'), 
		(SELECT $node_id FROM dbo.Books WHERE BookID = 3), 
		NULL, NULL),
	((SELECT $node_id FROM dbo.Members WHERE Name='Jane'), 
		(SELECT $node_id FROM dbo.Books WHERE BookID = 3), 
		'2018-07-22', '2018-07-26'),
	((SELECT $node_id FROM dbo.Members WHERE Name='Jane'), 
		(SELECT $node_id FROM dbo.Books WHERE BookID = 1), 
		'2018-07-28', '2018-08-01'),
	((SELECT $node_id FROM dbo.Members WHERE Name='Jane'), 
		(SELECT $node_id FROM dbo.Books WHERE BookID = 6), 
		'2018-08-05', NULL)
