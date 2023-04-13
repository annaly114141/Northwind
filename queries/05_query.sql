
select 
	p.product_name,
	p.unit_price as current_price,
	min(o.unit_price) as previous_price,
	to_char((p.unit_price - min(o.unit_price)) / min(o.unit_price) * 100, '99') as percentage_increase
from 
	northwind.products p left join northwind.order_details o
using
	(product_id)
where
	1=1
group by
	p.product_name,
	p.unit_price
having 
	(p.unit_price - min(o.unit_price)) / min(o.unit_price) * 100 
	not between 20 and 30
and
	count(o.order_id) > 10
order by
	(p.unit_price - min(o.unit_price)) / min(o.unit_price) * 100 asc
;
