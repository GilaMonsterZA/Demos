CREATE LOGIN Test WITH PASSWORD = "$(TEST_ACCOUNT_PASSWORD)"
-- CREATE LOGIN Test WITH PASSWORD = 'Billybob123456'

USE [InterstellarTransport]
CREATE USER Test FOR LOGIN Test
EXEC sp_addrolemember N'db_owner', N'Test'

