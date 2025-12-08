SELECT
    cu.customer_id,
    cu.first_name || ' ' || cu.last_name AS customer,
    p.amount,
    p.payment_date
FROM
    staging.customer cu
    JOIN staging.payment p ON p.customer_id = cu.customer_id;