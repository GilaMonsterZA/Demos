RESTORE DATABASE [InterstellarTransport]
FROM DISK = '/var/opt/mssql/backup/IST.bak' 
WITH 
MOVE 'InterstellarTransport' TO '/var/opt/mssql/data/InterstellarTransport.mdf', 
MOVE 'InterstellarTransport_log' TO '/var/opt/mssql/data/InterstellarTransport_log.ldf' 
GO
