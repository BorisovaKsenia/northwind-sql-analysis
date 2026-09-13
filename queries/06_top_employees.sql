SELECT 
    e.first_name || ' ' || e.last_name AS employee_name,
    e.title,
    COUNT(DISTINCT o.order_id) AS orders_count,
    ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS revenue
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY e.employee_id, e.first_name, e.last_name, e.title
ORDER BY revenue DESC
LIMIT 5;