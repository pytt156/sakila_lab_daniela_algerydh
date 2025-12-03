SELECT
    f.title,
    SUM(p.amount) AS total_amount
FROM
    film f
    JOIN inventory i ON i.film_id = f.film_id
    JOIN rental r ON r.inventory_id = i.inventory_id
    JOIN payment p ON p.rental_id = r.rental_id
GROUP BY
    f.title
ORDER BY
    total_amount DESC
LIMIT
    10;