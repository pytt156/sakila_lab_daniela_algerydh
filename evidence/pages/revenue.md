---
title: Revenue
---

```sql top_store
SELECT
store_id,
'revenue' as metric,
SUM(amount) as total_revenue
FROM sakila.revenue
GROUP BY store_id
ORDER BY total_revenue;
```

<Heatmap
    data={top_store}
    y="metric"
    x="store_id"
    value="total_revenue"
    title="Store Revenue"
    colorScale=myPastelHeat
/>

---

```sql top_costumer
SELECT
    customer,
    SUM(amount) AS total_revenue
FROM sakila.revenue
GROUP BY customer
ORDER BY total_revenue DESC
LIMIT 10;
```

<BubbleChart
    data={top_costumer}
    x=customer
    y=total_revenue
    size=total_revenue
    label=customer
    series=customer
    title="Top Customer"
    colorPalette=myPastelBars
/>

---

```sql revenue_by_category
SELECT
    category AS name,
    SUM(amount) AS value,
FROM sakila.revenue
GROUP BY category
ORDER BY value DESC;
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
        data: [...revenue_by_category]
      }
    ]
  }}
/>
---

```sql revenue_by_category_over_time
SELECT
  SUM(amount) AS revenue,
  category,
  strftime(payment_date, '%Y-%m') AS month
FROM sakila.films
GROUP BY category, month
ORDER BY revenue
```

<AreaChart
  data={revenue_by_category_over_time}
  x=month
  y=revenue
  series=category
  colorPalette=myPastelBars
/>

---

```sql category_payment_distrobution
SELECT
category,
MIN(amount) AS min,
MEDIAN(amount) AS median,
MAX(amount) AS max,
QUANTILE_CONT(amount, 0.25) AS q1,
QUANTILE_CONT(amount, 0.75) AS q3
FROM sakila.revenue
GROUP BY category;
```

<BoxPlot
    data={category_payment_distrobution}
    name=category
    min=min
    intervalBottom=q1
    midpoint=median
    intervalTop=q3
    max=max
    title="Category payment distrobution"
    color=myPastelBars
/>

---

```sql top_staff_by_revenue
SELECT
staff,
SUM(amount) as total_revenue
FROM sakila.revenue
GROUP BY staff;
```

<BarChart
    data={top_staff_by_revenue}
    x=staff
    y=total_revenue
    series=staff
    colorPalette=myPastelBars
/>

---

```sql most_profitable_movie
SELECT
    title as name,
    SUM(amount) AS value
FROM sakila.revenue
GROUP BY name
ORDER BY value DESC
LIMIT 20
```

<FunnelChart
    data={most_profitable_movie}
    nameCol=name
    valueCol=value
    title="Most profitable movies"
    series=name
    colorPalette=myPastelBars
/>