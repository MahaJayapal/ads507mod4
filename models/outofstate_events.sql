with date as (
    select * from {{ ref('stg_date') }}
),

sales as (
    select * from {{ ref('stg_sales') }}
),

event as (
    select * from {{ ref('stg_event') }}
),

venue as (
    select * from {{ ref('stg_venue') }}
),

users as (
    select * from {{ ref('stg_users') }}
)

/* Find number of users who bought ticketrs to out-of-state events. */

SELECT COUNT(DISTINCT u.userid) as count
FROM sales s
JOIN users u
  ON u.userid = s.buyerid
JOIN event e
  ON e.eventid = s.eventid
JOIN venue v
  ON v.venueid = e.venueid
    AND v.venuestate != u.state
