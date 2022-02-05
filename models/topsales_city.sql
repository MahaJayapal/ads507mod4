with sales as (
    select * from {{ ref('stg_sales') }}
),

event as (
    select * from {{ ref('stg_event') }}
),

venue as (
    select * from {{ ref('stg_venue') }}
),

/* Get the top event by sales per city. */

event_rankings AS (
  -- Returns rankings of events by sales per city
  SELECT
    v.venuecity,
    e.eventid,
    e.eventname,
    SUM(pricepaid) AS total_paid,
    ROW_NUMBER() OVER (PARTITION BY v.venuecity ORDER BY SUM(pricepaid) DESC) AS rnk
  FROM event e
  JOIN sales s
    ON s.eventid = e.eventid
  JOIN venue v
    ON v.venueid = e.venueid
  GROUP BY
    v.venuecity,
    e.eventid,
    e.eventname
)

SELECT
  venuecity,
  eventid,
  eventname,
  total_paid
FROM event_rankings
WHERE rnk = 1