SELECT qsq.query_id, rsi.start_time, wait_category_desc, total_query_wait_time_ms, avg_query_wait_time_ms, min_query_wait_time_ms, max_query_wait_time_ms 
	FROM sys.query_store_query qsq
		INNER JOIN sys.query_store_plan qsp on qsq.query_id = qsp.query_id
		INNER JOIN sys.query_store_wait_stats qsws on  qsp.plan_id = qsws.plan_id
		INNER JOIN sys.query_store_runtime_stats_interval rsi on qsws.runtime_stats_interval_id = rsi.runtime_stats_interval_id
WHERE qsq.query_id = 7
ORDER BY start_time desc, total_query_wait_time_ms desc;
