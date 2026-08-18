create view gold.dim_customer as
SELECT 
	ci.cst_id as customer_id,
	ci.cst_key as customer_number,
	ci.cst_firstname as first_name,
	ci.cst_lastname as last_name,
	lo.cntry as counrty,
	ci.cst_marital_status as marital_satus,
	case when ci.cst_gndr !='n/a' then ci.cst_gndr
		else coalesce(ca.gen,'n/a') 
	end as gender,
	ca.bdate as birthdate,
	ci.cst_create_date as createdate
FROM silver.crm_cust_info as ci
left join silver.erp_cust_az12 as ca
on ci.cst_key=ca.cid
left join silver.erp_loc_a101 as lo
on ci.cst_key=lo.cid
