select 
	EXTRACT(year from o.order_date) as year,
	count (distinct o.order_id) as order_count,
	round(sum(od.unit_price*od.quantity*(1-od.discount))::numeric,2) as revenue
from orders o
join order_details od on o.order_id=od.order_id
group by EXTRACT(year from o.order_date)
order by year;