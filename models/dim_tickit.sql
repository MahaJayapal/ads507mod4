select 
    count(venueid),
    venuestate
    from `mod4-507.tickit.venue`
    group by venuestate;
