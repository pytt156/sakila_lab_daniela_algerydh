SELECT
    cu.first_name || ' ' || cu.last_name as customer,
    COUNT(r.rental_id) AS total_rentals
FROM
    customer cu
    JOIN rental r ON r.customer_id = cu.customer_id
GROUP BY
    cu.first_name,
    cu.last_name
ORDER BY
    total_rentals DESC
LIMIT
    10;