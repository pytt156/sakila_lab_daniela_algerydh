SELECT
    a.actor_id,
    a.first_name || ' ' || a.last_name AS actor,
    a.first_name,
    f.film_id,
    a.last_name,
    f.title,
    c.name AS category
FROM
    staging.actor a
    JOIN staging.film_actor fa ON fa.actor_id = a.actor_id
    JOIN staging.film f ON f.film_id = fa.film_id
    LEFT JOIN staging.film_category fc ON fc.film_id = f.film_id
    LEFT JOIN staging.category c ON c.category_id = fc.category_id;