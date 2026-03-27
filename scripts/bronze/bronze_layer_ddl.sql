/*
============================================================
Script: 01_create_bronze_tables.sql
Layer: Bronze
Author: Eric Brown
Created: 2026

Description:
    This script initializes the Bronze layer of the data warehouse by creating
    raw ingestion tables for CRM and ERP data sources.

    The Bronze layer stores raw, untransformed data as-is from source systems.

Tables Created:
    - bronze.crm_cust_info
    - bronze.crm_prd_info
    - bronze.crm_sales_details
    - bronze.erp_loc_a101
    - bronze.erp_cust_az12
    - bronze.erp_px_cat_g1v2

Notes:
    - Existing tables will be dropped and recreated
    - Data types are loosely defined for raw ingestion (Bronze layer)
    - Transformations and data cleaning should occur in the Silver layer

WARNING:
    This script will DROP existing tables if they exist.
    Ensure backups are available before execution.
============================================================
*/
