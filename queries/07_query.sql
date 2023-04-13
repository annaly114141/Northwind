select
	c.category_name,
	case 
		when s.country in ('Singapore', 'Japan') then 'Asia-Pacific'
		when s.country in ('Brazil', 'USA', 'Canada') then 'America'
		else 'Europe'
	end as supplier_region,
	sum(p.unit_in_stock) units_in_stock,
	sum(p.unit_on_order) units_on_order,
	sum(p.reorder_level) reorder_level
from 
	northwind.categories c
	join northwind.products p using (category_id)
	join northwind.suppliers s using (supplier_id)
group by
	c.category_name, supplier_region
order by
	c.category_name, supplier_region, reorder_level asc
;