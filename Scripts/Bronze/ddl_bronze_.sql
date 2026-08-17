/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/
-- Creating and ingestion of data into data warehouse

--creatingtable for the crm
IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;
GO
 

CREATE TABLE bronze.crm_cust_info (
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname VARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_material_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date Date

);
GO

IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;
GO
-- creating table for prd

CREATE TABLE bronze.crm_prd_info (
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_name VARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_date Datetime,
	prd_start_end Datetime
);
GO




-- cretaing sales detail table
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
GO
CREATE TABLE bronze.crm_sales_details (
	sls_product_number NVARCHAR(50),
	sls_product_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_date Date,
	sls_ship_date Date,
	sls_due_date Date,
	sls_sales Int,
	sls_quaintity INT,
	sls_price INT

);
GO

-- CREATING ERP TABLES

--CREATING SUCTOMER ERP TABLE

IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;
GO

CREATE TABLE bronze.erp_cust_az12 (

	cid NVARCHAR(50),
	c_birthdate Date,
	c_gender VARCHAR(20)

);
GO

--cretaing erp location table
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;
GO

CREATE TABLE bronze.erp_loc_a101 (

	cid NVARCHAR(50),
	Country NVARCHAR(20)

);
GO

--- creating px cat table
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
GO
CREATE TABLE bronze.erp_px_cat_g1v2  (

	id NVARCHAR(50),
	cat NVARCHAR(50),
	subcat NVARCHAR(50),
	maintenance NVARCHAR(50)

);
GO