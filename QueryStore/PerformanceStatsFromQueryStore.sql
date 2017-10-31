SELECT qsq.query_id, rsi.start_time, qsrs.avg_duration, avg_cpu_time, avg_logical_io_reads, avg_dop, avg_query_max_used_memory, avg_rowcount, avg_tempdb_space_used
	FROM sys.query_store_query qsq
		INNER JOIN sys.query_store_plan qsp on qsq.query_id = qsp.query_id
		INNER JOIN sys.query_store_runtime_stats qsrs on  qsp.plan_id = qsrs.plan_id
		INNER JOIN sys.query_store_runtime_stats_interval rsi on qsrs.runtime_stats_interval_id = rsi.runtime_stats_interval_id
WHERE qsq.query_id = 7
ORDER BY start_time desc
