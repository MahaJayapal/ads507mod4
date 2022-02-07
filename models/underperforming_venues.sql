with v_event as(
    select * from {{ref ('stg_event_venue_merge') }}
),

sales as (
    select * from {{ ref('stg_sales') }}
)

select
    sum(qtysold) as QtySold,
    s.eventid,
    v_event.vcity,
    v_event.eventname
  FROM sales s
  JOIN v_event 
    ON s.eventid = v_event.eventid
  GROUP BY
    s.eventid,
    v_event.vcity,
    v_event.eventname
  order BY
    1

