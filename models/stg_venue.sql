with venue as (

select 
  VENUEID as venueid,
  VENUECITY as vcity,
  VENUESTATE as vstate
  from `mod4-507.tickit.venue`

)
select * from venue