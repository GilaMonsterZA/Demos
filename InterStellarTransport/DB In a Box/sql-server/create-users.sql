CREATE LOGIN Test WITH PASSWORD = "$(TEST_ACCOUNT_PASSWORD)"

USE [InterstellarTransport]
CREATE USER Test FOR LOGIN Test
EXEC sp_addrolemember N'db_owner', N'Test'

