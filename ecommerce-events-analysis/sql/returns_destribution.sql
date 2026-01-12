-- Распределение пользователей по количеству возвратов
WITH user_returns AS (
    SELECT
        customer_id,
        SUM(returns) AS returns_count
    FROM events
    GROUP BY customer_id
)
SELECT
    CASE
        WHEN returns_count = 1 THEN 'return 1'
        WHEN returns_count = 2 THEN 'return 2'
        WHEN returns_count = 3 THEN 'return 3'
        WHEN returns_count = 4 THEN 'return 4'
        ELSE 'return 4+'
    END AS return_group,
    ROUND(
        COUNT(*)::numeric /
        (SELECT COUNT(DISTINCT customer_id) FROM events) * 100,
        2
    ) AS percent
FROM user_returns
GROUP BY return_group
ORDER BY return_group;
