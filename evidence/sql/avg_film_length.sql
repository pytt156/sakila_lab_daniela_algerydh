SELECT
    c.name AS category,
    AVG(f.length)::INT AS average_movie_length
FROM
    category c
    JOIN film_category fc ON fc.category_id = c.category_id
    JOIN film f ON f.film_id = fc.film_id
GROUP BY
    category
ORDER BY
    average_movie_length DESC
LIMIT
    10;