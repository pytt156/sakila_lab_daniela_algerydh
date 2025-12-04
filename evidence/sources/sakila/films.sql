SELECT
    f.film_id,
    f.title,
    f.description,
    f.release_year,
    f.length,
    c.name AS category,
    i.inventory_id,
    r.rental_id,
    r.rental_date,
    p.amount,
    p.payment_date
FROM
    film f
    LEFT JOIN film_category fc ON f.film_id = fc.film_id
    LEFT JOIN category c ON fc.category_id = c.category_id
    LEFT JOIN inventory i ON f.film_id = i.film_id
    LEFT JOIN rental r ON r.inventory_id = i.inventory_id
    LEFT JOIN payment p ON p.rental_id = r.rental_id;