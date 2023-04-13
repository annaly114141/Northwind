select 
	ship_country,
	to_char(avg(shipped_date - order_date), '99.99') as average_days_between_order_shipping,
	count(order_id) as total_number_orders
from 
	northwind.orders
group by
	ship_country
having
	avg(shipped_date - order_date) >= 5
and
	count(order_id) > 10
order by
	ship_country asc
;