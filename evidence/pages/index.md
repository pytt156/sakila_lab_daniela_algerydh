---
title: Sakila Dashboard
---

This dashboard provides an overview of insights from the Sakila movie rental database.
All data is loaded into DuckDB.

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

## Nagivation