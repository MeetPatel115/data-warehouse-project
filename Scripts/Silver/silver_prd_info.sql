if object_id ('silver.crm_prd_info','U') is not null
	Drop table silver.crm_prd_info;
insert into silver.crm_prd_info(
	prd_id,
	cat_id,
	prd_key,
	prd_name,
	prd_cost,
	prd_line,
	prd_start_date,
	prd_end_date

)
Select 
	prd_id,
	Replace(SUBSTRING(prd_key, 1,5),'-','_') as cat_id, -- Extract category id
	SUBSTRING(prd_key, 7,len(prd_key)) as prd_key, -- Extract product key
	prd_name,
	isnull(prd_cost,0) as prd_cost,
	case upper(trim(prd_line))
		when 'M' then 'Mountain'
		when 'R' then 'Road'
		when 'S' then 'other sales'
		when 'T' then 'touring'
		else 'n/a'
	end as prd_line,
	cast(prd_start_date as Date) as prd_start_date,
	cast(
		lead(prd_start_date) over (partition by prd_key order by prd_start_date)-1
		as date
		) prd_end_date
from bronze.crm_prd_info;


select * from silver.crm_prd_info;