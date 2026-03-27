/*
============================================================
Script: 02_load_bronze_data.sql
Layer: Bronze
Author: Eric Brown
Created: 2026

Description:
    This script loads raw CSV data into Bronze layer tables
    using PostgreSQL COPY command.

    Data is truncated before loading to ensure full refresh.

Data Sources:
    - CRM: cust_info, prd_info, sales_details
    - ERP: loc_a101, cust_az12, px_cat_g1v2

Notes:
    - Assumes CSV files exist at specified file paths
    - Uses CSV HEADER to skip column names
    - Intended for local development / batch ingestion

WARNING:
    This script truncates tables before loading.
    Existing data will be permanently removed.
============================================================
*/

TRUNCATE TABLE bronze.crm_cust_info;
COPY bronze.crm_cust_info
FROM '/Users/ericbrown/dev/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM bronze.crm_cust_info;
SELECT COUNT(*) FROM bronze.crm_cust_info;

TRUNCATE TABLE bronze.crm_prd_info;
COPY bronze.crm_prd_info
FROM '/Users/ericbrown/dev/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM bronze.crm_prd_info;
SELECT COUNT(*) FROM bronze.crm_prd_info;


TRUNCATE TABLE bronze.crm_sales_details;
COPY bronze.crm_sales_details
FROM '/Users/ericbrown/dev/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM bronze.crm_sales_details;
SELECT COUNT(*) FROM bronze.crm_sales_details;


TRUNCATE TABLE bronze.erp_loc_a101;
COPY bronze.erp_loc_a101
FROM '/Users/ericbrown/dev/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/loc_a101.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM bronze.erp_loc_a101;
SELECT COUNT(*) FROM bronze.erp_loc_a101;


TRUNCATE TABLE bronze.erp_cust_az12;
COPY bronze.erp_cust_az12
FROM '/Users/ericbrown/dev/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/cust_az12.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM bronze.erp_cust_az12;
SELECT COUNT(*) FROM bronze.erp_cust_az12;

TRUNCATE TABLE bronze.erp_px_cat_g1v2;
COPY bronze.erp_px_cat_g1v2
FROM '/Users/ericbrown/dev/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/px_cat_g1v2.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM bronze.erp_px_cat_g1v2;
SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2;


