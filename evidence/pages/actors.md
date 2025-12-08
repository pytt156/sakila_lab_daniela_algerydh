---
title: Actors
---

```sql top_actors
SELECT
COUNT(actor_id) AS number_of_movies,
actor
FROM sakila.actors
GROUP BY actor
ORDER BY number_of_movies DESC
LIMIT 10;
```
<BarChart
    data={top_actors}
    x=actor
    y=number_of_movies
    title='Top Actors'
    xAxisTitle='Actor Name'
    yAxisTitle='Number of movies'
/>

---

```sql actors_category_counts
SELECT
    actor,
    category,
    COUNT(film_id) AS film_count
FROM sakila.actors
GROUP BY actor, category
ORDER BY film_count DESC, category
```
<div style="
    max-height: 400px;
    overflow-y: auto;
    padding-right: 10px;
    border: 0px;
    border-radius: 6px;
">
<BarChart
    data={actors_category_counts}
    x="actor"
    y="film_count"
    series="category"
    swapXY={true}
    title="Actors by Category and Film Count"
/>
</div>

---