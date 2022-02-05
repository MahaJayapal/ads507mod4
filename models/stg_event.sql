with event as (
    select
        EVENTID as eventid,
        VENUEID as venueid,
        CATID as catid,
        DATEID as dateid,
        EVENTNAME as eventname,
        from `mod4-507.tickit.event`
)

select * from event