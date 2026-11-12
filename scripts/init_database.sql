/*
Script Purpose:
This script creates a new database named 'DataWarehouse' after checking if it already exists.
If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
within the database: 'bronze', 'silver', and 'gold'.

WARNING:
Running this script will drop the entire 'DataWarehouse' database if it exists.
All data in the database will be permanently deleted. Proceed with caution
and ensure you have proper backups before running this script.

*/  
  



--Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO
  
-- Create Database 'DataWarehouse'

USE master;
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;

CREATE SCHEMA bronze;
--Date brute, importate din ERP și CRM, fără transformări majore. (Row data)
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO

--Go separate batches when working with multiple SQL statements
--SILVER = Date curatate, corectate, standardizate si verificate (CLEAN DATA)
--GOLD = Date integrate si organizate pentru rapoarte si analize (Business data)



