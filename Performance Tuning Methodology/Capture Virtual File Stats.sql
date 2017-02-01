INSERT INTO dbo.VirtualFileStats (DatabaseName, FileName, DatabaseID, AverageReadLatency, AverageWriteLatency, AverageBytesPerRead, AverageBytesPerWrite, TotalBytesRead, ReadStall, TotalBytesWritten, WriteStall)
SELECT  DB_NAME(vfs.database_id) AS database_name ,
        mf.name ,
		vfs.database_id ,
        io_stall_read_ms / NULLIF(num_of_reads, 0) AS avg_read_latency ,
        io_stall_write_ms / NULLIF(num_of_writes, 0) AS avg_write_latency ,
        num_of_bytes_read / NULLIF(num_of_reads, 0) AS avg_bytes_per_read ,
        num_of_bytes_written / NULLIF(num_of_writes, 0) AS avg_bytes_per_write ,
        vfs.num_of_bytes_read ,
        vfs.io_stall_read_ms ,
        vfs.num_of_bytes_written ,
        vfs.io_stall_write_ms 
FROM    sys.dm_io_virtual_file_stats(NULL, NULL) AS vfs
        JOIN sys.master_files AS mf ON vfs.database_id = mf.database_id
                                       AND vfs.FILE_ID = mf.FILE_ID
