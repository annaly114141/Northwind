select 
	product_name, unit_price 
from 
	northwind.products
where 
	unit_price between 20 and 50
and
	discontinued = 0
order by
	unit_price desc
;