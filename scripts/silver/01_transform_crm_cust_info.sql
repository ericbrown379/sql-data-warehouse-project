/*
============================================================
Script: 01_transform_crm_cust_info.sql
Layer: Silver
Author: Eric Brown
Created: 2026

Description:
    Transforms CRM customer data from Bronze to Silver layer.

    Includes:
        - Deduplication using ROW_NUMBER()
        - Data cleaning (TRIM)
        - Data standardization (gender, marital status)

Source:
    bronze.crm_cust_info

Target:
    silver.crm_cust_info
============================================================
*/

INSERT INTO silver.crm_cust_info(
    cst_id,
    cst_key,
    cst_firstname,
    cst_lastname,
    cst_marital_status,
    cst_gndr,
    cst_create_date
)
SELECT
    cst_id,
    cst_key,
    TRIM(cst_firstname),
    TRIM(cst_lastname),

    CASE 
        WHEN UPPER(TRIM(cst_material_status)) = 'S' THEN 'Single'
        WHEN UPPER(TRIM(cst_material_status)) = 'M' THEN 'Married'
        ELSE 'n/a'
    END,

    CASE 
        WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
        WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
        ELSE 'n/a'
    END,

    cst_create_date

FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
    FROM bronze.crm_cust_info
) t
WHERE flag_last = 1;
