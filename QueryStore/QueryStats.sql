SELECT qs.creation_time ,
       qs.last_execution_time ,
       qs.execution_count ,
       qs.total_worker_time ,
       qs.last_worker_time ,
       qs.min_worker_time ,
       qs.max_worker_time ,
       qs.total_logical_reads ,
       qs.last_logical_reads ,
       qs.min_logical_reads ,
       qs.max_logical_reads ,
       qs.total_elapsed_time ,
       qs.last_elapsed_time ,
       qs.min_elapsed_time ,
       qs.max_elapsed_time ,
       qs.query_hash ,
       qp.dbid ,
       qp.objectid ,
       qp.query_plan 
	FROM sys.dm_exec_query_stats qs
		CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle) qp
	WHERE qp.objectid = OBJECT_ID('dbo.GetClientTransactions')