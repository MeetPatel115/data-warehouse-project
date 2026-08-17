--loading data into the data base
truncate table bronze.crm_cust_info;
BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\91951\OneDrive\Desktop\dataengineer\Datawarehouse-pro\Dataset\source_crm\cust_info.csv'
WITH (
	FIRSTROW=2,
	FIELDTERMINATOR =',',
	TABLOCK
);

SELECT count(*) FROM bronze.crm_cust_info;


-- product table
truncate table bronze.crm_prd_info;
go
BULK INSERT bronze.crm_prd_info
FROM 'C:\Users\91951\OneDrive\Desktop\dataengineer\Datawarehouse-pro\Dataset\source_crm\prd_info.csv'
WITH (
	FIRSTROW=2,
	FIELDTERMINATOR =',',
	TABLOCK
);
go
SELECT count(*) FROM bronze.crm_prd_info;
go

--sales detail table

truncate table bronze.crm_sales_details;
go
BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\91951\OneDrive\Desktop\dataengineer\Datawarehouse-pro\Dataset\source_crm\sales_details.csv'
WITH (
	FIRSTROW=2,
	FIELDTERMINATOR =',',
	TABLOCK
);
go
SELECT count(*) FROM bronze.crm_sales_details;
go


-- erp tables


truncate table bronze.erp_cust_az12;
go
BULK INSERT bronze.erp_cust_az12
FROM 'C:\Users\91951\OneDrive\Desktop\dataengineer\Datawarehouse-pro\Dataset\source_erp\CUST_AZ12.csv'
WITH (
	FIRSTROW=2,
	FIELDTERMINATOR =',',
	TABLOCK
);
go
SELECT count(*) FROM bronze.erp_cust_az12;
go

truncate table bronze.erp_loc_a101;
go
BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\91951\OneDrive\Desktop\dataengineer\Datawarehouse-pro\Dataset\source_erp\LOC_A101.csv'
WITH (
	FIRSTROW=2,
	FIELDTERMINATOR =',',
	TABLOCK
);
go
SELECT count(*) FROM bronze.erp_loc_a101;
go

truncate table bronze.erp_px_cat_g1v2;
go
BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\Users\91951\OneDrive\Desktop\dataengineer\Datawarehouse-pro\Dataset\source_erp\PX_CAT_G1V2.csv'
WITH (
	FIRSTROW=2,
	FIELDTERMINATOR =',',
	TABLOCK
);
go
SELECT count(*) FROM bronze.erp_px_cat_g1v2;
go