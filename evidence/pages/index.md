---
title: Sakila Dashboard
---
<Details title='About'>
This dashboard provides an overview of insights from the Sakila movie rental database.
All data is loaded into DuckDB.
</Details>

---

## Example
```sql top_customers
SELECT
    customer,
    SUM(amount) AS total_amount
FROM sakila.customers
GROUP BY customer
ORDER BY total_amount DESC
LIMIT 5;
```

<BarChart
  data={top_customers}
  x=customer
  y=total_amount
  title="Top Customers"
/>

---

## Nagivation

- [Actors](../actors) - <i>Visuals related to/sorted by actors</i> <br>
- [Films](../films) - <i>Visuals related to/sorted by films</i> <br>
- [Revenue](../revenue) - <i>Visuals related to/sorted by revenue</i> <br>