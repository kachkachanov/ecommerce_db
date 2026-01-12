-- Общее число уникальных пользователей
SELECT COUNT(DISTINCT customer_id) FROM events;

-- Общее число событий
SELECT COUNT(*) FROM events;

-- Среднее число событий на пользователя
SELECT
    COUNT(*)::numeric / COUNT(DISTINCT customer_id)
FROM events;
