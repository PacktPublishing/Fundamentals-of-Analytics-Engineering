with
    stg_employees as (select * from {{ ref('stg_employees') }}),

    dim_employees as (

        select
            -- ids
            employee_id,

            -- strings
            contact_number,
            first_name,
            last_name,
            full_name,

            -- numerics
            hourly_rate,

            -- dates
            birth_date,
            hired_date


        from stg_employees
    )

select *
from dim_employees
