select
	categories.category_name,
	case 
		when order_details.unit_price < 20 then '1. Below $20'
		when order_details.unit_price between 20 and 50 then '2. $20 - $50'
		when order_details.unit_price > 50 then '3. Over $50'
	end as price_range,
	to_char(sum(
		order_details.quantity * 
		order_details.unit_price * 
		(1-order_details.discount)), '999999') as total_amount,
	count(order_id) as total_number_orders
from
	northwind.categories 
	left join northwind.products using (category_id)
	left join northwind.order_details using (product_id) 
group by
	categories.category_name, price_range
order by
	categories.category_name, price_range asc
;