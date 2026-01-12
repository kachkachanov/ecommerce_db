-- Процент ушедших пользователей
WITH user_churn AS (
    SELECT
        customer_id,
        MAX(churn) AS user_churn
    FROM events
    GROUP BY customer_id
)
SELECT
    ROUND(
        COUNT(*)::numeric /
        (SELECT COUNT(DISTINCT customer_id) FROM events) * 100,
        2
    ) AS churn_percent
FROM user_churn
WHERE user_churn = 1;
