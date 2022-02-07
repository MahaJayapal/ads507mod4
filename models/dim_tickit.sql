
select
    eventid, eventname
    from {{ source('tickit','event')}}