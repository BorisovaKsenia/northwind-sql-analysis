select 
	p.product_name,
	c.category_name,
	sum(od.quantity) as total_quantity,
	round(sum(od.unit_price*od.quantity*(1-od.discount))::numeric,2) as revenue
from order_details od
join products p on od.product_id=p.product_id
join categories c on c.category_id=p.category_id
group by p.product_id, p.product_name, c.category_name
order by revenue desc 
limit 10;