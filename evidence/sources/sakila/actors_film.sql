SELECT
    a.actor_id,
    a.first_name || ' ' || a.last_name AS actor,
    f.film_id,
    f.title,
    c.name AS category
FROM
    actor a
    JOIN film_actor fa ON fa.actor_id = a.actor_id
    JOIN film f ON f.film_id = fa.film_id
    LEFT JOIN film_category fc ON fc.film_id = f.film_id
    LEFT JOIN category c ON c.category_id = fc.category_id;