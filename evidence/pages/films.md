---
title: Films
---

```sql top_rented_films
```

```sql longest_movies
```

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
