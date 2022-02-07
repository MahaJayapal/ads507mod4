with venue as(
    select 
        VENUEID as venueid,
        VENUECITY as vcity,
        VENUESTATE as vstate
        from mod4-507.tickit.venue
),

venue_event as(
    SELECT
        v.vcity,
        e.eventid,
        e.eventname,
        FROM {{ref('stg_event') }} e
    JOIN venue v
    ON v.venueid = e.venueid
    GROUP BY
        v.vcity,
        e.eventid,
        e.eventname
)
select * from venue_event