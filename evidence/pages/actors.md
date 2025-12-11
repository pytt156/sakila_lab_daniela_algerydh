---
title: Actors
---

<BarChart
    data={top_paying_actors}
    x=actor
    y=total_revenue
    title="Top Paying Actors"
    xAxisTitle="Actor Name"
    yAxisTitle="Billed"
    colorPalette=myPastelBars
    series=actor
/>

```sql top_paying_actors
SELECT
SUM(amount) as total_revenue,
actor
FROM sakila.revenue
GROUP BY actor
ORDER BY total_revenue DESC
LIMIT 10;
```

---

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
    colorPalette=myPastelBars
/>
</div>

```sql actors_category_counts
SELECT
    actor,
    category,
    COUNT(film_id) AS film_count
FROM sakila.actors
GROUP BY actor, category
ORDER BY film_count DESC, category
```

---

<BubbleChart
    data={most_common_first_name}
    x=first_name
    y=number_of_actors_with_this_first_name
    size=number_of_actors_with_this_first_name
    series=first_name
    colorPalette=myPastelBars
    title="Most common first name"
/>

```sql most_common_first_name
SELECT
    COUNT(first_name) AS number_of_actors_with_this_first_name,
    first_name
FROM
    sakila.actors
GROUP BY
    first_name
LIMIT 10;
```

---

<BubbleChart
    data={most_common_last_name}
    x=last_name
    y=number_of_actors_with_this_last_name
    size=number_of_actors_with_this_last_name
    series=last_name
    colorPalette=myPastelBars
    title="Most common last name"
/>

```sql most_common_last_name
SELECT
    COUNT(first_name) AS number_of_actors_with_this_last_name,
    last_name
FROM
    sakila.actors
GROUP BY
    last_name
LIMIT 10;
```
