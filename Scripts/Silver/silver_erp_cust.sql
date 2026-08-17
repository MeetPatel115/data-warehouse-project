INSERT INTO silver.erp_cust_az12(
		cid,
		bdate,
		gen
)
SELECT 
CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid,4,len(cid))
	 else cid
end as cid,
CASE WHEN c_birthdate> GETDATE() then null
	 else c_birthdate
end as bdate,
CASE WHEN UPPER(TRIM(C_gender)) in ('F','FEMALE') THEN 'Female'
	 WHEN UPPER(TRIM(C_gender)) in ('M','MALE') THEN 'Male'
	 else 'n/a'
end as gen
from bronze.erp_cust_az12