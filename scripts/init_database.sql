/*
===============================================================================
Create Database and Schemas
===============================================================================

Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking
    if it already exists.

    If the database exists, it will be dropped and recreated. Additionally,
    the script sets up three schemas within the database:
        - bronze
        - silver
        - gold

    These schemas follow the Medallion Architecture commonly used in
    modern data engineering pipelines.

        bronze  -> raw ingested data
        silver  -> cleaned and transformed data
        gold    -> analytics-ready datasets

WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it
    already exists.

    All data in the database will be permanently deleted. Proceed with
    caution and ensure proper backups exist before executing this script.

Author: Eric Brown
Date: 2026-03-13
Environment: PostgreSQL
Project: Data Warehouse Setup
===============================================================================
*/

USE master;
GROUP BY

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO


-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;

-- Create Schema
CREATE SCHEMA bronze;
GO


CREATE SCHEMA silver;
GO


CREATE SCHEMA gold;
GO;
