---
title: Films
---

```sql top_rented_films
SELECT
    title,
    SUM(rental_id) AS rented_count,
FROM sakila.films
GROUP BY title
ORDER BY rented_count DESC
LIMIT 20;
```

<BarChart
    data={top_rented_films}
    x=title
    y=rented_count
    swapXY=true
    series=title
    title="Top rented films"
/>



```sql longest_movies
SELECT
length || ' minutes' AS length,
title
FROM
sakila.films
ORDER BY sakila.films.length DESC
LIMIT 10;
```

<FunnelChart
    data={longest_movies}
    nameCol=title
    valueCol=length
/>



```sql most_common_categories
SELECT
    category,
    COUNT(DISTINCT film_id) AS films
FROM sakila.actors
GROUP BY category
ORDER BY films DESC;
```
<BarChart
    data={most_common_categories}
    y=films
    x=category
    swapXY=true
    series=category
    title="Pouplar Categories"
/>

```sql most_rented_categories
```
