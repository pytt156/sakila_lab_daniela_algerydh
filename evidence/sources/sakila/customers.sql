SELECT
    title,
    rating,
    length,
    description
FROM
    staging.film
WHERE
    title ILIKE '%love%';