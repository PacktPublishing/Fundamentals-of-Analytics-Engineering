with
    stg_shifts as (select * from {{ ref("stg_shifts") }}),

    dim_shifts as (
        select
            -- ids
            employee_id,
            shift_id,

            -- strings
            role,

            -- date
            shift_date,

            -- timestamps
            shift_start_at,
            shift_end_at,
            shift_duration_hours

        from stg_shifts
    )

select *
from dim_shifts