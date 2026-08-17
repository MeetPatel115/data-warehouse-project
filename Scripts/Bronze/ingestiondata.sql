exec bronze.load_bronze;
go

CREATE OR ALTER PROCEDURE bronze.load_bronze as
BEGIN
	DECLARE @start_time DateTime, @end_time DateTime;
	BEGIN TRY
		--loading data into the data base
		print '=========================================';
		print 'Loading Bronze layer';
		print '=========================================';

		print '-------------------------------------------';
		print 'Loading Crm tables'
		print '-------------------------------------------';

		set @start_time=getdate()
		truncate table bronze.crm_cust_info;
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\91951\OneDrive\Desktop\dataengineer\Datawarehouse-pro\Dataset\source_crm\cust_info.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR =',',
			TABLOCK
		);

		set @end_time=getdate()

		Print '>> Load duration :' +cast(datediff(second,@start_time,@end_time) as Nvarchar) +' Second'
		-- product table

		set @start_time=getdate()
		truncate table bronze.crm_prd_info;

		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\91951\OneDrive\Desktop\dataengineer\Datawarehouse-pro\Dataset\source_crm\prd_info.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR =',',
			TABLOCK
		);
		set @end_time=getdate()


		Print '>> Load duration :' +cast(datediff(second,@start_time,@end_time) as Nvarchar) +' Second'
		--sales detail table

		set @start_time=getdate()
		truncate table bronze.crm_sales_details;

		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\91951\OneDrive\Desktop\dataengineer\Datawarehouse-pro\Dataset\source_crm\sales_details.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR =',',
			TABLOCK
		);

		set @end_time=getdate()
		Print '>> Load duration :' +cast(datediff(second,@start_time,@end_time) as Nvarchar) +' Second'

		-- erp tables

		print '-------------------------------------------';
		print 'Loading ERP tables'
		print '-------------------------------------------';

		set @start_time=getdate()
		truncate table bronze.erp_cust_az12;

		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\91951\OneDrive\Desktop\dataengineer\Datawarehouse-pro\Dataset\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR =',',
			TABLOCK
		);

		set @end_time=getdate()
		Print '>> Load duration :' +cast(datediff(second,@start_time,@end_time) as Nvarchar) +' Second'

		set @start_time=getdate()
		truncate table bronze.erp_loc_a101;

		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\91951\OneDrive\Desktop\dataengineer\Datawarehouse-pro\Dataset\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR =',',
			TABLOCK
		);
		set @end_time=getdate()
		Print '>> Load duration :' +cast(datediff(second,@start_time,@end_time) as Nvarchar) +' Second'

		set @start_time=getdate()
		truncate table bronze.erp_px_cat_g1v2;

		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\91951\OneDrive\Desktop\dataengineer\Datawarehouse-pro\Dataset\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR =',',
			TABLOCK
		);
		set @end_time=getdate()
		Print '>> Load duration :' +cast(datediff(second,@start_time,@end_time) as Nvarchar) +' Second'
	END TRY
	BEGIN CATCH
		print '==================================================';
		PRINT 'ERRO OCCURED FAILED TO LOAD THE BRONZE DATA ';
		PRINT 'Error message' + error_message();
		print 'Error number' + cast (ERROR_NUMBER() as nvarchar);
		print 'Error number' + cast (ERROR_STATE() as nvarchar);
		print '===================================================';
	END CATCH
--
END