select 
	category_name,
	product_name,
	unit_price,
	to_char(average_unit_price,'99.99') average_unit_price,
	to_char(median_unit_price,'99.99') median_unit_price,
	case 
		when unit_price < average_unit_price then 'Below Average'
		when unit_price > average_unit_price then 'Above Average'
		else 'Equal Average'
	end as average_unit_price_position,
	case 
		when unit_price < median_unit_price then 'Below Median'
		when unit_price > median_unit_price then 'Above Median'
		else 'Equal Median'
	end as median_unit_price_position
from
	northwind.products p 
	join
	(select 
		category_id, category_name,
		avg(unit_price) as average_unit_price,
		percentile_disc(0.5) within group (order by unit_price) as median_unit_price 
	from 
		northwind.products join northwind.categories using (category_id)
	group by
		category_id, category_name) as cstat
	on p.category_id = cstat.category_id
where
	p.discontinued = 0
order by
	category_name, product_name asc
;