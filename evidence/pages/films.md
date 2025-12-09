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
    category AS name,
    COUNT(DISTINCT film_id) AS value
FROM sakila.actors
GROUP BY category
ORDER BY name DESC;
```

<ECharts
  config={{
    tooltip: {
      formatter: '{b}: {c} ({d}%)'
    },
    color: [
      "#F7A8A8",
      "#F7D7A8",
      "#F7F7A8",
      "#A8F7C8",
      "#A8F7F7",
      "#A8C8F7",
      "#D7A8F7"
    ],
    series: [
      {
        type: 'pie',
        data: [...most_common_categories]
      }
    ]
  }}
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


