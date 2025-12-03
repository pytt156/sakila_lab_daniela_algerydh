SELECT
    cu.first_name || ' ' || cu.last_name AS customer,
    SUM(p.amount) AS total_amount
FROM
    customer cu
    JOIN payment p ON p.customer_id = cu.customer_id
GROUP BY
    customer
LIMIT
    5;