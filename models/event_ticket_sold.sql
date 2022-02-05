
with listing as (
    select * from {{ ref('stg_listing') }}
),

sales as (
    select * from {{ ref('stg_sales') }}
),

event as (
    select * from {{ ref('stg_event') }}
),

num_tickets_available_per_event AS (
  SELECT
    e.eventid,
    SUM(l.numtickets) AS total_listed_tickets
  FROM event e
  JOIN listing l
    ON l.eventid = e.eventid
  GROUP BY e.eventid
)

SELECT
  s.eventid,
  ntape.total_listed_tickets,
  SUM(qtysold) AS total_tickets_sold,
  1.0 * SUM(qtysold) / ntape.total_listed_tickets AS pct_tickets_sold
FROM num_tickets_available_per_event ntape
JOIN sales s
  ON s.eventid = ntape.eventid
GROUP BY s.eventid
ORDER BY pct_tickets_sold DESC