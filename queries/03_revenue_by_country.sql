select 
	o.ship_country as country,
	count(distinct o.order_id) as order_count,
	count(distinct o.customer_id) as customer_count,
	round(sum(od.unit_price*od.quantity*(1-od.discount))::numeric,2) as revenue
from orders o
join order_details od on o.order_id =od.order_id 
group by o.ship_country 
order by revenue desc;