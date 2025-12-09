---
title: Films
---

```sql top_rented_films
SELECT
    title,
    COUNT(rental_id) AS rented_count
FROM sakila.films
GROUP BY title
ORDER BY rented_count DESC
LIMIT 20
```

<BarChart
    data={top_rented_films}
    x=title
    y=rented_count
    swapXY=true
    series=title
    title="Top rented films"
    colorPalette="myPastelBars"
/>

---

```sql popular_titles_by_month
SELECT
    sf.title,
    strftime(sf.rental_date, '%Y-%m') AS year_month,
    COUNT(sf.rental_id) AS rented_count
FROM sakila.films sf
JOIN ${top_rented_films} tf ON sf.title = tf.title
WHERE sf.rental_date IS NOT NULL
GROUP BY sf.title, year_month
ORDER BY rented_count DESC
```

<Heatmap
    data={popular_titles_by_month}
    x=title
    y=year_month
    value=rented_count
    colorScale="myPastelHeat"
    />



---

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
    colorPalette=myPastelBars
/>

```sql most_rented_categories
SELECT
    category,
    SUM(rental_id) AS rented_count,
FROM sakila.films
GROUP BY category
ORDER BY rented_count DESC
LIMIT 20;
```

<FunnelChart
    data={most_rented_categories}
    nameCol=category
    valueCol=rented_count
    colorPalette=myPastelBars
/>


