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
    series: [
      {
        type: 'pie',
        data: [...revenue_by_category]
      }
    ]
  }}
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
/>

---

```sql most_expensive_movie
SELECT
    title as name,
    SUM(amount) AS value
FROM sakila.revenue
GROUP BY name
ORDER BY value DESC
LIMIT 20
```

<FunnelChart
    data={most_expensive_movie}
    nameCol=name
    valueCol=value
    title="Most expensive movies"
/>