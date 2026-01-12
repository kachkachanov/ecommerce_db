-- DAU (Daily Active Users)
SELECT
    DATE(purchase_date) AS event_date,
    COUNT(DISTINCT customer_id) AS dau
FROM events
GROUP BY event_date
ORDER BY event_date;
