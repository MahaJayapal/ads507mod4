with user as (
    select
        userid as sellerid,
        firstname,
        lastname
        from `mod4-507.tickit.users`
)

select* from user;