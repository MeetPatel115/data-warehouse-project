insert into silver.erp_loc_a101(
cid,
cntry
)
Select 
Replace(cid, '-','') cid,
CASE WHEN TRIM(Country)= 'DE' then 'Germany'
	 when TRIM(Country) in ('US','USA') then 'United States'
	 when trim(Country) = ''  or Country is null then 'n/a'
	 else Trim(Country)
end as cntry
from bronze.erp_loc_a101;
