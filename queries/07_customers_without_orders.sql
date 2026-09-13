select 
	c.customer_id,
	c.company_name,
	c.country,
	c.phone
from customers c
left join orders o on c.customer_id =o.customer_id 
where o.order_id is null;