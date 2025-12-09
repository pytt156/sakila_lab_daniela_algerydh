SELECT
p.amount,
c.first_name || ' ' || c.last_name as customer,
sf.first_name || ' ' || sf.last_name as staff,
f.title,
ca.name as category,
a.address,
ac.first_name || ' ' || ac.last_name AS actor,
co.country,
st.store_id,
r.rental_id,
ci.city,
(f.rental_rate / f.rental_duration) AS rent_per_day
FROM
staging.rental r
LEFT JOIN staging.payment p ON p.rental_id = r.rental_id
LEFT JOIN staging.customer c ON c.customer_id = p.customer_id
LEFT JOIN staging.staff sf ON p.staff_id = sf.staff_id
LEFT JOIN staging.store st ON sf.store_id = st.store_id
LEFT JOIN staging.inventory i ON r.inventory_id = i.inventory_id
LEFT JOIN staging.film f ON f.film_id = i.film_id
LEFT JOIN staging.film_category fc ON fc.film_id = f.film_id
LEFT JOIN staging.category ca ON ca.category_id = fc.category_id
LEFT JOIN staging.address a ON a.address_id = c.address_id
LEFT JOIN staging.city ci ON ci.city_id = a.city_id
LEFT JOIN staging.country co ON co.country_id = ci.country_id
LEFT JOIN staging.film_actor fa ON f.film_id = fa.film_id
LEFT JOIN staging.actor ac ON fa.actor_id = ac.actor_id