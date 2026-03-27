/*
============================================================
Script: 01_create_silver_tables.sql
Layer: Silver
Author: Eric Brown
Created: 2026

Description:
    This script initializes the Silver layer of the data warehouse by creating
    cleaned and structured tables for CRM and ERP data sources.

    The Silver layer stores validated, standardized, and transformed data
    from the Bronze layer.

Tables Created:
    - silver.crm_cust_info
    - silver.crm_prd_info
    - silver.crm_sales_details
    - silver.erp_loc_a101
    - silver.erp_cust_az12
    - silver.erp_px_cat_g1v2

Notes:
    - Existing tables will be dropped and recreated
    - Includes dwh_create_date for audit tracking
    - Transformations and business logic should be applied before loading

WARNING:
    This script will DROP existing tables if they exist.
    Ensure backups are available before execution.
============================================================
*/

DROP TABLE IF EXISTS silver.crm_cust_info;
CREATE TABLE silver.crm_cust_info (
    cst_id INT,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_material_status VARCHAR(50),
    cst_gndr VARCHAR(50),
    cst_create_date DATE,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS silver.crm_prd_info;
CREATE TABLE silver.crm_prd_info (
    prd_id INT,
    prd_key VARCHAR(50),
    prd_nm VARCHAR(50),
    prd_cost INT,
    prd_line VARCHAR(50),
    prd_start_dt TIMESTAMP,
    prd_end_dt TIMESTAMP,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS silver.crm_sales_details;
CREATE TABLE silver.crm_sales_details (
    sls_ord_num VARCHAR(50),
    sls_prd_key VARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS silver.erp_loc_a101;
CREATE TABLE silver.erp_loc_a101 (
    cid VARCHAR(50),
    cntry VARCHAR(50),
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS silver.erp_cust_az12;
CREATE TABLE silver.erp_cust_az12 (
    cid VARCHAR(50),
    bdate DATE,
    gen VARCHAR(50),
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS silver.erp_px_cat_g1v2;
CREATE TABLE silver.erp_px_cat_g1v2 (
    id VARCHAR(50),
    cat VARCHAR(50),
    subcat VARCHAR(50),
    maintenance VARCHAR(50),
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
