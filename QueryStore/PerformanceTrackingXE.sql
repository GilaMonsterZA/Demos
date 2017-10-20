CREATE EVENT SESSION [PerformanceStats] ON SERVER 
ADD EVENT sqlserver.sp_statement_completed(
    ACTION(sqlserver.database_id,sqlserver.query_hash)
    WHERE ([duration]>(100))),
ADD EVENT sqlserver.sql_statement_completed(SET collect_statement=(1)
    ACTION(sqlserver.database_id,sqlserver.query_hash)
    WHERE ([package0].[greater_than_int64]([duration],(100))))
ADD TARGET package0.event_file(SET filename=N'D:\Databases\Backup\PerformanceStats.xel')
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)
GO


