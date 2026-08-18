IF OBJECT_ID('gold.dim_customer', 'V') IS NOT NULL
    DROP VIEW gold.dim_customer;
GO

create view gold.dim_customer as
SELECT 
	ROW_NUMBER() over (order by ci.cst_id) as customer_key,
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
go


IF OBJECT_ID('gold.dim_products', 'V') IS NOT NULL
    DROP VIEW gold.dim_products;
GO

CREATE VIEW gold.dim_products AS
SELECT
    ROW_NUMBER() OVER (ORDER BY pn.prd_start_date, pn.prd_key) AS product_key, -- Surrogate key
    pn.prd_id       AS product_id,
    pn.prd_key      AS product_number,
    pn.prd_name       AS product_name,
    pn.cat_id       AS category_id,
    pc.cat          AS category,
    pc.subcat       AS subcategory,
    pc.maintenance  AS maintenance,
    pn.prd_cost     AS cost,
    pn.prd_line     AS product_line,
    pn.prd_start_date AS start_date
FROM silver.crm_prd_info pn
LEFT JOIN silver.erp_px_cat_g1v2 pc
    ON pn.cat_id = pc.id
WHERE pn.prd_end_date IS NULL; -- Filter out all historical data
GO


select * from gold.dim_products