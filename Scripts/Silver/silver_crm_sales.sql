Select *
from bronze.crm_sales_details;

insert into silver.crm_sales_details(

    sls_ord_num,
    sls_prd_key,
    sls_cust_id,
    sls_order_dt,
    sls_ship_dt,
    sls_due_dt,
    sls_sales,
    sls_quantity,
    sls_price
)
Select 
	sls_product_number as sls_ord_num,
	sls_product_key as sls_prd_key,
	sls_cust_id,
	case when sls_order_date = 0 or len(sls_order_date) != 8 THEN Null
		else cast(cast(sls_order_date as varchar) as Date)
	END AS sls_order_dt,
	case when sls_ship_date = 0 or len(sls_ship_date) != 8 THEN Null
		else cast(cast(sls_ship_date as varchar) as Date)
	END AS sls_ship_dt,
	case when sls_due_date = 0 or len(sls_due_date) != 8 THEN Null
		else cast(cast(sls_due_date as varchar) as Date)
	END AS sls_due_dt,
	case when sls_sales IS NULL OR sls_sales<=0 Or sls_sales != sls_quaintity*abs(sls_price)
		then sls_quaintity*abs(sls_price)
		else sls_sales
	end sls_sales,
	sls_quaintity as sls_quantity,
	case when sls_price IS NULL OR sls_price<=0
		then sls_sales/nullif(sls_quaintity,0)
		else sls_price
	end as sls_price	
from bronze.crm_sales_details;