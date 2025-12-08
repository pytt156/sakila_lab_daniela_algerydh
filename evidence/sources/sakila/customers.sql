SELECT
    c.first_name || ' ' || c.last_name AS customer,
    ct.city,
    cr.country,
    p.amount,
    r.rental_id
FROM staging.customer c
LEFT JOIN staging.payment p on c.customer_id = p.customer_id
LEFT JOIN staging.rental r ON c.customer_id = r.customer_id
LEFT JOIN staging.address a ON a.address_id = c.address_id
LEFT JOIN staging.city ct ON ct.city_id = a.city_id
LEFT JOIN staging.country cr ON cr.country_id = ct.country_id;