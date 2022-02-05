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

category as (
    select * from {{ ref('stg_category') }}
),

users as (
    select * from {{ ref('stg_users') }}
)



/* Get the users who have bought tickets to a musical and like sports. */

SELECT DISTINCT userid
FROM users u
JOIN sales s
  ON s.buyerid = u.userid
JOIN event e
  ON e.eventid = s.eventid
JOIN category c
  ON c.catid = e.catid
    AND c.catname = 'Musicals'
WHERE u.likesports