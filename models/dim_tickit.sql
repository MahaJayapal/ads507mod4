with date as (
    select * from {{ ref('stg_date')}}
),

sales as (
    select * from {{ ref('stg_sales')}}
)

