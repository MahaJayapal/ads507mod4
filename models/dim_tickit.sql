with rdate as (
    select * from {{ ref('stg_date')}}
)

select * from rdate