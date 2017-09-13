SELECT qsq.query_id ,
       qsq.object_id ,
       qsq.query_hash ,
       qsq.initial_compile_start_time ,
       qsq.last_compile_start_time ,
       qsq.last_execution_time ,
       qsqt.query_sql_text
	FROM sys.query_store_query qsq
	INNER JOIN sys.query_store_query_text qsqt ON qsqt.query_text_id = qsq.query_text_id
	WHERE qsqt.query_sql_text NOT LIKE '%sys.query_store_query%'
	ORDER BY qsq.last_execution_time desc
			