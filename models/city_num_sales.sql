
with sales as (
    select * from {{ ref('stg_sales') }}
),

event as (
    select * from {{ ref('stg_event') }}
),

venue as (
    select * from {{ ref('stg_venue') }}
)

/* Get the total number of sales per venue city. */

SELECT
  v.venuecity,
  COUNT(*) AS num_sales
FROM sales s
JOIN event e
  ON e.eventid = s.eventid
JOIN venue v
  ON v.venueid = e.venueid
GROUP BY v.venuecity
ORDER BY num_sales DESC