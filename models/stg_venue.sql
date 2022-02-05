with venue as (

select 
  VENUEID as venueid,
  VENUECITY as venuecity,
  VENUESTATE as venuestate,
  from `mod4-507.tickit.venue`

)
select * from venue