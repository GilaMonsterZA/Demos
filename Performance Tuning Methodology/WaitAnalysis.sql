SELECT WaitType, MAX(ResourceWaitTime)-MIN(ResourceWaitTime) AS TotalResourceWaitInInterval, MAX(TotalSignalWaitTime) - MIN(TotalSignalWaitTime) AS TotalSignalWaitInInterval
FROM dbo.WaitStats AS ws
WHERE WaitType NOT IN ('DIRTY_PAGE_POLL', 'BACKUPBUFFER','BACKUPIO','BACKUPTHREAD', 'DBMIRROR_WORKER_QUEUE', 'OLEDB', 'PREEMPTIVE_DTC_ENLIST','PREEMPTIVE_TRANSIMPORT','PREEMPTIVE_XE_DISPATCHER')
	AND ws.WaitType NOT LIKE '%SLEEP%' AND ws.WaitType NOT LIKE 'HADR%'
GROUP BY WaitType
ORDER BY TotalResourceWaitInInterval DESC;

WITH    RawWaits
          AS ( SELECT   WaitType ,
                        WaitingTasks ,
                        MaxWaitTime ,
                        TotalSignalWaitTime ,
                        ResourceWaitTime ,
                        SampleTime ,
                        ROW_NUMBER() OVER ( PARTITION BY WaitType ORDER BY SampleTime ) AS WaitNumber
               FROM     [dbo].[WaitStats]			   
             ),
    WaitIntervals AS (
    SELECT  w2.SampleTime, w1.WaitType AS WaitType, w2.ResourceWaitTime-w1.ResourceWaitTime AS WaitTimeInInterval, w2.TotalSignalWaitTime-w1.TotalSignalWaitTime AS SignalWaitTimeInInterval
    FROM    RawWaits w1
            LEFT OUTER JOIN RawWaits w2 ON w2.WaitType = w1.WaitType
                                           AND w2.WaitNumber = w1.WaitNumber + 1)
SELECT * FROM 
(SELECT SampleTime, WaitType, WaitTimeInInterval FROM WaitIntervals) p
PIVOT (AVG(p.WaitTimeInInterval) FOR WaitType IN ([PAGEIOLATCH_EX],[WRITELOG],[LCK_M_S],[ASYNC_NETWORK_IO],[PAGEIOLATCH_SH],[LCK_M_IX],[PAGELATCH_EX],[ASYNC_IO_COMPLETION],[CXPACKET])) AS pvt
ORDER BY SampleTime


