WITH monthly AS (
    SELECT 
        DATE_TRUNC('month', o.order_date)::date AS month,
        ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS revenue
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY DATE_TRUNC('month', o.order_date)
)
SELECT 
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_month,
    ROUND(revenue - LAG(revenue) OVER (ORDER BY month), 2) AS diff,
    ROUND(100.0 * (revenue - LAG(revenue) OVER (ORDER BY month)) 
          / NULLIF(LAG(revenue) OVER (ORDER BY month), 0), 2) AS growth_pct
FROM monthly
ORDER BY month;