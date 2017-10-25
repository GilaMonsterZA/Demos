USE InterStellarTransport;
GO

DBCC SHOW_STATISTICS (Shipments, idx_Shipments_ClientIDPriority)

DBCC SHOW_STATISTICS (Shipments, idx_Shipments_Priority)

GO

SELECT * FROM sys.dm_db_stats_properties(OBJECT_ID('Shipments'), 10)

SELECT * FROM sys.dm_db_stats_histogram(OBJECT_ID('Shipments'), 10)

GO