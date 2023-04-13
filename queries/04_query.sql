select 
	to_char(date_trunc('month', order_date), 'yyyy-mm-dd') as year_month,
	count(order_id) as total_number_orders,
	to_char(sum(freight),'99999') as total_freight
from 
	northwind.orders
where
	extract('year' from order_date) between 1997 and 1998 
group by
	date_trunc('month', order_date)
having
	count(order_id) > 35
order by
	total_freight desc
;