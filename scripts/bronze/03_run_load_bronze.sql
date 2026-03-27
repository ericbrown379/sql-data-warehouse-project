/*
============================================================
Script: 02_create_load_bronze_procedure.sql
Layer: Bronze
Author: Eric Brown
Created: 2026

Description:
    This script creates a stored procedure that loads data
    into Bronze layer tables from raw CSV files.

    The procedure performs:
        - Table truncation
        - Bulk data loading using COPY
        - Logging via RAISE NOTICE

Procedure:
    bronze.load_bronze()

Notes:
    - Assumes CSV files exist at specified paths
    - Requires PostgreSQL file system access permissions
    - Designed for batch ingestion workflows

WARNING:
    This procedure truncates all Bronze tables before loading.
    Existing data will be permanently removed.
============================================================
*/

CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE '------------------------------';
    RAISE NOTICE 'Loading BRONZE Layer';
    RAISE NOTICE '------------------------------';

    RAISE NOTICE '------------------------------';
    RAISE NOTICE 'Loading CRM Tables';
    RAISE NOTICE '------------------------------';

    RAISE NOTICE '>> Truncating Table: bronze.crm_cust_info';
    TRUNCATE TABLE bronze.crm_cust_info;

    RAISE NOTICE '>> Inserting Data Into: bronze.crm_cust_info';
    EXECUTE format(
        'COPY bronze.crm_cust_info FROM %L DELIMITER '','' CSV HEADER',
        '/Users/ericbrown/dev/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
    );

    RAISE NOTICE '>> Truncating Table: bronze.crm_prd_info';
    TRUNCATE TABLE bronze.crm_prd_info;

    RAISE NOTICE '>> Inserting Data Into: bronze.crm_prd_info';
    EXECUTE format(
        'COPY bronze.crm_prd_info FROM %L DELIMITER '','' CSV HEADER',
        '/Users/ericbrown/dev/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
    );

    RAISE NOTICE '>> Truncating Table: bronze.crm_sales_details';
    TRUNCATE TABLE bronze.crm_sales_details;

    RAISE NOTICE '>> Inserting Data Into: bronze.crm_sales_details';
    EXECUTE format(
        'COPY bronze.crm_sales_details FROM %L DELIMITER '','' CSV HEADER',
        '/Users/ericbrown/dev/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
    );

    RAISE NOTICE '------------------------------';
    RAISE NOTICE 'Loading ERP Tables';
    RAISE NOTICE '------------------------------';

    RAISE NOTICE '>> Truncating Table: bronze.erp_loc_a101';
    TRUNCATE TABLE bronze.erp_loc_a101;

    RAISE NOTICE '>> Inserting Data Into: bronze.erp_loc_a101';
    EXECUTE format(
        'COPY bronze.erp_loc_a101 FROM %L DELIMITER '','' CSV HEADER',
        '/Users/ericbrown/dev/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/loc_a101.csv'
    );

    RAISE NOTICE '>> Truncating Table: bronze.erp_cust_az12';
    TRUNCATE TABLE bronze.erp_cust_az12;

    RAISE NOTICE '>> Inserting Data Into: bronze.erp_cust_az12';
    EXECUTE format(
        'COPY bronze.erp_cust_az12 FROM %L DELIMITER '','' CSV HEADER',
        '/Users/ericbrown/dev/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/cust_az12.csv'
    );

    RAISE NOTICE '>> Truncating Table: bronze.erp_px_cat_g1v2';
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;

    RAISE NOTICE '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
    EXECUTE format(
        'COPY bronze.erp_px_cat_g1v2 FROM %L DELIMITER '','' CSV HEADER',
        '/Users/ericbrown/dev/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_erp/px_cat_g1v2.csv'
    );

    RAISE NOTICE '------------------------------';
    RAISE NOTICE 'Bronze load completed successfully';
    RAISE NOTICE '------------------------------';
END;
$$;
