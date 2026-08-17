-- cleaning the data from the bronze layer
INSERT INTO silver.crm_cust_info (
	cst_id,
	cst_key,
	cst_firstname,
	cst_lastname,
	cst_marital_status,
	cst_gndr,
	cst_create_date
)
select 
	cst_id,
	cst_key,
	Trim(cst_firstname) as cst_firstname,
	Trim(cst_lastname) as cst_lastname,
	case when upper(trim(cst_material_status)) = 'S' Then 'Single'
		 when upper(trim(cst_material_status)) = 'M' Then 'Married'
		 Else 'n/a'
	end cst_marital_status,
	case when upper(trim(cst_gndr)) = 'F' Then 'Female'
		 when upper(trim(cst_gndr)) = 'M' Then 'Male'
		 Else 'n/a'
	end cst_gndr,
	cst_create_date
from
(
	Select *,
	ROW_NUMBER() over(partition by cst_id order by cst_create_date desc) as flag_last
	from bronze.crm_cust_info
	where cst_id is not null
)t
where flag_last =1;